#include <iostream>
#include <algorithm>
#include <vector>

bool isEven(int num) {
    return num % 2 == 0;
}

int main() {
    std::vector<int> numbers = {1, 2, 3, 4, 5, 6, 7, 8};

    int newValue = 0;

    // Use std::replace_if to replace all even numbers with newValue
    std::replace_if(numbers.begin(), numbers.end(), isEven, newValue);

    // Display the modified vector
    std::cout << "Modified vector: ";
    for (int num : numbers) {
        std::cout << num << " ";
    }
    std::cout << std::endl;

    return 0;
}
