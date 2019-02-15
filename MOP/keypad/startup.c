/*
 *  startup.c
 *
 */
void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
#define GPIO_D 0x40020C00 
#define GPIO_MODER ((volatile unsigned int *) (GPIO_D))  
#define GPIO_OTYPER ((volatile unsigned short *) (GPIO_D+0x4))  
#define GPIO_PUPDR ((volatile unsigned int *) (GPIO_D+0xC)) 
#define GPIO_IDR_LOW ((volatile unsigned char *) (GPIO_D+0x10))  
#define GPIO_IDR_HIGH ((volatile unsigned char *) (GPIO_D+0x11))  
#define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_D+0x14))  
#define GPIO_ODR_HIGH ((volatile unsigned char *) (GPIO_D+0x15)) 
void startup ( void )
{
__asm volatile(
 " LDR R0,=0x2001C000\n"  /* set stack */
 " MOV SP,R0\n"
 " BL main\n"    /* call main */
 "_exit: B .\n"    /* never return */
 ) ;
}


void app_init(void)
{
 * ( (unsigned int *) GPIO_MODER )= 0x55005555;
 * ( (unsigned short *) GPIO_OTYPER) = 0x0100;
 * ( (unsigned int *) GPIO_PUPDR) = 0x00AA0000;
}

unsigned char keyb(void) 
{ 
 unsigned char key[]={1,2,3,0xA,4,5,6,0xB,7,8,9,0xC,0xE,0,0xF,0xD}; 
 int row, col; 
 for (row=1; row <=4 ; row++ ) { 
  kbdActivate(row); 
  col = kbdGetCol();
  if( col != 0 ) { 
   kbdActivate( 0 ); 
   return key [4*(row-1)+(col-1) ]; 
  } 
 } 
 kbdActivate( 0 ); 
 return 0xFF; 
}

void kbdActivate( unsigned int row ) /* Aktivera angiven rad hos tangentbordet, eller * deaktivera samtliga */
{  
 switch( row ) 
 { 
  case 1: *GPIO_ODR_HIGH = 0x10; break; 
  case 2: *GPIO_ODR_HIGH = 0x20; break; 
  case 3: *GPIO_ODR_HIGH = 0x40; break; 
  case 4: *GPIO_ODR_HIGH = 0x80; break; 
  case 0: *GPIO_ODR_HIGH = 0x00; break; 
 } 
}
int kbdGetCol ( void )  /* Om någon tangent (i aktiverad rad) * är nedtryckt, returnera dess kolumnnummer, * annars, returnera 0 */ 
{
 unsigned char c; 
 c = *GPIO_IDR_HIGH; 
 if ( c & 0x8 ) return 4; 
 if ( c & 0x4 ) return 3;
 if ( c & 0x2 ) return 2;
 if ( c & 0x1 ) return 1; 
 return 0; 
}

void out7seg(unsigned char c)
{
 unsigned char key[] = {0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F,0x77,0x7C,0x39,0x5E,0x79,0x71};
 if(c <=15)
 {
  unsigned char ourKey = key[c];
  *GPIO_ODR_LOW = ourKey;
 }
 else 
 {
  *GPIO_ODR_LOW = 0x00;
 }
}
 
 void main(void)
{
 app_init();
 while(1)
 {
  unsigned char key = keyb();
  out7seg(key);
 }
}
