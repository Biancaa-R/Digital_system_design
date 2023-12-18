#include <iostream>
#include <unordered_map>

int main() {
    std::unordered_map<int, std::string> myMap = {
        {1, "One"},
        {2, "Two"},
        {3, "Three"}
    };

    // Remove an element by key
    int keyToRemove = 2;
    size_t removedElements = myMap.erase(keyToRemove);

    if (removedElements > 0) {
        std::cout << "Element with key " << keyToRemove << " removed." << std::endl;
    } else {
        std::cout << "Element with key " << keyToRemove << " not found." << std::endl;
    }

    // Print the updated map
    std::cout << "Updated Map:" << std::endl;
    for (const auto& pair : myMap) {
        std::cout << "Key: " << pair.first << ", Value: " << pair.second << std::endl;
    }

    return 0;
}
