#include <stdio.h>

int main() {
	//the ={} initializes to zero
	int buff[95] = {};
	//this passes a negative array index with the expectation that the function only access indexes 32-127
	int numCounted = charCount("aaaaabbbbcccdde",buff-32);
	printf("Counted: %d\n",numCounted);

	int keys[95];
	for(int i = 0; i<95; i++){
		keys[i] = i+32;
	}
	sort(keys,buff,95);

	int realSize = 95;
	for(int i = 0;i<95;i++){
		if(buff[i]==0){
			realSize = i;
			break;
		}
	}


	for(int i = 0;i<realSize;i++){
		printf("%c count: %d\n",keys[i],buff[i]);
	}
	return 0;
}