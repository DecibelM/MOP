#include <delay.h>
#include <gpio.h>

void delay_milli(int ms)
{
	while(ms > 0)
	{
	#ifndef SIMULATOR
	delay_micro(1000);
	#endif
	ms--;
	}
}

void delay_micro(int us)
{
	while(us > 0)
	{
	#ifndef SIMULATOR
	delay_250ns();
	delay_250ns();
	delay_250ns();
	delay_250ns();
	#endif
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

void delay_500ns(void)
{
	#ifndef SIMULATOR
	delay_250ns();
	delay_250ns();
	#endif
}
