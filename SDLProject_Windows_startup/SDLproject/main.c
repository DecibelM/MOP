#include "renderer.h"
#include <stdio.h>
#include <math.h>
#include <vecmath.h>
#include "gameobject.h"

GameObject ship, background;
const Uint8 *state;
GameObject* gameObjects[] = {&background, &ship};
int nGameObjects = 2;

void close(); 
void vandStrang();

void printToWindow(char* str, int x, int y)
{
   renderText(str, x, y);
}

void printToConsole(char* str, int x, int y)
{
   printf("%s\n", str); 
}

void (*print) (char* str, int x, int y) = printToWindow;
    bool toggle = true;


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

void flip(char s[])
{
	int l = strlen(s); 
    int half_len = l/2;
    for(int i=0; i < half_len; i++) {
        // swap two elements
        char t = s[i];
        s[i] = s[l - i - 1];
        s[l - i - 1] = t;
    }
}

void render(GameObject* g)
{
	renderGfxObject(&g->obj, g->pos.x, g->pos.y, g->angle, g->scale);
	
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

void updateBack(GameObject* g)
{
		g->angle = fmod(g->angle+0.02, 360);
        g->scale += 1.0/2500.0;
	
	if (state[SDL_SCANCODE_S])
            g->scale = (g->scale - g->scaleSpeed <= 0) ? 0 : g->scale-g->scaleSpeed;
	if (state[SDL_SCANCODE_W])
            g->scale = (g->scale + g->scaleSpeed <= 0) ? 0 : g->scale+g->scaleSpeed;
}

//Keyboard input
	

int main( int argc, char* args[] )
{
    // If you want the program to not launch the terminal, then go to 
    // Project->Settings->General->"This program is a GUI application" and uncheck that flag.
    
	// Start up SDL and create window of width=800, height = 600
	initRenderer(800, 600); 

    
    // Create an object
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
 
	
	// Add Background
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
	
	// Variables for rotating and zooming
	
	
	
	//Keyboard input
	state = SDL_GetKeyboardState(NULL);
	void (*print) (char* str, int x, int y) = printToWindow;
    bool toggle = true;
    char strang[] = "Hello World!";
    int  loopIter = 0;
    
    while(true) // The real-time loop
    {
        // Handle events on the inqueue (e.g., mouse events)
        SDL_Event e;  //Event handler
		
		// get pointer to key states
		shake(&ship.pos);
		
		/*
		if (state[SDL_SCANCODE_RIGHT])
            ship.pos.x = (ship.pos.x+ship.speed >= 799) ? 799 : ship.pos.x+ship.speed;
        if (state[SDL_SCANCODE_LEFT])
            ship.pos.x = (ship.pos.x-ship.speed <= 0) ? 0 : ship.pos.x-ship.speed; 
        if (state[SDL_SCANCODE_DOWN])
            ship.pos.y = (ship.pos.y+ship.speed >= 599) ? 599 : ship.pos.y+ship.speed;           
        if (state[SDL_SCANCODE_UP])
            ship.pos.y = (ship.pos.y-ship.speed <= 0) ? 0 : ship.pos.y-ship.speed;
		if (state[SDL_SCANCODE_S])
            background.scale = (background.scale - background.scaleSpeed <= 0) ? 0 : background.scale-background.scaleSpeed;
		if (state[SDL_SCANCODE_W])
            background.scale = (background.scale + background.scaleSpeed <= 0) ? 0 : background.scale+background.scaleSpeed;
		if (state[SDL_SCANCODE_A])
            background.angle = fmod(background.angle - background.angleSpeed, 360.0);           
        if (state[SDL_SCANCODE_D])
            background.angle = fmod(background.angle + background.angleSpeed, 360.0);
		*/
        while( SDL_PollEvent( &e ) != 0 )
        {
            if( e.type == SDL_QUIT ) {   //User requests quit
                close(); 
                exit(0);
            }
        }
		
		if( (e.type == SDL_KEYDOWN) && 
                   (e.key.keysym.scancode == SDL_SCANCODE_C) )
            {
                toggle = !toggle;
                if(!toggle)
                    print = printToConsole;
                else
                    print = printToWindow;
            }
        
        // Clear screen with a grey background color, red=0x33, blue=0x33, green=0x33, alpha=0xff. 0=minimum, 0xff=maximum.
        // Alpha is transparency: 0 = fully transparent, 0xFF = fully opaque. However, actual use of transparency requires further settings.
        SDL_SetRenderDrawColor( gRenderer, 0x33, 0x33, 0x33, 0xFF ); 
        SDL_RenderClear( gRenderer );

        // Render our object(s) - background objects first, and then forward objects (like a painter)
		
		for(int i=0; i < nGameObjects; i++)
		gameObjects[i]->update(gameObjects[i]);
		for(int i=0; i < nGameObjects; i++)
		gameObjects[i]->render(gameObjects[i]);
		
		if( (loopIter % 100) == 99 )
            flip(strang);
        print(strang, 300, 150);
        
		
        renderText("Hello World!", 300, 150);
		char s[] = "Hej Varld!";
		flip(s);
		//renderText(s, 300, 180 );
		
		print(strang, 300, 180);
		//angle = fmod(angle+0.05, 360);
		//zoom += 1.0/2500.0;
		
		
			
         
        // This function updates the screen and also sleeps ~16 ms or so (based on the screen's refresh rate),  
        // because we used the flag SDL_RENDERER_PRESENTVSYNC in function initRenderer()
        SDL_RenderPresent( gRenderer );
		loopIter++;
    }

	close(); //Free allocated resources
	return 0;
}

void close()
{
    //Preferably, you should free all your GfxObjects, by calls to freeGfxObject(GfxObject* obj), but you don't have to.
    freeGfxObject(&ship.obj);
	freeGfxObject(&background.obj);
    
    closeRenderer(); //Free resources and close SDL
}