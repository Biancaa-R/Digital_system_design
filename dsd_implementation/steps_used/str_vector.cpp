#include <iostream>
#include <vector>
#include <string>

int main() {
    std::string inputString = "Hello, World!";

    // Convert string to vector of strings
    std::vector<std::string> stringVector;
    for (char character : inputString) {
        stringVector.push_back(std::string(1, character));
    }

    // Display the result
    std::cout << "String to Vector of Strings: ";
    for (const std::string& str : stringVector) {
        std::cout << str << " ";
    }
    std::cout << std::endl;

    return 0;
}
