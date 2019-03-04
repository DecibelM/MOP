/*
 * 	startup.c autopong_move
 *
 */
#include <stdint.h>
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

#define GPIO_D 0x40020C00 
#define GPIOD_MODER ((volatile unsigned int *) (GPIO_D))  
#define GPIOD_OTYPER ((volatile unsigned short *) (GPIO_D+0x4))  
#define GPIOD_PUPDR ((volatile unsigned int *) (GPIO_D+0xC)) 
#define GPIOD_IDR_LOW ((volatile unsigned char *) (GPIO_D+0x10))  
#define GPIOD_IDR_HIGH ((volatile unsigned char *) (GPIO_D+0x11))  
#define GPIOD_ODR_LOW ((volatile unsigned char *) (GPIO_D+0x14))  
#define GPIOD_ODR_HIGH ((volatile unsigned char *) (GPIO_D+0x15)) 

#define STK_CTRL ((volatile unsigned int *)(0xE000E010))
#define STK_LOAD ((volatile unsigned int *)(0xE000E014))
#define STK_VAL ((volatile unsigned int *)(0xE000E018))

#define B_E 0x40
#define B_SELECT 0x04
#define B_RW 0x02
#define B_RS 0x01

#define B_RST 0x20
#define B_CS2 0x10
#define B_CS1 0x08

#define LCD_ON 0x3F
#define LCD_OFF 0x3E
#define LCD_SET_ADD 0x40
#define LCD_SET_PAGE 0xB8
#define LCD_DISP_START 0xC0
#define LCD_BUSY 0x80

#define SIMULATOR
//#define USBDM

void startup ( void )
{
__asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	"_exit: B .\n"				/* never return */
	) ;
}

typedef unsigned char uint8_t;

typedef struct tPoint
{
	unsigned char x;
	unsigned char y;
}POINT;

#define MAX_POINTS 20

typedef struct tGeometry
{
	int numpoints;
	int sizex;
	int sizey;
	POINT px[ MAX_POINTS];
}GEOMETRY, *PGEOMETRY;

typedef struct tObj{
	PGEOMETRY geo;
	int dirx, diry;
	int posx, posy;
	void(*draw)(struct tObj*);
	void(*clear)(struct tObj*);
	void(*move)(struct tObj*);
	void(*set_speed)(struct tObj*,int,int);
}OBJECT, *POBJECT;

static void graphic_wait_ready(void)
{
	uint8_t c;
	graphic_ctrl_bit_clear(B_E);
	*GPIO_MODER = 0x00005555;
	graphic_ctrl_bit_clear(B_RS);
	graphic_ctrl_bit_set(B_RW);
	delay_500ns();
	
	while(1)
	{
		graphic_ctrl_bit_set(B_E);
		delay_500ns();
		c = *GPIO_IDR_HIGH & LCD_BUSY; //LCD_BUSY?????
		graphic_ctrl_bit_clear(B_E);
		delay_500ns();
		if(c == 0)
		{
			break;
		}
	}
	*GPIO_MODER = 0x55555555;
}

static uint8_t graphic_read(uint8_t controller)
{
	uint8_t c;
	graphic_ctrl_bit_clear(B_E);
	*GPIO_MODER = 0x00005555;
	graphic_ctrl_bit_set(B_RS|B_RW);
	select_controller(controller);
	delay_500ns();
	graphic_ctrl_bit_set(B_E);
	delay_500ns();
	c = *GPIO_IDR_HIGH;
	graphic_ctrl_bit_clear(B_E);
	*GPIO_MODER = 0x55555555;
	
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
	*GPIO_ODR_HIGH = value;
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
	*GPIO_ODR_HIGH = 0;
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
	c = *GPIO_ODR_LOW;
	c |= ( ~B_SELECT & x ); //Nollställer B_Select!
	*GPIO_ODR_LOW = c;
}

void graphic_ctrl_bit_clear(unsigned char x)
{
	unsigned char c;
	c = *GPIO_ODR_LOW;
	c &= (~B_SELECT & ~x); //~ bildar 1-komplement
	*GPIO_ODR_LOW = c;
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

void set_object_speed(POBJECT o, int speedx, int speedy){
	
	o->dirx = speedx;
	o->diry = speedy;
	
	if(o->posx < 1){
		o->dirx = -o->dirx;
	}
	if(o->posx > 128 - o->geo->sizex){
		o->dirx = -o->dirx;
	}
	if(o->posy < 1){
		o->diry = -o->diry;
	}
	if(o->posy > 64 - o->geo->sizey){
		o->diry = -o->diry;
	}
	
}

void move_object(POBJECT o){
	clear_object(o);
	o->posx += o->dirx;
	o->posy += o->diry;
	
	if(o->posx < 1){
		o->dirx = -o->dirx;
	}
	if(o->posx > 128 - o->geo->sizex){
		o->dirx = -o->dirx;
	}
	if(o->posy < 1){
		o->diry = -o->diry;
	}
	if(o->posy > 64 - o->geo->sizey){
		o->diry = -o->diry;
	}
	draw_object(o);
}

	GEOMETRY ball_geometry =
{
	12,4,4,{{0,1},{0,2},{1,0},{1,1},{1,2},{1,3},{2,0},{2,1},{2,2},{2,3},{3,1},{3,2}}
};

static OBJECT ball=
{&ball_geometry,
0,0,
1,1,
draw_object,
clear_object,
move_object,
set_object_speed};

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
  case 1: *GPIOD_ODR_HIGH = 0x10; break; 
  case 2: *GPIOD_ODR_HIGH = 0x20; break; 
  case 3: *GPIOD_ODR_HIGH = 0x40; break; 
  case 4: *GPIOD_ODR_HIGH = 0x80; break; 
  case 0: *GPIOD_ODR_HIGH = 0x00; break; 
 } 
}
int kbdGetCol ( void )  /* Om någon tangent (i aktiverad rad) * är nedtryckt, returnera dess kolumnnummer, * annars, returnera 0 */ 
{
 unsigned char c; 
 c = *GPIOD_IDR_HIGH; 
 if ( c & 0x8 ) return 4; 
 if ( c & 0x4 ) return 3;
 if ( c & 0x2 ) return 2;
 if ( c & 0x1 ) return 1; 
 return 0; 
}




void init_app(void)
{
	#ifdef USBDM
	*((unsigned long*) 0x40023830) = 0x18;
	__asm volatile("LDR R0,=0x08000209\n BLX R0\n");
	#endif
	
	* ( (unsigned int *) GPIOD_MODER )= 0x55005555;
	* ( (unsigned short *) GPIOD_OTYPER) = 0x0100;
	* ( (unsigned int *) GPIOD_PUPDR) = 0x00AA0000;
 
	*GPIO_MODER = 0x55555555;
	
}

void main(void)
{
	char c;

	POBJECT p = &ball;
	init_app();
	graphic_initialize();
	#ifndef SIMULATOR
		graphic_clear_screen();
	#endif
	
	while(1)
	{
		p->move(p);
		delay_milli(40);
		c = keyb();
		switch(c)
		{
			case 6: p->set_speed(p,2,0); break;
			case 4: p->set_speed(p,-2,0); break;
			case 2: p->set_speed(p,0,-2); break;
			case 8: p->set_speed(p,0,2); break;
		}
	}

}
