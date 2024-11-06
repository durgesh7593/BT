#include <iostream>
#include <string>
#include <map>
#include <vector>
#include <queue>
using namespace std ;


struct Node{
    char data ; 
    int freq ; 
    Node* left ; 
    Node* right ; 

    Node (char data_ , int freq_){
        data = data_ ; 
        freq = freq_ ;
        left = nullptr ; 
        right = nullptr ; 
    }
};

struct compare{
    bool operator()(Node* Left, Node* Right){
        return Left->freq > Right->freq ; 
    }
};


void printCodes(Node* n , string code,unordered_map<char, string>& codes){
    if (!n){
        return ; 
    }
    if (!n->left && !n->right){
        codes[n->data] = code ; 
        cout  <<n->data << " : " << codes[n->data] <<endl ; 
    }
    else {
        printCodes(n->left , code + "0" , codes ); 
        printCodes(n->right , code + "1" , codes ); 
    }
}

void buildHuffmanTree (string text){
    unordered_map <char , int > freqs ; 
    for (auto ch : text){
        freqs[ch] ++ ; 
    }

    priority_queue<Node* , vector<Node*> , compare> pq ; 

    for (auto pair : freqs){
        pq.push(new Node(pair.first , pair.second)) ; 
    }

    while (pq.size()>1){
        Node* left = pq.top() ; pq.pop() ; 
        Node* right = pq.top() ; pq.pop() ; 

        Node* newNode = new Node ('\0' , left->freq + right->freq ); 

        newNode -> left = left ; 
        newNode -> right = right; 

        pq.push(newNode) ; 
    }

    Node* root = pq.top() ; 

    unordered_map<char, string> codes ; 
    printCodes(root,  "" , codes) ; 

    cout << "\nEncoded string: ";
    for (char ch : text) {
        cout << codes[ch];
    }
    cout << endl;
}
int main (){
    string text;
    cout << "Enter text to encode using Huffman Encoding: ";
    getline(cin, text);

    buildHuffmanTree(text);
}
