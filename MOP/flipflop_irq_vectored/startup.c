/*
 * 	startup.c flipflop_irq_vectored
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

#define EXTI_PR ((volatile unsigned int *) 0x40013C14)

#define SCB_VTOR ((volatile unsigned long *)0xE000ED08)


#define SYSCFG_BASE ((volatile unsigned int *) 0x40013800)
#define SYSCFG_EXTICR1 ((volatile unsigned int *) 0x40013808)
#define SYSCFG_IMR ((volatile unsigned int *) 0x40013C00)
#define SYSCFG_FTSR ((volatile unsigned int *) 0x40013C0C)
#define SYSCFG_RTSR ((volatile unsigned int *) 0x40013C08)
#define SYSCFG_PR ((volatile unsigned int *) 0x40013C14)
#define EXTI3_IRQVEC ((void (**) (void) ) 0x2001C064)
#define EXTI2_IRQVEC ((void (**) (void) ) 0x2001C060)
#define EXTI1_IRQVEC ((void (**) (void) ) 0x2001C05C)
#define EXTI0_IRQVEC  ((void (**) (void) ) 0x2001C058)
#define NVIC_ISER0 ((volatile unsigned int *) 0xE000E100)
#define NVIC_EXTI3_IRQ_BPOS (1<<9)      
#define NVIC_EXTI2_IRQ_BPOS (1<<8)
#define NVIC_EXTI1_IRQ_BPOS (1<<7)
#define NVIC_EXTI0_IRQ_BPOS (1<<6)

#define EXTI3_IRQ_BPOS 0x00000008
#define EXTI2_IRQ_BPOS 0x00000004
#define EXTI1_IRQ_BPOS 0x00000002
#define EXTI0_IRQ_BPOS 0x00000001

unsigned int count;
unsigned int lit = 0;

void irq_handler(void)
{
	if( (*EXTI_PR & EXTI3_IRQ_BPOS) != 0 )
	{
		//Glöm ej att reset avbrottet genom att skicka till e-portens utportar (de höga bitarna, se föreläsningen och boken)
		*EXTI_PR |= EXTI3_IRQ_PE3;
		
		if( (*GPIOE_IDR_LOW & EXTI3_IRQ_PE0) )
		{
		count++;
		*EXTI_PR |= EXTI3_IRQ_PE0;
		}
		
		if( (*GPIOE_IDR_LOW & EXTI3_IRQ_PE1) )
		{
		count = 0;
		*EXTI_PR |= EXTI3_IRQ_PE1;
		}
		
		if( (*GPIOE_IDR_LOW & EXTI3_IRQ_PE2) )
		{
			*EXTI_PR |= EXTI3_IRQ_PE2;
			if(lit)
			{
				*GPIO_ODR_HIGH = 0; //Här är fel, lampan skall blinka inte bara tändas/släckas?
				lit = 0;
			}else{
				*GPIO_ODR_HIGH = 0xFF;
				lit = 1;
			}
		}
	}
}

void app_init(void)
{
	*GPIO_MODER = 0x55555555;
	*GPIOE_MODER =0x00000000;
	//IO pinne PE3-0 till EXTI3-0
	*((unsigned int *) SYSCFG_EXTICR1) &= ~0xFFFF;
	*((unsigned int *) SYSCFG_EXTICR1) |= 0x4444;
	
	
	//EXTI3-0 konfigureras till att generera avbrott
	*((unsigned int *) 0x40013C00) |= 0xF;
	*((unsigned int *) 0x40013C08) |= 0xF;
	*((unsigned int *) 0x40013C0C) &= ~0xF;
	
	//Avbrottsvektor konfigureras
	*SCB_VTOR = 0x2001C000;
	*((void (**) (void)) 0x2001C064 ) = irq_handler; //ANDRA DESSA!!!
	*((void (**) (void)) 0x2001C064 ) = irq_handler;
	*((void (**) (void)) 0x2001C064 ) = irq_handler;
	*((void (**) (void)) 0x2001C064 ) = irq_handler;
	
	*((unsigned int *) 0xE000E100) |= (1<<9);
	
}

void main(void)
{
	app_init();
	while(1){
		*GPIO_ODR_LOW = count;
	}
}
