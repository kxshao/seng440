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

	int realSize;
	for(realSize = 0;realSize<95;realSize++){
		if(buff[94-realSize]==0){
			break;
		}
	}
	//todo possibly remove an unnecessary array and initializer loop
	//im dumb why did i originally define the array as int instead of char
	char sortedLetters[realSize];
	int weights[realSize];
	for(int i = 0;i<realSize;i++){
		sortedLetters[i] = (char) keys[94-i];
		weights[i] = buff[94-i];
	}

	printf("unique letters: %d\n",realSize);

	for(int i = 0;i<realSize;i++){
		printf("%c count: %d\n",sortedLetters[i],weights[i]);
	}
	return 0;
}