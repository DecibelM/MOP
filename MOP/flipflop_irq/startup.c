/*
 * 	startup.c flipflop_irq
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
#define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_D+0x14)) 

#define SYSCFG_EXTICR1 ((volatile unsigned int *) 0x40013808)

#define EXTI_PR ((volatile unsigned int *) 0x40013C14)

#define SCB_VTOR ((volatile unsigned long *)0xE000ED08)

#define USBDM


#define EXTI3_IRQ_BPOS 0x00000008

unsigned int count;

void irq_handler(void)
{
	if( (*EXTI_PR & EXTI3_IRQ_BPOS) != 0 )
	{
		count++;
		*EXTI_PR |= EXTI3_IRQ_BPOS;
	}
}

void app_init(void)
{
	#ifdef USBDM
	*((unsigned long *) 0x40023830) = 0x18;
	*((unsigned long *) 0x40023844) |= 0x4000;
	*((unsigned long *) 0xE000ED08) = 0x2001C000;
	#endif
	
	*GPIO_MODER = 0x55555555;
	//IO pinne PE3 till EXTI3
	*((unsigned int *) SYSCFG_EXTICR1) &= ~0xF000;
	*((unsigned int *) SYSCFG_EXTICR1) |= 0x4000;
	
	//EXTI3 konfigureras till att generera avbrott
	*((unsigned int *) 0x40013C00) |= 8;
	*((unsigned int *) 0x40013C0C) |= 8;
	*((unsigned int *) 0x40013C08) &= ~8;
	
	*SCB_VTOR = 0x2001C000;
	*((void (**) (void)) 0x2001C064 ) = irq_handler;
	
	*((unsigned int *) 0xE000E100) |= (1<<9);
	
}

void main(void)
{
	app_init();
	count = 0;
	while(1){
		if(count < 5){
		count++;
		}
		*GPIO_ODR_LOW = count;
	}
}
