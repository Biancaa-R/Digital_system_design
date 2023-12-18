#include <bitset>
#include <iostream>
# include<typeinfo>

int main() {
    int decimalNumber = 42; // Replace this with your decimal number

    // Convert decimal to binary using std::bitset
    std::bitset<8> binaryRepresentation(decimalNumber); // 8 is the number of bits

    std::cout << "Binary representation: " << typeid(binaryRepresentation).name() << std::endl;

    return 0;
}
