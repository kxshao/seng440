#include <stdio.h>
#include <stdlib.h>
#include "string.h"

#define  INPUT_SIZE 5000000
#define VERBOSE 0

int main() {
//	FILE* f = fopen("../text/enc.txt","r");
	FILE* f = stdin;
	if(!f){
		printf("file open failed\n");
		return 1;
	}
	int c;

	//parse encoded input
	char input[INPUT_SIZE];
	char* inputIndex = input;
	int inputSize = 0;
	while ((c = fgetc(f))!=EOF){
	    //subtract 48 to change '0' to 0
		*inputIndex++ = (char)c-48;
		if(++inputSize > INPUT_SIZE-2) break;
	}

	struct CacheObj{
	    char c;
	    int actualBits;
	};
	//this can be addressed as a 6 bit number (char or int)
    struct CacheObj cache6[] ={
            'T',3,//000xxx
            'T',3,//000xxx
            'T',3,//000xxx
            'T',3,//000xxx
            'T',3,//000xxx
            'T',3,//000xxx
            'T',3,//000xxx
            'T',3,//000xxx
            'D',4,//0010xx
            'D',4,//0010xx
            'D',4,//0010xx
            'D',4,//0010xx
            'F',5,//00110x
            'F',5,//00110x
            'M',5,//00111x
            'M',5,//00111x
            'W',5,//01000x
            'W',5,//01000x
            'B',6,//010010
            'P',6,//010011
            'R',4,//0101xx
            'R',4,//0101xx
            'R',4,//0101xx
            'R',4,//0101xx
            'I',4,//0110xx
            'I',4,//0110xx
            'I',4,//0110xx
            'I',4,//0110xx
            'S',4,//0111xx
            'S',4,//0111xx
            'S',4,//0111xx
            'S',4,//0111xx
            'E',3,//100xxx
            'E',3,//100xxx
            'E',3,//100xxx
            'E',3,//100xxx
            'E',3,//100xxx
            'E',3,//100xxx
            'E',3,//100xxx
            'E',3,//100xxx
            'H',4,//1010xx
            'H',4,//1010xx
            'H',4,//1010xx
            'H',4,//1010xx
            'U',5,//10110x
            'U',5,//10110x
            'G',6,//101110
            'Y',6,//101111
            'N',4,//1100xx
            'N',4,//1100xx
            'N',4,//1100xx
            'N',4,//1100xx
            'O',4,//1101xx
            'O',4,//1101xx
            'O',4,//1101xx
            'O',4,//1101xx
            'A',4,//1110xx
            'A',4,//1110xx
            'A',4,//1110xx
            'A',4,//1110xx
            'L',5,//11110x
            'L',5,//11110x
            0,5//11111x
    };

	int i = 0;

    while(i<inputSize-11){
		//note - only stores 6 bits out of 8
        unsigned char buffer;
		//first bit
		buffer = input[i];
		if(buffer>1)return 1;
		//shift for bits 2-6
		buffer <<= 1;
		buffer |= input[i+1];
        buffer <<= 1;
        buffer |= input[i+2];
        buffer <<= 1;
        buffer |= input[i+3];
        buffer <<= 1;
        buffer |= input[i+4];
        buffer <<= 1;
        buffer |= input[i+5];
        if(cache6[buffer].c){
            //cache hit
            putc(cache6[buffer].c,stdout);
            i+=cache6[buffer].actualBits;
        } else{
            //rare letter found, up to 6 additional bits
            //all in the list below begin with 11111
            // {'C',"0"},
            // {'K',"10"},
            // {'V',"111"},
            // {'X',"1100"},
            // {'Q',"11010"},
            // {'Z',"110110"},
            // {'J',"110111"},

            if(!input[i+5]){
                putc('C',stdout);
                i+=6;
            } else if(!input[i+6]){
                putc('K',stdout);
                i+=7;
            } else if( input[i+7]){
                putc('V',stdout);
                i+=8;
            } else if(!input[i+8]){
                putc('X',stdout);
                i+=9;
            } else if(!input[i+9]){
                putc('Q',stdout);
                i+=10;
            } else if( input[i+10]){
                putc('J',stdout);
                i+=11;
            } else{
                putc('Z',stdout);
                i+=11;
            }
        }
	}

	return 0;
}