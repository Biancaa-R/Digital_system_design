#include <iostream>
#include <vector>
using namespace std;

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

int main() {
    int number = 12345;

    // Convert the number to a vector of digits
    vector<int> result = numberToVector(number);

    // Display the vector
    cout << "Vector representation: ";
    for (int digit : result) {
        cout << digit << " ";
    }
    cout << endl;

    return 0;
}
