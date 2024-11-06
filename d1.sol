#include <iostream>
#include <vector>
using namespace std ;

long long int recFibo(long long int n){
    if(n == 1 || n == 2){
        return 1 ; 
    }
    else {
        return recFibo(n-1) + recFibo(n-2) ; 
    }
    return -1 ; 
}

long long int itrFibo(long long int n){
    long long int a = 0 ;
    long long int b = 1 ; 
    long long int c = 1;
    for (int i = 0 ; i < n-1 ; i ++){
        c = a + b ; 
        a = b ; 
        b = c ; 
    }
    return c ; 
}


long long int itrFiboB(long long int n){
    vector<long long int> B ; 
    B.push_back(0) ; 
    B.push_back(1) ; 

    for (int i = 2 ; i <= n ; i ++){
        B.push_back(B[i-1] + B[i-2]) ; 
    }
    if(n >= 0 ){
        return B[n] ; 
    }
    return  -1 ; 
}

int main (){
    cout << recFibo(1)<<endl ;
    cout << recFibo(2)<<endl ;
    cout << recFibo(3)<<endl ;
    cout << recFibo(4)<<endl ;
    cout << recFibo(5)<<endl ;
    cout << recFibo(6)<<endl ;
    cout <<endl ;
    cout << itrFibo(1)<<endl ;
    cout << itrFibo(2)<<endl ;
    cout << itrFibo(3)<<endl ;
    cout << itrFibo(4)<<endl ;
    cout << itrFibo(5)<<endl ;
    cout << itrFibo(6)<<endl ;
    cout <<endl ;
    cout << itrFiboB(1)<<endl ;
    cout << itrFiboB(2)<<endl ;
    cout << itrFiboB(3)<<endl ;
    cout << itrFiboB(4)<<endl ;
    cout << itrFiboB(5)<<endl ;
    cout << itrFiboB(6)<<endl ;


    return 0 ; 
}
