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

int snakeLength;
OBJECT snakeVec[100];
POBJECT pSnakeVec[100];

void set_object_speed(POBJECT o, int speedx, int speedy){
	if(speedx != -o->dirx)
	{
		o->dirx = speedx;
	}
	if(speedy != -o->diry){
		o->diry = speedy;
	}
}

void move_object(POBJECT o){
	//clear_object(o);
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
	//draw_object(o);
}

	GEOMETRY ball_geometry =
{
	12,4,4,{{0,1},{0,2},{1,0},{1,1},{1,2},{1,3},{2,0},{2,1},{2,2},{2,3},{3,1},{3,2}}
};

static OBJECT snake=
{&ball_geometry,
0,0,
6,2,
draw_object,
clear_object,
move_object,
set_object_speed};

static OBJECT apple=
{&ball_geometry,
0,4,
10,2,
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

void collision(POBJECT pSnakeVec[], POBJECT a)
{
	POBJECT p = pSnakeVec[0];
	if(p->posx +4 >= a->posx & p->posx <= a->posx + 4)
	{
		if(p->posy +4 >= a->posy & p->posy <= a->posy + 4)
		{
			clear_object(a);
			points++;
			POBJECT x = pSnakeVec[snakeLength-1];
			POBJECT y = &snakeVec[snakeLength];
			extend_snake(&snakeVec[snakeLength],pSnakeVec[snakeLength-1] );
			pSnakeVec[snakeLength] = &snakeVec[snakeLength];
			snakeLength++;
			
			char string[] = "Points:";
			s = string;
			ascii_gotoxy(1,1);
			while(*s)
			{
			ascii_write_char(*s++);
			}
			char pts = points + '0';
			ascii_write_char(pts);
			
			a->move(a);
		}
	}
}

void move_snake(POBJECT o, int i){
	//clear_object(o);
	o->posx = pSnakeVec[i-1]->posx;
	o->posy = pSnakeVec[i-1]->posy;
}


void extend_snake(POBJECT new, POBJECT tail)
{
	new->geo = &ball_geometry;
	new->dirx = tail->dirx;
	new->diry = tail->diry;
	new->posx = tail->posx - tail->geo->sizex;
	new->posy = tail->posy;
	new->draw = draw_object;
	new->clear = clear_object;
	new->smove = move_snake;
}



OBJECT p2 = {&ball_geometry,
	0,0,
	2,2,
	draw_object,
	clear_object,
	move_snake,
	set_object_speed};

void main(void)
{
	char c;
	
	POBJECT s = &snake;
	POBJECT pp2 = &p2;
	POBJECT a = &apple;
	pSnakeVec[0] = s;
	pSnakeVec[1] = pp2;
	
	snakeLength = 2;
	
	init_app();
	graphic_initialize();
	ascii_init();
	ascii_gotoxy(1,1);
	
	#ifndef SIMULATOR
		graphic_clear_screen();
	#endif
	
	while(1)
	{
		s->move(s);
		draw_object(s);
		
		for(int i = snakeLength -1; i>0; i--)
		{
			POBJECT px = pSnakeVec[i];
			draw_object(pSnakeVec[i]);			
		}
		
		for(int i = snakeLength -1; i>= 0; i--)
		{
			POBJECT px = pSnakeVec[i];
			clear_object(pSnakeVec[i]);
			if(i!=0){
				move_snake(pSnakeVec[i], i);
			}
		}
		
		draw_object(a);
		collision(pSnakeVec,a);
		
		delay_milli(40);
		c = keyb();
		switch(c)
		{
			case 6: s->set_speed(s,4,0); break;
			case 4: s->set_speed(s,-4,0); break;
			case 2: s->set_speed(s,0,-4); break;
			case 8: s->set_speed(s,0,4); break;
		}
	}
}
