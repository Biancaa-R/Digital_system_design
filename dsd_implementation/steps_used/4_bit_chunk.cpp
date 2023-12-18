#include <iostream>
#include <string>

int main() {
    int number = 100000;

    // Convert the number to a string
    std::string strNumber = std::to_string(number);

    // Keep only the last 4 digits and pad with leading zeros if needed
    std::string result = strNumber.substr(std::max<int>(strNumber.size() - 4, 0));

    // Display the result
    std::cout << "Formatted result: " << stoi(result) << std::endl;
    
    char x = '3';
    int intValue = static_cast<int>(x- '0');
    std::cout<<intValue;

}
