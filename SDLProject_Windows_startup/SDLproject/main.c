#include "renderer.h"
#include <stdio.h>
#include <math.h>
#include <vecmath.h>
#include "gameobject.h"
#include <player.h>
#include <background.h>
#include <aliens.h>
#include <coin.h>
#include <heart.h>

const Uint8 *state;


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

//Keyboard input

int main( int argc, char* args[] )
{
    // If you want the program to not launch the terminal, then go to 
    // Project->Settings->General->"This program is a GUI application" and uncheck that flag.
	
	// Start up SDL and create window of width=800, height = 600
	initRenderer(800, 600); 

	// Create an object
    
    
	// Add Background
	createBackground();
	createShip();
	createAliens();
	createCoins();
	createHearts();
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
		
		print(strang, 300, 180);
		
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
	//freeGfxObject(&aliens.obj);
    
    closeRenderer(); //Free resources and close SDL
}