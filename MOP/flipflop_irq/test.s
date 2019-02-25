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
  25              		.file 1 "C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq/startup.c"
   1:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** /*
   2:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c ****  * 	startup.c
   3:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c ****  *
   4:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c ****  */
   5:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   6:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** 
   7:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** void startup ( void )
   8:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** {
  26              		.loc 1 8 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
   9:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** __asm volatile(
  31              		.loc 1 9 0
  32              		.syntax divided
  33              	@ 9 "C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  10:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  11:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** 	" MOV SP,R0\n"
  12:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** 	" BL main\n"				/* call main */
  13:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** 	"_exit: B .\n"				/* never return */
  14:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** 	) ;
  15:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** }
  40              		.loc 1 15 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.comm	count,4,4
  48              		.text
  49              		.align	1
  50              		.global	irq_handler
  51              		.syntax unified
  52              		.code	16
  53              		.thumb_func
  54              		.fpu softvfp
  56              	irq_handler:
  57              	.LFB1:
  16:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** 
  17:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** #define GPIO_D 0x40020C00 
  18:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** #define GPIO_MODER ((volatile unsigned int *) (GPIO_D))
  19:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** #define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_D+0x14)) 
  20:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** 
  21:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** #define SYSCFG_EXTICR1 ((volatile unsigned int *) 0x40013808)
  22:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** 
  23:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** #define EXTI_PR ((volatile unsigned int *) 0x40013C14)
  24:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** 
  25:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** #define SCB_VTOR ((volatile unsigned long *)0xE000ED08)
  26:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** 
  27:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** 
  28:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** #define EXTI3_IRQ_BPOS 0x00000008
  29:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** 
  30:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** unsigned int count;
  31:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** 
  32:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** void irq_handler(void)
  33:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** {
  58              		.loc 1 33 0
  59              		.cfi_startproc
  60              		@ args = 0, pretend = 0, frame = 0
  61              		@ frame_needed = 1, uses_anonymous_args = 0
  62 0000 80B5     		push	{r7, lr}
  63              		.cfi_def_cfa_offset 8
  64              		.cfi_offset 7, -8
  65              		.cfi_offset 14, -4
  66 0002 00AF     		add	r7, sp, #0
  67              		.cfi_def_cfa_register 7
  34:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** 	if( (*EXTI_PR & EXTI3_IRQ_BPOS) != 0 )
  68              		.loc 1 34 0
  69 0004 094B     		ldr	r3, .L5
  70 0006 1B68     		ldr	r3, [r3]
  71 0008 0822     		movs	r2, #8
  72 000a 1340     		ands	r3, r2
  73 000c 0AD0     		beq	.L4
  35:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** 	{
  36:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** 		count++;
  74              		.loc 1 36 0
  75 000e 084B     		ldr	r3, .L5+4
  76 0010 1B68     		ldr	r3, [r3]
  77 0012 5A1C     		adds	r2, r3, #1
  78 0014 064B     		ldr	r3, .L5+4
  79 0016 1A60     		str	r2, [r3]
  37:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** 		*EXTI_PR |= EXTI3_IRQ_BPOS;
  80              		.loc 1 37 0
  81 0018 044B     		ldr	r3, .L5
  82 001a 1A68     		ldr	r2, [r3]
  83 001c 034B     		ldr	r3, .L5
  84 001e 0821     		movs	r1, #8
  85 0020 0A43     		orrs	r2, r1
  86 0022 1A60     		str	r2, [r3]
  87              	.L4:
  38:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** 	}
  39:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** }
  88              		.loc 1 39 0
  89 0024 C046     		nop
  90 0026 BD46     		mov	sp, r7
  91              		@ sp needed
  92 0028 80BD     		pop	{r7, pc}
  93              	.L6:
  94 002a C046     		.align	2
  95              	.L5:
  96 002c 143C0140 		.word	1073822740
  97 0030 00000000 		.word	count
  98              		.cfi_endproc
  99              	.LFE1:
 101              		.align	1
 102              		.global	app_init
 103              		.syntax unified
 104              		.code	16
 105              		.thumb_func
 106              		.fpu softvfp
 108              	app_init:
 109              	.LFB2:
  40:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** 
  41:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** void app_init(void)
  42:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** {
 110              		.loc 1 42 0
 111              		.cfi_startproc
 112              		@ args = 0, pretend = 0, frame = 0
 113              		@ frame_needed = 1, uses_anonymous_args = 0
 114 0034 80B5     		push	{r7, lr}
 115              		.cfi_def_cfa_offset 8
 116              		.cfi_offset 7, -8
 117              		.cfi_offset 14, -4
 118 0036 00AF     		add	r7, sp, #0
 119              		.cfi_def_cfa_register 7
  43:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** 	*GPIO_MODER = 0x55555555;
 120              		.loc 1 43 0
 121 0038 184B     		ldr	r3, .L8
 122 003a 194A     		ldr	r2, .L8+4
 123 003c 1A60     		str	r2, [r3]
  44:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** 	//IO pinne PE3 till EXTI3
  45:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** 	*((unsigned int *) SYSCFG_EXTICR1) &= ~0xF000;
 124              		.loc 1 45 0
 125 003e 194B     		ldr	r3, .L8+8
 126 0040 1A68     		ldr	r2, [r3]
 127 0042 184B     		ldr	r3, .L8+8
 128 0044 1849     		ldr	r1, .L8+12
 129 0046 0A40     		ands	r2, r1
 130 0048 1A60     		str	r2, [r3]
  46:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** 	*((unsigned int *) SYSCFG_EXTICR1) |= 0x4000;
 131              		.loc 1 46 0
 132 004a 164B     		ldr	r3, .L8+8
 133 004c 1A68     		ldr	r2, [r3]
 134 004e 154B     		ldr	r3, .L8+8
 135 0050 8021     		movs	r1, #128
 136 0052 C901     		lsls	r1, r1, #7
 137 0054 0A43     		orrs	r2, r1
 138 0056 1A60     		str	r2, [r3]
  47:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** 	
  48:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** 	//EXTI3 konfigureras till att generera avbrott
  49:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** 	*((unsigned int *) 0x40013C00) |= 8;
 139              		.loc 1 49 0
 140 0058 144B     		ldr	r3, .L8+16
 141 005a 1A68     		ldr	r2, [r3]
 142 005c 134B     		ldr	r3, .L8+16
 143 005e 0821     		movs	r1, #8
 144 0060 0A43     		orrs	r2, r1
 145 0062 1A60     		str	r2, [r3]
  50:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** 	*((unsigned int *) 0x40013C08) |= 8;
 146              		.loc 1 50 0
 147 0064 124B     		ldr	r3, .L8+20
 148 0066 1A68     		ldr	r2, [r3]
 149 0068 114B     		ldr	r3, .L8+20
 150 006a 0821     		movs	r1, #8
 151 006c 0A43     		orrs	r2, r1
 152 006e 1A60     		str	r2, [r3]
  51:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** 	*((unsigned int *) 0x40013C0C) &= ~8;
 153              		.loc 1 51 0
 154 0070 104B     		ldr	r3, .L8+24
 155 0072 1A68     		ldr	r2, [r3]
 156 0074 0F4B     		ldr	r3, .L8+24
 157 0076 0821     		movs	r1, #8
 158 0078 8A43     		bics	r2, r1
 159 007a 1A60     		str	r2, [r3]
  52:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** 	
  53:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** 	*SCB_VTOR = 0x2001C000;
 160              		.loc 1 53 0
 161 007c 0E4B     		ldr	r3, .L8+28
 162 007e 0F4A     		ldr	r2, .L8+32
 163 0080 1A60     		str	r2, [r3]
  54:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** 	*((void (**) (void)) 0x2001C064 ) = irq_handler;
 164              		.loc 1 54 0
 165 0082 0F4B     		ldr	r3, .L8+36
 166 0084 0F4A     		ldr	r2, .L8+40
 167 0086 1A60     		str	r2, [r3]
  55:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** 	
  56:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** 	*((unsigned int *) 0xE000E100) |= (1<<9);
 168              		.loc 1 56 0
 169 0088 0F4B     		ldr	r3, .L8+44
 170 008a 1A68     		ldr	r2, [r3]
 171 008c 0E4B     		ldr	r3, .L8+44
 172 008e 8021     		movs	r1, #128
 173 0090 8900     		lsls	r1, r1, #2
 174 0092 0A43     		orrs	r2, r1
 175 0094 1A60     		str	r2, [r3]
  57:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** 	
  58:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** }
 176              		.loc 1 58 0
 177 0096 C046     		nop
 178 0098 BD46     		mov	sp, r7
 179              		@ sp needed
 180 009a 80BD     		pop	{r7, pc}
 181              	.L9:
 182              		.align	2
 183              	.L8:
 184 009c 000C0240 		.word	1073875968
 185 00a0 55555555 		.word	1431655765
 186 00a4 08380140 		.word	1073821704
 187 00a8 FF0FFFFF 		.word	-61441
 188 00ac 003C0140 		.word	1073822720
 189 00b0 083C0140 		.word	1073822728
 190 00b4 0C3C0140 		.word	1073822732
 191 00b8 08ED00E0 		.word	-536810232
 192 00bc 00C00120 		.word	536985600
 193 00c0 64C00120 		.word	536985700
 194 00c4 00000000 		.word	irq_handler
 195 00c8 00E100E0 		.word	-536813312
 196              		.cfi_endproc
 197              	.LFE2:
 199              		.align	1
 200              		.global	main
 201              		.syntax unified
 202              		.code	16
 203              		.thumb_func
 204              		.fpu softvfp
 206              	main:
 207              	.LFB3:
  59:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** 
  60:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** void main(void)
  61:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** {
 208              		.loc 1 61 0
 209              		.cfi_startproc
 210              		@ args = 0, pretend = 0, frame = 0
 211              		@ frame_needed = 1, uses_anonymous_args = 0
 212 00cc 80B5     		push	{r7, lr}
 213              		.cfi_def_cfa_offset 8
 214              		.cfi_offset 7, -8
 215              		.cfi_offset 14, -4
 216 00ce 00AF     		add	r7, sp, #0
 217              		.cfi_def_cfa_register 7
  62:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** 	app_init();
 218              		.loc 1 62 0
 219 00d0 FFF7FEFF 		bl	app_init
 220              	.L11:
  63:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** 	while(1){
  64:C:/Users/Maria/Documents/IT/MOP/MOP/flipflop_irq\startup.c **** 		*GPIO_ODR_LOW = count;
 221              		.loc 1 64 0 discriminator 1
 222 00d4 024B     		ldr	r3, .L12
 223 00d6 1A68     		ldr	r2, [r3]
 224 00d8 024B     		ldr	r3, .L12+4
 225 00da D2B2     		uxtb	r2, r2
 226 00dc 1A70     		strb	r2, [r3]
 227 00de F9E7     		b	.L11
 228              	.L13:
 229              		.align	2
 230              	.L12:
 231 00e0 00000000 		.word	count
 232 00e4 140C0240 		.word	1073875988
 233              		.cfi_endproc
 234              	.LFE3:
 236              	.Letext0:
