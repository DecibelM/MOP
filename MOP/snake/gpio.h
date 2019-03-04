#ifndef GPIO_H
#define GPIO_H

#define SIMULATOR
//#define USBDM

typedef unsigned int uint32_t;
typedef unsigned short uint16_t;
typedef unsigned char uint8_t;

typedef struct {
uint32_t moder;
uint16_t otyper; // +0x4
uint16_t otReserved;
uint32_t ospeedr; // +0x8
uint32_t pupdr; // +0xc
uint8_t idrLow; // +0x10
uint8_t idrHigh; // +0x11
uint16_t idrReserved;
uint8_t odrLow; // +0x14
uint8_t odrHigh; // +0x15
uint16_t odrReserved;
} GPIO;

#define GPIO_D (*((volatile GPIO*) 0x40020C00))
#define GPIO_E (*((volatile GPIO*) 0x40021000))

#define STK_CTRL ((volatile unsigned int *)(0xE000E010))
#define STK_LOAD ((volatile unsigned int *)(0xE000E014))
#define STK_VAL ((volatile unsigned int *)(0xE000E018))

#define B_E 0x40
#define B_SELECT 0x04
#define B_RW 0x02
#define B_RS 0x01

#define B_RST 0x20
#define B_CS2 0x10
#define B_CS1 0x08

#define LCD_ON 0x3F
#define LCD_OFF 0x3E
#define LCD_SET_ADD 0x40
#define LCD_SET_PAGE 0xB8
#define LCD_DISP_START 0xC0
#define LCD_BUSY 0x80

#define MAX_POINTS 20

#endif
