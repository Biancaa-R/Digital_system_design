#include <iostream>
#include <vector>
#include <unordered_map>
#include <string>

using namespace std;

namespace std {
    template <>
    struct hash<std::vector<int>> {
        size_t operator()(const std::vector<int>& v) const {
            size_t hash = 0;
            for (int i : v) {
                // Combine the hash with the next element
                hash ^= std::hash<int>{}(i) + 0x9e3779b9 + (hash << 6) + (hash >> 2);
            }
            return hash;
        }
    };
}

int main() {
    vector<vector<int>> keysToRemove;
    unordered_map<vector<int>, vector<int>> matched_pairs = {
        {{1, 2, 3, 4, 5, 6}, {1, 0, 1, 0, 5}},
        {{1, 2, 3}, {3, 4, 5, 3, 2}},
        {{1, 5, 6, 7, 5, 4}, {7, 5, 4, 3, 2, 2}}
    };

    size_t max1 = 0, max2 = 0, max;

    // Check if the map is not empty
    if (!matched_pairs.empty()) {
        // Initialize max1 with the size of the first key in the map
        auto itr = matched_pairs.begin();
        max1 = itr->first.size();

        // Check the size of all keys to find the maximum size
        for (const auto& pair : matched_pairs) {
            max2 = pair.first.size();
            if (max2 != max1) {
                // Whatever it may be
                break;
            }
        }

        if (max1 > max2) {
            max = max1;
        } else {
            max = max2;
        }

        // Find keys that meet the condition
        for (const auto& pair : matched_pairs) {
            if (pair.first.size() < max) {
                keysToRemove.push_back(pair.first);
            }
        }

        // Remove elements outside the loop
        for (const auto& key : keysToRemove) {
            matched_pairs.erase(key);
        }

        // Display the updated map
        for (const auto& pair : matched_pairs) {
            cout << "key: [";
            for (const auto& element : pair.first) {
                cout << element << " ";
            }
            cout << "], value: [";
            for (const auto& element : pair.second) {
                cout << element << " ";
            }
            cout << "]\n";
        }
    }

    return 0;
}
