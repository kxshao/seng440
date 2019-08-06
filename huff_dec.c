#include <stdio.h>
#include <stdlib.h>
#include "string.h"

#define  INPUT_SIZE 5000000
#define VERBOSE 0

typedef struct BinaryTreeNode{
	struct BinaryTreeNode* l;
	struct BinaryTreeNode* r;
	struct BinaryTreeNode* parent;
	char v;
	int weight;
} Node;


Node* join(Node* l, Node* r){
	Node* parent = malloc(sizeof(Node));
	parent -> l = l;
	parent -> r = r;
	parent -> parent = NULL;
	parent -> v = 0;
	if(r==NULL){
		parent -> weight = l->weight;
	} else{
		parent -> weight = l->weight + r->weight;
	}
	return parent;
}

void insert(Node* newNode, Node** nodes, int start, int end){
	int i;
	for(i = start+1; i<end; i++){
		if(newNode->weight < nodes[i]->weight){
			break;
		}
		nodes[i-1]=nodes[i];
	}
	nodes[i-1] = newNode;
}

void makeTree(Node** tree, const char* letters, const int* counts, int size){
	Node *leafs[size];

	//init
	for (int i=0;i<size;i++){
		leafs[i] = malloc(sizeof(Node));
		leafs[i]->l = NULL;
		leafs[i]->r = NULL;
		leafs[i]->parent = NULL;
		leafs[i]->v = letters[i];
		leafs[i]->weight = counts[i];
	}

	//base case
	if(size==1){
		*tree = join(leafs[0],NULL);
		return;
	}

	int i = 1;
	Node *tmp;

	//start at lowest weight and go up
	while (i<size){
		tmp = join(leafs[i-1], leafs[i]);
		//leafs[i-1] becomes ignored garbage

		//maintain small-to-big sorted order
		insert(tmp,leafs,i,size);
		i++;
	}

	*tree = leafs[size-1];
}

void printTree(Node* tree, const char* sequence){
	if(tree==NULL) return;
	if(*sequence==0){
		printf("Printing tree: (total weight %d)\n",tree->weight);
	} else{
		if(tree->v){
			printf("Leaf,\'%c\',%s,%d\n",tree->v,sequence,tree->weight);
		} else{
			printf("Intermediate,%s,%d\n",sequence, tree->weight);
		}
	}
	//C lang bullshit to join const strings
	int l = (int) strlen(sequence);
	char newStr[l+2];//strlen doesnt count the ending 0
	strcpy(newStr,sequence);
	//manually fiddle with the last bits rather than call strcat
	newStr[l]='0';
	newStr[l+1]=0;
	printTree(tree->l,newStr);
	newStr[l]='1';
	printTree(tree->r,newStr);
}

void makeLookupTable(Node* tree, const char* sequence, char** table){
	if(tree==NULL) return;
	if(*sequence){
		if(tree->v){
			//leaf
			table[tree->v] = malloc(sizeof(char)*(strlen(sequence)+1));
			strcpy(table[tree->v],sequence);
		} else{
		}
	}
	//C lang bullshit to join const strings
	int l = (int) strlen(sequence);
	char newStr[l+2];//strlen doesnt count the ending 0
	strcpy(newStr,sequence);
	//manually fiddle with the last bits rather than call strcat
	newStr[l]='0';
	newStr[l+1]=0;
	makeLookupTable(tree->l,newStr,table);
	newStr[l]='1';
	makeLookupTable(tree->r,newStr,table);
}


int main() {
//	FILE* f = fopen("../text/enc.txt","r");
	FILE* f = stdin;
	if(!f){
		printf("file open failed\n");
		return 1;
	}
	int c;

	//precomputed frequencies
	int charsetSize = 26;
    char keys[26] = {'Z','J','Q','X','V','K','B','P','G','Y','C','F','M','W','U','L','D','R','I','S','H','N','O','A','T','E'};
    int weights[26] = {280,492,545,813,5635,6305,8838,9183,12647,12806,13646,14213,17246,17415,18492,26101,28679,36136,38381,39632,42403,44551,51607,52583,58279,81286};

	//parse encoded input
	char input[INPUT_SIZE];
	char* inputIndex = input;
	int inputSize = 0;
	while ((c = fgetc(f))!=EOF){
		*inputIndex++ = (char)c;
		if(++inputSize > INPUT_SIZE-2) break;
	}

	//levels 1 and 2 have no leafs
    char cache3[] = {
            'T',//000
            0,//001
            0,//010
            0,//011
            'E',//100
            0,//101
            0,//110
            0,//111
    };

    char cache4[] ={
            0,//000x=T
            0,//000x=T
            'D',//0010
            0,//0011
            0,//0100
            'R',//0101
            'I',//0110
            'S',//0111
            0,//100x=E
            0,//100x=E
            'H',//1010
            0,//1011
            'N',//1100
            'O',//1101
            'A',//1110
            0,//1111
    };
    char cache5[] ={
            0,//000x=T
            0,//000x=T
            0,//000x=T
            0,//000x=T
            0,//0010x=D
            0,//0010x=D
            'F',//00110
            'M',//00111
            'W',//01000
            0,//01001
            0,//0101x=R
            0,//0101x=R
            0,//0110x=I
            0,//0110x=I
            0,//0111x=S
            0,//0111x=S
            0,//100x=E
            0,//100x=E
            0,//100x=E
            0,//100x=E
            0,//1010x=H
            0,//1010x=H
            'U',//10110
            0,//10111
            0,//1100x=N
            0,//1100x=N
            0,//1101x=O
            0,//1101x=O
            0,//1110x=A
            0,//1110x=A
            'L',//11110
            0,//11111
    };
    struct  Node2{
        char v;
        char * sequence;
    } ;
    struct Node2 rareList[] = {
            {'B',"010010"},
            {'P',"010011"},
            {'G',"101110"},
            {'Y',"101111"},
            {'C',"111110"},
            {'K',"1111110"},
            {'V',"11111111"},
            {'X',"111111100"},
            {'Q',"1111111010"},
            {'Z',"11111110110"},
            {'J',"11111110111"},
    };

    Node* root;
	makeTree(&root,keys,weights,charsetSize);

	Node* curr = root;

	for(int i = 0; i<inputSize;i++){
		char v = input[i];
		if(v=='0'){
			curr = curr->l;
			if(curr->v != 0){
				putc(curr->v,stdout);
				curr = root;
			}
		} else{
			curr = curr->r;
			if(curr->v != 0){
				putc(curr->v,stdout);
				curr = root;
			}
		}
	}

	return 0;
}