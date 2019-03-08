/*
#include <structs.h>
#include <gpio.h>
#include <delay.h>
#include <graphic.h>
#include <ascii.h>

int snakeLength;
POBJECT snakeVec[100];

GEOMETRY ball_geometry2 =
{
	12,4,4,{{0,1},{0,2},{1,0},{1,1},{1,2},{1,3},{2,0},{2,1},{2,2},{2,3},{3,1},{3,2}}
};

void move_snake(POBJECT o, int i){
	clear_object(o);
	o->posx = snakeVec[i-1]->posx;
	o->posy = snakeVec[i-1]->posy;
	
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

void extendSnake(void)
{
	OBJECT newSnake;
	POBJECT tail = snakeVec[snakeLength -1];
	newSnake.geo = &ball_geometry2;
	newSnake.dirx = tail->dirx;
	newSnake.diry = tail->diry;
	newSnake.posx = tail->posx + tail->geo->sizex;
	newSnake.posx = tail->posy + tail->geo->sizey;
	newSnake.draw = draw_object;
	newSnake.clear = clear_object;
	newSnake.smove = move_snake;
	
	snakeVec[snakeLength] = &newSnake;
	snakeLength++;
}

*/