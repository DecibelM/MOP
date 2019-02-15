#include <stdio.h>
#include <string.h>

int main()
{
	char str[] = "Maria";
	for(int i = strlen(str) - 1; i >= 0; i--){
		printf("%c", str[i]);
	}
	return 0;
	}