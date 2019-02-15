#include "renderer.h"
#include <stdio.h>
#include <math.h>

GfxObject ship;
GfxObject background;

void close(); 

int main( int argc, char* args[] )
{
    // If you want the program to not launch the terminal, then go to 
    // Project->Settings->General->"This program is a GUI application" and uncheck that flag.
    
	// Start up SDL and create window of width=800, height = 600
	initRenderer(800, 600); 
    
    // Create an object
    ship = createGfxObject(  "../ship.png" );
    ship.outputWidth  = 200;
    ship.outputHeight = 200;

	float x = 400, y = 300, speed = 3;
	float* px = &x;
	float* py = &y;
	
	// Add Background
	background = createGfxObject("../background.jpg");
	background.outputWidth  = 800;
	background.outputHeight = 600;
	
	// Variables for rotating and zooming
	double angle = 0;
	float zoom = 1.0f;
	
	//Keyboard input
	const Uint8 *state = SDL_GetKeyboardState(NULL);
    
    while(true) // The real-time loop
    {
        // Handle events on the inqueue (e.g., mouse events)
        SDL_Event e;  //Event handler
		
		// get pointer to key states
		
        while( SDL_PollEvent( &e ) != 0 )
        {
            if( e.type == SDL_QUIT ) {   //User requests quit
                close(); 
                exit(0);
            }
        }
        
        // Clear screen with a grey background color, red=0x33, blue=0x33, green=0x33, alpha=0xff. 0=minimum, 0xff=maximum.
        // Alpha is transparency: 0 = fully transparent, 0xFF = fully opaque. However, actual use of transparency requires further settings.
        SDL_SetRenderDrawColor( gRenderer, 0x33, 0x33, 0x33, 0xFF ); 
        SDL_RenderClear( gRenderer );

        // Render our object(s) - background objects first, and then forward objects (like a painter)
        
		renderGfxObject(&background, 400, 300, angle, zoom);
		renderGfxObject(&ship, *px, *py, 0, 1.0f);
        renderText("Hello World!", 300, 150);
		angle = fmod(angle+0.05, 360);
		zoom += 1.0/2500.0;
		
		if (state[SDL_SCANCODE_RIGHT])
            *px = (*px+speed >= 799) ? 799 : *px+speed;
        if (state[SDL_SCANCODE_LEFT])
            *px = (*px-speed <= 0) ? 0 : *px-speed; 
        if (state[SDL_SCANCODE_DOWN])
            *py = (*py+speed >= 599) ? 599 : *py+speed;           
        if (state[SDL_SCANCODE_UP])
            *py = (*py-speed <= 0) ? 0 : *py-speed;
         
        // This function updates the screen and also sleeps ~16 ms or so (based on the screen's refresh rate),  
        // because we used the flag SDL_RENDERER_PRESENTVSYNC in function initRenderer()
        SDL_RenderPresent( gRenderer );
    }

	close(); //Free allocated resources
	return 0;
}

void close()
{
    //Preferably, you should free all your GfxObjects, by calls to freeGfxObject(GfxObject* obj), but you don't have to.
    freeGfxObject(&ship);
    
    closeRenderer(); //Free resources and close SDL
}