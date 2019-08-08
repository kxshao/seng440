#include <stdio.h>

int main() {
    unsigned char derp[8] = {1,2,3,4,1,2,3,4};
    unsigned int * pt = derp;
    unsigned char a = pt[1];
    unsigned short int b = pt[1];
    unsigned int c = pt[1];

    printf("%uc\n",a);
    printf("%uc\n",b);
    printf("%uc\n",c);

    return 0;
}