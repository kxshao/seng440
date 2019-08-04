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