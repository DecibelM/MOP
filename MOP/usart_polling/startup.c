/*
 * 	startup.c
 *
 */
void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void )
{
__asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	"_exit: B .\n"				/* never return */
	) ;
}

#include <USART.h>
#define USART1 ((USART*) 0x40011000)

#define USART1_IRQVEC 0x2001C0D4
#define NVIC_USART1_IRQ_BPOS (1<<5)
#define NVIC_USART1_ISER 0xE000E104

#define BIT_UE (1<<13)		//USART enable
#define BIT_TE (1<<3)		//Transmitter enable
#define BIT_RE (1<<2)		//Reciever enable
#define BIT_RXNE (1<<5)		//Recieve data register not empty
#define BIT_TXE (1<<7)		//Transmit data register empty

#define BIT_EN (1<<13)		//USART enable
#define BIT_RXNEIE (1<<5)	//Recieve interrupt enable

#define TXEIE (1<<7)//TXE interrupt enable
#define TCIE (1<<6)	//TC interrupt enable
#define TC (1<<6)	//Transmission complete
#define TXE (1<<7) 	//Transmit data register empty

char inbuf;
char outbuf;
static FIFO TxBuffer, RxBuffer;

void bufferInit(FIFO buffer)
{
	buffer.count = 0;
	buffer.in = 0;
	buffer.out = 0;
}

int bufferPut(FIFO buffer, char c)
{
	if(buffer.count == USARTBUFFSIZE)
	{
		return 0;
	}else{
		buffer.buff[buffer.in] = c;
		buffer.in++;
		buffer.count++;
		if(buffer.in == USARTBUFFSIZE)
		{
			buffer.in = 0;
		}
		return 1;
	}
}

int bufferGet(FIFO buffer, char* pc)
{
	if(buffer.count == 0)
	{
		return 0;
	}else{
		*pc = buffer.buff[buffer.out];
		buffer.count--;
		if(buffer.out == USARTBUFFSIZE)
		{
			buffer.out = 0;
		}
		return 1;
	}
}

char c;
char* pc;

char usart_tstchar(void)
{
	char c;
	char* pc;
	bufferGet(RxBuffer, pc);
	return c;
}

void usart_outchar(char c)
{
	bufferPut(RxBuffer, c);
	USART1->cr1 |= TXEIE;
}

void usart_irq_routine(void)
{
	if(USART1->sr & BIT_RXNE)
	{
		bufferPut(RxBuffer, (char) USART1->dr);
		//inbuf = (char) USART1->dr;
	}
	
	if(((USART1->cr1 & TXEIE) !=0) && ((USART1->sr & TXE) != 0))
	{
		bufferGet(RxBuffer, (unsigned short) USART1->dr);
		//USART1->dr = (unsigned short) outbuf;
		USART1->cr1 &= ~TXEIE;
	}
}

void usart_init(void)
{
	inbuf = 0;
	*((void (**) (void)) USART1_IRQVEC) = usart_irq_routine;
	*((unsigned int *) NVIC_USART1_ISER) |= NVIC_USART1_IRQ_BPOS;
	USART1->brr = 0x2D9;
	USART1->cr3 = 0;
	USART1->cr2 = 0;
	USART1->cr1 = BIT_EN | BIT_RXNEIE | BIT_TE | BIT_RE; 
}

void putstring(char *s)
{
	while(*s)
	{
		usart_outchar(*s++);
	}
}

void main(void)
{
	char c;
	usart_init();
	putstring("USART program");
	while(1)
	{
		c = usart_tstchar();
		if (c)
		{
			usart_outchar(c);
		}
	}
}

