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
 107 0020 07E0     		b	.L6
 108              	.L7:
 109              	.LBB2:
  31:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	{
  32:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	delay_micro(1000);
 110              		.loc 1 32 0
 111 0022 FA23     		movs	r3, #250
 112 0024 9B00     		lsls	r3, r3, #2
 113 0026 1800     		movs	r0, r3
 114 0028 FFF7FEFF 		bl	delay_micro
  33:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	ms--;
 115              		.loc 1 33 0
 116 002c 7B68     		ldr	r3, [r7, #4]
 117 002e 013B     		subs	r3, r3, #1
 118 0030 7B60     		str	r3, [r7, #4]
 119              	.L6:
 120              	.LBE2:
  30:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	while(ms > 0)
 121              		.loc 1 30 0
 122 0032 7B68     		ldr	r3, [r7, #4]
 123 0034 002B     		cmp	r3, #0
 124 0036 F4DC     		bgt	.L7
  34:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	}
  35:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** }
 125              		.loc 1 35 0
 126 0038 C046     		nop
 127 003a BD46     		mov	sp, r7
 128 003c 02B0     		add	sp, sp, #8
 129              		@ sp needed
 130 003e 80BD     		pop	{r7, pc}
 131              		.cfi_endproc
 132              	.LFE2:
 134              		.align	1
 135              		.global	delay_micro
 136              		.syntax unified
 137              		.code	16
 138              		.thumb_func
 139              		.fpu softvfp
 141              	delay_micro:
 142              	.LFB3:
  36:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 
  37:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** void delay_micro(int us)
  38:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** {
 143              		.loc 1 38 0
 144              		.cfi_startproc
 145              		@ args = 0, pretend = 0, frame = 8
 146              		@ frame_needed = 1, uses_anonymous_args = 0
 147 0040 80B5     		push	{r7, lr}
 148              		.cfi_def_cfa_offset 8
 149              		.cfi_offset 7, -8
 150              		.cfi_offset 14, -4
 151 0042 82B0     		sub	sp, sp, #8
 152              		.cfi_def_cfa_offset 16
 153 0044 00AF     		add	r7, sp, #0
 154              		.cfi_def_cfa_register 7
 155 0046 7860     		str	r0, [r7, #4]
  39:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	while(us > 0)
 156              		.loc 1 39 0
 157 0048 0AE0     		b	.L9
 158              	.L10:
 159              	.LBB3:
  40:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	{
  41:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	delay_250ns();
 160              		.loc 1 41 0
 161 004a FFF7FEFF 		bl	delay_250ns
  42:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	delay_250ns();
 162              		.loc 1 42 0
 163 004e FFF7FEFF 		bl	delay_250ns
  43:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	delay_250ns();
 164              		.loc 1 43 0
 165 0052 FFF7FEFF 		bl	delay_250ns
  44:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	delay_250ns();
 166              		.loc 1 44 0
 167 0056 FFF7FEFF 		bl	delay_250ns
  45:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	us--;
 168              		.loc 1 45 0
 169 005a 7B68     		ldr	r3, [r7, #4]
 170 005c 013B     		subs	r3, r3, #1
 171 005e 7B60     		str	r3, [r7, #4]
 172              	.L9:
 173              	.LBE3:
  39:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	{
 174              		.loc 1 39 0
 175 0060 7B68     		ldr	r3, [r7, #4]
 176 0062 002B     		cmp	r3, #0
 177 0064 F1DC     		bgt	.L10
  46:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	}
  47:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** }
 178              		.loc 1 47 0
 179 0066 C046     		nop
 180 0068 BD46     		mov	sp, r7
 181 006a 02B0     		add	sp, sp, #8
 182              		@ sp needed
 183 006c 80BD     		pop	{r7, pc}
 184              		.cfi_endproc
 185              	.LFE3:
 187              		.align	1
 188              		.global	delay_250ns
 189              		.syntax unified
 190              		.code	16
 191              		.thumb_func
 192              		.fpu softvfp
 194              	delay_250ns:
 195              	.LFB4:
  48:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 
  49:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** void delay_250ns(void)
  50:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** {
 196              		.loc 1 50 0
 197              		.cfi_startproc
 198              		@ args = 0, pretend = 0, frame = 8
 199              		@ frame_needed = 1, uses_anonymous_args = 0
 200 006e 80B5     		push	{r7, lr}
 201              		.cfi_def_cfa_offset 8
 202              		.cfi_offset 7, -8
 203              		.cfi_offset 14, -4
 204 0070 82B0     		sub	sp, sp, #8
 205              		.cfi_def_cfa_offset 16
 206 0072 00AF     		add	r7, sp, #0
 207              		.cfi_def_cfa_register 7
  51:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	*STK_CTRL = 0;
 208              		.loc 1 51 0
 209 0074 0F4B     		ldr	r3, .L13
 210 0076 0022     		movs	r2, #0
 211 0078 1A60     		str	r2, [r3]
  52:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	*STK_LOAD = 0x29; //0x2A - 1
 212              		.loc 1 52 0
 213 007a 0F4B     		ldr	r3, .L13+4
 214 007c 2922     		movs	r2, #41
 215 007e 1A60     		str	r2, [r3]
  53:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	*STK_VAL = 0x0;
 216              		.loc 1 53 0
 217 0080 0E4B     		ldr	r3, .L13+8
 218 0082 0022     		movs	r2, #0
 219 0084 1A60     		str	r2, [r3]
  54:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	*STK_CTRL = 5;
 220              		.loc 1 54 0
 221 0086 0B4B     		ldr	r3, .L13
 222 0088 0522     		movs	r2, #5
 223 008a 1A60     		str	r2, [r3]
  55:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	unsigned int ctrl = *STK_CTRL & 0x10000;
 224              		.loc 1 55 0
 225 008c 094B     		ldr	r3, .L13
 226 008e 1A68     		ldr	r2, [r3]
 227 0090 8023     		movs	r3, #128
 228 0092 5B02     		lsls	r3, r3, #9
 229 0094 1340     		ands	r3, r2
 230 0096 7B60     		str	r3, [r7, #4]
  56:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	while((*STK_CTRL & 0x10000) == 0);
 231              		.loc 1 56 0
 232 0098 C046     		nop
 233              	.L12:
 234              		.loc 1 56 0 is_stmt 0 discriminator 1
 235 009a 064B     		ldr	r3, .L13
 236 009c 1A68     		ldr	r2, [r3]
 237 009e 8023     		movs	r3, #128
 238 00a0 5B02     		lsls	r3, r3, #9
 239 00a2 1340     		ands	r3, r2
 240 00a4 F9D0     		beq	.L12
  57:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	*STK_CTRL= 0;
 241              		.loc 1 57 0 is_stmt 1
 242 00a6 034B     		ldr	r3, .L13
 243 00a8 0022     		movs	r2, #0
 244 00aa 1A60     		str	r2, [r3]
  58:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	
  59:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** }
 245              		.loc 1 59 0
 246 00ac C046     		nop
 247 00ae BD46     		mov	sp, r7
 248 00b0 02B0     		add	sp, sp, #8
 249              		@ sp needed
 250 00b2 80BD     		pop	{r7, pc}
 251              	.L14:
 252              		.align	2
 253              	.L13:
 254 00b4 10E000E0 		.word	-536813552
 255 00b8 14E000E0 		.word	-536813548
 256 00bc 18E000E0 		.word	-536813544
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
  60:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 
  61:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** void main(void)
  62:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** {
 269              		.loc 1 62 0
 270              		.cfi_startproc
 271              		@ args = 0, pretend = 0, frame = 0
 272              		@ frame_needed = 1, uses_anonymous_args = 0
 273 00c0 80B5     		push	{r7, lr}
 274              		.cfi_def_cfa_offset 8
 275              		.cfi_offset 7, -8
 276              		.cfi_offset 14, -4
 277 00c2 00AF     		add	r7, sp, #0
 278              		.cfi_def_cfa_register 7
  63:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	init_app();
 279              		.loc 1 63 0
 280 00c4 FFF7FEFF 		bl	init_app
 281              	.L16:
  64:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	while(1)
  65:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 	{
  66:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 		*GPIO_ODR = 0x00;
 282              		.loc 1 66 0 discriminator 1
 283 00c8 064B     		ldr	r3, .L17
 284 00ca 0022     		movs	r2, #0
 285 00cc 1A70     		strb	r2, [r3]
  67:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 		delay_milli(1);
 286              		.loc 1 67 0 discriminator 1
 287 00ce 0120     		movs	r0, #1
 288 00d0 FFF7FEFF 		bl	delay_milli
  68:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 		*GPIO_ODR = 0xFF;
 289              		.loc 1 68 0 discriminator 1
 290 00d4 034B     		ldr	r3, .L17
 291 00d6 FF22     		movs	r2, #255
 292 00d8 1A70     		strb	r2, [r3]
  69:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 		delay_milli(1);
 293              		.loc 1 69 0 discriminator 1
 294 00da 0120     		movs	r0, #1
 295 00dc FFF7FEFF 		bl	delay_milli
  66:C:/Users/Maria/Documents/IT/MOP/MOP/delay\startup.c **** 		delay_milli(1);
 296              		.loc 1 66 0 discriminator 1
 297 00e0 F2E7     		b	.L16
 298              	.L18:
 299 00e2 C046     		.align	2
 300              	.L17:
 301 00e4 14100240 		.word	1073877012
 302              		.cfi_endproc
 303              	.LFE5:
 305              	.Letext0:
