#include <iostream>
#include <vector>
#include <variant>
using namespace std;

int main() {
    vector<variant<int, double, string>> mixedVector;

    mixedVector.push_back(42);
    mixedVector.push_back(3.14);
    mixedVector.push_back("Hello");

    for (const auto& item : mixedVector) {
        if (holds_alternative<int>(item)) {
            cout << "Integer: " << get<int>(item) << endl;
        } else if (holds_alternative<double>(item)) {
            cout << "Double: " << get<double>(item) << endl;
        } else if (holds_alternative<string>(item)) {
            cout << "String: " << get<string>(item) << endl;
        }
    }

    return 0;
}
