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
  25              		.file 1 "C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack/startup.c"
   1:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** /*
   2:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c ****  * 	startup.c flipflop_irq_ack
   3:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c ****  *
   4:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c ****  */
   5:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c ****  #include "gpio_2.h"
   6:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 
   7:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   8:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 
   9:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** void startup ( void )
  10:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** {
  26              		.loc 1 10 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  11:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** __asm volatile(
  31              		.loc 1 11 0
  32              		.syntax divided
  33              	@ 11 "C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  12:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  13:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 	" MOV SP,R0\n"
  14:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 	" BL main\n"				/* call main */
  15:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 	"_exit: B .\n"				/* never return */
  16:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 	) ;
  17:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** }
  40              		.loc 1 17 0
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
  57              		.global	irq_handler
  58              		.syntax unified
  59              		.code	16
  60              		.thumb_func
  61              		.fpu softvfp
  63              	irq_handler:
  64              	.LFB1:
  18:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 
  19:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** /*
  20:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** #define GPIO_D 0x40020C00 
  21:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** #define GPIO_MODER ((volatile unsigned int *) (GPIO_D))
  22:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** #define GPIO_IDR_LOW ((volatile unsigned char *) (GPIO_D+0x10))  
  23:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** #define GPIO_IDR_HIGH ((volatile unsigned char *) (GPIO_D+0x11))  
  24:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** #define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_D+0x14))  
  25:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** #define GPIO_ODR_HIGH ((volatile unsigned char *) (GPIO_D+0x15))
  26:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 
  27:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** #define GPIO_E 0x40021000
  28:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** #define GPIOE_MODER ((volatile unsigned int *) (0x40021000))
  29:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** #define GPIOE_OTYPER ((volatile unsigned short *) (0x40021004))
  30:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** #define GPIOE_IDR_LOW ((volatile unsigned char *) (0x40021010))
  31:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** #define GPIOE_IDR_HIGH ((volatile unsigned char *) (0x40021011))
  32:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** #define GPIOE_ODR_HIGH ((volatile unsigned char *) (0x40021015))
  33:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** #define GPIOE_ODR_LOW ((volatile unsigned char *) (0x40021014))
  34:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** */
  35:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 
  36:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** #define GPIO_D (*((volatile GPIO*) 0x40020c00))
  37:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** #define GPIO_E (*((volatile GPIO*) 0x40021000))
  38:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 
  39:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** #define SYSCFG_EXTICR1 ((volatile unsigned int *) 0x40013808)
  40:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 
  41:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** #define EXTI_PR ((volatile unsigned int *) 0x40013C14)
  42:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 
  43:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** #define SCB_VTOR ((volatile unsigned long *)0xE000ED08)
  44:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 
  45:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 
  46:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** #define EXTI3_IRQ_PE3 0x00000008
  47:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** #define EXTI3_IRQ_PE2 0x00000004
  48:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** #define EXTI3_IRQ_PE1 0x00000002
  49:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** #define EXTI3_IRQ_PE0 0x00000001
  50:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 
  51:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** //#define USBDM
  52:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** #define SIMULATOR
  53:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 
  54:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** unsigned int count;
  55:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** unsigned int lit = 0;
  56:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 
  57:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** void irq_handler(void)
  58:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** {
  65              		.loc 1 58 0
  66              		.cfi_startproc
  67              		@ args = 0, pretend = 0, frame = 0
  68              		@ frame_needed = 1, uses_anonymous_args = 0
  69 0000 80B5     		push	{r7, lr}
  70              		.cfi_def_cfa_offset 8
  71              		.cfi_offset 7, -8
  72              		.cfi_offset 14, -4
  73 0002 00AF     		add	r7, sp, #0
  74              		.cfi_def_cfa_register 7
  59:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 	if( (*EXTI_PR & EXTI3_IRQ_PE3) != 0 )
  75              		.loc 1 59 0
  76 0004 264B     		ldr	r3, .L8
  77 0006 1B68     		ldr	r3, [r3]
  78 0008 0822     		movs	r2, #8
  79 000a 1340     		ands	r3, r2
  80 000c 45D0     		beq	.L7
  60:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 	{
  61:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 		
  62:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 		*EXTI_PR |= EXTI3_IRQ_PE3;
  81              		.loc 1 62 0
  82 000e 244B     		ldr	r3, .L8
  83 0010 1A68     		ldr	r2, [r3]
  84 0012 234B     		ldr	r3, .L8
  85 0014 0821     		movs	r1, #8
  86 0016 0A43     		orrs	r2, r1
  87 0018 1A60     		str	r2, [r3]
  63:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 		
  64:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 		if( (GPIO_E.idrLow & EXTI3_IRQ_PE0) )
  88              		.loc 1 64 0
  89 001a 224B     		ldr	r3, .L8+4
  90 001c 1B7C     		ldrb	r3, [r3, #16]
  91 001e DBB2     		uxtb	r3, r3
  92 0020 1A00     		movs	r2, r3
  93 0022 0123     		movs	r3, #1
  94 0024 1340     		ands	r3, r2
  95 0026 0AD0     		beq	.L4
  65:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 		{
  66:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 		count++;
  96              		.loc 1 66 0
  97 0028 1F4B     		ldr	r3, .L8+8
  98 002a 1B68     		ldr	r3, [r3]
  99 002c 5A1C     		adds	r2, r3, #1
 100 002e 1E4B     		ldr	r3, .L8+8
 101 0030 1A60     		str	r2, [r3]
  67:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 		*EXTI_PR |= EXTI3_IRQ_PE0;
 102              		.loc 1 67 0
 103 0032 1B4B     		ldr	r3, .L8
 104 0034 1A68     		ldr	r2, [r3]
 105 0036 1A4B     		ldr	r3, .L8
 106 0038 0121     		movs	r1, #1
 107 003a 0A43     		orrs	r2, r1
 108 003c 1A60     		str	r2, [r3]
 109              	.L4:
  68:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 		}
  69:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 		
  70:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 		if( (GPIO_E.idrLow & EXTI3_IRQ_PE1) )
 110              		.loc 1 70 0
 111 003e 194B     		ldr	r3, .L8+4
 112 0040 1B7C     		ldrb	r3, [r3, #16]
 113 0042 DBB2     		uxtb	r3, r3
 114 0044 1A00     		movs	r2, r3
 115 0046 0223     		movs	r3, #2
 116 0048 1340     		ands	r3, r2
 117 004a 08D0     		beq	.L5
  71:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 		{
  72:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 		count = 0;
 118              		.loc 1 72 0
 119 004c 164B     		ldr	r3, .L8+8
 120 004e 0022     		movs	r2, #0
 121 0050 1A60     		str	r2, [r3]
  73:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 		*EXTI_PR |= EXTI3_IRQ_PE1;
 122              		.loc 1 73 0
 123 0052 134B     		ldr	r3, .L8
 124 0054 1A68     		ldr	r2, [r3]
 125 0056 124B     		ldr	r3, .L8
 126 0058 0221     		movs	r1, #2
 127 005a 0A43     		orrs	r2, r1
 128 005c 1A60     		str	r2, [r3]
 129              	.L5:
  74:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 		}
  75:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 		
  76:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 		if( (GPIO_E.idrLow & EXTI3_IRQ_PE2) )
 130              		.loc 1 76 0
 131 005e 114B     		ldr	r3, .L8+4
 132 0060 1B7C     		ldrb	r3, [r3, #16]
 133 0062 DBB2     		uxtb	r3, r3
 134 0064 1A00     		movs	r2, r3
 135 0066 0423     		movs	r3, #4
 136 0068 1340     		ands	r3, r2
 137 006a 16D0     		beq	.L7
  77:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 		{
  78:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 			*EXTI_PR |= EXTI3_IRQ_PE2;
 138              		.loc 1 78 0
 139 006c 0C4B     		ldr	r3, .L8
 140 006e 1A68     		ldr	r2, [r3]
 141 0070 0B4B     		ldr	r3, .L8
 142 0072 0421     		movs	r1, #4
 143 0074 0A43     		orrs	r2, r1
 144 0076 1A60     		str	r2, [r3]
  79:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 			if(lit)
 145              		.loc 1 79 0
 146 0078 0C4B     		ldr	r3, .L8+12
 147 007a 1B68     		ldr	r3, [r3]
 148 007c 002B     		cmp	r3, #0
 149 007e 06D0     		beq	.L6
  80:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 			{
  81:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 				GPIO_D.odrHigh = 0;
 150              		.loc 1 81 0
 151 0080 0B4B     		ldr	r3, .L8+16
 152 0082 0022     		movs	r2, #0
 153 0084 5A75     		strb	r2, [r3, #21]
  82:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 				lit = 0;
 154              		.loc 1 82 0
 155 0086 094B     		ldr	r3, .L8+12
 156 0088 0022     		movs	r2, #0
 157 008a 1A60     		str	r2, [r3]
  83:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 			}else{
  84:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 				GPIO_D.odrHigh = 0xFF;
  85:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 				lit = 1;
  86:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 			}
  87:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 		}
  88:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 	}
  89:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** }
 158              		.loc 1 89 0
 159 008c 05E0     		b	.L7
 160              	.L6:
  84:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 				lit = 1;
 161              		.loc 1 84 0
 162 008e 084B     		ldr	r3, .L8+16
 163 0090 FF22     		movs	r2, #255
 164 0092 5A75     		strb	r2, [r3, #21]
  85:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 			}
 165              		.loc 1 85 0
 166 0094 054B     		ldr	r3, .L8+12
 167 0096 0122     		movs	r2, #1
 168 0098 1A60     		str	r2, [r3]
 169              	.L7:
 170              		.loc 1 89 0
 171 009a C046     		nop
 172 009c BD46     		mov	sp, r7
 173              		@ sp needed
 174 009e 80BD     		pop	{r7, pc}
 175              	.L9:
 176              		.align	2
 177              	.L8:
 178 00a0 143C0140 		.word	1073822740
 179 00a4 00100240 		.word	1073876992
 180 00a8 00000000 		.word	count
 181 00ac 00000000 		.word	lit
 182 00b0 000C0240 		.word	1073875968
 183              		.cfi_endproc
 184              	.LFE1:
 186              		.align	1
 187              		.global	app_init
 188              		.syntax unified
 189              		.code	16
 190              		.thumb_func
 191              		.fpu softvfp
 193              	app_init:
 194              	.LFB2:
  90:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 
  91:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** void app_init(void)
  92:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** {
 195              		.loc 1 92 0
 196              		.cfi_startproc
 197              		@ args = 0, pretend = 0, frame = 0
 198              		@ frame_needed = 1, uses_anonymous_args = 0
 199 00b4 80B5     		push	{r7, lr}
 200              		.cfi_def_cfa_offset 8
 201              		.cfi_offset 7, -8
 202              		.cfi_offset 14, -4
 203 00b6 00AF     		add	r7, sp, #0
 204              		.cfi_def_cfa_register 7
  93:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 	#ifdef USBDM
  94:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 	*((unsigned long *) 0x40023830) = 0x18;
  95:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 	*((unsigned long *) 0x40023844) |= 0x4000;
  96:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 	*((unsigned long *) 0xE000ED08) = 0x2001C000;
  97:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 	#endif
  98:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 	
  99:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 	GPIO_D.moder = 0x55555555;
 205              		.loc 1 99 0
 206 00b8 1A4B     		ldr	r3, .L11
 207 00ba 1B4A     		ldr	r2, .L11+4
 208 00bc 1A60     		str	r2, [r3]
 100:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 	GPIO_E.moder =0x00000000;
 209              		.loc 1 100 0
 210 00be 1B4B     		ldr	r3, .L11+8
 211 00c0 0022     		movs	r2, #0
 212 00c2 1A60     		str	r2, [r3]
 101:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 	//IO pinne PE3 till EXTI3
 102:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 	*((unsigned int *) SYSCFG_EXTICR1) &= ~0xF000;
 213              		.loc 1 102 0
 214 00c4 1A4B     		ldr	r3, .L11+12
 215 00c6 1A68     		ldr	r2, [r3]
 216 00c8 194B     		ldr	r3, .L11+12
 217 00ca 1A49     		ldr	r1, .L11+16
 218 00cc 0A40     		ands	r2, r1
 219 00ce 1A60     		str	r2, [r3]
 103:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 	*((unsigned int *) SYSCFG_EXTICR1) |= 0x4000;
 220              		.loc 1 103 0
 221 00d0 174B     		ldr	r3, .L11+12
 222 00d2 1A68     		ldr	r2, [r3]
 223 00d4 164B     		ldr	r3, .L11+12
 224 00d6 8021     		movs	r1, #128
 225 00d8 C901     		lsls	r1, r1, #7
 226 00da 0A43     		orrs	r2, r1
 227 00dc 1A60     		str	r2, [r3]
 104:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 	
 105:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 	//EXTI3 konfigureras till att generera avbrott
 106:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 	*((unsigned int *) 0x40013C00) |= 8;
 228              		.loc 1 106 0
 229 00de 164B     		ldr	r3, .L11+20
 230 00e0 1A68     		ldr	r2, [r3]
 231 00e2 154B     		ldr	r3, .L11+20
 232 00e4 0821     		movs	r1, #8
 233 00e6 0A43     		orrs	r2, r1
 234 00e8 1A60     		str	r2, [r3]
 107:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 	*((unsigned int *) 0x40013C08) |= 8;
 235              		.loc 1 107 0
 236 00ea 144B     		ldr	r3, .L11+24
 237 00ec 1A68     		ldr	r2, [r3]
 238 00ee 134B     		ldr	r3, .L11+24
 239 00f0 0821     		movs	r1, #8
 240 00f2 0A43     		orrs	r2, r1
 241 00f4 1A60     		str	r2, [r3]
 108:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 	*((unsigned int *) 0x40013C0C) &= ~8;
 242              		.loc 1 108 0
 243 00f6 124B     		ldr	r3, .L11+28
 244 00f8 1A68     		ldr	r2, [r3]
 245 00fa 114B     		ldr	r3, .L11+28
 246 00fc 0821     		movs	r1, #8
 247 00fe 8A43     		bics	r2, r1
 248 0100 1A60     		str	r2, [r3]
 109:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 	
 110:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 	*SCB_VTOR = 0x2001C000;
 249              		.loc 1 110 0
 250 0102 104B     		ldr	r3, .L11+32
 251 0104 104A     		ldr	r2, .L11+36
 252 0106 1A60     		str	r2, [r3]
 111:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 	*((void (**) (void)) 0x2001C064 ) = irq_handler;
 253              		.loc 1 111 0
 254 0108 104B     		ldr	r3, .L11+40
 255 010a 114A     		ldr	r2, .L11+44
 256 010c 1A60     		str	r2, [r3]
 112:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 	
 113:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 	*((unsigned int *) 0xE000E100) |= (1<<9);
 257              		.loc 1 113 0
 258 010e 114B     		ldr	r3, .L11+48
 259 0110 1A68     		ldr	r2, [r3]
 260 0112 104B     		ldr	r3, .L11+48
 261 0114 8021     		movs	r1, #128
 262 0116 8900     		lsls	r1, r1, #2
 263 0118 0A43     		orrs	r2, r1
 264 011a 1A60     		str	r2, [r3]
 114:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 	
 115:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** }
 265              		.loc 1 115 0
 266 011c C046     		nop
 267 011e BD46     		mov	sp, r7
 268              		@ sp needed
 269 0120 80BD     		pop	{r7, pc}
 270              	.L12:
 271 0122 C046     		.align	2
 272              	.L11:
 273 0124 000C0240 		.word	1073875968
 274 0128 55555555 		.word	1431655765
 275 012c 00100240 		.word	1073876992
 276 0130 08380140 		.word	1073821704
 277 0134 FF0FFFFF 		.word	-61441
 278 0138 003C0140 		.word	1073822720
 279 013c 083C0140 		.word	1073822728
 280 0140 0C3C0140 		.word	1073822732
 281 0144 08ED00E0 		.word	-536810232
 282 0148 00C00120 		.word	536985600
 283 014c 64C00120 		.word	536985700
 284 0150 00000000 		.word	irq_handler
 285 0154 00E100E0 		.word	-536813312
 286              		.cfi_endproc
 287              	.LFE2:
 289              		.align	1
 290              		.global	main
 291              		.syntax unified
 292              		.code	16
 293              		.thumb_func
 294              		.fpu softvfp
 296              	main:
 297              	.LFB3:
 116:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 
 117:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** void main(void)
 118:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** {
 298              		.loc 1 118 0
 299              		.cfi_startproc
 300              		@ args = 0, pretend = 0, frame = 0
 301              		@ frame_needed = 1, uses_anonymous_args = 0
 302 0158 80B5     		push	{r7, lr}
 303              		.cfi_def_cfa_offset 8
 304              		.cfi_offset 7, -8
 305              		.cfi_offset 14, -4
 306 015a 00AF     		add	r7, sp, #0
 307              		.cfi_def_cfa_register 7
 119:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 	app_init();
 308              		.loc 1 119 0
 309 015c FFF7FEFF 		bl	app_init
 310              	.L14:
 120:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 	while(1){
 121:C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack\startup.c **** 		GPIO_D.odrLow = count;
 311              		.loc 1 121 0 discriminator 1
 312 0160 024B     		ldr	r3, .L15
 313 0162 1A68     		ldr	r2, [r3]
 314 0164 024B     		ldr	r3, .L15+4
 315 0166 D2B2     		uxtb	r2, r2
 316 0168 1A75     		strb	r2, [r3, #20]
 317 016a F9E7     		b	.L14
 318              	.L16:
 319              		.align	2
 320              	.L15:
 321 016c 00000000 		.word	count
 322 0170 000C0240 		.word	1073875968
 323              		.cfi_endproc
 324              	.LFE3:
 326              	.Letext0:
 327              		.file 2 "C:/Users/Maria/Documents/IT/MOP/MOP/flipflip_irq_ack/gpio_2.h"
