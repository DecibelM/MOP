#ifndef STRUCTS_H
#define STRUCTS_H

#define MAX_POINTS 50

typedef struct tPoint
{
	unsigned char x;
	unsigned char y;
}POINT;

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
	void(*smove)(struct tObj*,int);
}OBJECT, *POBJECT;

/*
void extendSnake();
extern int snakeLength;
extern POBJECT snakeVec[];
extern GEOMETRY ball_geometry;
void set_object_speed(POBJECT o, int speedx, int speedy);
void move_snake(POBJECT o, int i);
 * */



#endif
