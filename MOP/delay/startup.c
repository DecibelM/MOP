// Test program for delay functions.

void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

#define GPIO_E 0x40021000
#define GPIO_MODER ((volatile unsigned int *) (GPIO_E))
#define GPIO_ODR ((volatile unsigned char *) (GPIO_E + 0x14))

#define STK_CTRL ((volatile unsigned int *)(0xE000E010))
#define STK_LOAD ((volatile unsigned int *)(0xE000E014))
#define STK_VAL ((volatile unsigned int *)(0xE000E018))

void startup ( void )
{
__asm volatile(
 " LDR R0,=0x2001C000\n"  /* set stack */
 " MOV SP,R0\n"
 " BL main\n"    /* call main */
 "_exit: B .\n"    /* never return */
 ) ;
}

void init_app(void)
{
	* ( (unsigned int *) GPIO_MODER ) = 0x55555555;
}

void delay_milli(int ms)
{
	while(ms > 0)
	{
	delay_micro(1000);
	ms--;
	}
}

void delay_micro(int us)
{
	while(us > 0)
	{
	delay_250ns();
	delay_250ns();
	delay_250ns();
	delay_250ns();
	us--;
	}
}

void delay_250ns(void)
{
	*STK_CTRL = 0;
	*STK_LOAD = 0x29; //0x2A - 1
	*STK_VAL = 0x0;
	*STK_CTRL = 5;
	unsigned int ctrl = *STK_CTRL & 0x10000;
	while((*STK_CTRL & 0x10000) == 0);
	*STK_CTRL= 0;
	
}

void main(void)
{
	init_app();
	while(1)
	{
		*GPIO_ODR = 0x00;
		delay_milli(500);
		*GPIO_ODR = 0xFF;
		delay_milli(500);
	}
}



