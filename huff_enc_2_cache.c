#include <stdio.h>
#include <stdlib.h>
#include "string.h"

#define  INPUT_SIZE 1000000
#define VERBOSE 0

int main() {
    char* lookupTableAZ[26] = {"1110","010010","111110","0010","100","00110","101110","1010","0110","11111110111","1111110","11110","00111","1100","1101","010011","1111111010","0101","0111","000","10110","11111111","01000","111111100","101111","11111110110",};

    //	FILE* f = fopen("../text/in.txt","r");
	FILE* f = stdin;
	if(!f){
		printf("file open failed\n");
		return 1;
	}
	int c;
	int inputSize = 0;
	while ((c = fgetc(f))!=EOF){
        if(c>64 && c<91){
            printf("%s",lookupTableAZ[c-65]);
        }
        //-2 to leave space for the ending null and the fact that index counts from 0
		if(++inputSize > INPUT_SIZE-2) break;
	}
	if(VERBOSE) printf("chars read %d\n",inputSize);
	fclose(f);

	return 0;
}