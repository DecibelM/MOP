#include <gameobject.h>

GameObject* gameObjects[100];
int nGameObjects = 0;
void render(GameObject* this)
{
	int w = this->obj.textureWidth / this->numFrames;
    int x = w * (int)(this->frame);

    SDL_Rect srcRect = { x, 0, w, this->obj.textureHeight }; // select the sub image
    
    renderGfxSubFrame(&this->obj, this->pos.x, this->pos.y, this->angle,
                       this->scale, srcRect );
	
}