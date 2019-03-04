/*
 * 	startup.c snake
 *
 */
//#include <stdint.h>
#include <gpio.h>
#include <structs.h>
#include <delay.h>
#include <graphic.h>
#include <ascii.h>

void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void )
{
__asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	"_exit: B .\n"				/* never return */
	) ;
}

void set_object_speed(POBJECT o, int speedx, int speedy){
	o->dirx = speedx;
	o->diry = speedy;
	/*
	if(o->dirx == -speedx | o->diry == -speedy)
	{
	
	}else{
		
	}
	 */
}

void move_object(POBJECT o){
	clear_object(o);
	o->posx += o->dirx;
	o->posy += o->diry;
	
	if(o->posx <= 1){
		o->posx = 128 - o->geo->sizex;
	}
	if(o->posx > 128 - o->geo->sizex){
		o->posx = 1;
	}
	if(o->posy <= 1){
		o->posy = 64 - o->geo->sizey;
	}
	if(o->posy > 64 - o->geo->sizey){
		o->posy = 1 ;
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
2,2,
draw_object,
clear_object,
move_object,
set_object_speed};

static OBJECT apple=
{&ball_geometry,
0,0,
7,7,
draw_object,
clear_object,
move_object,
set_object_speed};


void init_app(void)
{
	#ifdef USBDM
	*((unsigned long*) 0x40023830) = 0x18;
	__asm volatile("LDR R0,=0x08000209\n BLX R0\n");
	#endif
	
	GPIO_D.moder= 0x55005555;
	GPIO_D.otyper = 0x0100;
	GPIO_D.pupdr = 0x00AA0000;
 
	GPIO_E.moder = 0x55555555;
	
}

int points =0;
char *s;
char string[] = "Points";

void collision(POBJECT p, POBJECT a)
{
	if(p->posx +4 >= a->posx & p->posx <= a->posx + 4)
	{
		if(p->posy +4 >= a->posy & p->posy <= a->posy + 4)
		{
			clear_object(a);
			points++;
			
			char string[] = "Points:";
			s = string;
			ascii_gotoxy(1,1);
			while(*s)
			{
			ascii_write_char(*s++);
			}
			char pts = points + '0';
			ascii_write_char(pts);
			
			a->posx = a->posx + 5;
			a->posy = a->posy + 5;
		}
	}
}

void main(void)
{
	char c;
	
	POBJECT p = &ball;
	POBJECT a = &apple;
	init_app();
	graphic_initialize();
	ascii_init();
	ascii_gotoxy(1,1);
	
	#ifndef SIMULATOR
		graphic_clear_screen();
	#endif
	
	while(1)
	{
		p->move(p);
		draw_object(a);
		
		collision(p,a);
		
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
