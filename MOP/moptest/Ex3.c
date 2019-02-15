#include <stdio.h>
#include <string.h>

void func8(unsigned char byte){
	for(int i= 7; i>=0; i--){
		int bit = (byte >> i) & 0x01;
		printf("%d", bit);
	}
	printf("\n");
}

void func16(unsigned short byte){
	for(int i= 15; i>=0; i--){
		int bit = (byte >> i) & 0x01;
		printf("%d", bit);
	}
	printf("\n");
}

void str2int(char str[]){
	unsigned char num = 0;
	for(int i=0; i<8; i++){
		if(str[i] == '1'){
			num |= (1<<(7-i));
		}
	}
	printf("%d \n", num);
}

int main(){
	//unsigned char byte8 = 128;
	//unsigned short byte16 = 46;
	//func8(byte8);
	//func16(byte16);
	
	//char str[] = "10101010";
	//str2int(str);
	
	/*unsigned char c = 128;
	c |= 1 << 5;
	c |= 1 << 3;
	c |= 1;*/
	
	/*func8(c);
	printf("%d\n", c);*/
	
	unsigned char x = 27;
	func8(x);
	x = ~x;
	func8(x);
	x = x+1;
	func8(x);
	
	x=27;
	x ^= 0xff;
	func8(x);
    x++;
	func8(x);
	
	
	return 0;
}