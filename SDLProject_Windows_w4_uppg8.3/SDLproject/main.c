#include "renderer.h"
#include <stdio.h>
#include <math.h>   // för fmod()
#include <stdlib.h> // för rand()
#include <string.h> // för strlen

#include "vecmath.h"
#include "gameobject.h"
#include "player.h"
#include "background.h"
#include "aliens.h"
#include "heart.h"
#include "coin.h"
#include "dynamicalloc.h"
#include "collision.h"

const Uint8 *state;

void close(); 
void vandStrang();
void printToWindow(char* str, int x, int y);
void printToConsole(char* str, int x, int y);

// Definiera en struct GameEvent
typedef struct {
    int time;
    void (*function) (void);
} GameEvent;

// Skapa en array av events
GameEvent gameEvents[] = {
    { 0,    createHearts },
    { 1*60, createCoins  },
    { 2.00f*60, createAliens },
    { 2.25f*60, createAliens },
    { 2.50f*60, createAliens },
    { 2.75f*60, createAliens },
    { 4.00f*60, createAliens },
    { 4.25f*60, createAliens },
    { 4.50f*60, createAliens },
    { 4.75f*60, createAliens }
};
int nextEvent = 0;
// Låt gärna kompilatorn beräkna arrayens längd i compile time:
int nGameEvents = sizeof(gameEvents) / sizeof(GameEvent);


int main( int argc, char* args[] )
{
	// Start up SDL and create window of width=800, height = 600
	initRenderer(800, 600); 

    // Create objects
    createBackground(); 
    createShip();   

    state = SDL_GetKeyboardState(NULL); // get pointer to key states 
    void (*print) (char* str, int x, int y) = printToWindow;
    char strang[] = "Hello World!";
    int  loopIter = 0;
    while(true) // The real-time loop
    {
        // Handle events on the inqueue (e.g., mouse events)
        SDL_Event e;  //Event handler
        while( SDL_PollEvent( &e ) != 0 )
        {
            if( e.type == SDL_QUIT ) {   //User requests quit
                close(); 
                exit(0);
            }
            if( (e.type == SDL_KEYDOWN) && (e.key.keysym.scancode == SDL_SCANCODE_C) ) {
                static bool toggle = true;
                toggle = !toggle;
                if(!toggle)
                    print = printToConsole;
                else
                    print = printToWindow;
            }        
        }
		
		// Handle initiation of game events
        while(loopIter >= gameEvents[nextEvent].time && nextEvent < nGameEvents) {
            gameEvents[nextEvent].function();
            nextEvent++;
        }
        
        // Clear screen with a grey background color, red=0x33, blue=0x33, green=0x33, alpha=0xff. 0=minimum, 0xff=maximum.
        // Alpha is transparency: 0 = fully transparent, 0xFF = fully opaque. However, actual use of transparency requires further settings.
        SDL_SetRenderDrawColor( gRenderer, 0x33, 0x33, 0x33, 0xFF ); 
        SDL_RenderClear( gRenderer );
      
        // Update our object(s)
        int j=0;
        for(int i=0; i < nGameObjects; i++) {
            if( gameObjects[i]->update(gameObjects[i]) )
                gameObjects[j++] = gameObjects[i]; // lägg tillbaks objektet i arrayen
            else
                freeElement(gameObjects[i]);       // deallokera elementet
        }
        nGameObjects = j; // uppdaterar arrayens storlek
        
        // Collision detection
        CollisionDetection(gameObjects, &nGameObjects);

        // Render our object(s) - background objects first, and then forward objects
        for(int i=0; i < nGameObjects; i++)
            gameObjects[i]->render(gameObjects[i]);


        if( (loopIter % 100) == 99 )
            vandStrang(strang);
        print(strang, 300, 150);
         
        // This function updates the screen and also sleeps ~16 ms or so (based on the screen's refresh rate),  
        // because we used the flag SDL_RENDERER_PRESENTVSYNC in function initRenderer()
        SDL_RenderPresent( gRenderer );
        loopIter++;
    }

	close(); //Free allocated resources
	return 0;
}

void vandStrang(char str[])
{
    int l = strlen(str); 
    int half_len = l/2;
    for(int i=0; i<half_len; i++) {
        // swap two elements
        char t = str[i];
        str[i] = str[l - i - 1];
        str[l - i - 1] = t;
    }
}

void printToWindow(char* str, int x, int y)
{
   renderText(str, x, y);
}

void printToConsole(char* str, int x, int y)
{
   printf("%s\n", str); 
}


void close()
{
    //Preferably, you should free all your GfxObjects, by calls to freeGfxObject(GfxObject* obj), but you don't have to.
    freeGfxObject(&ship.gfxObj);
    freeGfxObject(&background.gfxObj);
    
    closeRenderer(); //Free resources and close SDL
}