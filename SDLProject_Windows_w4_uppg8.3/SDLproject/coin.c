#include "coin.h"
#include "gameobject.h"
#include <math.h>   // för fmod()
#include "dynamicalloc.h"

//GameObject coin[100];

static bool update(GameObject* this)
{
    // update which frame in texture to show
    this->frame = fmod( (this->frame+this->frameSpeed), this->numFrames );   
    
    // update positions
    int duration = 200;
    float ampl = 100.0f, t;

    this->iter++;
    
    // this frame
    int frame = this->iter + (this->pos.x) / 3.5f;
    t = (frame % duration) / (float)(duration-1); // t: 0 -> duration
    float current_y = ampl*( fabs(2.0f*(3*t*t - 2*t*t*t) -1)); // snott fr. uppg.3 v1.
    
    // previous frame
    t = ((frame-1) % duration) / (float)(duration-1); 
    float previous_y = ampl*( fabs(2.0f*(3*t*t - 2*t*t*t) -1)); 
    
    // Compute delta step in y-direction
    float delta_y = current_y - previous_y;
    
    this->pos.y += delta_y;
    
    // kolla om dags att terminera
    return (this->age++ < this->lifeTime);
}

static void init(GameObject* pObj, GfxObject* pGfx, vec2f pos, float startFrame)
{
    pObj->gfxObj = *pGfx;
    pObj->gfxObj.outputWidth  = 100;
    pObj->gfxObj.outputHeight = 100;
    pObj->pos = pos;
    pObj->moveDir = (vec2f){0,0};  // unused
    pObj->speed = 0;
    pObj->angle = 0;               // unused
    pObj->angleSpeed = 0;          // unused
    pObj->scale = 1.0f;
    pObj->scaleSpeed = 0;          // unused
    pObj->update = update;         // our own update in this file
    pObj->render = render;         // From gameobjects.h
    pObj->frame = startFrame;
    pObj->frameSpeed = 1.0f;
    pObj->numFrames = 40;
    pObj->age = 0;
    pObj->lifeTime = 5*600000;        // 10 seconds 
    pObj->iter = 0;

    pObj->properties = COLL_CHECK | COIN;
    pObj->setExplosion = 0;  
}

void createCoins()
{
    static GfxObject gfx;
    static bool bFirstTime = true;
    
    // It is unnecesary to load the heart image for every instance. Just do it once:
    if(bFirstTime) {
        bFirstTime = false;
        // Create a GfxObject for the coin image
        gfx = createGfxObject(  "../coinstrip40st.png" ); 
    }
     
	// Skapa fyra instanser
	for (int i=0; i<4; i++)
    {
        // Allokera och initiera en instans
        GameObject* pObj = allocElement(); // allokera dynamiskt
        if (pObj == 0)
            return;
        init(pObj, &gfx, (vec2f){400+i*100, 100},  i*10);
        gameObjects[nGameObjects++] = pObj;
    }
}

