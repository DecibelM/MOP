#ifndef COLLISION_H
#define COLLISION_H

#include "gameobject.h"

void CollisionDetection(GameObject* gameObjects[], int *nGameObjects);

void setExplosion1(GameObject* gameobj);
void setExplosion2(GameObject* gameobj);

#endif //COLLISION_H