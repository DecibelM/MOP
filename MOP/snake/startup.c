/*
 *  startup.c snake
 *
 */
//#include <stdint.h>
#include "gpio.h"
#include "structs.h"
#include "delay.h"
#include "graphic.h"
#include "ascii.h"
#define USBDM
void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
void startup ( void )
{
__asm volatile(
 " LDR R0,=0x2001C000\n"  /* set stack */
 " MOV SP,R0\n"
 " BL main\n"    /* call main */
 "_exit: B .\n"    /* never return */
 ) ;
}
static int snakeLength;
static OBJECT snakeVec[100];
static POBJECT pSnakeVec[100];
static int points =0;

static void set_object_speed(POBJECT o, int speedx, int speedy){
 if(speedx != -o->dirx)
 {
  o->dirx = speedx;
 }
 if(speedy != -o->diry){
  o->diry = speedy;
 }
}
static void move_object(POBJECT o){
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
static GEOMETRY ball_geometry =
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
10,8,
10,20,
draw_object,
clear_object,
move_object,
set_object_speed};
/*
void itoa(int v, int len, char* a) {
 a[len - 1] = '0' + v % 10;
 v /= 10;
 for(int i = 1; i < len; i++) {
  if(v > 0) {
   a[len - i - 1] = '0' + a % 10;
   a /= 10;
  }
 }
 a[len] = '\0';
}
 * */
static void move_snake(POBJECT o, int i){
 o->posx = pSnakeVec[i-1]->posx;
 o->posy = pSnakeVec[i-1]->posy;
}

static void extend_snake(POBJECT new, POBJECT tail)
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
static void collision(POBJECT pSnakeVec[], POBJECT a)
{
 
 char *s;
 char string[] = "Points";
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
   
   if(points > 9)
   {
    char entalx = (points % 10);
    char ental = (points % 10) + '0';
    char tiotal = (points - entalx)/10 + '0';
    ascii_write_char(tiotal);
    ascii_write_char(ental);
    
   }else{
    char pts = points + '0';
    ascii_write_char(pts);
    ascii_write_char('  ');
   }
   
   a->move(a);
  }
 }
}
static void gameOver(POBJECT s)
{
 char *st;
 char string[] = "Game Over";
 st = string;
 ascii_gotoxy(1, 1);
 
 while(*st)
 {
  ascii_write_char(*st++);
 }
 
 s->dirx = 0;
 s->diry = 0;
 points = 0;
 snakeLength = 1;
}
static OBJECT p2 = {&ball_geometry,
 0,0,
 2,2,
 draw_object,
 clear_object,
 move_snake,
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
void main(void)
{
 char c;
 
 POBJECT s = &snake;
 POBJECT pp2 = &p2;
 POBJECT a = &apple;
 pSnakeVec[0] = s;
 pSnakeVec[1] = pp2;
 
 snakeLength = 1;
 
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
  delay_milli(40);
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
  
  for (int i = snakeLength -1; i> 1; i--)
  {
   if (s->posx == pSnakeVec[i]->posx)
   {
    if(s->posy == pSnakeVec[i]->posy)
    {
     gameOver(s);
    }
   }
  }
  
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
