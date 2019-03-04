#ifndef GRAPHIC_H
#define GRAPHIC_H

#include <gpio.h>
#include <structs.h>

static void graphic_wait_ready(void);
static uint8_t graphic_read(uint8_t controller);
void graphic_write(uint8_t value, uint8_t controller);
void graphic_write_command(uint8_t command, uint8_t controller);
void graphic_write_data(uint8_t data, uint8_t controller);
uint8_t graphic_read_data(uint8_t controller);
void graphic_ctrl_bit_set(uint8_t x);
void graphic_ctrl_bit_clear(unsigned char x);
void select_controller(uint8_t controller);
void graphic_initialize(void);
void graphic_clear_screen(void);
void pixel(int x, int y, int set);
void draw_object(POBJECT obj);
void clear_object(POBJECT obj);

#endif