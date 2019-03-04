#include <player.h>
#include <gameobject.h>
#include <math.h>


extern const Uint8 *state;
GameObject ship;

void createShip(void){
	ship.obj = createGfxObject(  "../ship.png" );
    ship.obj.outputWidth  = 200;
    ship.obj.outputHeight = 200;
	ship.pos.x = 400.0f;
	ship.pos.y = 300.0f;
	ship.speed = 3;
	ship.angle = 0;
	ship.angleSpeed = 90.0/360.0; // unused
    ship.scale = 1.0f;
    ship.scaleSpeed = 0;
	ship.render = render;
	ship.update = updateShip;
	ship.frame = 0;
    ship.frameSpeed = 1;
    ship.numFrames = 1;
	
	gameObjects[nGameObjects++] = &ship;
}
void updateShip(GameObject* g)
{
	
		if (state[SDL_SCANCODE_RIGHT])
            g->pos.x = (g->pos.x+g->speed >= 799) ? 799 : g->pos.x+g->speed;
        if (state[SDL_SCANCODE_LEFT])
            g->pos.x = (g->pos.x-g->speed <= 0) ? 0 : g->pos.x-g->speed; 
        if (state[SDL_SCANCODE_DOWN])
            g->pos.y = (g->pos.y+g->speed >= 599) ? 599 : g->pos.y+g->speed;           
        if (state[SDL_SCANCODE_UP])
            g->pos.y = (g->pos.y-g->speed <= 0) ? 0 : g->pos.y-g->speed;
		if (state[SDL_SCANCODE_A])
            g->angle = fmod(g->angle - g->angleSpeed, 360.0);           
		if (state[SDL_SCANCODE_D])
            g->angle = fmod(g->angle + g->angleSpeed, 360.0);
		
}

int t = 0;
bool bShake = false;
int shakeStop = 0;
void shake(vec2f* pos)
{
   if( bShake == false && ((rand() % 60)==1) ) {
        bShake = true;
        shakeStop = t + (rand() % 20) + 30;
    }
    if( bShake && t < shakeStop) {
        pos->x += 2* ((t % 3) - 1);
        pos->y += ((rand() % 3) - 1); 
    }
    if( bShake && (t >= shakeStop) ) {
        bShake = false;
    }
    t++;
}