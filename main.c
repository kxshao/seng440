#include <stdio.h>

int main() {
	//the ={} initializes to zero
	int buff[128] = {};
	int numCounted = charCount("aaaaabbbbcccdde",buff);
	printf("Counted: %d\n",numCounted);

	int keys[128];
	for(int i = 0; i<128; i++){
		keys[i] = i;
	}

	sort(keys,buff,128);

	for(int i = 0;i<128;i++){
		printf("%c count: %d\n",keys[i],buff[i]);
	}
	return 0;
}