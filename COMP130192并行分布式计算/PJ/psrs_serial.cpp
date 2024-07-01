#include <iostream>
#include <vector>
#include <algorithm>
#include <fstream>
#include <chrono>
using namespace std;
using namespace std::chrono;

void quicksort(vector<int>& vec, int left, int right) {
    if (left < right) {
        int i = left, j = right;
        int pivot = vec[(left + right) / 2];

        while (i <= j) {
            while (vec[i] < pivot)
                i++;
            while (vec[j] > pivot)
                j--;
            if (i <= j) {
                swap(vec[i], vec[j]);
                i++;
                j--;
            }
        }

        quicksort(vec, left, j);
        quicksort(vec, i, right);
    }
}

// 串行 PSRS 排序
void serialPSRS(vector<int>& vec) {
    int n = vec.size();

    // 局部排序
    quicksort(vec, 0, n - 1);

    // 选取主元
    vector<int> pivots(1);
    pivots[0] = vec[n / 2];

    // 全局交换
    vector<int> sendcount(1), sdispls(1), recvcount(1), rdispls(1);
    sdispls[0] = 0;
    sendcount[0] = upper_bound(vec.begin(), vec.end(), pivots[0]) - vec.begin() - sdispls[0];
    sdispls[0] = sdispls[0];
    sendcount[0] = n - sdispls[0];

    int totalnum = recvcount[0] = n;
    rdispls[0] = 0;

    vector<int> result(totalnum);

    // 全局交换
    copy(vec.begin(), vec.end(), result.begin());

    // 合并排序结果
    quicksort(result, 0, totalnum - 1);
    cout << endl;
}

int main() {
    int arraySize = 1000;
    vector<int> vec = vector<int>(arraySize);  // 你的数据
    
    ifstream infile("numbers.txt");
    int index = 0;
    while (infile && index < arraySize) {
        int number;
        infile >> number;
        vec[index++] = number;
    }
    auto start = steady_clock::now();
	serialPSRS(vec);
    auto end = steady_clock::now();
    auto during = end - start;
	std::cout <<"sort " << arraySize << " numbers, use time: " <<during.count() << " ns" << std::endl;
    
    return 0;
}
