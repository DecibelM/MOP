#include "shots.h"
#include "gameobject.h"
#include <math.h>   // för fmod()
#include "dynamicalloc.h"


static bool update(GameObject* this)
{
    // update which frame in texture to show
    this->frame = fmod( (this->frame+this->frameSpeed), this->numFrames ); 
    
    // update positions
    this->pos.x += this->moveDir.x * this->speed;
    this->pos.y += this->moveDir.y * this->speed;
 
    // Hämta fönsterstorleken:
    int screenWidth, screenHeight; 
    SDL_GetWindowSize(gWindow, &screenWidth, &screenHeight);
    
    // Terminera objektet om det är helt utanför fönstret
    bool bOutside = false;
    bOutside |= this->pos.x <= -this->gfxObj.outputWidth/2;
    bOutside |= this->pos.x >= screenWidth + this->gfxObj.outputWidth/2;
    bOutside |= this->pos.y <= -this->gfxObj.outputHeight/2;
    bOutside |= this->pos.y >= screenHeight + this->gfxObj.outputHeight/2;
        
    if(bOutside)
        return false;  
    // kolla om dags att terminera
    return ( (this->age++ < this->lifeTime) && !bOutside);
}


GameObject* createPlayerShot1(vec2f pos, vec2f dir)
{
    static GfxObject gfxApple;
    static bool bFirstApple = true;    
    // It is unnecesary to load the apple image for every instance. Just do it once:
    if(bFirstApple)
    {
        bFirstApple = false;
        // Create a GfxObject for the apple image
        gfxApple = createGfxObject(  "../apples25st.png" );
    }

    // Allokera och initiera en instans
    GameObject* pObj = allocElement(); // allokera dynamiskt
    if (pObj == 0)
        return 0;
    pObj->gfxObj = gfxApple;
    pObj->gfxObj.outputWidth  = 50;
    pObj->gfxObj.outputHeight = 50;
    pObj->pos = pos;
    pObj->moveDir = dir;  
    pObj->speed = 5;
    pObj->angle = 0;               // unused
    pObj->angleSpeed = 0;          // unused
    pObj->scale = 1.0f;
    pObj->scaleSpeed = 0;          // unused
    pObj->update = update;         // our own update in this file
    pObj->render = render;         // From gameobjects.h
    pObj->frame = 0;
    pObj->frameSpeed = 1;
    pObj->numFrames = 25;
    pObj->age = 0;
    pObj->lifeTime = 6*60;        // 10 seconds 
 
    pObj->properties = COLL_CHECK | PLAYER_SHOT;
    pObj->setExplosion = 0;

    gameObjects[nGameObjects++] = pObj;
    return pObj;		
}

