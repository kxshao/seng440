#include <stdio.h>

int main() {
	//the ={} initializes to zero
	int buff[128] = {};
	int numCounted = charCount("aaaaabbbbcccdde",buff);
	printf("Counted: %d\n",numCounted);

	for(int i = 95;i<110;i++){
		printf("%c count: %d\n",i,buff[i]);
	}
	return 0;
}