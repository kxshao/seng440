#include <stdio.h>
#include <stdlib.h>
#include "string.h"

#define  INPUT_SIZE 5000000
#define VERBOSE 0

int charCount(char* input, int* buffer, int size){
	char c = *input;
	int length = 0;
	while (c != 0 && size){
		if(c>31 && c < 127){
			buffer[c]++;
			length++;
		}
		input++;
		c = *input;
		size--;
	}
	return length;
}

//insertion sort for k-v pairs
void sort(int *keys, int *vals, int length){
	int i = 1;
	int tmp;

	while (i<length){
		int j = i;
		while (j>0 && vals[j-1] > vals[j]){
			//swap
			tmp = keys[j];
			keys[j] = keys[j-1];
			keys[j-1] = tmp;
			tmp = vals[j];
			vals[j] = vals[j-1];
			vals[j-1] = tmp;

			//j moves backward
			j--;
		}
		i++;
	}
}

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
			printf("Leaf,\"%c\",%s,%d\n",tree->v,sequence,tree->weight);
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

	//build the table from input
	int charsetSize = fgetc(f);
	//discard 1 newline after size
	fgetc(f);
	char keys[charsetSize];
	int weights[charsetSize];

	for(int i = 0; i<charsetSize; i++){
		keys[i] = (char) fgetc(f);
		char v[20];
		int size = 0;
		while ((c = fgetc(f))!='\n'){
			v[size] = (char) c;
			size++;
		}
		//terminate
		v[size] = 0;
		weights[i] = atoi(v);
	}

	//parse encoded input
	char input[INPUT_SIZE];
	char* inputIndex = input;
	int inputSize = 0;
	while ((c = fgetc(f))!=EOF){
		*inputIndex++ = (char)c;
		if(++inputSize > INPUT_SIZE-2) break;
	}

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