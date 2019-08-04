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