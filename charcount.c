int charCount(char* input, int* buffer){
	char c = *input;
	int length = 0;
	while (c != 0){
		buffer[c]++;
		input++;
		length++;
		c = *input;
	}
	return length;
}