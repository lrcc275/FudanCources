#include <iostream>
#include <chrono>
#include <fstream>
using namespace std;
using namespace std::chrono;

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
        if (left < j)
            quicksort(arr, left, j);
        if (i < right)
            quicksort(arr, i, right);
    }
}
int main() {
    const int arraySize = 100000;
    int array[arraySize];

    ifstream infile("numbers.txt");
    int index = 0;
    while (infile && index < arraySize) {
        int number;
        infile >> number;
        array[index++] = number;
    }

    auto start = steady_clock::now();
    quicksort(array, 0, arraySize - 1);
    auto end = steady_clock::now();
    auto during = end - start;

    std::cout <<"sort " << arraySize << " numbers, use time: " <<during.count() << " ns" << std::endl;

    return 0;
}
