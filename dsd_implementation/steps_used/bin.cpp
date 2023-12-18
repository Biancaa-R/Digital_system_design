

// C++ program to convert decimal numbers to binary using
// bitset class
#include <bitset>
#include <iostream>
#include <math.h>
using namespace std;

#include <vector>

vector<int> numberToVector(int num) {
    vector<int> digits;

    // Handle the case when the number is 0 separately
    if (num == 0) {
        digits.push_back(0);
        return digits;
    }

    // Extract digits and store them in the vector
    while (num > 0) {
        digits.insert(digits.begin(), num % 10);
        num /= 10;
    }

    return digits;
}

int main()
{
    int decimalNumber = 5;
 
    // Assuming 32-bit representation
      const int sz = ceil(log2(100));
    bitset<sz> binaryRepresentation(decimalNumber);
 
    cout << "Binary representation:" << binaryRepresentation << endl;
    vector<int> result = numberToVector(binaryRepresentation);
    //ERROR ;///

    //Dropping the idea of using bitset
    //rip bitset

    /*
    Result produced : St6bitsetILy8EE
    type id operator when used on std::bitset<8> object
    St- start of name of the data type
    6-6 characters of info
    bitset-bitset class
    I-integer type
    ILy8E part indicates that it is a template class with the template parameter being an 
    std::integral_constant<unsigned long long, 8>. 
    The mangled name is compiler-specific and may vary between different C++ compilers.

    E-> end of template name
    E->end of name of datatype
    */
 
    return 0;
}