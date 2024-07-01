#include<cstdio>
#include<cmath>
#include<mpi.h>
#include<ctime>
#include<vector>
#include<iostream>
#include<algorithm>
#include<fstream>
#include<queue>
#include <chrono>
using namespace std;
using namespace std::chrono;

// 快速排序，并且选出代表元
inline void quicksort(int* arr, int start, int end, int* pivots, int numprocs, int w)
{
    // 使用STL的sort函数对给定区间的元素进行排序
    sort(arr + start, arr + end);

    // 选取代表元素，每个进程选取一个
    for (int i = 0; i < numprocs; i++)
    {
        pivots[i] = arr[start + i * w];
    }
}

// 分区排序
inline void MergeSort(int* src, int* dst, int* recevieNum, int* recshifts, int numprocs, int totalnum)
{
    int cur = 0, min_temp, idx;
    vector<int> cnt(numprocs);

    // 合并排序算法，将多个有序序列合并成一个有序序列
    while (cur < totalnum)
    {
        idx = -1;
        for (int i = 0; i < numprocs; i++)
        {
            if (cnt[i] != recevieNum[i])
            {
                // 选取各个进程中最小的元素
                if (idx == -1 || src[cnt[i] + recshifts[i]] < min_temp){
                    min_temp = src[cnt[i] + recshifts[i]];
                    idx = i;
                }
            }
        }
        dst[cur++] = min_temp;
        ++cnt[idx];
    }
}

// 抽样
inline void choosepivots(int* pivots, int numprocs, int id, int* final_pivots)
{
    int* root_pivots = new int[numprocs * numprocs];
    // 将每个进程选取的代表元素传递给根进程
    MPI_Gather(pivots, numprocs, MPI_INT, root_pivots, numprocs, MPI_INT, 0, MPI_COMM_WORLD);

    if (id == 0)
    {
        // 根进程排序所有代表元素，选择主元
        sort(root_pivots, root_pivots + numprocs * numprocs);
        for (int i = 1; i < numprocs; i++)
            final_pivots[i - 1] = root_pivots[i * numprocs];
    }

    // 将选择的主元广播给所有进程
    MPI_Bcast(final_pivots, numprocs - 1, MPI_INT, 0, MPI_COMM_WORLD);
    delete[] root_pivots;
}

// PSRS并行排序算法
inline void psrs(int* arr, int n)
{
    int myid, numprocs;
    MPI_Comm_rank(MPI_COMM_WORLD, &myid);    // 获取线程ID
    MPI_Comm_size(MPI_COMM_WORLD, &numprocs); // 获取总线程数

    int num = n / numprocs;
    int beg = myid * num;
    int end = (myid + 1) * num;
    int w = n / (numprocs * numprocs);
    end = min(end, n);

    int* pivots = new int[numprocs];
    quicksort(arr, beg, end, pivots, numprocs, w);

    if (numprocs <= 1)
    {
        // 单进程时直接返回
        delete[] pivots;
        return;
    }

    int* final_pivots = new int[numprocs - 1];
    choosepivots(pivots, numprocs, myid, final_pivots);

    int* sendcount = new int[numprocs], * sendshifts = new int[numprocs];    
    int* receiveNum = new int[numprocs], * recshifts = new int[numprocs];

    sendshifts[0] = beg;
    sendcount[0] = upper_bound(arr + beg, arr + end, final_pivots[0]) - arr - sendshifts[0];
    for (int i = 1; i < numprocs - 1; i++)
    {
        sendshifts[i] = sendshifts[i - 1] + sendcount[i - 1];        
        sendcount[i] = upper_bound(arr + beg, arr + end, final_pivots[i]) - arr - sendshifts[i];
    }
    sendshifts[numprocs - 1] = sendshifts[numprocs - 2] + sendcount[numprocs - 2];
    sendcount[numprocs - 1] = end - sendshifts[numprocs - 1];
    delete[] final_pivots;

    MPI_Alltoall(sendcount, 1, MPI_INT, receiveNum, 1, MPI_INT, MPI_COMM_WORLD);    
    int totalnum = receiveNum[0];
    recshifts[0] = 0;
    for (int i = 1; i < numprocs; i++)
    {
        totalnum += receiveNum[i];
        recshifts[i] = recshifts[i - 1] + receiveNum[i - 1];
    }

    int* result = new int[totalnum];
    // 全局交换，发送各进程的元素，接收其他进程的元素
    MPI_Alltoallv(arr, sendcount, sendshifts, MPI_INT, result, receiveNum, recshifts, MPI_INT, MPI_COMM_WORLD);

    int* sort_result = new int[totalnum];
    // 合并排序，将所有元素进行排序
    MergeSort(result, sort_result, receiveNum, recshifts, numprocs, totalnum);

    int* num_idx = new int[numprocs];    
    // 将每个进程的元素数量传递给根进程
    MPI_Gather(&totalnum, 1, MPI_INT, num_idx, 1, MPI_INT, 0, MPI_COMM_WORLD);    

    int* finalpos = new int[numprocs];
    if (myid == 0)
    {
        finalpos[0] = 0;
        for (int i = 1; i < numprocs; i++)
        {
            finalpos[i] = finalpos[i - 1] + num_idx[i - 1];    
        }
    }

    // 将排序后的元素传递给根进程
    MPI_Gatherv(sort_result, totalnum, MPI_INT, arr, num_idx, finalpos, MPI_INT, 0, MPI_COMM_WORLD);

    delete[] num_idx;
    delete[] finalpos;
    delete[] result;
    delete[] sort_result;
    delete[] sendcount;
    delete[] sendshifts;
    delete[] receiveNum;
    delete[] recshifts;
    delete[] pivots;
}

int main(int argc, char* argv[])
{
    int arraySize = 10000; 
    int* vec = new int[arraySize];
    ifstream infile("numbers.txt");
    int index = 0;
    while (infile && index < arraySize) {
        int number;
        infile >> number;
        vec[index++] = number;
    }

    MPI_Init(&argc, &argv);
    auto start = steady_clock::now();
    psrs(vec, arraySize);    // 排序
    auto end = steady_clock::now();
    MPI_Finalize();
    
    auto during = end - start;
    std::cout <<"sort " << arraySize << " numbers, use time: " <<during.count() << " ns" << std::endl;
    return 0;
}
