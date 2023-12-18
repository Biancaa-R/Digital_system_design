//Quine mc clusky method

# include <iostream>
#include <string>
#include <math.h>
#include <unordered_map>
# include<vector>
# include<stdbool.h>

//int obj_num;
//int num;
//Here  - will be 5 just like bus
//int num1=0;
//int num2=0;
//obj_num=num1+num2;
//unordered_map<vector<int>,vector<int>>matched_pairs;
//minterms * arr3=new minterms[obj_num];

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

class minterms{
    public:
        vector <int> bin_rep;
        string value;
        int min;
        int count;
        int group;
        

    void initialize(int m,string v,vector<int> bin,int g){
        min=m;
        value=v;
        bin_rep=bin;
        group=g;
    }

};

string binary_from_dec(int decimalNumber,int num) {
    //where num is the number of variables
    string binary="";
    if (decimalNumber == 0) {
        //cout << "Binary representation: 0" << std::endl;
        
        for (int i = 0; i < num; ++i) {
        binary += "0";
            }
        return binary;
    }

    while (decimalNumber > 0) {
        int remainder = decimalNumber % 2;
        //std::cout << remainder;
        binary+=to_string(remainder);
        decimalNumber /= 2;
    }
    if (binary.length()<num){
        int alpha=num-binary.length();
        //number of 0 s to be added
        for(int i=0;i<alpha;i++){
            binary="0"+binary;
        }
    }
    return binary;
}

vector<int> numberToVector(string num) {
    vector<int> digits;

    for(char x: num){
        int intValue = static_cast<int>(x- '0');
        //This only works for num 0-9
        //enaku prachana illa
        digits.push_back(intValue);
    }

    return digits;
}

void minimize(int num,int num1,int num2){
    //where num is the number of variables
    //num1 is number of minterms
    //num2 is number of dontcares

    int *arr1=new int [num1];
    string *arrb1=new string[num1];
    int * arr2=new int[num2];
    string *arrb2=new string[num2];

    for (int i=0;i<num1;i++){
        cout<<"Enter the "<<i+1<<"term";
        cin>>arr1[i];
    }
    for(int i=0;i<num2;i++){
        cout<<"Enter the "<<i+1<<"term";
        cin>>arr2[i];
    }
    for (int i=0;i<num1;i++){
        string binary;
        binary=binary_from_dec(arr1[i],num);
        arrb1[i]=binary;
    }
    for (int i=0;i<num2;i++){
    string binary;
    binary=binary_from_dec(arr2[i],num);
    arrb2[i]=binary;
    }


    //Finished the conversions
    //Grouping;

    unordered_map<string,vector<int>>vec_rep;
    unordered_map<vector<int>,vector<int>>matched_pairs;

    //unordered_map<vector<int>,vector<int>>merged_pairs;

    //we are storing the vector value with group as int
    //merging of dont cares happen here

    int *arrg1=new int[num1];
    int *arrg2=new int[num2];
    //having data about the groups
    int grp;
    int obj_num;
    obj_num=num1+num2;
    
    minterms * arr3=new minterms[obj_num];
    //creating as many objects as minterms+dont cares
    for(int i=0;i<num1;i++){
        grp=0;
        string bin;
        bin=arrb1[i];
        vector <int> bin_rep1=numberToVector(bin);
        //vector of bin kadachuchu
        for(int i=0;i<num;i++){
            //number of bits= number of variables
            if (bin_rep1[i]==1){
                grp+=1;
            }
        }
        vec_rep[bin]=bin_rep1;
        arrg1[i]=grp;
        }

    for(int i=0;i<num2;i++){
        string bin;
        grp=0;
        bin=arrb2[i];
        vector <int> bin_rep2=numberToVector(bin);
        for(int i=0;i<num;i++){
            //number of bits= number of variables
            if (bin_rep2[i]==1){
                grp+=1;
            }
        }
        vec_rep[bin]=bin_rep2;
        arrg2[i]=grp;
    }

    for (int i=0;i<num1;i++){
        //ready up all the input values:
        int m=arr1[i];
        string v=arrb1[i];
        vector<int> vec=vec_rep[v];
        int g=arrg1[i];
        
        arr3[i].initialize(m,v,vec,g);
    }
    //class and objects are created
         //find the minimum group:
        //i th is base


    int group1=0;
    int count1=0;

    while(group1<num){
    for(int i=0;i<obj_num;i++)
        {
            if (arr3[i].group==group1){
                for(int j=0;j<obj_num;j++){
                    if(j!=i && arr3[j].group==group1+1){
                        //ok a probable match:
                        for(int k=0;k<num;k++){
                            count1=0;
                            if(arr3[i].bin_rep[k]!=arr3[j].bin_rep[k])
                            {
                                count1+=1;
                            }
                        }
                        if (count1!=1){
                            //do nothing
                        }
                        else{
                            //match:
                            vector <int> temp={};
                            for(int k=0;k<num;k++){
                                //for finding change position:
                                if(arr3[i].bin_rep[k]!=arr3[j].bin_rep[k])
                                {
                                    temp.push_back(5);
                                }
                                else{
                                    temp.push_back(arr3[i].bin_rep[k]);
                                }

                            }
                            temp.push_back(group1);//as the last element
                            matched_pairs[{arr3[i].min,arr3[j].min}]=temp;

                        }
                       
                    }
                }
            }
        }
        group1=group1+1;
    }

        //first traversal is over:
        // Iterate through the unordered map using a range-based for loop
        //bool swap=false;
        while (true){
            //group1=0;
            count1=0;
            bool swap=false;

            //should rejuvenate for each iteration
            while(group1<num){


            for (const auto& pair : matched_pairs) {
                if(pair.second[pair.second.size()-1]==group1){
                    for(const auto& despair :matched_pairs){
                        if(despair.second[despair.second.size()-1]==group1+1){
                            //rightuu
                            //a probable match
                            for(int i=0;i<pair.second.size()-1;i++){
                                count1=0;
                                if(pair.second[i]!=despair.second[i])
                                {
                                    count1+=1;
                                }
                            }

                            if(count1==1){
                                //ok done
                                swap=true;
                                vector <int> temp;
                                for(int k=0;k<pair.second.size()-1;k++){
                                    //epdiyum size num+1 dhan
                                    //for finding change position:
                                    if(pair.second[k]!=despair.second[k])
                                    {
                                        temp.push_back(5);
                                    }
                                    else{
                                        temp.push_back(pair.second[k]);
                                    }

                                }
                                temp.push_back(group1);//as the last element
                                vector <int> newmatch;
                                for(int i=0;i<pair.first.size();i++){
                                    newmatch.push_back(pair.first[i]);
                                }
                                for(int i=0;i<despair.first.size();i++){
                                    newmatch.push_back(despair.first[i]);
                                }
                                matched_pairs[newmatch]=temp;
                                //merged_pairs[newmatch] = temp;


                            }
                            //matched_pairs.insert(merged_pairs.begin(),merged_pairs.end());
                            //merged_pairs.clear();
                        }
                    }
                }         
            }

            group1+=1;
            
        }
        

    /*
        //remove trash from previous iteration
        //based on length:
        //The matched pair set is same for a particular batch
        int max1=0,max2=0;
        int max;
        /*for(const auto& pair :matched_pairs){
            max1=pair.first.size();
            //there is no other way for me to get hold of a value
        }
        auto itr=matched_pairs.begin();
        max1=itr->first.size();
        //to check if difference exists in the first place:
        for(const auto& pair:matched_pairs){
            max2=pair.first.size();
            if (max2!=max1){
                //whatever it may be
                break;
            }
        }
        if(max1>max2){
            max=max1;
        }
        else{
            max=max2;
        }

        //removal with erase function code:
        //here pair.first is the key value:
        //for(const auto& pair:matched_pairs)
        {
            if(pair.first.size()<max){
                size_t removedElements = matched_pairs.erase(pair.first);
                //its just stored in removedElements
            }
        }*/
        

            size_t max1 = 0, max2 = 0, max;

    // Check if the map is not empty
    if (!matched_pairs.empty()) {

        vector<vector<int>> keysToRemove;
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


        
        if (swap==false){
            break;
            //no change happened in the entire iteration
    }

}
    
    cout<<"\n\nend------";

    for (const auto& pair : matched_pairs) {
        // Print the key (first)
        std::cout << "key: [";
        for (const auto& element : pair.first) {
            std::cout << element << " ";
        }
        std::cout << "], ";

        // Print the value (second)
        std::cout << "value: [";
        for (const auto& element : pair.second) {
            std::cout << element << " ";
        }
        std::cout << "]\n";
    }

    /*for(const auto&pair :matched_pairs){
        vector<int> mins=pair.first;
        vector<int> bin=pair.second;
        for(int k=0;k<mins.size();k++){
            cout<<mins[k]<<"\t";
        }
        cout<<":";
        for(int k=0;k<bin.size();k++){
            cout<<bin[k]<<"\t";
        }
        cout<<"\n";
    }*/

}


int main()
{
    minimize(5,7,2);

}