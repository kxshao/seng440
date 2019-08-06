#include <stdio.h>
#include <stdlib.h>
#include "string.h"

#define  INPUT_SIZE 10000
#define  MAX_DEPTH 20
#define VERBOSE 0

int main() {
	FILE* f = fopen("/home/go/textfiles/testfile.txt","r");
//	FILE* f = stdin;
	if(!f){
		printf("file open failed\n");
		return 1;
	}
	int c;

	//build the table from input
	char* lookupTable[128];
	int lookupTableSize = fgetc(f);
	//discard 1 newline after size
	fgetc(f);
	for(int i = 0; i<lookupTableSize; i++){
		char k = (char) fgetc(f);
		char v[MAX_DEPTH];
		int size = 0;
		//ignore the following comma
		fgetc(f);
		while ((c = fgetc(f))!='\n'){
			v[size] = (char) c;
			size++;
		}
		//terminate
		v[size] = 0;
		lookupTable[k] = malloc(sizeof(char)*size);
		strcpy(lookupTable[k],v);
		printf("%s\n",v);
	}

	//parse encoded input
	char input[INPUT_SIZE];
	char* inputIndex = input;
	int inputSize = 0;
	while ((c = fgetc(f))!=EOF){
		*inputIndex++ = (char)c;
		if(++inputSize > INPUT_SIZE-2) break;
	}

	printf("%s",input);
	return 0;
}