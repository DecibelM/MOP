#include <background.h>
#include <gameobject.h>
#include <math.h>

extern const Uint8 *state;
GameObject background;

void createBackground()
{
	background.obj = createGfxObject("../background.jpg");
	background.obj.outputWidth  = 800;
	background.obj.outputHeight = 600;
	background.pos.x = 400.0f;
	background.pos.y = 300.0f;
	background.speed = 0;
	background.angle = 0;
	background.angleSpeed = 90.0/360.0; // unused
    background.scale = 1.8f;
    background.scaleSpeed = 1.0/100.0;
	background.render = render;
	background.update = updateBack;
	background.frame = 0;
    background.frameSpeed = 1;
    background.numFrames = 1;
	
	gameObjects[nGameObjects++] = &background;
}

void updateBack(GameObject* g)
{
		g->angle = fmod(g->angle+0.02, 360);
        g->scale += 1.0/2500.0;
	
	if (state[SDL_SCANCODE_S])
            g->scale = (g->scale - g->scaleSpeed <= 0) ? 0 : g->scale-g->scaleSpeed;
	if (state[SDL_SCANCODE_W])
            g->scale = (g->scale + g->scaleSpeed <= 0) ? 0 : g->scale+g->scaleSpeed;
}