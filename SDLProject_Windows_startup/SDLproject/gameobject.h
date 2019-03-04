#ifndef GAMEOBJECT_H // eller vad din fil heter. Versaler på 
#define GAMEOBJECT_H // filnamnet + "_H" är vanligt.

#include <vecmath.h>
#include <renderer.h>



typedef struct tGameObject{
	GfxObject obj;
	vec2f pos;
	vec2f moveDir;
	float speed;
	double angle, angleSpeed;
	float scale, scaleSpeed;
	float       frame;
    float       frameSpeed;
    int         numFrames;
	void (*render) (struct tGameObject* g);
	void (*update) (struct tGameObject* g);
}GameObject;

extern GameObject* gameObjects[];
extern int nGameObjects;

void render(GameObject* g);
#endif