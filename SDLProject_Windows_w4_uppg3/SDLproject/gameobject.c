#include "gameobject.h"
#include "renderer.h"

GameObject* gameObjects[100];
int nGameObjects = 0;


void render(GameObject* this)
{
    renderGfxObject(&this->gfxObj, this->pos.x, this->pos.y, this->angle, this->scale);    
}


