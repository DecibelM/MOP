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
  25              		.file 1 "C:/Users/Maria/Documents/IT/MOP/MOP/delay/startup.c"
   1:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** // Test program for delay functions.
   2:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 
   3:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   4:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 
   5:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** #define GPIO_E 0x40021000
   6:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** #define GPIO_MODER ((volatile unsigned int *) (GPIO_E))
   7:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** #define GPIO_ODR ((volatile unsigned char *) (GPIO_E + 0x14))
   8:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 
   9:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** #define STK_CTRL ((volatile unsigned int *)(0xE000E010))
  10:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** #define STK_LOAD ((volatile unsigned int *)(0xE000E014))
  11:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** #define STK_VAL ((volatile unsigned int *)(0xE000E018))
  12:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 
  13:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** void startup ( void )
  14:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** {
  26              		.loc 1 14 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  15:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** __asm volatile(
  31              		.loc 1 15 0
  32              		.syntax divided
  33              	@ 15 "C:/Users/Maria/Documents/IT/MOP/MOP/delay/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  16:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c ****  " LDR R0,=0x2001C000\n"  /* set stack */
  17:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c ****  " MOV SP,R0\n"
  18:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c ****  " BL main\n"    /* call main */
  19:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c ****  "_exit: B .\n"    /* never return */
  20:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c ****  ) ;
  21:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** }
  40              		.loc 1 21 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.text
  48              		.align	1
  49              		.global	init_app
  50              		.syntax unified
  51              		.code	16
  52              		.thumb_func
  53              		.fpu softvfp
  55              	init_app:
  56              	.LFB1:
  22:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 
  23:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** void init_app(void)
  24:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** {
  57              		.loc 1 24 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  25:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	* ( (unsigned int *) GPIO_MODER ) = 0x55555555;
  67              		.loc 1 25 0
  68 0004 024B     		ldr	r3, .L3
  69 0006 034A     		ldr	r2, .L3+4
  70 0008 1A60     		str	r2, [r3]
  26:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** }
  71              		.loc 1 26 0
  72 000a C046     		nop
  73 000c BD46     		mov	sp, r7
  74              		@ sp needed
  75 000e 80BD     		pop	{r7, pc}
  76              	.L4:
  77              		.align	2
  78              	.L3:
  79 0010 00100240 		.word	1073876992
  80 0014 55555555 		.word	1431655765
  81              		.cfi_endproc
  82              	.LFE1:
  84              		.align	1
  85              		.global	delay_milli
  86              		.syntax unified
  87              		.code	16
  88              		.thumb_func
  89              		.fpu softvfp
  91              	delay_milli:
  92              	.LFB2:
  27:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 
  28:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** void delay_milli(int ms)
  29:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** {
  93              		.loc 1 29 0
  94              		.cfi_startproc
  95              		@ args = 0, pretend = 0, frame = 8
  96              		@ frame_needed = 1, uses_anonymous_args = 0
  97 0018 80B5     		push	{r7, lr}
  98              		.cfi_def_cfa_offset 8
  99              		.cfi_offset 7, -8
 100              		.cfi_offset 14, -4
 101 001a 82B0     		sub	sp, sp, #8
 102              		.cfi_def_cfa_offset 16
 103 001c 00AF     		add	r7, sp, #0
 104              		.cfi_def_cfa_register 7
 105 001e 7860     		str	r0, [r7, #4]
  30:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	while(ms > 0)
 106              		.loc 1 30 0
 107 0020 05E0     		b	.L6
 108              	.L7:
 109              	.LBB2:
  31:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	{
  32:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	delay_micro(100);
 110              		.loc 1 32 0
 111 0022 6420     		movs	r0, #100
 112 0024 FFF7FEFF 		bl	delay_micro
  33:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	ms--;
 113              		.loc 1 33 0
 114 0028 7B68     		ldr	r3, [r7, #4]
 115 002a 013B     		subs	r3, r3, #1
 116 002c 7B60     		str	r3, [r7, #4]
 117              	.L6:
 118              	.LBE2:
  30:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	while(ms > 0)
 119              		.loc 1 30 0
 120 002e 7B68     		ldr	r3, [r7, #4]
 121 0030 002B     		cmp	r3, #0
 122 0032 F6DC     		bgt	.L7
  34:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	}
  35:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** }
 123              		.loc 1 35 0
 124 0034 C046     		nop
 125 0036 BD46     		mov	sp, r7
 126 0038 02B0     		add	sp, sp, #8
 127              		@ sp needed
 128 003a 80BD     		pop	{r7, pc}
 129              		.cfi_endproc
 130              	.LFE2:
 132              		.align	1
 133              		.global	delay_micro
 134              		.syntax unified
 135              		.code	16
 136              		.thumb_func
 137              		.fpu softvfp
 139              	delay_micro:
 140              	.LFB3:
  36:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 
  37:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** void delay_micro(int us)
  38:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** {
 141              		.loc 1 38 0
 142              		.cfi_startproc
 143              		@ args = 0, pretend = 0, frame = 8
 144              		@ frame_needed = 1, uses_anonymous_args = 0
 145 003c 80B5     		push	{r7, lr}
 146              		.cfi_def_cfa_offset 8
 147              		.cfi_offset 7, -8
 148              		.cfi_offset 14, -4
 149 003e 82B0     		sub	sp, sp, #8
 150              		.cfi_def_cfa_offset 16
 151 0040 00AF     		add	r7, sp, #0
 152              		.cfi_def_cfa_register 7
 153 0042 7860     		str	r0, [r7, #4]
  39:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	while(us > 0)
 154              		.loc 1 39 0
 155 0044 0AE0     		b	.L9
 156              	.L10:
 157              	.LBB3:
  40:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	{
  41:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	delay_250ns();
 158              		.loc 1 41 0
 159 0046 FFF7FEFF 		bl	delay_250ns
  42:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	delay_250ns();
 160              		.loc 1 42 0
 161 004a FFF7FEFF 		bl	delay_250ns
  43:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	delay_250ns();
 162              		.loc 1 43 0
 163 004e FFF7FEFF 		bl	delay_250ns
  44:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	delay_250ns();
 164              		.loc 1 44 0
 165 0052 FFF7FEFF 		bl	delay_250ns
  45:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	us--;
 166              		.loc 1 45 0
 167 0056 7B68     		ldr	r3, [r7, #4]
 168 0058 013B     		subs	r3, r3, #1
 169 005a 7B60     		str	r3, [r7, #4]
 170              	.L9:
 171              	.LBE3:
  39:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	{
 172              		.loc 1 39 0
 173 005c 7B68     		ldr	r3, [r7, #4]
 174 005e 002B     		cmp	r3, #0
 175 0060 F1DC     		bgt	.L10
  46:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	}
  47:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** }
 176              		.loc 1 47 0
 177 0062 C046     		nop
 178 0064 BD46     		mov	sp, r7
 179 0066 02B0     		add	sp, sp, #8
 180              		@ sp needed
 181 0068 80BD     		pop	{r7, pc}
 182              		.cfi_endproc
 183              	.LFE3:
 185              		.align	1
 186              		.global	delay_250ns
 187              		.syntax unified
 188              		.code	16
 189              		.thumb_func
 190              		.fpu softvfp
 192              	delay_250ns:
 193              	.LFB4:
  48:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 
  49:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** void delay_250ns(void)
  50:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** {
 194              		.loc 1 50 0
 195              		.cfi_startproc
 196              		@ args = 0, pretend = 0, frame = 8
 197              		@ frame_needed = 1, uses_anonymous_args = 0
 198 006a 80B5     		push	{r7, lr}
 199              		.cfi_def_cfa_offset 8
 200              		.cfi_offset 7, -8
 201              		.cfi_offset 14, -4
 202 006c 82B0     		sub	sp, sp, #8
 203              		.cfi_def_cfa_offset 16
 204 006e 00AF     		add	r7, sp, #0
 205              		.cfi_def_cfa_register 7
  51:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	*STK_CTRL = 0;
 206              		.loc 1 51 0
 207 0070 0F4B     		ldr	r3, .L13
 208 0072 0022     		movs	r2, #0
 209 0074 1A60     		str	r2, [r3]
  52:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	*STK_LOAD = 0x29; //0x2A - 1
 210              		.loc 1 52 0
 211 0076 0F4B     		ldr	r3, .L13+4
 212 0078 2922     		movs	r2, #41
 213 007a 1A60     		str	r2, [r3]
  53:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	*STK_VAL = 0x0;
 214              		.loc 1 53 0
 215 007c 0E4B     		ldr	r3, .L13+8
 216 007e 0022     		movs	r2, #0
 217 0080 1A60     		str	r2, [r3]
  54:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	*STK_CTRL = 5;
 218              		.loc 1 54 0
 219 0082 0B4B     		ldr	r3, .L13
 220 0084 0522     		movs	r2, #5
 221 0086 1A60     		str	r2, [r3]
  55:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	unsigned int ctrl = *STK_CTRL & 0x10000;
 222              		.loc 1 55 0
 223 0088 094B     		ldr	r3, .L13
 224 008a 1A68     		ldr	r2, [r3]
 225 008c 8023     		movs	r3, #128
 226 008e 5B02     		lsls	r3, r3, #9
 227 0090 1340     		ands	r3, r2
 228 0092 7B60     		str	r3, [r7, #4]
  56:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	while((*STK_CTRL & 0x10000) == 0);
 229              		.loc 1 56 0
 230 0094 C046     		nop
 231              	.L12:
 232              		.loc 1 56 0 is_stmt 0 discriminator 1
 233 0096 064B     		ldr	r3, .L13
 234 0098 1A68     		ldr	r2, [r3]
 235 009a 8023     		movs	r3, #128
 236 009c 5B02     		lsls	r3, r3, #9
 237 009e 1340     		ands	r3, r2
 238 00a0 F9D0     		beq	.L12
  57:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	*STK_CTRL= 0;
 239              		.loc 1 57 0 is_stmt 1
 240 00a2 034B     		ldr	r3, .L13
 241 00a4 0022     		movs	r2, #0
 242 00a6 1A60     		str	r2, [r3]
  58:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	
  59:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** }
 243              		.loc 1 59 0
 244 00a8 C046     		nop
 245 00aa BD46     		mov	sp, r7
 246 00ac 02B0     		add	sp, sp, #8
 247              		@ sp needed
 248 00ae 80BD     		pop	{r7, pc}
 249              	.L14:
 250              		.align	2
 251              	.L13:
 252 00b0 10E000E0 		.word	-536813552
 253 00b4 14E000E0 		.word	-536813548
 254 00b8 18E000E0 		.word	-536813544
 255              		.cfi_endproc
 256              	.LFE4:
 258              		.align	1
 259              		.global	main
 260              		.syntax unified
 261              		.code	16
 262              		.thumb_func
 263              		.fpu softvfp
 265              	main:
 266              	.LFB5:
  60:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 
  61:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** void main(void)
  62:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** {
 267              		.loc 1 62 0
 268              		.cfi_startproc
 269              		@ args = 0, pretend = 0, frame = 0
 270              		@ frame_needed = 1, uses_anonymous_args = 0
 271 00bc 80B5     		push	{r7, lr}
 272              		.cfi_def_cfa_offset 8
 273              		.cfi_offset 7, -8
 274              		.cfi_offset 14, -4
 275 00be 00AF     		add	r7, sp, #0
 276              		.cfi_def_cfa_register 7
  63:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	init_app();
 277              		.loc 1 63 0
 278 00c0 FFF7FEFF 		bl	init_app
 279              	.L16:
  64:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	while(1)
  65:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	{
  66:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 		*GPIO_ODR = 0x00;
 280              		.loc 1 66 0 discriminator 1
 281 00c4 064B     		ldr	r3, .L17
 282 00c6 0022     		movs	r2, #0
 283 00c8 1A70     		strb	r2, [r3]
  67:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 		delay_milli(1);
 284              		.loc 1 67 0 discriminator 1
 285 00ca 0120     		movs	r0, #1
 286 00cc FFF7FEFF 		bl	delay_milli
  68:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 		*GPIO_ODR = 0xFF;
 287              		.loc 1 68 0 discriminator 1
 288 00d0 034B     		ldr	r3, .L17
 289 00d2 FF22     		movs	r2, #255
 290 00d4 1A70     		strb	r2, [r3]
  69:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 		delay_milli(1);
 291              		.loc 1 69 0 discriminator 1
 292 00d6 0120     		movs	r0, #1
 293 00d8 FFF7FEFF 		bl	delay_milli
  66:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 		delay_milli(1);
 294              		.loc 1 66 0 discriminator 1
 295 00dc F2E7     		b	.L16
 296              	.L18:
 297 00de C046     		.align	2
 298              	.L17:
 299 00e0 14100240 		.word	1073877012
 300              		.cfi_endproc
 301              	.LFE5:
 303              	.Letext0:
