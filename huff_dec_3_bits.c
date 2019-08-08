#include <stdio.h>

#define  INPUT_SIZE 5000000
#define VERBOSE 0

struct CacheObj{
    char c;
    unsigned char actualBits;
};
//this can be addressed as a 6 bit number (char or int)
const struct CacheObj cache6[] ={
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
        0,5,//11111x
        0,5//11111x
};

int main() {
//	FILE* f = fopen("../text/enc.bin","r");
	FILE* f = stdin;
	if(!f){
		return 1;
	}
	int c;

	//parse encoded input
    unsigned char input[INPUT_SIZE];
    unsigned char* inputIndex = input;
	int inputSize = 0;
	while ((c = fgetc(f))!=EOF){
		*inputIndex++ = c;
		if(++inputSize > INPUT_SIZE-1) break;
	}
    unsigned char* endIndex = inputIndex;


	inputIndex = input;
    unsigned char byte1;
    unsigned char byte2;
    unsigned char lookup;
    unsigned int startBit = 0;

    while(inputIndex < endIndex-1){
        byte1 = *inputIndex;
        byte2 = *(inputIndex+1);
        lookup = byte1 << startBit;
        lookup |= byte2 >> (8-startBit);
        lookup >>= 2;
		struct CacheObj tmp = cache6[lookup];
        if(tmp.c){
            //cache hit
            putc(tmp.c,stdout);
            startBit+=tmp.actualBits;
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
            startBit += 5;
            //if more than 8 bits used out of the 16 bit buffer, fetch next 8
            if(startBit>7){
                startBit -=8;
                inputIndex++;
                byte1 = byte2;
                byte2 = *inputIndex;
            }
            unsigned short int bothBits = (byte1<<8) | (byte2);
            unsigned short int mask = 0x8000u >> (startBit);
            if(!(bothBits&mask)){
                putc('C',stdout);
                startBit+=1;
            } else if(!(bothBits&(mask>>1))){
                putc('K',stdout);
                startBit+=2;
            } else if(  bothBits&(mask>>2)){
                putc('V',stdout);
                startBit+=3;
            } else if(!(bothBits&(mask>>3))){
                putc('X',stdout);
                startBit+=4;
            } else if(!(bothBits&(mask>>4))){
                putc('Q',stdout);
                startBit+=5;
            } else if(  bothBits&(mask>>5)){
                putc('J',stdout);
                startBit+=6;
            } else{
                putc('Z',stdout);
                startBit+=6;
            }
        }
        //if more than 8 bits used out of the 16 bit buffer, fetch next 8
        if(startBit>7){
            startBit -=8;
            inputIndex++;
        }
	}

	return 0;
}