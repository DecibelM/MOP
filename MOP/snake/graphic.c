#include <graphic.h>
#include <delay.h>
#include <gpio.h>

static void graphic_wait_ready(void)
{
	uint8_t c;
	graphic_ctrl_bit_clear(B_E);
	GPIO_E.moder = 0x00005555;
	graphic_ctrl_bit_clear(B_RS);
	graphic_ctrl_bit_set(B_RW);
	delay_500ns();
	
	while(1)
	{
		graphic_ctrl_bit_set(B_E);
		delay_500ns();
		c = GPIO_E.idrHigh & LCD_BUSY; //LCD_BUSY?????
		graphic_ctrl_bit_clear(B_E);
		delay_500ns();
		if(c == 0)
		{
			break;
		}
	}
	GPIO_E.moder = 0x55555555;
}

static uint8_t graphic_read(uint8_t controller)
{
	uint8_t c;
	graphic_ctrl_bit_clear(B_E);
	GPIO_E.moder = 0x00005555;
	graphic_ctrl_bit_set(B_RS|B_RW);
	select_controller(controller);
	delay_500ns();
	graphic_ctrl_bit_set(B_E);
	delay_500ns();
	c = GPIO_E.idrHigh;
	graphic_ctrl_bit_clear(B_E);
	GPIO_E.moder = 0x55555555;
	
	if(controller & B_CS1){
		select_controller(B_CS1);
		graphic_wait_ready();
	}
	if(controller & B_CS2)
	{
		select_controller(B_CS2);
		graphic_wait_ready();
	}
	return c;
}

void graphic_write(uint8_t value, uint8_t controller)
{
	uint8_t c;
	GPIO_E.odrHigh = value;
	select_controller(controller);
	delay_500ns();
	graphic_ctrl_bit_set(B_E);
	delay_500ns();
	graphic_ctrl_bit_clear(B_E);

	if(controller & B_CS1){
		select_controller(B_CS1);
		graphic_wait_ready();
	}
	if(controller & B_CS2)
	{
		select_controller(B_CS2);
		graphic_wait_ready();
	}
	GPIO_E.odrHigh = 0;
	graphic_ctrl_bit_set(B_E);
	select_controller(0);
}

void graphic_write_command(uint8_t command, uint8_t controller)
{
	graphic_ctrl_bit_clear(B_E);
	select_controller(controller);
	graphic_ctrl_bit_clear(B_RS | B_RW);
	graphic_write(command, controller);
}

void graphic_write_data(uint8_t data, uint8_t controller)
{
	graphic_ctrl_bit_clear(B_E);
	select_controller(controller);
	graphic_ctrl_bit_clear(B_RW);
	graphic_ctrl_bit_set(B_RS);
	graphic_write(data, controller);
}

uint8_t graphic_read_data(uint8_t controller)
{
	graphic_read(controller);
	return graphic_read(controller);
}

void graphic_ctrl_bit_set(uint8_t x)
{
	unsigned char c;
	c = GPIO_E.odrLow;
	c |= ( ~B_SELECT & x ); //Nollställer B_Select!
	GPIO_E.odrLow = c;
}

void graphic_ctrl_bit_clear(unsigned char x)
{
	unsigned char c;
	c = GPIO_E.odrLow;;
	c &= (~B_SELECT & ~x); //~ bildar 1-komplement
	GPIO_E.odrLow = c;
}

void select_controller(uint8_t controller)
{
	switch(controller){
		case 0:
				graphic_ctrl_bit_clear(B_CS1|B_CS2);
				break;
		case B_CS1:
				graphic_ctrl_bit_set(B_CS1);
				graphic_ctrl_bit_clear(B_CS2);
				break;
		case B_CS2:
				graphic_ctrl_bit_set(B_CS2);
				graphic_ctrl_bit_clear(B_CS1);
				break;
		case B_CS1|B_CS2:
				graphic_ctrl_bit_set(B_CS1|B_CS2);
				break;
	}
}

void graphic_initialize(void)
{
	graphic_ctrl_bit_set(B_E);
	delay_micro(10);
	graphic_ctrl_bit_clear(B_CS1|B_CS2|B_RST|B_E);
	delay_milli(30);
	graphic_ctrl_bit_set(B_RST);
	delay_milli(100);
	graphic_write_command(LCD_OFF, B_CS1|B_CS2);
	graphic_write_command(LCD_ON, B_CS1|B_CS2);
	graphic_write_command(LCD_DISP_START, B_CS1|B_CS2);
	graphic_write_command(LCD_SET_ADD, B_CS1|B_CS2);
	graphic_write_command(LCD_SET_PAGE, B_CS1|B_CS2);
	select_controller(0);
}

void graphic_clear_screen(void)
{
	for(unsigned int page = 0; page < 8; page++)
	{
		graphic_write_command(LCD_SET_PAGE|page,B_CS1|B_CS2);
		graphic_write_command(LCD_SET_ADD|0,B_CS1|B_CS2);
		for(unsigned int add = 0; add<64;add++)
		{
			graphic_write_data(0, B_CS1|B_CS2);
		}
	}
}

void pixel(int x, int y, int set)
{
	uint8_t mask, c, controller;
	int index;
	
	if((x < 1) || (y < 1) || (x > 128) || (y > 64)) return;
	
	index = (y-1)/8;
	
	switch((y-1)%8){
		case 0: mask = 1; break;
		case 1: mask = 2; break;
		case 2: mask = 4; break;
		case 3: mask = 8; break;
		case 4: mask = 0x10; break;
		case 5: mask = 0x20; break;
		case 6: mask = 0x40; break;
		case 7: mask = 0x80; break;
	}
	
	if(set == 0){
		mask = ~mask;
	}
	if(x>64){
		controller = B_CS2;
		x = x - 65;
	}else{
		controller = B_CS1;
		x = x-1;
	}
	
	graphic_write_command(LCD_SET_ADD | x,controller);
	graphic_write_command(LCD_SET_PAGE| index, controller);
	c = graphic_read_data(controller);
	graphic_write_command(LCD_SET_ADD| x, controller);
	
	if(set){
		mask = mask | c;
	}else{
		mask = mask & c;
	}
	graphic_write_data(mask, controller);
}

void draw_object(POBJECT obj)
{
	uint8_t p;
	uint8_t n = obj->geo->numpoints;
	uint8_t x_coord;
	uint8_t y_coord;
	
	POINT s;
	for(p = 0; p<n; p++){
		//s = obj -> geo -> px[p];
		x_coord  = obj->posx + obj->geo->px[p].x;
		y_coord = obj->posy + obj->geo->px[p].y;
		//point = obj->geo->px;
		//pixel(s.x, s.y,1);
		pixel(x_coord,y_coord,1);
	}
}

void clear_object(POBJECT obj)
{
	uint8_t p;
	uint8_t n = obj->geo->numpoints;
	uint8_t x_coord;
	uint8_t y_coord;
	for(p = 0; p<n; p++){
		x_coord  = obj->posx + obj->geo->px[p].x;
		y_coord = obj->posy + obj->geo->px[p].y;
		pixel(x_coord,y_coord,0);
	}
}