#ifndef GAMEOBJECT_H
#define GAMEOBJECT_H

#include "renderer.h"
#include "vecmath.h"

// properties implemented as bit booleans
typedef enum {TERMINATING=1, COLL_CHECK=2,
              PLAYER=8, ENEMY=16, PLAYER_SHOT=32, ENEMY_SHOT=64,
              COIN=128, POWER_UP=256 } Props;

typedef struct tGameObject{
    GfxObject   gfxObj;
    vec2f       pos;
    vec2f       moveDir;    // move direction
    float       speed;
    double      angle, angleSpeed;
    float       scale, scaleSpeed;
    int         age;
    int         lifeTime;
    int         iter;   // used by coins and hearts
    // new members for animated images:
    float       frame;
    float       frameSpeed;
    int         numFrames;
    // new member for shooting apples
    int         delay;
    // new members for powerups - used by player
    int         delayTime; // önskad tid mellan skott
    float       shotSpeed; // skottens hastighet    
    // Properties
    Props       properties;
    
    // methods:
    void        (*setExplosion)(struct tGameObject* gameobj);
    bool        (*update) (struct tGameObject* gameobj);
    void        (*render) (struct tGameObject* gameobj);
} GameObject;

void render(GameObject* this); // metod

extern GameObject* gameObjects[];
extern int nGameObjects;

#endif // GAMEOBJECT_H