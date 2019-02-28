   1              		.arch armv6-m
   2              		.eabi_attribute 20, 1
   3              		.eabi_attribute 21, 1
   4              		.eabi_attribute 23, 3
   5              		.eabi_attribute 24, 1
   6              		.eabi_attribute 25, 1
   7              		.eabi_attribute 26, 1
   8              		.eabi_attribute 30, 6
   9              		.eabi_attribute 34, 0
  10              		.eabi_attribute 18, 4
  11              		.file	"startup.c"
  12              		.text
  13              	.Ltext0:
  14              		.cfi_sections	.debug_frame
  15              		.section	.start_section,"ax",%progbits
  16              		.align	1
  17              		.global	startup
  18              		.syntax unified
  19              		.code	16
  20              		.thumb_func
  21              		.fpu softvfp
  23              	startup:
  24              	.LFB0:
  25              		.file 1 "C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored/startup.c"
   1:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** /*
   2:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c ****  * 	startup.c flipflop_irq_vectored
   3:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c ****  *
   4:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c ****  */
   5:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c ****  //#include <GPIO.h>
   6:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   7:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 
   8:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** void startup ( void )
   9:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** {
  26              		.loc 1 9 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  10:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** __asm volatile(
  31              		.loc 1 10 0
  32              		.syntax divided
  33              	@ 10 "C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  11:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  12:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	" MOV SP,R0\n"
  13:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	" BL main\n"				/* call main */
  14:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	"_exit: B .\n"				/* never return */
  15:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	) ;
  16:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** }
  40              		.loc 1 16 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.comm	count,4,4
  48              		.global	lit
  49              		.bss
  50              		.align	2
  53              	lit:
  54 0000 00000000 		.space	4
  55              		.text
  56              		.align	1
  57              		.global	irq_handler_EXTI_2
  58              		.syntax unified
  59              		.code	16
  60              		.thumb_func
  61              		.fpu softvfp
  63              	irq_handler_EXTI_2:
  64              	.LFB1:
  17:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 
  18:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 
  19:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** #define GPIO_D 0x40020C00 
  20:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** #define GPIO_MODER ((volatile unsigned int *) (GPIO_D))
  21:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** #define GPIO_IDR_LOW ((volatile unsigned char *) (GPIO_D+0x10))  
  22:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** #define GPIO_IDR_HIGH ((volatile unsigned char *) (GPIO_D+0x11))  
  23:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** #define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_D+0x14))  
  24:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** #define GPIO_ODR_HIGH ((volatile unsigned char *) (GPIO_D+0x15))
  25:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 
  26:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** #define GPIO_E 0x40021000
  27:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** #define GPIOE_MODER ((volatile unsigned int *) (0x40021000))
  28:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** #define GPIOE_OTYPER ((volatile unsigned short *) (0x40021004))
  29:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** #define GPIOE_IDR_LOW ((volatile unsigned char *) (0x40021010))
  30:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** #define GPIOE_IDR_HIGH ((volatile unsigned char *) (0x40021011))
  31:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** #define GPIOE_ODR_HIGH ((volatile unsigned char *) (0x40021015))
  32:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** #define GPIOE_ODR_LOW ((volatile unsigned char *) (0x40021014))
  33:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c ****  
  34:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c ****  
  35:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c ****  
  36:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 
  37:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 
  38:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** #define EXTI_PR ((volatile unsigned int *) 0x40013C14)
  39:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 
  40:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** #define SCB_VTOR ((volatile unsigned long *)0xE000ED08)
  41:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 
  42:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 
  43:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** #define SYSCFG_BASE ((volatile unsigned int *) 0x40013800)
  44:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** #define SYSCFG_EXTICR1 ((volatile unsigned int *) 0x40013808)
  45:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** #define SYSCFG_IMR ((volatile unsigned int *) 0x40013C00)
  46:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** #define SYSCFG_FTSR ((volatile unsigned int *) 0x40013C0C)
  47:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** #define SYSCFG_RTSR ((volatile unsigned int *) 0x40013C08)
  48:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** #define SYSCFG_PR ((volatile unsigned int *) 0x40013C14)
  49:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** #define EXTI3_IRQVEC ((void (**) (void) ) 0x2001C064)
  50:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** #define EXTI2_IRQVEC ((void (**) (void) ) 0x2001C060)
  51:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** #define EXTI1_IRQVEC ((void (**) (void) ) 0x2001C05C)
  52:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** #define EXTI0_IRQVEC  ((void (**) (void) ) 0x2001C058)
  53:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** #define NVIC_ISER0 ((volatile unsigned int *) 0xE000E100)
  54:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** #define NVIC_EXTI3_IRQ_BPOS (1<<9)      
  55:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** #define NVIC_EXTI2_IRQ_BPOS (1<<8)
  56:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** #define NVIC_EXTI1_IRQ_BPOS (1<<7)
  57:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** #define NVIC_EXTI0_IRQ_BPOS (1<<6)
  58:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 
  59:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** #define EXTI3_IRQ_BPOS 0x00000008
  60:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** #define EXTI2_IRQ_BPOS 0x00000004
  61:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** #define EXTI1_IRQ_BPOS 0x00000002
  62:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** #define EXTI0_IRQ_BPOS 0x00000001
  63:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 
  64:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** unsigned int count;
  65:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** unsigned int lit = 0;
  66:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** /*
  67:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** void irq_handler(void)
  68:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** {
  69:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	if( (*EXTI_PR & EXTI3_IRQ_BPOS) != 0 )
  70:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	{
  71:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 		//Glöm ej att reset avbrottet genom att skicka till e-portens utportar (de höga bitarna, se fö
  72:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 		*EXTI_PR |= EXTI3_IRQ_PE3;
  73:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 		
  74:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 		if( (*GPIOE_IDR_LOW & EXTI3_IRQ_PE0) )
  75:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 		{
  76:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 		count++;
  77:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 		*EXTI_PR |= EXTI3_IRQ_PE0;
  78:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 		}
  79:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 		
  80:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 		if( (*GPIOE_IDR_LOW & EXTI3_IRQ_PE1) )
  81:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 		{
  82:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 		count = 0;
  83:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 		*EXTI_PR |= EXTI3_IRQ_PE1;
  84:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 		}
  85:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 		
  86:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 		if( (*GPIOE_IDR_LOW & EXTI3_IRQ_PE2) )
  87:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 		{
  88:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 			*EXTI_PR |= EXTI3_IRQ_PE2;
  89:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 			if(lit)
  90:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 			{
  91:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 				*GPIO_ODR_HIGH = 0; //Här är fel, lampan skall blinka inte bara tändas/släckas?
  92:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 				lit = 0;
  93:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 			}else{
  94:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 				*GPIO_ODR_HIGH = 0xFF;
  95:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 				lit = 1;
  96:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 			}
  97:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 		}
  98:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	}
  99:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** }
 100:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c ****  * */
 101:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 
 102:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** void irq_handler_EXTI_2(void)
 103:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** {
  65              		.loc 1 103 0
  66              		.cfi_startproc
  67              		@ args = 0, pretend = 0, frame = 0
  68              		@ frame_needed = 1, uses_anonymous_args = 0
  69 0000 80B5     		push	{r7, lr}
  70              		.cfi_def_cfa_offset 8
  71              		.cfi_offset 7, -8
  72              		.cfi_offset 14, -4
  73 0002 00AF     		add	r7, sp, #0
  74              		.cfi_def_cfa_register 7
 104:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	if( (*GPIOE_IDR_LOW & EXTI2_IRQ_BPOS) )
  75              		.loc 1 104 0
  76 0004 184B     		ldr	r3, .L6
  77 0006 1B78     		ldrb	r3, [r3]
  78 0008 DBB2     		uxtb	r3, r3
  79 000a 1A00     		movs	r2, r3
  80 000c 0423     		movs	r3, #4
  81 000e 1340     		ands	r3, r2
  82 0010 16D0     		beq	.L3
 105:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	{
 106:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	if(lit)
  83              		.loc 1 106 0
  84 0012 164B     		ldr	r3, .L6+4
  85 0014 1B68     		ldr	r3, [r3]
  86 0016 002B     		cmp	r3, #0
  87 0018 06D0     		beq	.L4
 107:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	{
 108:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 		*GPIO_ODR_HIGH = 0; //Här är fel, lampan skall blinka inte bara tändas/släckas?
  88              		.loc 1 108 0
  89 001a 154B     		ldr	r3, .L6+8
  90 001c 0022     		movs	r2, #0
  91 001e 1A70     		strb	r2, [r3]
 109:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 		lit = 0;
  92              		.loc 1 109 0
  93 0020 124B     		ldr	r3, .L6+4
  94 0022 0022     		movs	r2, #0
  95 0024 1A60     		str	r2, [r3]
  96 0026 05E0     		b	.L5
  97              	.L4:
 110:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	}else{
 111:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 		*GPIO_ODR_HIGH = 0xFF;
  98              		.loc 1 111 0
  99 0028 114B     		ldr	r3, .L6+8
 100 002a FF22     		movs	r2, #255
 101 002c 1A70     		strb	r2, [r3]
 112:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 		lit = 1;
 102              		.loc 1 112 0
 103 002e 0F4B     		ldr	r3, .L6+4
 104 0030 0122     		movs	r2, #1
 105 0032 1A60     		str	r2, [r3]
 106              	.L5:
 113:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	}
 114:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	*EXTI_PR |= EXTI2_IRQ_BPOS;
 107              		.loc 1 114 0
 108 0034 0F4B     		ldr	r3, .L6+12
 109 0036 1A68     		ldr	r2, [r3]
 110 0038 0E4B     		ldr	r3, .L6+12
 111 003a 0421     		movs	r1, #4
 112 003c 0A43     		orrs	r2, r1
 113 003e 1A60     		str	r2, [r3]
 114              	.L3:
 115:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	}
 116:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	*GPIOE_ODR_LOW |= 0x40;
 115              		.loc 1 116 0
 116 0040 0D4B     		ldr	r3, .L6+16
 117 0042 1B78     		ldrb	r3, [r3]
 118 0044 DBB2     		uxtb	r3, r3
 119 0046 0C4A     		ldr	r2, .L6+16
 120 0048 4021     		movs	r1, #64
 121 004a 0B43     		orrs	r3, r1
 122 004c DBB2     		uxtb	r3, r3
 123 004e 1370     		strb	r3, [r2]
 117:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	*GPIOE_ODR_LOW &= ~0x40;
 124              		.loc 1 117 0
 125 0050 094B     		ldr	r3, .L6+16
 126 0052 1B78     		ldrb	r3, [r3]
 127 0054 DBB2     		uxtb	r3, r3
 128 0056 084A     		ldr	r2, .L6+16
 129 0058 4021     		movs	r1, #64
 130 005a 8B43     		bics	r3, r1
 131 005c DBB2     		uxtb	r3, r3
 132 005e 1370     		strb	r3, [r2]
 118:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** }
 133              		.loc 1 118 0
 134 0060 C046     		nop
 135 0062 BD46     		mov	sp, r7
 136              		@ sp needed
 137 0064 80BD     		pop	{r7, pc}
 138              	.L7:
 139 0066 C046     		.align	2
 140              	.L6:
 141 0068 10100240 		.word	1073877008
 142 006c 00000000 		.word	lit
 143 0070 150C0240 		.word	1073875989
 144 0074 143C0140 		.word	1073822740
 145 0078 14100240 		.word	1073877012
 146              		.cfi_endproc
 147              	.LFE1:
 149              		.align	1
 150              		.global	irq_handler_EXTI_1
 151              		.syntax unified
 152              		.code	16
 153              		.thumb_func
 154              		.fpu softvfp
 156              	irq_handler_EXTI_1:
 157              	.LFB2:
 119:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 
 120:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** void irq_handler_EXTI_1(void)
 121:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** {
 158              		.loc 1 121 0
 159              		.cfi_startproc
 160              		@ args = 0, pretend = 0, frame = 0
 161              		@ frame_needed = 1, uses_anonymous_args = 0
 162 007c 80B5     		push	{r7, lr}
 163              		.cfi_def_cfa_offset 8
 164              		.cfi_offset 7, -8
 165              		.cfi_offset 14, -4
 166 007e 00AF     		add	r7, sp, #0
 167              		.cfi_def_cfa_register 7
 122:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	if( (*GPIOE_IDR_LOW & EXTI1_IRQ_BPOS) ){
 168              		.loc 1 122 0
 169 0080 114B     		ldr	r3, .L10
 170 0082 1B78     		ldrb	r3, [r3]
 171 0084 DBB2     		uxtb	r3, r3
 172 0086 1A00     		movs	r2, r3
 173 0088 0223     		movs	r3, #2
 174 008a 1340     		ands	r3, r2
 175 008c 08D0     		beq	.L9
 123:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	count = 0;
 176              		.loc 1 123 0
 177 008e 0F4B     		ldr	r3, .L10+4
 178 0090 0022     		movs	r2, #0
 179 0092 1A60     		str	r2, [r3]
 124:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	*EXTI_PR |= EXTI1_IRQ_BPOS;
 180              		.loc 1 124 0
 181 0094 0E4B     		ldr	r3, .L10+8
 182 0096 1A68     		ldr	r2, [r3]
 183 0098 0D4B     		ldr	r3, .L10+8
 184 009a 0221     		movs	r1, #2
 185 009c 0A43     		orrs	r2, r1
 186 009e 1A60     		str	r2, [r3]
 187              	.L9:
 125:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	}
 126:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	*GPIOE_ODR_LOW |= 0x20;
 188              		.loc 1 126 0
 189 00a0 0C4B     		ldr	r3, .L10+12
 190 00a2 1B78     		ldrb	r3, [r3]
 191 00a4 DBB2     		uxtb	r3, r3
 192 00a6 0B4A     		ldr	r2, .L10+12
 193 00a8 2021     		movs	r1, #32
 194 00aa 0B43     		orrs	r3, r1
 195 00ac DBB2     		uxtb	r3, r3
 196 00ae 1370     		strb	r3, [r2]
 127:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	*GPIOE_ODR_LOW &= ~0x20;
 197              		.loc 1 127 0
 198 00b0 084B     		ldr	r3, .L10+12
 199 00b2 1B78     		ldrb	r3, [r3]
 200 00b4 DBB2     		uxtb	r3, r3
 201 00b6 074A     		ldr	r2, .L10+12
 202 00b8 2021     		movs	r1, #32
 203 00ba 8B43     		bics	r3, r1
 204 00bc DBB2     		uxtb	r3, r3
 205 00be 1370     		strb	r3, [r2]
 128:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** }
 206              		.loc 1 128 0
 207 00c0 C046     		nop
 208 00c2 BD46     		mov	sp, r7
 209              		@ sp needed
 210 00c4 80BD     		pop	{r7, pc}
 211              	.L11:
 212 00c6 C046     		.align	2
 213              	.L10:
 214 00c8 10100240 		.word	1073877008
 215 00cc 00000000 		.word	count
 216 00d0 143C0140 		.word	1073822740
 217 00d4 14100240 		.word	1073877012
 218              		.cfi_endproc
 219              	.LFE2:
 221              		.align	1
 222              		.global	irq_handler_EXTI_0
 223              		.syntax unified
 224              		.code	16
 225              		.thumb_func
 226              		.fpu softvfp
 228              	irq_handler_EXTI_0:
 229              	.LFB3:
 129:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 
 130:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** void irq_handler_EXTI_0(void)
 131:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** {
 230              		.loc 1 131 0
 231              		.cfi_startproc
 232              		@ args = 0, pretend = 0, frame = 0
 233              		@ frame_needed = 1, uses_anonymous_args = 0
 234 00d8 80B5     		push	{r7, lr}
 235              		.cfi_def_cfa_offset 8
 236              		.cfi_offset 7, -8
 237              		.cfi_offset 14, -4
 238 00da 00AF     		add	r7, sp, #0
 239              		.cfi_def_cfa_register 7
 132:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	if( (*GPIOE_IDR_LOW & EXTI0_IRQ_BPOS) ){
 240              		.loc 1 132 0
 241 00dc 124B     		ldr	r3, .L14
 242 00de 1B78     		ldrb	r3, [r3]
 243 00e0 DBB2     		uxtb	r3, r3
 244 00e2 1A00     		movs	r2, r3
 245 00e4 0123     		movs	r3, #1
 246 00e6 1340     		ands	r3, r2
 247 00e8 0AD0     		beq	.L13
 133:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	count++;
 248              		.loc 1 133 0
 249 00ea 104B     		ldr	r3, .L14+4
 250 00ec 1B68     		ldr	r3, [r3]
 251 00ee 5A1C     		adds	r2, r3, #1
 252 00f0 0E4B     		ldr	r3, .L14+4
 253 00f2 1A60     		str	r2, [r3]
 134:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	*EXTI_PR |= EXTI0_IRQ_BPOS;
 254              		.loc 1 134 0
 255 00f4 0E4B     		ldr	r3, .L14+8
 256 00f6 1A68     		ldr	r2, [r3]
 257 00f8 0D4B     		ldr	r3, .L14+8
 258 00fa 0121     		movs	r1, #1
 259 00fc 0A43     		orrs	r2, r1
 260 00fe 1A60     		str	r2, [r3]
 261              	.L13:
 135:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	}
 136:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	*GPIOE_ODR_LOW |= 0x10;
 262              		.loc 1 136 0
 263 0100 0C4B     		ldr	r3, .L14+12
 264 0102 1B78     		ldrb	r3, [r3]
 265 0104 DBB2     		uxtb	r3, r3
 266 0106 0B4A     		ldr	r2, .L14+12
 267 0108 1021     		movs	r1, #16
 268 010a 0B43     		orrs	r3, r1
 269 010c DBB2     		uxtb	r3, r3
 270 010e 1370     		strb	r3, [r2]
 137:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	*GPIOE_ODR_LOW &= ~0x10;
 271              		.loc 1 137 0
 272 0110 084B     		ldr	r3, .L14+12
 273 0112 1B78     		ldrb	r3, [r3]
 274 0114 DBB2     		uxtb	r3, r3
 275 0116 074A     		ldr	r2, .L14+12
 276 0118 1021     		movs	r1, #16
 277 011a 8B43     		bics	r3, r1
 278 011c DBB2     		uxtb	r3, r3
 279 011e 1370     		strb	r3, [r2]
 138:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** }
 280              		.loc 1 138 0
 281 0120 C046     		nop
 282 0122 BD46     		mov	sp, r7
 283              		@ sp needed
 284 0124 80BD     		pop	{r7, pc}
 285              	.L15:
 286 0126 C046     		.align	2
 287              	.L14:
 288 0128 10100240 		.word	1073877008
 289 012c 00000000 		.word	count
 290 0130 143C0140 		.word	1073822740
 291 0134 14100240 		.word	1073877012
 292              		.cfi_endproc
 293              	.LFE3:
 295              		.align	1
 296              		.global	app_init
 297              		.syntax unified
 298              		.code	16
 299              		.thumb_func
 300              		.fpu softvfp
 302              	app_init:
 303              	.LFB4:
 139:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 
 140:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** void app_init(void)
 141:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** {
 304              		.loc 1 141 0
 305              		.cfi_startproc
 306              		@ args = 0, pretend = 0, frame = 0
 307              		@ frame_needed = 1, uses_anonymous_args = 0
 308 0138 80B5     		push	{r7, lr}
 309              		.cfi_def_cfa_offset 8
 310              		.cfi_offset 7, -8
 311              		.cfi_offset 14, -4
 312 013a 00AF     		add	r7, sp, #0
 313              		.cfi_def_cfa_register 7
 142:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	*GPIO_MODER = 0x55555555;
 314              		.loc 1 142 0
 315 013c 234B     		ldr	r3, .L17
 316 013e 244A     		ldr	r2, .L17+4
 317 0140 1A60     		str	r2, [r3]
 143:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	*GPIOE_MODER =0x00001500;
 318              		.loc 1 143 0
 319 0142 244B     		ldr	r3, .L17+8
 320 0144 A822     		movs	r2, #168
 321 0146 5201     		lsls	r2, r2, #5
 322 0148 1A60     		str	r2, [r3]
 144:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	//IO pinne PE3-0 till EXTI3-0
 145:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	*((unsigned int *) SYSCFG_EXTICR1) &= ~0x0FFF;
 323              		.loc 1 145 0
 324 014a 234B     		ldr	r3, .L17+12
 325 014c 1A68     		ldr	r2, [r3]
 326 014e 224B     		ldr	r3, .L17+12
 327 0150 120B     		lsrs	r2, r2, #12
 328 0152 1203     		lsls	r2, r2, #12
 329 0154 1A60     		str	r2, [r3]
 146:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	*((unsigned int *) SYSCFG_EXTICR1) |= 0x0444;
 330              		.loc 1 146 0
 331 0156 204B     		ldr	r3, .L17+12
 332 0158 1A68     		ldr	r2, [r3]
 333 015a 1F4B     		ldr	r3, .L17+12
 334 015c 1F49     		ldr	r1, .L17+16
 335 015e 0A43     		orrs	r2, r1
 336 0160 1A60     		str	r2, [r3]
 147:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	
 148:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	
 149:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	//EXTI3-0 konfigureras till att generera avbrott
 150:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	*((unsigned int *) 0x40013C00) |= 0x7;
 337              		.loc 1 150 0
 338 0162 1F4B     		ldr	r3, .L17+20
 339 0164 1A68     		ldr	r2, [r3]
 340 0166 1E4B     		ldr	r3, .L17+20
 341 0168 0721     		movs	r1, #7
 342 016a 0A43     		orrs	r2, r1
 343 016c 1A60     		str	r2, [r3]
 151:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	*((unsigned int *) 0x40013C08) |= 0x7;
 344              		.loc 1 151 0
 345 016e 1D4B     		ldr	r3, .L17+24
 346 0170 1A68     		ldr	r2, [r3]
 347 0172 1C4B     		ldr	r3, .L17+24
 348 0174 0721     		movs	r1, #7
 349 0176 0A43     		orrs	r2, r1
 350 0178 1A60     		str	r2, [r3]
 152:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	*((unsigned int *) 0x40013C0C) &= ~0x7;
 351              		.loc 1 152 0
 352 017a 1B4B     		ldr	r3, .L17+28
 353 017c 1A68     		ldr	r2, [r3]
 354 017e 1A4B     		ldr	r3, .L17+28
 355 0180 0721     		movs	r1, #7
 356 0182 8A43     		bics	r2, r1
 357 0184 1A60     		str	r2, [r3]
 153:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	
 154:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	//Avbrottsvektor konfigureras
 155:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	*SCB_VTOR = 0x2001C000;
 358              		.loc 1 155 0
 359 0186 194B     		ldr	r3, .L17+32
 360 0188 194A     		ldr	r2, .L17+36
 361 018a 1A60     		str	r2, [r3]
 156:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	//*((void (**) (void)) 0x2001C064 ) = irq_handler_EXTI3; //Behövs denna?!!!
 157:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	*((void (**) (void)) 0x2001C060 ) = irq_handler_EXTI_2;
 362              		.loc 1 157 0
 363 018c 194B     		ldr	r3, .L17+40
 364 018e 1A4A     		ldr	r2, .L17+44
 365 0190 1A60     		str	r2, [r3]
 158:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	*((void (**) (void)) 0x2001C05C ) = irq_handler_EXTI_1;
 366              		.loc 1 158 0
 367 0192 1A4B     		ldr	r3, .L17+48
 368 0194 1A4A     		ldr	r2, .L17+52
 369 0196 1A60     		str	r2, [r3]
 159:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	*((void (**) (void)) 0x2001C058 ) = irq_handler_EXTI_0;
 370              		.loc 1 159 0
 371 0198 1A4B     		ldr	r3, .L17+56
 372 019a 1B4A     		ldr	r2, .L17+60
 373 019c 1A60     		str	r2, [r3]
 160:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	
 161:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	//AKtivera NVIC för EXTI
 162:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	//*((unsigned int *) 0xE000E100) |= (1<<9);
 163:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	*((unsigned int *) 0xE000E100) |= (1<<8);
 374              		.loc 1 163 0
 375 019e 1B4B     		ldr	r3, .L17+64
 376 01a0 1A68     		ldr	r2, [r3]
 377 01a2 1A4B     		ldr	r3, .L17+64
 378 01a4 8021     		movs	r1, #128
 379 01a6 4900     		lsls	r1, r1, #1
 380 01a8 0A43     		orrs	r2, r1
 381 01aa 1A60     		str	r2, [r3]
 164:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	*((unsigned int *) 0xE000E100) |= (1<<7);
 382              		.loc 1 164 0
 383 01ac 174B     		ldr	r3, .L17+64
 384 01ae 1A68     		ldr	r2, [r3]
 385 01b0 164B     		ldr	r3, .L17+64
 386 01b2 8021     		movs	r1, #128
 387 01b4 0A43     		orrs	r2, r1
 388 01b6 1A60     		str	r2, [r3]
 165:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	*((unsigned int *) 0xE000E100) |= (1<<6);
 389              		.loc 1 165 0
 390 01b8 144B     		ldr	r3, .L17+64
 391 01ba 1A68     		ldr	r2, [r3]
 392 01bc 134B     		ldr	r3, .L17+64
 393 01be 4021     		movs	r1, #64
 394 01c0 0A43     		orrs	r2, r1
 395 01c2 1A60     		str	r2, [r3]
 166:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** }
 396              		.loc 1 166 0
 397 01c4 C046     		nop
 398 01c6 BD46     		mov	sp, r7
 399              		@ sp needed
 400 01c8 80BD     		pop	{r7, pc}
 401              	.L18:
 402 01ca C046     		.align	2
 403              	.L17:
 404 01cc 000C0240 		.word	1073875968
 405 01d0 55555555 		.word	1431655765
 406 01d4 00100240 		.word	1073876992
 407 01d8 08380140 		.word	1073821704
 408 01dc 44040000 		.word	1092
 409 01e0 003C0140 		.word	1073822720
 410 01e4 083C0140 		.word	1073822728
 411 01e8 0C3C0140 		.word	1073822732
 412 01ec 08ED00E0 		.word	-536810232
 413 01f0 00C00120 		.word	536985600
 414 01f4 60C00120 		.word	536985696
 415 01f8 00000000 		.word	irq_handler_EXTI_2
 416 01fc 5CC00120 		.word	536985692
 417 0200 00000000 		.word	irq_handler_EXTI_1
 418 0204 58C00120 		.word	536985688
 419 0208 00000000 		.word	irq_handler_EXTI_0
 420 020c 00E100E0 		.word	-536813312
 421              		.cfi_endproc
 422              	.LFE4:
 424              		.align	1
 425              		.global	main
 426              		.syntax unified
 427              		.code	16
 428              		.thumb_func
 429              		.fpu softvfp
 431              	main:
 432              	.LFB5:
 167:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 
 168:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** void main(void)
 169:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** {
 433              		.loc 1 169 0
 434              		.cfi_startproc
 435              		@ args = 0, pretend = 0, frame = 0
 436              		@ frame_needed = 1, uses_anonymous_args = 0
 437 0210 80B5     		push	{r7, lr}
 438              		.cfi_def_cfa_offset 8
 439              		.cfi_offset 7, -8
 440              		.cfi_offset 14, -4
 441 0212 00AF     		add	r7, sp, #0
 442              		.cfi_def_cfa_register 7
 170:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	app_init();
 443              		.loc 1 170 0
 444 0214 FFF7FEFF 		bl	app_init
 445              	.L20:
 171:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 	while(1){
 172:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq_vectored\startup.c **** 		*GPIO_ODR_LOW = count;
 446              		.loc 1 172 0 discriminator 1
 447 0218 024B     		ldr	r3, .L21
 448 021a 1A68     		ldr	r2, [r3]
 449 021c 024B     		ldr	r3, .L21+4
 450 021e D2B2     		uxtb	r2, r2
 451 0220 1A70     		strb	r2, [r3]
 452 0222 F9E7     		b	.L20
 453              	.L22:
 454              		.align	2
 455              	.L21:
 456 0224 00000000 		.word	count
 457 0228 140C0240 		.word	1073875988
 458              		.cfi_endproc
 459              	.LFE5:
 461              	.Letext0:
