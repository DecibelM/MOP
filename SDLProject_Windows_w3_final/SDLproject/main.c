#include "renderer.h"
#include <stdio.h>
#include <math.h>
#include <stdlib.h> // för rand()

#include "vecmath.h"
#include "gameobject.h"

const Uint8 *state;

GameObject ship, background;
// ordningen är viktig ty annars ritar bakgrunden över skeppet:
GameObject* gameObjects[] = {&background, &ship}; 
int nGameObjects = 2;

void close(); 
void vandStrang();
void printToWindow(char* str, int x, int y);
void printToConsole(char* str, int x, int y);

int t = 0;
bool bShake = false;
int shakeStop = 0;
void shake(vec2f* pos)
{
    // om bShake == false, initiera shake med sannolikhet 1/60.
    //      Sätt bShake = true;
    //      Sätt shakeStop till t + (30 till 50) frames
    // om (bShake && t < shakeStop)
    //      addera omväxlande -1 resp 1 varannan frame till x,y
    // om (bShake && t >= shakeStop)
    //      sätt bShake = false;
    
    if( bShake == false && ((rand() % 60)==1) ) {
        bShake = true;
        shakeStop = t + (rand() % 20) + 30;
    }
    if( bShake && t < shakeStop) {
        pos->x += 2*((t % 3) - 1); 
        pos->y += ((rand() % 3) - 1); 
    }
    if( bShake && (t >= shakeStop) ) {
        bShake = false;
    }
    t++;
}

void updateShip(GameObject* this)
{
    shake(&ship.pos);    
    if (state[SDL_SCANCODE_RIGHT])
        this->pos.x = (this->pos.x+this->speed >= 799) ? 799 : this->pos.x+this->speed;
    if (state[SDL_SCANCODE_LEFT])
        this->pos.x = (this->pos.x-this->speed <= 0) ? 0 : this->pos.x-this->speed; 
    if (state[SDL_SCANCODE_DOWN])
        this->pos.y = (this->pos.y+this->speed >= 599) ? 599 : this->pos.y+this->speed;           
    if (state[SDL_SCANCODE_UP])
        this->pos.y = (this->pos.y-this->speed <= 0) ? 0 : this->pos.y-this->speed;

    if (state[SDL_SCANCODE_A])
        this->angle = fmod(this->angle - this->angleSpeed, 360.0);           
    if (state[SDL_SCANCODE_D])
        this->angle = fmod(this->angle + this->angleSpeed, 360.0);    
}

void updateBackground(GameObject* this)
{
    this->angle = fmod(this->angle+0.02, 360);
    this->scale += 1.0/2500.0;

    if (state[SDL_SCANCODE_W])
        this->scale = this->scale + this->scaleSpeed;           
    if (state[SDL_SCANCODE_S])
        this->scale = (this->scale - this->scaleSpeed <= 0) ? 0 : 
                            this->scale - this->scaleSpeed;     
}

void render(GameObject* this)
{
    renderGfxObject(&this->gfxObj, this->pos.x, this->pos.y, this->angle, this->scale);    
}

int main( int argc, char* args[] )
{
    // If you want the program to not launch the terminal, then go to 
    // Project->Settings->General->"This program is a GUI application" and uncheck 
    // that flag.
    
    // Start up SDL and create window of width=800, height = 600
    initRenderer(800, 600); 

    // Create an object
    ship.gfxObj = createGfxObject(  "../ship.png" );
    ship.gfxObj.outputWidth  = 200;
    ship.gfxObj.outputHeight = 200;
    ship.pos.x = 400.0f;
    ship.pos.y = 300.0f;
    ship.speed = 3;
    //(Note: 90/360, without .0, are integer numbers and division then becomes 
    // equal to 0)
    ship.angle = 0;               // unused
    ship.angleSpeed = 90.0/360.0; // unused
    ship.scale = 1.0f;
    ship.scaleSpeed = 0;          // unused
    ship.update = updateShip;
    ship.render = render;    
    
    // Create the background object
    background.gfxObj = createGfxObject(  "../background.jpg" );
    background.gfxObj.outputWidth  = 800;
    background.gfxObj.outputHeight = 600; 
    background.pos.x = 400.0f;
    background.pos.y = 300.0f;
    background.speed = 0;         // unused
    background.angle = 0;  
    //(Note: 1/100 are integer numbers and division becomes equal to 0)
    background.scale = 1.8f;
    background.scaleSpeed = 1.0/100.0; 
    background.update = updateBackground;
    background.render = render;    
    
    state = SDL_GetKeyboardState(NULL); // get pointer to key states 

    void (*print) (char* str, int x, int y) = printToWindow;
    bool toggle = true;
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
            if( (e.type == SDL_KEYDOWN) && 
                   (e.key.keysym.scancode == SDL_SCANCODE_C) )
            {
                toggle = !toggle;
                if(!toggle)
                    print = printToConsole;
                else
                    print = printToWindow;
            }            
        }
        
        // Clear screen with a grey background color.
        SDL_SetRenderDrawColor( gRenderer, 0x33, 0x33, 0x33, 0xFF ); 
        SDL_RenderClear( gRenderer );

        // Update our object(s)
        for(int i=0; i < nGameObjects; i++)
            gameObjects[i]->update(gameObjects[i]);
        // Render our object(s) - background objects first, and then forward objects
        for(int i=0; i < nGameObjects; i++)
            gameObjects[i]->render(gameObjects[i]);
       

        if( (loopIter % 100) == 99 )
            vandStrang(strang);
        print(strang, 300, 150);
         

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
    for(int i=0; i < half_len; i++) {
        // swap two elements
        char t = str[i];
        str[i] = str[l - i - 1];
        str[l - i - 1] = t;
    }
}

void close()
{
    // Preferably, you should free all your GfxObjects, by calls to 
    // freeGfxObject(GfxObject* obj), but you don't have to.
    freeGfxObject(&ship.gfxObj);
    freeGfxObject(&background.gfxObj);
    
    closeRenderer(); //Free resources and close SDL
}

void printToWindow(char* str, int x, int y)
{
   renderText(str, x, y);
}

void printToConsole(char* str, int x, int y)
{
   printf("%s\n", str); 
}