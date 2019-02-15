#include <stdio.h>
#include <string.h>
#include <windows.h>
#include <math.h>

void func16(unsigned short byte){
	for(int i= 15; i>=0; i--){
		int bit = (byte >> i) & 0x01;
		printf("%d", bit);
	}
	printf("\n");
}

void clear(int n){
	for(int i = 0; i<n; i++)
	printf("\n");
}

void printSpaces(int n){
	for(int j = 0; j<n; j++){
				printf(" ");
			}
}

int main(){
	unsigned short s1 = 0x0001;
	unsigned short s2 = 0x8000;
	int scrollWidth = 50; 
	int scrollHeight = 30;
	int loopIter = 0;
	
	while(1){
		float t = (loopIter % 41) / 40.0f; // t: 0 -> 40
        float y = 10.3f*( fabs(2*(3*t*t - 2*t*t*t) -1));
		
		
		clear(y);
		int scrollIter = loopIter % (2*scrollWidth); 
		int pos = 35 + scrollWidth - abs(scrollWidth - scrollIter);
		printSpaces(pos);
		
		if((s1 == 0) & (s2 == 0)){
			s1=0x0001;
			s2=0x8000;
		}else{
		s1 = s1<<1;
		s2 = s2>>(1);
		}
		func16(s1 | s2);
		Sleep(250);
		
		loopIter++;
	}
}