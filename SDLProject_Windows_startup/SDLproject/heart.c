#include "heart.h"
#include "gameobject.h"
#include    "math.h"

GameObject heart[100];

static void update(GameObject* this)
{
    // update which frame in texture to show
    this->frame = fmod( (this->frame+this->frameSpeed), this->numFrames );   
    
    // update position
    this->pos.x += this->moveDir.x * this->speed;
	this->pos.y += this->moveDir.y * this->speed;
}

static void init(GameObject* pObj, GfxObject* pGfx, vec2f pos, float startFrame)
{
    pObj->obj = *pGfx;
    pObj->obj.outputWidth  = 100;
    pObj->obj.outputHeight = 100;
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
    pObj->frameSpeed = 0.5f;
    pObj->numFrames = 10;
}

void createHearts()
{
    static GfxObject gfx;
    static bool bFirstTime = true;
    
    // It is unnecesary to load the heart image for every instance. Just do it once:
    if(bFirstTime)
    {
        bFirstTime = false;
        // Create a GfxObject for the heart image
        gfx = createGfxObject(  "../fireheart_new.png" );
    }
        
    init(&heart[0], &gfx, (vec2f){100, 100}, 0);
    init(&heart[1], &gfx, (vec2f){200, 100}, 3);
    init(&heart[2], &gfx, (vec2f){300, 100}, 6);
    gameObjects[nGameObjects++] = &heart[0];
    gameObjects[nGameObjects++] = &heart[1];
    gameObjects[nGameObjects++] = &heart[2];
}
