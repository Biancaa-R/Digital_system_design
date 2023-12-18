#include <iostream>
#include <unordered_map>
using namespace std;

int main() {

  // uniform initialization
  unordered_map<string, int> unordered_map1  {
  {"One", 1},
  {"Two", 2},
  {"Three", 3}
 };

  cout << "Key - Value" << endl;

  // loop across the unordered map
  // display the key-value pairs
  for(const auto& key_value: unordered_map1) {
    string key = key_value.first;
    int value = key_value.second;
    
    cout << key << " - " << value << endl;
  }
  
  return 0;
}