#ifndef USART_H
#define USART_H

#define USARTBUFFSIZE 64

typedef struct tag_usart
{
	volatile unsigned short sr;
	volatile unsigned short Unused0;
	volatile unsigned short dr;
	volatile unsigned short Unused1;
	volatile unsigned short brr;
	volatile unsigned short Unused2;
	volatile unsigned short cr1;
	volatile unsigned short Unused3;
	volatile unsigned short cr2;
	volatile unsigned short Unused4;
	volatile unsigned short cr3;
	volatile unsigned short Unused5;
	volatile unsigned short gtpr;
}USART;

typedef struct{
	unsigned char in;
	unsigned char out;
	unsigned char count;
	unsigned char buff[USARTBUFFSIZE];
}FIFO;

#endif