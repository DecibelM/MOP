#include "delay.h"
#include "gpio.h"

void ascii_ctrl_bit_set(unsigned char x)
{
	unsigned char c;
	c = GPIO_E.odrLow;
	c |= ( B_SELECT | x ); //Varför ettställa B_select?
	GPIO_E.odrLow = c;
}

void ascii_ctrl_bit_clear(unsigned char x)
{
	unsigned char c;
	c = GPIO_E.odrLow;
	c &= (B_SELECT | ~x); //~ bildar 1-komplement
	GPIO_E.odrLow = c;
}

void ascii_write_controller(unsigned char byte)
{
	ascii_ctrl_bit_set( B_E );
	GPIO_E.odrHigh = byte;
	delay_250ns();
	ascii_ctrl_bit_clear(B_E);	//Ska delay vara före eller efter detta?
}

unsigned char ascii_read_controller(void)
{
	unsigned char rv;
	ascii_ctrl_bit_set( B_E );
	delay_250ns();
	delay_250ns();
	rv = GPIO_E.idrHigh;
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
	GPIO_E.moder &= 0x00005555;
	ascii_ctrl_bit_set(B_RW);
	ascii_ctrl_bit_clear(B_RS);
	rv = ascii_read_controller();
	GPIO_E.moder |= 0x55555555;
	return rv;
}

unsigned char ascii_read_data(void)
{
	unsigned char rv;
	GPIO_E.moder &= 0x00005555;
	ascii_ctrl_bit_set(B_RS);
	ascii_ctrl_bit_set(B_RW);
	rv = ascii_read_controller();
	GPIO_E.moder |= 0x55555555;
	return rv;
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
	ascii_write_cmd(0x38); //00111000
	delay_micro(40);
	
	while((ascii_read_status() & 0x80) == 0x80){}
	delay_micro(8);
	ascii_write_cmd(0x0D); //00001110
	delay_micro(40);
	
	while((ascii_read_status() & 0x80) == 0x80){}
	delay_micro(8);
	ascii_write_cmd(1);
	delay_milli(2);
	
	while((ascii_read_status() & 0x80) == 0x80){}
	delay_micro(8);
	ascii_write_cmd(0x06); //Rätt? Increment? 00000100
	delay_micro(39);
}