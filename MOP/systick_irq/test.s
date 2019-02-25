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
  25              		.file 1 "C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq/startup.c"
   1:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** /*
   2:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c ****  * 	startup.c
   3:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c ****  *
   4:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c ****  */
   5:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   6:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** #define SIMULATOR
   7:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** #ifdef SIMULATOR
   8:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** #define DELAY_COUNT 100
   9:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** #else
  10:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** #define DELAY_COUNT 1000000
  11:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** #endif
  12:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 
  13:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** #define GPIO_D 0x40020C00 
  14:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** #define GPIO_MODER ((volatile unsigned int *) (GPIO_D))  
  15:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** #define GPIO_OTYPER ((volatile unsigned short *) (GPIO_D+0x4))  
  16:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** #define GPIO_PUPDR ((volatile unsigned int *) (GPIO_D+0xC)) 
  17:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** #define GPIO_IDR_LOW ((volatile unsigned char *) (GPIO_D+0x10))  
  18:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** #define GPIO_IDR_HIGH ((volatile unsigned char *) (GPIO_D+0x11))  
  19:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** #define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_D+0x14))  
  20:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** #define GPIO_ODR_HIGH ((volatile unsigned char *) (GPIO_D+0x15)) 
  21:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 
  22:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** #define STK_CTRL ((volatile unsigned int *)(0xE000E010))
  23:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** #define STK_LOAD ((volatile unsigned int *)(0xE000E014))
  24:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** #define STK_VAL ((volatile unsigned int *)(0xE000E018))
  25:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 
  26:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** #define SCB_VTOR ((volatile unsigned long *)0xE000ED08)
  27:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 
  28:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** void startup ( void )
  29:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** {
  26              		.loc 1 29 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  30:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** __asm volatile(
  31              		.loc 1 30 0
  32              		.syntax divided
  33              	@ 30 "C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  31:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  32:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 	" MOV SP,R0\n"
  33:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 	" BL main\n"				/* call main */
  34:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 	"_exit: B .\n"				/* never return */
  35:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 	) ;
  36:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** }
  40              		.loc 1 36 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.bss
  48              		.align	2
  49              	systick_flag:
  50 0000 00000000 		.space	4
  52              		.align	2
  53              	delay_count:
  54 0004 00000000 		.space	4
  56              		.text
  57              		.align	1
  58              		.global	systick_irq_handler
  59              		.syntax unified
  60              		.code	16
  61              		.thumb_func
  62              		.fpu softvfp
  64              	systick_irq_handler:
  65              	.LFB1:
  37:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 
  38:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** static volatile int systick_flag;
  39:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** static volatile int delay_count;
  40:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 
  41:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** void systick_irq_handler(void)
  42:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** {
  66              		.loc 1 42 0
  67              		.cfi_startproc
  68              		@ args = 0, pretend = 0, frame = 0
  69              		@ frame_needed = 1, uses_anonymous_args = 0
  70 0000 80B5     		push	{r7, lr}
  71              		.cfi_def_cfa_offset 8
  72              		.cfi_offset 7, -8
  73              		.cfi_offset 14, -4
  74 0002 00AF     		add	r7, sp, #0
  75              		.cfi_def_cfa_register 7
  43:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 	*STK_CTRL = 0;
  76              		.loc 1 43 0
  77 0004 0A4B     		ldr	r3, .L6
  78 0006 0022     		movs	r2, #0
  79 0008 1A60     		str	r2, [r3]
  44:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 	delay_count--;
  80              		.loc 1 44 0
  81 000a 0A4B     		ldr	r3, .L6+4
  82 000c 1B68     		ldr	r3, [r3]
  83 000e 5A1E     		subs	r2, r3, #1
  84 0010 084B     		ldr	r3, .L6+4
  85 0012 1A60     		str	r2, [r3]
  45:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 	if(delay_count > 0)
  86              		.loc 1 45 0
  87 0014 074B     		ldr	r3, .L6+4
  88 0016 1B68     		ldr	r3, [r3]
  89 0018 002B     		cmp	r3, #0
  90 001a 02DD     		ble	.L3
  91              	.LBB2:
  46:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 	{
  47:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 		delay_1mikro();
  92              		.loc 1 47 0
  93 001c FFF7FEFF 		bl	delay_1mikro
  94              	.LBE2:
  48:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 	}else{
  49:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 		systick_flag = 1;
  50:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 	}
  51:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** }
  95              		.loc 1 51 0
  96 0020 02E0     		b	.L5
  97              	.L3:
  49:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 	}
  98              		.loc 1 49 0
  99 0022 054B     		ldr	r3, .L6+8
 100 0024 0122     		movs	r2, #1
 101 0026 1A60     		str	r2, [r3]
 102              	.L5:
 103              		.loc 1 51 0
 104 0028 C046     		nop
 105 002a BD46     		mov	sp, r7
 106              		@ sp needed
 107 002c 80BD     		pop	{r7, pc}
 108              	.L7:
 109 002e C046     		.align	2
 110              	.L6:
 111 0030 10E000E0 		.word	-536813552
 112 0034 04000000 		.word	delay_count
 113 0038 00000000 		.word	systick_flag
 114              		.cfi_endproc
 115              	.LFE1:
 117              		.align	1
 118              		.global	delay_1mikro
 119              		.syntax unified
 120              		.code	16
 121              		.thumb_func
 122              		.fpu softvfp
 124              	delay_1mikro:
 125              	.LFB2:
  52:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 
  53:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** void delay_1mikro()
  54:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** {
 126              		.loc 1 54 0
 127              		.cfi_startproc
 128              		@ args = 0, pretend = 0, frame = 0
 129              		@ frame_needed = 1, uses_anonymous_args = 0
 130 003c 80B5     		push	{r7, lr}
 131              		.cfi_def_cfa_offset 8
 132              		.cfi_offset 7, -8
 133              		.cfi_offset 14, -4
 134 003e 00AF     		add	r7, sp, #0
 135              		.cfi_def_cfa_register 7
  55:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 	systick_flag = 0;
 136              		.loc 1 55 0
 137 0040 084B     		ldr	r3, .L9
 138 0042 0022     		movs	r2, #0
 139 0044 1A60     		str	r2, [r3]
  56:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 	*STK_CTRL = 0;
 140              		.loc 1 56 0
 141 0046 084B     		ldr	r3, .L9+4
 142 0048 0022     		movs	r2, #0
 143 004a 1A60     		str	r2, [r3]
  57:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 	*STK_LOAD = ( 168 -1 );
 144              		.loc 1 57 0
 145 004c 074B     		ldr	r3, .L9+8
 146 004e A722     		movs	r2, #167
 147 0050 1A60     		str	r2, [r3]
  58:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 	*STK_VAL = 0;
 148              		.loc 1 58 0
 149 0052 074B     		ldr	r3, .L9+12
 150 0054 0022     		movs	r2, #0
 151 0056 1A60     		str	r2, [r3]
  59:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 	*STK_CTRL = 7;
 152              		.loc 1 59 0
 153 0058 034B     		ldr	r3, .L9+4
 154 005a 0722     		movs	r2, #7
 155 005c 1A60     		str	r2, [r3]
  60:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** }
 156              		.loc 1 60 0
 157 005e C046     		nop
 158 0060 BD46     		mov	sp, r7
 159              		@ sp needed
 160 0062 80BD     		pop	{r7, pc}
 161              	.L10:
 162              		.align	2
 163              	.L9:
 164 0064 00000000 		.word	systick_flag
 165 0068 10E000E0 		.word	-536813552
 166 006c 14E000E0 		.word	-536813548
 167 0070 18E000E0 		.word	-536813544
 168              		.cfi_endproc
 169              	.LFE2:
 171              		.align	1
 172              		.global	delay
 173              		.syntax unified
 174              		.code	16
 175              		.thumb_func
 176              		.fpu softvfp
 178              	delay:
 179              	.LFB3:
  61:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 
  62:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** void delay(unsigned int count)
  63:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** {
 180              		.loc 1 63 0
 181              		.cfi_startproc
 182              		@ args = 0, pretend = 0, frame = 8
 183              		@ frame_needed = 1, uses_anonymous_args = 0
 184 0074 80B5     		push	{r7, lr}
 185              		.cfi_def_cfa_offset 8
 186              		.cfi_offset 7, -8
 187              		.cfi_offset 14, -4
 188 0076 82B0     		sub	sp, sp, #8
 189              		.cfi_def_cfa_offset 16
 190 0078 00AF     		add	r7, sp, #0
 191              		.cfi_def_cfa_register 7
 192 007a 7860     		str	r0, [r7, #4]
  64:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 	delay_count = count;
 193              		.loc 1 64 0
 194 007c 7A68     		ldr	r2, [r7, #4]
 195 007e 044B     		ldr	r3, .L12
 196 0080 1A60     		str	r2, [r3]
  65:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 	delay_1mikro();
 197              		.loc 1 65 0
 198 0082 FFF7FEFF 		bl	delay_1mikro
  66:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** }
 199              		.loc 1 66 0
 200 0086 C046     		nop
 201 0088 BD46     		mov	sp, r7
 202 008a 02B0     		add	sp, sp, #8
 203              		@ sp needed
 204 008c 80BD     		pop	{r7, pc}
 205              	.L13:
 206 008e C046     		.align	2
 207              	.L12:
 208 0090 04000000 		.word	delay_count
 209              		.cfi_endproc
 210              	.LFE3:
 212              		.align	1
 213              		.global	init_app
 214              		.syntax unified
 215              		.code	16
 216              		.thumb_func
 217              		.fpu softvfp
 219              	init_app:
 220              	.LFB4:
  67:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 
  68:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** void init_app(void)
  69:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** {
 221              		.loc 1 69 0
 222              		.cfi_startproc
 223              		@ args = 0, pretend = 0, frame = 0
 224              		@ frame_needed = 1, uses_anonymous_args = 0
 225 0094 80B5     		push	{r7, lr}
 226              		.cfi_def_cfa_offset 8
 227              		.cfi_offset 7, -8
 228              		.cfi_offset 14, -4
 229 0096 00AF     		add	r7, sp, #0
 230              		.cfi_def_cfa_register 7
  70:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 	*GPIO_MODER = 0x55555555;
 231              		.loc 1 70 0
 232 0098 054B     		ldr	r3, .L15
 233 009a 064A     		ldr	r2, .L15+4
 234 009c 1A60     		str	r2, [r3]
  71:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 	*SCB_VTOR = 0x2001C000;
 235              		.loc 1 71 0
 236 009e 064B     		ldr	r3, .L15+8
 237 00a0 064A     		ldr	r2, .L15+12
 238 00a2 1A60     		str	r2, [r3]
  72:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 	*((void (**)(void) ) 0x2001C03C ) = systick_irq_handler;
 239              		.loc 1 72 0
 240 00a4 064B     		ldr	r3, .L15+16
 241 00a6 074A     		ldr	r2, .L15+20
 242 00a8 1A60     		str	r2, [r3]
  73:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** }
 243              		.loc 1 73 0
 244 00aa C046     		nop
 245 00ac BD46     		mov	sp, r7
 246              		@ sp needed
 247 00ae 80BD     		pop	{r7, pc}
 248              	.L16:
 249              		.align	2
 250              	.L15:
 251 00b0 000C0240 		.word	1073875968
 252 00b4 55555555 		.word	1431655765
 253 00b8 08ED00E0 		.word	-536810232
 254 00bc 00C00120 		.word	536985600
 255 00c0 3CC00120 		.word	536985660
 256 00c4 00000000 		.word	systick_irq_handler
 257              		.cfi_endproc
 258              	.LFE4:
 260              		.align	1
 261              		.global	main
 262              		.syntax unified
 263              		.code	16
 264              		.thumb_func
 265              		.fpu softvfp
 267              	main:
 268              	.LFB5:
  74:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 
  75:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** void main(void)
  76:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** {
 269              		.loc 1 76 0
 270              		.cfi_startproc
 271              		@ args = 0, pretend = 0, frame = 0
 272              		@ frame_needed = 1, uses_anonymous_args = 0
 273 00c8 80B5     		push	{r7, lr}
 274              		.cfi_def_cfa_offset 8
 275              		.cfi_offset 7, -8
 276              		.cfi_offset 14, -4
 277 00ca 00AF     		add	r7, sp, #0
 278              		.cfi_def_cfa_register 7
  77:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 	init_app();
 279              		.loc 1 77 0
 280 00cc FFF7FEFF 		bl	init_app
  78:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 	*GPIO_ODR_LOW = 0;
 281              		.loc 1 78 0
 282 00d0 0B4B     		ldr	r3, .L23
 283 00d2 0022     		movs	r2, #0
 284 00d4 1A70     		strb	r2, [r3]
  79:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 	delay(DELAY_COUNT);
 285              		.loc 1 79 0
 286 00d6 6420     		movs	r0, #100
 287 00d8 FFF7FEFF 		bl	delay
  80:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 	*GPIO_ODR_LOW = 0xFF;
 288              		.loc 1 80 0
 289 00dc 084B     		ldr	r3, .L23
 290 00de FF22     		movs	r2, #255
 291 00e0 1A70     		strb	r2, [r3]
 292              	.L20:
  81:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 	while(1)
  82:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 	{
  83:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 		if(systick_flag)
 293              		.loc 1 83 0
 294 00e2 084B     		ldr	r3, .L23+4
 295 00e4 1B68     		ldr	r3, [r3]
 296 00e6 002B     		cmp	r3, #0
 297 00e8 03D1     		bne	.L22
  84:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 		{
  85:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 			break;
  86:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 		}
  87:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 		*GPIO_ODR_LOW = 0xFE;
 298              		.loc 1 87 0
 299 00ea 054B     		ldr	r3, .L23
 300 00ec FE22     		movs	r2, #254
 301 00ee 1A70     		strb	r2, [r3]
  83:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 		{
 302              		.loc 1 83 0
 303 00f0 F7E7     		b	.L20
 304              	.L22:
  85:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 		}
 305              		.loc 1 85 0
 306 00f2 C046     		nop
  88:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 		
  89:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 	}
  90:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** 	*GPIO_ODR_LOW = 0xFC;
 307              		.loc 1 90 0
 308 00f4 024B     		ldr	r3, .L23
 309 00f6 FC22     		movs	r2, #252
 310 00f8 1A70     		strb	r2, [r3]
  91:C:/Users/Maria/Documents/IT/MOP/MOP/systick_irq\startup.c **** }
 311              		.loc 1 91 0
 312 00fa C046     		nop
 313 00fc BD46     		mov	sp, r7
 314              		@ sp needed
 315 00fe 80BD     		pop	{r7, pc}
 316              	.L24:
 317              		.align	2
 318              	.L23:
 319 0100 140C0240 		.word	1073875988
 320 0104 00000000 		.word	systick_flag
 321              		.cfi_endproc
 322              	.LFE5:
 324              	.Letext0:
