#ifndef GAMEOBJECT_H // eller vad din fil heter. Versaler på 
#define GAMEOBJECT_H // filnamnet + "_H" är vanligt.

#include <vecmath.h>
#include <renderer.h>

typedef struct tGameObject{
	GfxObject obj;
	vec2f pos;
	float speed;
	double angle, angleSpeed;
	float scale, scaleSpeed;
	void (*render) (struct tGameObject* g);
	void (*update) (struct tGameObject* g);
}GameObject;

#endif