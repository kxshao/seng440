#include <stdio.h>
#include <stdlib.h>
#include "string.h"

#define  INPUT_SIZE 1000000
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
    int i;
    for (i = 0; i < size; i++){
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

	i = 1;
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
//	FILE* f = fopen("../text/in.txt","r");
	FILE* f = stdin;
	if(!f){
		printf("file open failed\n");
		return 1;
	}
	char input[INPUT_SIZE];
	int c;
	char* inputIndex = input;
	int inputSize = 0;
	while ((c = fgetc(f))!=EOF){
		*inputIndex++ = (char)c;
		//-2 to leave space for the ending null and the fact that index counts from 0
		if(++inputSize > INPUT_SIZE-2) break;
	}
	//add terminator
	*inputIndex = 0;
	if(VERBOSE) printf("chars read %d, strlen %lu\n",inputSize, strlen(input));
	fclose(f);

	int realSize = 26;
    char keys[26] = {'Z','J','Q','X','V','K','B','P','G','Y','C','F','M','W','U','L','D','R','I','S','H','N','O','A','T','E'};
    int weights[26] = {280,492,545,813,5635,6305,8838,9183,12647,12806,13646,14213,17246,17415,18492,26101,28679,36136,38381,39632,42403,44551,51607,52583,58279,81286};

	Node* root;
	makeTree(&root,keys,weights,realSize);
	char* lookupTable[128] = {};
	makeLookupTable(root,"",lookupTable);

	if(VERBOSE) printTree(root,"");
	if(VERBOSE) printf("unique letters: %d\n",realSize);
	//print num of lines in lookup table
	if(VERBOSE){
		printf("%c\n",realSize);
        int i;
        for(i = 65; i < 91; i++){
			if(lookupTable[i]){
				printf("%c,%s\n",i,lookupTable[i]);
			}else{
				if(VERBOSE) printf("%d,\n",i);
			}
		}
	}

	if(VERBOSE) printf("__encoded text__\n");

	inputIndex = input;
	char v;
	while ((v = *inputIndex++)){
		//this check discards unprintable characters
		if(v>31 && v<127){
			printf("%s",lookupTable[v]);
		}
	}

	return 0;
}