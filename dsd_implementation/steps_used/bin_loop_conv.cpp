#include <iostream>
#include <string>
using namespace std;

string binary_from_dec(int decimalNumber,int num) {
    //where num is the number of variables
    string binary="";
    if (decimalNumber == 0) {
        //cout << "Binary representation: 0" << std::endl;
        
        for (int i = 0; i < num; ++i) {
        binary += "0";
            }
        return binary;
    }

    while (decimalNumber > 0) {
        int remainder = decimalNumber % 2;
        //std::cout << remainder;
        binary+=to_string(remainder);
        decimalNumber /= 2;
    }
    if (binary.length()<num){
        int alpha=num-binary.length();
        //number of 0 s to be added
        for(int i=0;i<alpha;i++){
            binary="0"+binary;
        }
    }
    return binary;
}

int main() {
    int decimalNumber = 7; // Replace this with your decimal number

    // Convert decimal to binary using successive division and a loop
    string y= binary_from_dec(decimalNumber,3);
    cout<<y;

    return 0;
}
