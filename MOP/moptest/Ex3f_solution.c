#include <stdio.h>
#include <string.h>
#include <stdlib.h>  // för abs()
#include <windows.h> //(eller <windows.h>)
#include <math.h>

void printBinary(unsigned short tal)
{
    for(int i=15; i>=0; i--) {
        int bit = (tal >> i) & 0x01;
        printf("%d", bit);
    }
}
void clearscreen()
{
    for(int i=0; i<80; i++)
        printf("\n");
}

void printSpaces(int n)
{
    for(int i=0; i<n; i++)
        printf(" ");
}
int main()
{
    unsigned short a = 1, b = 0x8000;
    int scrollWidth = 50; 
    int loopIter = 0;
    while (1)
    {
        clearscreen();
        
        // Hantera horisontell bouncing scroll
        // låt scrolliter loopa runt från 0 t.om. 99; 
        int scrollIter = loopIter % (2*scrollWidth); 
        int pos = 35 + scrollWidth - abs(scrollWidth - scrollIter); 
        printSpaces(pos);
        
        // hantera bit-scroll
        if((loopIter % 2) != 0) { // uppdatera bitmönstret endast varannan iteration.
            a = (a <= 1) ? 0x8000 : a >> 1; 
            b = (b == 0x8000) ? 0x0001 : b << 1;
        }
        printBinary(a | b); 
        
        //printf("\n");    
        Sleep(250);
		
		//Hantera studs i y-led
		float t = (loopIter % 41) / 40.0f; // t: 0 -> 40
        float y = 10.3f*( fabs(2*(3*t*t - 2*t*t*t) -1)); // ser bättre ut än 
                                                         // en ren t^2-kurva
        for(int i=0; i<y; i++)
            printf("\n");
        loopIter++;
    }
    return 0;
}