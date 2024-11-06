#include<iostream>
#include<vector>
#include<map>
#include<cstdlib> // For rand()

using namespace std; 

class quicks {
public: 
    vector<int> arr; 

    quicks(vector<int> arr_){
        arr = arr_; 
    } 

    void display(){
        for (auto i : arr){
            cout << i << " ";  
        }
        cout << endl; 
    }

    // Partition for normal quicksort
    int partation(int l, int h){
        int p = arr[l]; 
        int i = l + 1;

        for (int j = l + 1; j <= h; j++){
            if (arr[j] < p){
                swap(arr[i++], arr[j]);
            }
        }
        swap(arr[i-1], arr[l]); 
        return i - 1; 
    }

    // Partition with random pivot for randomized quicksort
    int partation_r(int l, int h){
        int p = l + rand() % (h - l + 1); 
        swap(arr[l], arr[p]); 
        return partation(l, h); 
    }

    // Sorting using normal quicksort
    void sort_d(int l, int h){
        if(l < h){
            int p = partation(l, h); 
            cout << "Pivot index: " << p << " Value: " << arr[p] << endl;

            display(); 

            sort_d(l, p - 1); 
            sort_d(p + 1, h);  
        }
    }

    // Sorting using randomized quicksort
    void sort_r(int l, int h){
        if(l < h){
            int p = partation_r(l, h); 
            cout << "Pivot index: " << p << " Value: " << arr[p] << endl;

            display(); 

            sort_r(l, p - 1); 
            sort_r(p + 1, h);  
        }
    }
};

int main() {
    // Test Case 1: Normal quicksort
    vector<int> arr1 = {12, 4, 7, 9, 2, 5, 10};
    quicks q1(arr1);
    cout << "Sorting with Normal Quicksort (sort_d):" << endl;
    q1.sort_d(0, arr1.size() - 1);

    cout << "-----------------------------------" << endl;

    // Test Case 2: Randomized quicksort
    vector<int> arr2 = {12, 4, 7, 9, 2, 5, 10};
    quicks q2(arr2);
    cout << "Sorting with Randomized Quicksort (sort_r):" << endl;
    q2.sort_r(0, arr2.size() - 1);

    return 0; 
}
