#ifndef DYNAMIC_ALLOC_H
#define DYNAMIC_ALLOC_H
#include "gameobject.h"

GameObject* allocElement(); // Allokerar dynamiskt minnesutrymme för ett objekt 
void freeElement(GameObject* pObj); // Deallokerar minnesutrymmet för ett objekt

#endif // DYNAMIC_ALLOC_H
