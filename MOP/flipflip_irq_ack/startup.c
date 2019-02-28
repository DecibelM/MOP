/*
 * 	startup.c flipflop_irq_ack
 *
 */
 #include "gpio_2.h"

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

/*
#define GPIO_D 0x40020C00 
#define GPIO_MODER ((volatile unsigned int *) (GPIO_D))
#define GPIO_IDR_LOW ((volatile unsigned char *) (GPIO_D+0x10))  
#define GPIO_IDR_HIGH ((volatile unsigned char *) (GPIO_D+0x11))  
#define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_D+0x14))  
#define GPIO_ODR_HIGH ((volatile unsigned char *) (GPIO_D+0x15))

#define GPIO_E 0x40021000
#define GPIOE_MODER ((volatile unsigned int *) (0x40021000))
#define GPIOE_OTYPER ((volatile unsigned short *) (0x40021004))
#define GPIOE_IDR_LOW ((volatile unsigned char *) (0x40021010))
#define GPIOE_IDR_HIGH ((volatile unsigned char *) (0x40021011))
#define GPIOE_ODR_HIGH ((volatile unsigned char *) (0x40021015))
#define GPIOE_ODR_LOW ((volatile unsigned char *) (0x40021014))
*/

#define GPIO_D (*((volatile GPIO*) 0x40020c00))
#define GPIO_E (*((volatile GPIO*) 0x40021000))

#define SYSCFG_EXTICR1 ((volatile unsigned int *) 0x40013808)

#define EXTI_PR ((volatile unsigned int *) 0x40013C14)

#define SCB_VTOR ((volatile unsigned long *)0xE000ED08)


#define EXTI3_IRQ_PE3 0x00000008
#define EXTI3_IRQ_PE2 0x00000004
#define EXTI3_IRQ_PE1 0x00000002
#define EXTI3_IRQ_PE0 0x00000001

//#define USBDM
#define SIMULATOR

unsigned int count;
unsigned int lit = 0;

void irq_handler(void)
{
	if( (*EXTI_PR & EXTI3_IRQ_PE3) != 0 )
	{
		
		*EXTI_PR |= EXTI3_IRQ_PE3;
		
		if( (GPIO_E.idrLow & EXTI3_IRQ_PE0) )
		{
		count++;
		*EXTI_PR |= EXTI3_IRQ_PE0;
		}
		
		if( (GPIO_E.idrLow & EXTI3_IRQ_PE1) )
		{
		count = 0;
		*EXTI_PR |= EXTI3_IRQ_PE1;
		}
		
		if( (GPIO_E.idrLow & EXTI3_IRQ_PE2) )
		{
			*EXTI_PR |= EXTI3_IRQ_PE2;
			if(lit)
			{
				GPIO_D.odrHigh = 0;
				lit = 0;
			}else{
				GPIO_D.odrHigh = 0xFF;
				lit = 1;
			}
		}
	}
}

void app_init(void)
{
	#ifdef USBDM
	*((unsigned long *) 0x40023830) = 0x18;
	*((unsigned long *) 0x40023844) |= 0x4000;
	*((unsigned long *) 0xE000ED08) = 0x2001C000;
	#endif
	
	GPIO_D.moder = 0x55555555;
	GPIO_E.moder =0x00000000;
	//IO pinne PE3 till EXTI3
	*((unsigned int *) SYSCFG_EXTICR1) &= ~0xF000;
	*((unsigned int *) SYSCFG_EXTICR1) |= 0x4000;
	
	//EXTI3 konfigureras till att generera avbrott
	*((unsigned int *) 0x40013C00) |= 8;
	*((unsigned int *) 0x40013C08) |= 8;
	*((unsigned int *) 0x40013C0C) &= ~8;
	
	*SCB_VTOR = 0x2001C000;
	*((void (**) (void)) 0x2001C064 ) = irq_handler;
	
	*((unsigned int *) 0xE000E100) |= (1<<9);
	
}

void main(void)
{
	app_init();
	while(1){
		GPIO_D.odrLow = count;
	}
}
