#include <iostream>
#include <vector>
using namespace std;

// Function to solve 0-1 Knapsack using memoization
int solve(int index, int capacity, vector<int>& values, vector<int>& weights, vector<vector<int>>& dp) {
    // Base case: If no items left or capacity is 0
    if (index < 0 || capacity == 0) {
        return 0;
    }

    // If the value is already computed, return it
    if (dp[index][capacity] != -1) {
        return dp[index][capacity];
    }

    // Option to not pick the current item
    int notPick = solve(index - 1, capacity, values, weights, dp);

    // Option to pick the current item (only if its weight is within the capacity)
    int pick = 0;
    if (weights[index] <= capacity) {
        pick = values[index] + solve(index - 1, capacity - weights[index], values, weights, dp);
    }

    // Choose the maximum value between picking and not picking the item
    dp[index][capacity] = max(pick, notPick);

    return dp[index][capacity];
}

int knapsack(int capacity, vector<int>& values, vector<int>& weights) {
    int n = values.size();
    // Create a memoization table initialized with -1 and name it dp
    vector<vector<int>> dp(n, vector<int>(capacity + 1, -1));

    return solve(n - 1, capacity, values, weights, dp);
}

int main() {
    vector<int> values = {60, 100, 120}; // Values of the items
    vector<int> weights = {10, 20, 30};  // Weights of the items
    int capacity = 50;                   // Capacity of the knapsack

    int result = knapsack(capacity, values, weights);
    cout << "The maximum value that can be obtained is: " << result << endl;

    return 0;
}
