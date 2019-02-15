/*
 * 	startup.c
 *
 */
void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

#define GPIO_E 0x40021000
#define GPIO_MODER ((volatile unsigned int *) (0x40021000))
#define GPIO_OTYPER ((volatile unsigned short *) (0x40021004))
#define GPIO_OSPEEDR ((volatile unsigned int *) (0x40021008))
#define GPIO_PUPDR ((volatile unsigned int *) (0x4002100C))
#define GPIO_IDR_LOW ((volatile unsigned char *) (0x40021010))
#define GPIO_IDR_HIGH ((volatile unsigned char *) (0x40021011))
#define GPIO_ODR_HIGH ((volatile unsigned char *) (0x40021015))
#define GPIO_ODR_LOW ((volatile unsigned char *) (0x40021014))

#define STK_CTRL ((volatile unsigned int *)(0xE000E010))
#define STK_LOAD ((volatile unsigned int *)(0xE000E014))
#define STK_VAL ((volatile unsigned int *)(0xE000E018))

#define B_E 0x40
#define B_SELECT 0x04
#define B_RW 0x02
#define B_RS 0x01

void startup ( void )
{
__asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	"_exit: B .\n"				/* never return */
	) ;
}

void init_app(void)
{
	*GPIO_MODER = 0x55555555;
}

void ascii_ctrl_bit_set(unsigned char x)
{
	unsigned char c;
	c = *GPIO_IDR_LOW;
	c |= ( B_SELECT | x ); //Varför ettställa B_select?
	*GPIO_IDR_LOW = c;
}

void ascii_ctrl_bit_clear(unsigned char x)
{
	unsigned char c;
	c = *GPIO_IDR_LOW;
	c &= (B_SELECT | ~x); //~ bildar 1-komplement
	*GPIO_IDR_LOW = c;
}

void ascii_write_controller(unsigned char byte)
{
	ascii_ctrl_bit_set( B_E );
	*GPIO_IDR_HIGH = byte;
	delay_250ns();
	ascii_ctrl_bit_clear(B_E);	//Ska delay vara före eller efter detta?
}

unsigned char ascii_read_controller(void)
{
	unsigned char rv;
	ascii_ctrl_bit_set( B_E );
	delay_250ns();
	delay_250ns();
	rv = *GPIO_IDR_HIGH;
	ascii_ctrl_bit_clear( B_E );
	return rv;
	
}

void ascii_write_cmd(unsigned char command)
{
	ascii_ctrl_bit_clear(B_RS);
	ascii_ctrl_bit_clear(B_RW);
	ascii_write_controller(command);
	
}

void ascii_write_data(unsigned char data)
{
	ascii_ctrl_bit_set(B_RS);
	ascii_ctrl_bit_clear(B_RW);
	ascii_write_controller(data);
}



unsigned char ascii_read_status(void)
{
	unsigned char rv;
	*GPIO_MODER &= 0x1101;
	ascii_ctrl_bit_clear(B_RS);
	ascii_ctrl_bit_set(B_RW);
	rv = ascii_read_controller();
	*GPIO_MODER |= 0x0050;
	return rv;
}

unsigned char ascii_read_data(void)
{
	unsigned char rv;
	*GPIO_MODER &= 0x1101;
	ascii_ctrl_bit_set(B_RS);
	ascii_ctrl_bit_set(B_RW);
	rv = ascii_read_controller();
	*GPIO_MODER |= 0x0050;
	return rv;
}

void delay_milli(int ms)
{
	delay_micro(10);
}

void delay_micro(int us)
{
	us = us/10;
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

void ascii_write_char(unsigned char c)
{
	while((ascii_read_status() & 0x80) == 0x80){}
	delay_micro(8);
	ascii_write_data(c);
	delay_micro(45);
}

void ascii_gotoxy(int row, int col)
{
	unsigned int adress;
	adress = row -1;
	if(col == 2)
	{
		adress = adress + 0x40;
	}
	ascii_write_cmd(0x80|adress);
}

void ascii_init(void)
{
	while((ascii_read_status() & 0x80) == 0x80){}
	delay_micro(8);
	ascii_write_cmd(00111000);
	delay_micro(40);
	
	while((ascii_read_status() & 0x80) == 0x80){}
	delay_micro(8);
	ascii_write_cmd(00001110);
	delay_micro(40);
	
	while((ascii_read_status() & 0x80) == 0x80){}
	delay_micro(8);
	ascii_write_cmd(1);
	delay_milli(2);
	
	while((ascii_read_status() & 0x80) == 0x80){}
	delay_micro(8);
	ascii_write_cmd(00000100); //Rätt? Increment?
	delay_micro(39);
}

int main(int argc, char **argv)
{
	char *s;
	char test1[] = "Alfanumerisk ";
	char test2[] = "Display - test";
	
	init_app();
	ascii_init();
	ascii_gotoxy(1,1);
	s = test1;
	while(*s)
	{
		ascii_write_char(*s++);
	}
	ascii_gotoxy(1,2);
	s = test2;
	while(*s)
	{
		ascii_write_char(*s++);
	}
	return 0;
	
}

