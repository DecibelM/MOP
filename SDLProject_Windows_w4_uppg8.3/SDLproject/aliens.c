#include "aliens.h"
#include "gameobject.h"
#include "renderer.h"
#include "dynamicalloc.h"
#include "collision.h"

//static GameObject aliens[3];

static bool update(GameObject* this)
{

    // update positions
    this->pos.x += this->moveDir.x * this->speed;
    this->pos.y += this->moveDir.y * this->speed;
 
    // Hämta fönsterstorleken:
    int screenWidth, screenHeight; 
    SDL_GetWindowSize(gWindow, &screenWidth, &screenHeight);
    
    // Låt objektet studsa vid skärmkanterna    
    if(this->pos.x <= this->gfxObj.outputWidth/2 && this->moveDir.x < 0) {
        int overflow = (this->gfxObj.outputWidth/2) - this->pos.x;
        this->pos.x += 2*overflow;
        this->moveDir.x = -this->moveDir.x;
    }
    if(this->pos.x >= screenWidth - this->gfxObj.outputWidth/2 && this->moveDir.x > 0) {
        int overflow = this->pos.x - (screenWidth - this->gfxObj.outputWidth/2);
        this->pos.x -= 2*overflow;
        this->moveDir.x = -this->moveDir.x;
    }
   
    if(this->pos.y <= this->gfxObj.outputHeight/2 && this->moveDir.y < 0) {
        int overflow = (this->gfxObj.outputHeight/2) - this->pos.y;
        this->pos.y += 2*overflow;
        this->moveDir.y = -this->moveDir.y;
    }
    if(this->pos.y >= screenHeight - this->gfxObj.outputHeight/2 && this->moveDir.y > 0) {
        int overflow = this->pos.y - (screenHeight - this->gfxObj.outputHeight/2);
        this->pos.y -= 2*overflow;
        this->moveDir.y = -this->moveDir.y;
    }    
    
    // kolla om dags att terminera
    return (this->age++ < this->lifeTime);
}

static void init(GameObject* pObj, GfxObject* pGfx, int w, int h, vec2f pos, vec2f moveDir, float speed)
{
    pObj->gfxObj = *pGfx;
    pObj->gfxObj.outputWidth  = w;
    pObj->gfxObj.outputHeight = h;
    pObj->pos = pos;
    pObj->moveDir = moveDir;
    pObj->speed = speed;
    pObj->angle = 0;               // unused
    pObj->angleSpeed = 0;          // unused
    pObj->scale = 1.0f;
    pObj->scaleSpeed = 0;          // unused
    pObj->frame = 0;
    pObj->frameSpeed = 1;
    pObj->numFrames = 1;      
    pObj->age = 0;
    pObj->lifeTime = 10*60;        // 10 seconds
    pObj->update = update;         // Our own update in this file
    pObj->render = render;         // From gameobjects.h
    pObj->setExplosion = setExplosion1;

    pObj->properties = COLL_CHECK | ENEMY;  
}

void createAliens()
{
    static GfxObject gfx;
    static bool bFirstTime = true;
    
    // It is unnecesary to load the image for every instance. Just do it once:
    if(bFirstTime)
    {
        bFirstTime = false;
        gfx = createGfxObject(  "../alienship.png" );
    }

	// Skapa tre instanser
    for (int i=0; i<3; i++)
    {
        // Allokera och initiera en instans
        GameObject* pObj = allocElement(); // allokera dynamiskt
        if (pObj == 0)
            return;
        init(pObj, &gfx, 100, 100, (vec2f){100, -50}, (vec2f){0.33*(i+1), 1}, 5.0f);      
        gameObjects[nGameObjects++] = pObj;
    }
}


