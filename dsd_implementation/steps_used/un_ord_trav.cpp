#include <iostream>
#include <unordered_map>

int main() {
    // Create an unordered map
    std::unordered_map<int, std::string> myMap = {
        {1, "One"},
        {2, "Two"},
        {3, "Three"}
    };

    // Iterate through the unordered map using a range-based for loop
    for (const auto& pair : myMap) {
        std::cout << "Key: " << pair.first << ", Value: " << pair.second << std::endl;
    }

    return 0;
}
