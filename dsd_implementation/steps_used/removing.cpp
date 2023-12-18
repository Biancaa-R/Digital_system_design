#include <iostream>
#include <vector>
#include <unordered_map>
# include<string>

using namespace std;

int main() {
    vector<int> keysToRemove;
    unordered_map<vector<int>,vector<int> matched_pairs = {
        {{1,2,3,4,5,6}, {1,0,1,0,5}},
        {{1,2,3},{3,4,5,3,2}},
        {{1,5,6,7,5,4},{7,5,4,3,2,2}}
        
    };

    int max1 = 0, max2 = 0, max;

    // Check if the map is not empty
    if (!matched_pairs.empty()) {
        // Initialize max1 with the size of the first element in the map
        auto itr = matched_pairs.begin();
        max1 = itr->first;

        // Check the size of all keys to find the maximum size
        for (const auto& pair : matched_pairs) {
            max2 = pair.first;
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
            if ( to_string(pair.first).size() < max) {
                keysToRemove.push_back(pair.first);
            }
        }

        // Remove elements outside the loop
        for (const auto& key : keysToRemove) {
            matched_pairs.erase(key);
        }

        // Display the updated map
        for (const auto& pair : matched_pairs) {
            cout << pair.first << ": " << pair.second << endl;
        }
    }

    return 0;
}
