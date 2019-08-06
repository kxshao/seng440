#include <stdio.h>
#include <stdlib.h>
#include "string.h"
#include "charcount.c"
#include "lib/sort.c"

#define  INPUT_SIZE 1000
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

/**
 * @param start is the first non null value
 * nodes[start-1] MUST be allocated, and will be overwritten
 * */
void insert(Node* new, Node** nodes, int start, int end){
	int i;
	for(i = start+1; i<end; i++){
		if(new->weight < nodes[i]->weight){
			break;
		}
		nodes[i-1]=nodes[i];
	}
	nodes[i-1] = new;
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
	FILE* f = fopen("/home/go/textfiles/pg-dracula.txt","r");
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

	//the ={} initializes to zero
	int buff[95] = {};
	//this passes a negative array index with the expectation that the function only access indexes 32-127
	int numCounted = charCount(input,buff-32, inputSize);
	if(VERBOSE) printf("valid chars counted: %d\n",numCounted);

	int keys[95];
	for(int i = 0; i<95; i++){
		keys[i] = i+32;
	}
	sort(keys,buff,95);

	int realSize;
	for(realSize = 0;realSize<95;realSize++){
		if(buff[94-realSize]==0){
			break;
		}
	}
	//todo possibly remove an unnecessary array and initializer loop
	//im dumb why did i originally define the array as int instead of char
	char sortedLetters[realSize];
	int weights[realSize];
	for(int i = 0;i<realSize;i++){
		sortedLetters[i] = (char) keys[95-realSize+i];
		weights[i] = buff[95-realSize+i];
	}

	Node* root;
	makeTree(&root,sortedLetters,weights,realSize);
	char* lookupTable[128] = {};
	makeLookupTable(root,"",lookupTable);

	if(VERBOSE) printTree(root,"");
	if(VERBOSE) printf("unique letters: %d\n",realSize);
	if(VERBOSE){
		for(int i = 0;i<realSize;i++){
			printf("%c count: %d\n",sortedLetters[i],weights[i]);
		}
	}
	//print num of lines in lookup table
	if(VERBOSE){
		printf("%c\n",realSize);
		for(int i = 32;i<127;i++){
			if(lookupTable[i]){
				printf("%c,%s\n",i,lookupTable[i]);
			}else{
				if(VERBOSE) printf("%d,\n",i);
			}
		}
	}

	printf("%c\n",realSize);
	for(int i = 0;i<realSize;i++){
		printf("%c%d\n",sortedLetters[i],weights[i]);
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