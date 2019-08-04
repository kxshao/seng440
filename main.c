#include <stdio.h>
#include <stdlib.h>
#include "string.h"
#include "charcount.c"
#include "lib/sort.c"

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
		printf("Printing tree:\n");
	} else{
		if(tree->v){
			printf("Leaf %c: %s\n",tree->v,sequence);
		} else{
			printf("Intermediate: %s\n",sequence);
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

int main() {
	//the ={} initializes to zero
	int buff[95] = {};
	//this passes a negative array index with the expectation that the function only access indexes 32-127
	int numCounted = charCount("aaaaabbbbcccdde",buff-32);
	printf("Counted: %d\n",numCounted);

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
	printTree(root,"");

	printf("unique letters: %d\n",realSize);

	for(int i = 0;i<realSize;i++){
		printf("%c count: %d\n",sortedLetters[i],weights[i]);
	}
	return 0;
}