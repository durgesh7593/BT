#include <iostream>
#include <algorithm>
#include <string>
#include <map>
#include <vector>
#include <queue>
using namespace std ;

int knapsackDP(string studentList[] , int weights[] , int values[] , int capacity , int items ){
    int dp[items+1][capacity+1];
    for (int i = 0 ; i <= items ; i ++){
        dp[0][i] = 0 ;
        dp[i][0] = 0 ; 
    }
    for (int i = 1 ; i <= items ; i ++){
        for (int j = 1 ; j <= capacity ; j ++){
            if(j - weights[i-1] >= 0 ){
                dp[i][j] = max(dp[i-1][j] , values[i-1] + dp[i][j-weights[i-1]]);
            }else{
                dp[i][j] = dp[i-1][j] ; 
            }
        }
    }
    return dp[items][capacity];
}

int main(){
    string item_list[] = {"1","2","3","4"};
    int weight[] = {2,3,4,5} ;
    int value[] = {3,4,5,6} ;  
    int capacity = 5 ;
    int items = 4;
    cout << knapsackDP(item_list , weight , value, capacity,items) ;
    return 0 ; 
}
