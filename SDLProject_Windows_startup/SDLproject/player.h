#ifndef PLAYER_H
#define  PLAYER_H

#include <gameobject.h>

extern GameObject ship;

void updateShip(GameObject* g);
void createShip(void);
void shake(vec2f* pos);

#endif