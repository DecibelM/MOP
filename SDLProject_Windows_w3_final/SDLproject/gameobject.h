#ifndef GAMEOBJECT_H
#define GAMEOBJECT_H

#include "renderer.h"
#include "vecmath.h"

typedef struct tGameObject{
    GfxObject   gfxObj;
    vec2f       pos;
    float       speed;
    double      angle, angleSpeed;
    float       scale, scaleSpeed;
    
    void        (*update) (struct tGameObject* gameobj);
    void        (*render) (struct tGameObject* gameobj);
} GameObject;

#endif // GAMEOBJECT_H