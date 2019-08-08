#include <stdio.h>

int main() {
//	FILE* f = fopen("../text/enc.txt","r");
    FILE* f = stdin;
    if(!f){
        return 1;
    }

    int c;
    unsigned char buff = 0;
    unsigned char mask = 0b10000000;

    while ((c = fgetc(f))!=EOF){
        if(c=='0'){
//            buff &= ~mask;//unnecessary
            mask >>= 1u;
        } else if(c=='1'){
            buff |= mask;
            mask >>= 1u;
        }
        if(!mask){
            putc(buff,stdout);
            mask = 0b10000000;
            buff = 0;
        }
    }
    if (buff){
        putc(buff,stdout);
    }
    return 0;
}