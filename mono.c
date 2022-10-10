#include <stdio.h>
#include <stdbool.h>
int i[]={1,2,5,5,6};
int j[]={600,240,43,25,1};
int k[]={1,3,2,4,5};
int l[]={34,34,34,34,34};
int m[]={1,0,-1,0};
bool res[5];
bool isMonotonic(int* nums, int numsSize){
    bool a=false,d=false;
    int eq=0;
    for(int i=0;i<numsSize-1;++i){  
        if(nums[i]<nums[i+1])
            a=true;
        if(nums[i]>nums[i+1])
            d=true;
        if(nums[i]==nums[i+1])
            eq++;
    }
    return a^d|(eq==numsSize-1);
}

int main(){
    res[0]=isMonotonic(i,5);
    res[1]=isMonotonic(j,5);
    res[2]=isMonotonic(k,5);
    res[3]=isMonotonic(l,5);
    res[4]=isMonotonic(m,4);
    for(bool *it=res;it<res+5;++it){
        if(*it)
            printf("true\n");
        else
            printf("false\n");
    }
}