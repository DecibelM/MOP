#include "collision.h"
#include "vecmath.h"
#include "dynamicalloc.h"
#include "player.h"
#include <math.h>   // för sqrt()

static inline float getRadius(GameObject* pObj)
{
    float radius = sqrt(
      pObj->gfxObj.outputHeight*pObj->gfxObj.outputHeight + 
      pObj->gfxObj.outputWidth*pObj->gfxObj.outputWidth)*0.25f;
    return radius;
}

static inline bool collide(GameObject* pA, GameObject* pB)
{
    vec2f centerA = pA->pos;
    vec2f centerB = pB->pos;
    float dx = (centerA.x - centerB.x);
    float dy = (centerA.y - centerB.y);
    float dist = sqrt(dx*dx + dy*dy);
    return (dist <= getRadius(pA) + getRadius(pB));
}

static bool update(GameObject* this)
{
    // kolla om animeringen är färdig
    bool bFinished = this->frame+this->frameSpeed >= this->numFrames;
    
    // update which frame in texture to show
    this->frame = fmod( (this->frame+this->frameSpeed), this->numFrames ); 
    
    // Hack to make player resurrect again
    if( bFinished && (this->properties & PLAYER) )
        createShip();
        
    return !bFinished;
}

void setExplosion1(GameObject* pObj)
{
    static GfxObject expl;
    static bool bFirstTime = true;

    if(bFirstTime)
    {
        bFirstTime = false;
        // Create a GfxObject for the explosion animation
        expl = createGfxObject(  "../explosion1_10.png" );
    }
    int w = pObj->gfxObj.outputWidth;
    int h = pObj->gfxObj.outputHeight;
    pObj->gfxObj = expl;
    pObj->gfxObj.outputWidth = w*1.5f;
    pObj->gfxObj.outputHeight = h*1.5f;
    pObj->frame = 0;
    pObj->frameSpeed = 0.3f;
    pObj->moveDir = (vec2f){0,0};
    pObj->numFrames = 10;
    pObj->update = update;
}

void setExplosion2(GameObject* pObj)
{
    static GfxObject expl;
    static bool bFirstTime = true;
    if(bFirstTime) {
        bFirstTime = false;
        //expl = createGfxObject(  "../explosion2_50.png" );
        expl = createGfxObject(  "../explosion1_10.png" );
    }
    int w = pObj->gfxObj.outputWidth;
    int h = pObj->gfxObj.outputHeight;
    pObj->gfxObj = expl;
    pObj->gfxObj.outputWidth = w;
    pObj->gfxObj.outputHeight = h;
    pObj->frame = 0;
    pObj->frameSpeed = 0.2f;
    pObj->moveDir = (vec2f){0,0};
    pObj->numFrames = 10; //50;    
    pObj->update = update;
}

void CollisionDetection(GameObject* gameObjects[], int * outNumGameObjects)
{
    int nGameObjects = *outNumGameObjects;
    for(int i=0; i<nGameObjects; i++)
    {
        GameObject* pA = gameObjects[i];
        
        if( !(pA->properties & COLL_CHECK) )
            continue; // A is not collidable
        // We want to test: PLAYER and PLAYER_SHOT against the other collidable types            
        if( !(pA->properties & (PLAYER | PLAYER_SHOT)) )
            continue;
        for(int j=0; j<nGameObjects; j++)
        {
            GameObject* pB = gameObjects[j];
            if( !(pB->properties & COLL_CHECK) )
                continue; // B is not collidable
                
 /*         // Följande rader snabbar upp logiken men är just nu överflödiga:
           if(pB->properties & (PLAYER | PLAYER_SHOT) )
                continue; // Don't test player and/or player shots against each other
            if(pA->properties & PLAYER_SHOT && !(pB->properties & ENEMY) )
                continue; // player shots can only hit enemies (not enemyshots, coins nor power_ups)
 */               
            // Testa A och B mot varandra        
            if(collide(pA, pB)) 
            {
                if(pB->properties & (ENEMY | ENEMY_SHOT) ) {
                    // Spelare/spelarskott ska kunna skada flera enemies...
                    pA->properties |= TERMINATING; // ... so kill player/playershot but don't turn off collision detection
                    pB->properties |= TERMINATING; // kill enemy
                    pB->properties &= ~COLL_CHECK;  // disable further collision check for the enemy.
                }

                if( (pA->properties & PLAYER) && (pB->properties & (COIN | POWER_UP)) ) {
                    // Powerup/coin kan bara plockas av en spelare åt gången
                    pB->properties &= ~COLL_CHECK; // Därför, slå av kollisionsdetektering
                    pB->properties |= TERMINATING; // kill coin/powerup  
                    // add points or power-up capabilities
                    if(pB->properties & POWER_UP) {
                        pA->speed *= 1.6f;
                        pA->delayTime /= 1.5f;
                        pA->shotSpeed *= 1.4f;
                    }
                }
            }
        }
    }
    
    // Do something with each of the newly terminating objects. 
    // E.g., initiate termination animation or remove them.
    int j=0;
    for(int i=0; i<nGameObjects; i++) 
    {
        GameObject* pObj = gameObjects[i];
        gameObjects[j++] = gameObjects[i]; // lägg tillbaks objektet i arrayen
               
        if( pObj->properties & TERMINATING )
        {
            // clear the terminating and coll_check flags 
            pObj->properties &= ~(TERMINATING | COLL_CHECK); 
            
            if( pObj->setExplosion )
                pObj->setExplosion(pObj);
            else {
                freeElement(pObj);  // deallokera objektet
                j--; // minska antal objekt
            }
        }
    }
    *outNumGameObjects = j; // uppdaterar arrayens storlek  
}