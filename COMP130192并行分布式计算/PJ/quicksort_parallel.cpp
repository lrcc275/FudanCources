#include <iostream>
#include <fstream>
#include <omp.h>
#include <random>
#include <chrono>

using namespace std::chrono;
using namespace std;

void quicksort(int arr[], int left, int right) {
    if (left < right) {
        int i = left, j = right;
        int pivot = arr[(left + right) / 2];

        while (i <= j) {
            while (arr[i] < pivot)
                i++;
            while (arr[j] > pivot)
                j--;
            if (i <= j) {
                swap(arr[i], arr[j]);
                i++;
                j--;
            }
        }

        #pragma omp single nowait
        {
            #pragma omp task
            {
                if (left < j)
                    quicksort(arr, left, j);
            }

            #pragma omp task
            {
                if (i < right)
                    quicksort(arr, i, right);
            }
        }
    }
}

int main() {
    int arraySize = 1000;
    int arr[arraySize];
    int size = arraySize;
    ifstream infile("numbers.txt");
    int index = 0;
    while (infile && index < arraySize) {
        int number;
        infile >> number;
        arr[index++] = number;
    }
    auto start = steady_clock::now();

    #pragma omp parallel num_threads(16)
    {
        #pragma omp single nowait
        {
            #pragma omp task
            {
                quicksort(arr, 0, size - 1);
            }
        }
    }

    #pragma omp taskwait

    auto end = steady_clock::now();
    auto during = end - start;
    std::cout <<"sort " << arraySize << " numbers, use time: " << during.count() << " ns" << std::endl;

    return 0;
}
