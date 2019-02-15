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
  25              		.file 1 "C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display/startup.c"
   1:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** /*
   2:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c ****  * 	startup.c
   3:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c ****  *
   4:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c ****  */
   5:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   6:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
   7:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** #define GPIO_E 0x40021000
   8:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** #define GPIO_MODER ((volatile unsigned int *) (0x40021000))
   9:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** #define GPIO_OTYPER ((volatile unsigned short *) (0x40021004))
  10:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** #define GPIO_OSPEEDR ((volatile unsigned int *) (0x40021008))
  11:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** #define GPIO_PUPDR ((volatile unsigned int *) (0x4002100C))
  12:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** #define GPIO_IDR_LOW ((volatile unsigned char *) (0x40021010))
  13:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** #define GPIO_IDR_HIGH ((volatile unsigned char *) (0x40021011))
  14:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** #define GPIO_ODR_HIGH ((volatile unsigned char *) (0x40021015))
  15:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** #define GPIO_ODR_LOW ((volatile unsigned char *) (0x40021014))
  16:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
  17:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** #define STK_CTRL ((volatile unsigned int *)(0xE000E010))
  18:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** #define STK_LOAD ((volatile unsigned int *)(0xE000E014))
  19:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** #define STK_VAL ((volatile unsigned int *)(0xE000E018))
  20:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
  21:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** #define B_E 0x40
  22:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** #define B_SELECT 0x04
  23:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** #define B_RW 0x02
  24:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** #define B_RS 0x01
  25:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
  26:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void startup ( void )
  27:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
  26              		.loc 1 27 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  28:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** __asm volatile(
  31              		.loc 1 28 0
  32              		.syntax divided
  33              	@ 28 "C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  29:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  30:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	" MOV SP,R0\n"
  31:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	" BL main\n"				/* call main */
  32:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	"_exit: B .\n"				/* never return */
  33:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	) ;
  34:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
  40              		.loc 1 34 0
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
  35:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
  36:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void init_app(void)
  37:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
  57              		.loc 1 37 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  38:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*GPIO_MODER = 0x55555555;
  67              		.loc 1 38 0
  68 0004 024B     		ldr	r3, .L3
  69 0006 034A     		ldr	r2, .L3+4
  70 0008 1A60     		str	r2, [r3]
  39:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
  71              		.loc 1 39 0
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
  85              		.global	ascii_ctrl_bit_set
  86              		.syntax unified
  87              		.code	16
  88              		.thumb_func
  89              		.fpu softvfp
  91              	ascii_ctrl_bit_set:
  92              	.LFB2:
  40:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
  41:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void ascii_ctrl_bit_set(unsigned char x)
  42:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
  93              		.loc 1 42 0
  94              		.cfi_startproc
  95              		@ args = 0, pretend = 0, frame = 16
  96              		@ frame_needed = 1, uses_anonymous_args = 0
  97 0018 80B5     		push	{r7, lr}
  98              		.cfi_def_cfa_offset 8
  99              		.cfi_offset 7, -8
 100              		.cfi_offset 14, -4
 101 001a 84B0     		sub	sp, sp, #16
 102              		.cfi_def_cfa_offset 24
 103 001c 00AF     		add	r7, sp, #0
 104              		.cfi_def_cfa_register 7
 105 001e 0200     		movs	r2, r0
 106 0020 FB1D     		adds	r3, r7, #7
 107 0022 1A70     		strb	r2, [r3]
  43:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	unsigned char c;
  44:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	c = *GPIO_IDR_LOW;
 108              		.loc 1 44 0
 109 0024 0C4A     		ldr	r2, .L6
 110 0026 0F21     		movs	r1, #15
 111 0028 7B18     		adds	r3, r7, r1
 112 002a 1278     		ldrb	r2, [r2]
 113 002c 1A70     		strb	r2, [r3]
  45:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	c |= ( B_SELECT | x ); //Varför ettställa B_select?
 114              		.loc 1 45 0
 115 002e FA1D     		adds	r2, r7, #7
 116 0030 7B18     		adds	r3, r7, r1
 117 0032 1278     		ldrb	r2, [r2]
 118 0034 1B78     		ldrb	r3, [r3]
 119 0036 1343     		orrs	r3, r2
 120 0038 DAB2     		uxtb	r2, r3
 121 003a 0800     		movs	r0, r1
 122 003c 7B18     		adds	r3, r7, r1
 123 003e 0421     		movs	r1, #4
 124 0040 0A43     		orrs	r2, r1
 125 0042 1A70     		strb	r2, [r3]
  46:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*GPIO_IDR_LOW = c;
 126              		.loc 1 46 0
 127 0044 044A     		ldr	r2, .L6
 128 0046 0100     		movs	r1, r0
 129 0048 7B18     		adds	r3, r7, r1
 130 004a 1B78     		ldrb	r3, [r3]
 131 004c 1370     		strb	r3, [r2]
  47:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 132              		.loc 1 47 0
 133 004e C046     		nop
 134 0050 BD46     		mov	sp, r7
 135 0052 04B0     		add	sp, sp, #16
 136              		@ sp needed
 137 0054 80BD     		pop	{r7, pc}
 138              	.L7:
 139 0056 C046     		.align	2
 140              	.L6:
 141 0058 10100240 		.word	1073877008
 142              		.cfi_endproc
 143              	.LFE2:
 145              		.align	1
 146              		.global	ascii_ctrl_bit_clear
 147              		.syntax unified
 148              		.code	16
 149              		.thumb_func
 150              		.fpu softvfp
 152              	ascii_ctrl_bit_clear:
 153              	.LFB3:
  48:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
  49:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void ascii_ctrl_bit_clear(unsigned char x)
  50:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 154              		.loc 1 50 0
 155              		.cfi_startproc
 156              		@ args = 0, pretend = 0, frame = 16
 157              		@ frame_needed = 1, uses_anonymous_args = 0
 158 005c 80B5     		push	{r7, lr}
 159              		.cfi_def_cfa_offset 8
 160              		.cfi_offset 7, -8
 161              		.cfi_offset 14, -4
 162 005e 84B0     		sub	sp, sp, #16
 163              		.cfi_def_cfa_offset 24
 164 0060 00AF     		add	r7, sp, #0
 165              		.cfi_def_cfa_register 7
 166 0062 0200     		movs	r2, r0
 167 0064 FB1D     		adds	r3, r7, #7
 168 0066 1A70     		strb	r2, [r3]
  51:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	unsigned char c;
  52:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	c = *GPIO_IDR_LOW;
 169              		.loc 1 52 0
 170 0068 0D4A     		ldr	r2, .L9
 171 006a 0F21     		movs	r1, #15
 172 006c 7B18     		adds	r3, r7, r1
 173 006e 1278     		ldrb	r2, [r2]
 174 0070 1A70     		strb	r2, [r3]
  53:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	c &= (B_SELECT | ~x); //~ bildar 1-komplement
 175              		.loc 1 53 0
 176 0072 FB1D     		adds	r3, r7, #7
 177 0074 1B78     		ldrb	r3, [r3]
 178 0076 5BB2     		sxtb	r3, r3
 179 0078 DB43     		mvns	r3, r3
 180 007a 5BB2     		sxtb	r3, r3
 181 007c 0422     		movs	r2, #4
 182 007e 1343     		orrs	r3, r2
 183 0080 5BB2     		sxtb	r3, r3
 184 0082 7A18     		adds	r2, r7, r1
 185 0084 1278     		ldrb	r2, [r2]
 186 0086 52B2     		sxtb	r2, r2
 187 0088 1340     		ands	r3, r2
 188 008a 5AB2     		sxtb	r2, r3
 189 008c 7B18     		adds	r3, r7, r1
 190 008e 1A70     		strb	r2, [r3]
  54:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*GPIO_IDR_LOW = c;
 191              		.loc 1 54 0
 192 0090 034A     		ldr	r2, .L9
 193 0092 7B18     		adds	r3, r7, r1
 194 0094 1B78     		ldrb	r3, [r3]
 195 0096 1370     		strb	r3, [r2]
  55:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 196              		.loc 1 55 0
 197 0098 C046     		nop
 198 009a BD46     		mov	sp, r7
 199 009c 04B0     		add	sp, sp, #16
 200              		@ sp needed
 201 009e 80BD     		pop	{r7, pc}
 202              	.L10:
 203              		.align	2
 204              	.L9:
 205 00a0 10100240 		.word	1073877008
 206              		.cfi_endproc
 207              	.LFE3:
 209              		.align	1
 210              		.global	ascii_write_controller
 211              		.syntax unified
 212              		.code	16
 213              		.thumb_func
 214              		.fpu softvfp
 216              	ascii_write_controller:
 217              	.LFB4:
  56:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
  57:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void ascii_write_controller(unsigned char byte)
  58:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 218              		.loc 1 58 0
 219              		.cfi_startproc
 220              		@ args = 0, pretend = 0, frame = 8
 221              		@ frame_needed = 1, uses_anonymous_args = 0
 222 00a4 80B5     		push	{r7, lr}
 223              		.cfi_def_cfa_offset 8
 224              		.cfi_offset 7, -8
 225              		.cfi_offset 14, -4
 226 00a6 82B0     		sub	sp, sp, #8
 227              		.cfi_def_cfa_offset 16
 228 00a8 00AF     		add	r7, sp, #0
 229              		.cfi_def_cfa_register 7
 230 00aa 0200     		movs	r2, r0
 231 00ac FB1D     		adds	r3, r7, #7
 232 00ae 1A70     		strb	r2, [r3]
  59:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_set( B_E );
 233              		.loc 1 59 0
 234 00b0 4020     		movs	r0, #64
 235 00b2 FFF7FEFF 		bl	ascii_ctrl_bit_set
  60:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*GPIO_IDR_HIGH = byte;
 236              		.loc 1 60 0
 237 00b6 064A     		ldr	r2, .L12
 238 00b8 FB1D     		adds	r3, r7, #7
 239 00ba 1B78     		ldrb	r3, [r3]
 240 00bc 1370     		strb	r3, [r2]
  61:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_250ns();
 241              		.loc 1 61 0
 242 00be FFF7FEFF 		bl	delay_250ns
  62:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_clear(B_E);	//Ska delay vara före eller efter detta?
 243              		.loc 1 62 0
 244 00c2 4020     		movs	r0, #64
 245 00c4 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  63:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 246              		.loc 1 63 0
 247 00c8 C046     		nop
 248 00ca BD46     		mov	sp, r7
 249 00cc 02B0     		add	sp, sp, #8
 250              		@ sp needed
 251 00ce 80BD     		pop	{r7, pc}
 252              	.L13:
 253              		.align	2
 254              	.L12:
 255 00d0 11100240 		.word	1073877009
 256              		.cfi_endproc
 257              	.LFE4:
 259              		.align	1
 260              		.global	ascii_read_controller
 261              		.syntax unified
 262              		.code	16
 263              		.thumb_func
 264              		.fpu softvfp
 266              	ascii_read_controller:
 267              	.LFB5:
  64:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
  65:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** unsigned char ascii_read_controller(void)
  66:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 268              		.loc 1 66 0
 269              		.cfi_startproc
 270              		@ args = 0, pretend = 0, frame = 8
 271              		@ frame_needed = 1, uses_anonymous_args = 0
 272 00d4 80B5     		push	{r7, lr}
 273              		.cfi_def_cfa_offset 8
 274              		.cfi_offset 7, -8
 275              		.cfi_offset 14, -4
 276 00d6 82B0     		sub	sp, sp, #8
 277              		.cfi_def_cfa_offset 16
 278 00d8 00AF     		add	r7, sp, #0
 279              		.cfi_def_cfa_register 7
  67:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	unsigned char rv;
  68:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_set( B_E );
 280              		.loc 1 68 0
 281 00da 4020     		movs	r0, #64
 282 00dc FFF7FEFF 		bl	ascii_ctrl_bit_set
  69:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_250ns();
 283              		.loc 1 69 0
 284 00e0 FFF7FEFF 		bl	delay_250ns
  70:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_250ns();
 285              		.loc 1 70 0
 286 00e4 FFF7FEFF 		bl	delay_250ns
  71:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	rv = *GPIO_IDR_HIGH;
 287              		.loc 1 71 0
 288 00e8 064A     		ldr	r2, .L16
 289 00ea FB1D     		adds	r3, r7, #7
 290 00ec 1278     		ldrb	r2, [r2]
 291 00ee 1A70     		strb	r2, [r3]
  72:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_clear( B_E );
 292              		.loc 1 72 0
 293 00f0 4020     		movs	r0, #64
 294 00f2 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  73:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	return rv;
 295              		.loc 1 73 0
 296 00f6 FB1D     		adds	r3, r7, #7
 297 00f8 1B78     		ldrb	r3, [r3]
  74:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	
  75:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 298              		.loc 1 75 0
 299 00fa 1800     		movs	r0, r3
 300 00fc BD46     		mov	sp, r7
 301 00fe 02B0     		add	sp, sp, #8
 302              		@ sp needed
 303 0100 80BD     		pop	{r7, pc}
 304              	.L17:
 305 0102 C046     		.align	2
 306              	.L16:
 307 0104 11100240 		.word	1073877009
 308              		.cfi_endproc
 309              	.LFE5:
 311              		.align	1
 312              		.global	ascii_write_cmd
 313              		.syntax unified
 314              		.code	16
 315              		.thumb_func
 316              		.fpu softvfp
 318              	ascii_write_cmd:
 319              	.LFB6:
  76:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
  77:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void ascii_write_cmd(unsigned char command)
  78:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 320              		.loc 1 78 0
 321              		.cfi_startproc
 322              		@ args = 0, pretend = 0, frame = 8
 323              		@ frame_needed = 1, uses_anonymous_args = 0
 324 0108 80B5     		push	{r7, lr}
 325              		.cfi_def_cfa_offset 8
 326              		.cfi_offset 7, -8
 327              		.cfi_offset 14, -4
 328 010a 82B0     		sub	sp, sp, #8
 329              		.cfi_def_cfa_offset 16
 330 010c 00AF     		add	r7, sp, #0
 331              		.cfi_def_cfa_register 7
 332 010e 0200     		movs	r2, r0
 333 0110 FB1D     		adds	r3, r7, #7
 334 0112 1A70     		strb	r2, [r3]
  79:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_clear(B_RS);
 335              		.loc 1 79 0
 336 0114 0120     		movs	r0, #1
 337 0116 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  80:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_clear(B_RW);
 338              		.loc 1 80 0
 339 011a 0220     		movs	r0, #2
 340 011c FFF7FEFF 		bl	ascii_ctrl_bit_clear
  81:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_write_controller(command);
 341              		.loc 1 81 0
 342 0120 FB1D     		adds	r3, r7, #7
 343 0122 1B78     		ldrb	r3, [r3]
 344 0124 1800     		movs	r0, r3
 345 0126 FFF7FEFF 		bl	ascii_write_controller
  82:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	
  83:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 346              		.loc 1 83 0
 347 012a C046     		nop
 348 012c BD46     		mov	sp, r7
 349 012e 02B0     		add	sp, sp, #8
 350              		@ sp needed
 351 0130 80BD     		pop	{r7, pc}
 352              		.cfi_endproc
 353              	.LFE6:
 355              		.align	1
 356              		.global	ascii_write_data
 357              		.syntax unified
 358              		.code	16
 359              		.thumb_func
 360              		.fpu softvfp
 362              	ascii_write_data:
 363              	.LFB7:
  84:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
  85:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void ascii_write_data(unsigned char data)
  86:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 364              		.loc 1 86 0
 365              		.cfi_startproc
 366              		@ args = 0, pretend = 0, frame = 8
 367              		@ frame_needed = 1, uses_anonymous_args = 0
 368 0132 80B5     		push	{r7, lr}
 369              		.cfi_def_cfa_offset 8
 370              		.cfi_offset 7, -8
 371              		.cfi_offset 14, -4
 372 0134 82B0     		sub	sp, sp, #8
 373              		.cfi_def_cfa_offset 16
 374 0136 00AF     		add	r7, sp, #0
 375              		.cfi_def_cfa_register 7
 376 0138 0200     		movs	r2, r0
 377 013a FB1D     		adds	r3, r7, #7
 378 013c 1A70     		strb	r2, [r3]
  87:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_set(B_RS);
 379              		.loc 1 87 0
 380 013e 0120     		movs	r0, #1
 381 0140 FFF7FEFF 		bl	ascii_ctrl_bit_set
  88:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_clear(B_RW);
 382              		.loc 1 88 0
 383 0144 0220     		movs	r0, #2
 384 0146 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  89:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_write_controller(data);
 385              		.loc 1 89 0
 386 014a FB1D     		adds	r3, r7, #7
 387 014c 1B78     		ldrb	r3, [r3]
 388 014e 1800     		movs	r0, r3
 389 0150 FFF7FEFF 		bl	ascii_write_controller
  90:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 390              		.loc 1 90 0
 391 0154 C046     		nop
 392 0156 BD46     		mov	sp, r7
 393 0158 02B0     		add	sp, sp, #8
 394              		@ sp needed
 395 015a 80BD     		pop	{r7, pc}
 396              		.cfi_endproc
 397              	.LFE7:
 399              		.align	1
 400              		.global	ascii_read_status
 401              		.syntax unified
 402              		.code	16
 403              		.thumb_func
 404              		.fpu softvfp
 406              	ascii_read_status:
 407              	.LFB8:
  91:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
  92:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
  93:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
  94:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** unsigned char ascii_read_status(void)
  95:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 408              		.loc 1 95 0
 409              		.cfi_startproc
 410              		@ args = 0, pretend = 0, frame = 8
 411              		@ frame_needed = 1, uses_anonymous_args = 0
 412 015c 90B5     		push	{r4, r7, lr}
 413              		.cfi_def_cfa_offset 12
 414              		.cfi_offset 4, -12
 415              		.cfi_offset 7, -8
 416              		.cfi_offset 14, -4
 417 015e 83B0     		sub	sp, sp, #12
 418              		.cfi_def_cfa_offset 24
 419 0160 00AF     		add	r7, sp, #0
 420              		.cfi_def_cfa_register 7
  96:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	unsigned char rv;
  97:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*GPIO_MODER &= 0x1101;
 421              		.loc 1 97 0
 422 0162 0E4B     		ldr	r3, .L22
 423 0164 1A68     		ldr	r2, [r3]
 424 0166 0D4B     		ldr	r3, .L22
 425 0168 0D49     		ldr	r1, .L22+4
 426 016a 0A40     		ands	r2, r1
 427 016c 1A60     		str	r2, [r3]
  98:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_clear(B_RS);
 428              		.loc 1 98 0
 429 016e 0120     		movs	r0, #1
 430 0170 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  99:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_set(B_RW);
 431              		.loc 1 99 0
 432 0174 0220     		movs	r0, #2
 433 0176 FFF7FEFF 		bl	ascii_ctrl_bit_set
 100:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	rv = ascii_read_controller();
 434              		.loc 1 100 0
 435 017a FC1D     		adds	r4, r7, #7
 436 017c FFF7FEFF 		bl	ascii_read_controller
 437 0180 0300     		movs	r3, r0
 438 0182 2370     		strb	r3, [r4]
 101:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*GPIO_MODER |= 0x0050;
 439              		.loc 1 101 0
 440 0184 054B     		ldr	r3, .L22
 441 0186 1A68     		ldr	r2, [r3]
 442 0188 044B     		ldr	r3, .L22
 443 018a 5021     		movs	r1, #80
 444 018c 0A43     		orrs	r2, r1
 445 018e 1A60     		str	r2, [r3]
 102:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	return rv;
 446              		.loc 1 102 0
 447 0190 FB1D     		adds	r3, r7, #7
 448 0192 1B78     		ldrb	r3, [r3]
 103:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 449              		.loc 1 103 0
 450 0194 1800     		movs	r0, r3
 451 0196 BD46     		mov	sp, r7
 452 0198 03B0     		add	sp, sp, #12
 453              		@ sp needed
 454 019a 90BD     		pop	{r4, r7, pc}
 455              	.L23:
 456              		.align	2
 457              	.L22:
 458 019c 00100240 		.word	1073876992
 459 01a0 01110000 		.word	4353
 460              		.cfi_endproc
 461              	.LFE8:
 463              		.align	1
 464              		.global	ascii_read_data
 465              		.syntax unified
 466              		.code	16
 467              		.thumb_func
 468              		.fpu softvfp
 470              	ascii_read_data:
 471              	.LFB9:
 104:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
 105:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** unsigned char ascii_read_data(void)
 106:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 472              		.loc 1 106 0
 473              		.cfi_startproc
 474              		@ args = 0, pretend = 0, frame = 8
 475              		@ frame_needed = 1, uses_anonymous_args = 0
 476 01a4 90B5     		push	{r4, r7, lr}
 477              		.cfi_def_cfa_offset 12
 478              		.cfi_offset 4, -12
 479              		.cfi_offset 7, -8
 480              		.cfi_offset 14, -4
 481 01a6 83B0     		sub	sp, sp, #12
 482              		.cfi_def_cfa_offset 24
 483 01a8 00AF     		add	r7, sp, #0
 484              		.cfi_def_cfa_register 7
 107:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	unsigned char rv;
 108:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*GPIO_MODER &= 0x1101;
 485              		.loc 1 108 0
 486 01aa 0E4B     		ldr	r3, .L26
 487 01ac 1A68     		ldr	r2, [r3]
 488 01ae 0D4B     		ldr	r3, .L26
 489 01b0 0D49     		ldr	r1, .L26+4
 490 01b2 0A40     		ands	r2, r1
 491 01b4 1A60     		str	r2, [r3]
 109:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_set(B_RS);
 492              		.loc 1 109 0
 493 01b6 0120     		movs	r0, #1
 494 01b8 FFF7FEFF 		bl	ascii_ctrl_bit_set
 110:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_set(B_RW);
 495              		.loc 1 110 0
 496 01bc 0220     		movs	r0, #2
 497 01be FFF7FEFF 		bl	ascii_ctrl_bit_set
 111:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	rv = ascii_read_controller();
 498              		.loc 1 111 0
 499 01c2 FC1D     		adds	r4, r7, #7
 500 01c4 FFF7FEFF 		bl	ascii_read_controller
 501 01c8 0300     		movs	r3, r0
 502 01ca 2370     		strb	r3, [r4]
 112:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*GPIO_MODER |= 0x0050;
 503              		.loc 1 112 0
 504 01cc 054B     		ldr	r3, .L26
 505 01ce 1A68     		ldr	r2, [r3]
 506 01d0 044B     		ldr	r3, .L26
 507 01d2 5021     		movs	r1, #80
 508 01d4 0A43     		orrs	r2, r1
 509 01d6 1A60     		str	r2, [r3]
 113:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	return rv;
 510              		.loc 1 113 0
 511 01d8 FB1D     		adds	r3, r7, #7
 512 01da 1B78     		ldrb	r3, [r3]
 114:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 513              		.loc 1 114 0
 514 01dc 1800     		movs	r0, r3
 515 01de BD46     		mov	sp, r7
 516 01e0 03B0     		add	sp, sp, #12
 517              		@ sp needed
 518 01e2 90BD     		pop	{r4, r7, pc}
 519              	.L27:
 520              		.align	2
 521              	.L26:
 522 01e4 00100240 		.word	1073876992
 523 01e8 01110000 		.word	4353
 524              		.cfi_endproc
 525              	.LFE9:
 527              		.align	1
 528              		.global	delay_milli
 529              		.syntax unified
 530              		.code	16
 531              		.thumb_func
 532              		.fpu softvfp
 534              	delay_milli:
 535              	.LFB10:
 115:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
 116:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void delay_milli(int ms)
 117:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 536              		.loc 1 117 0
 537              		.cfi_startproc
 538              		@ args = 0, pretend = 0, frame = 8
 539              		@ frame_needed = 1, uses_anonymous_args = 0
 540 01ec 80B5     		push	{r7, lr}
 541              		.cfi_def_cfa_offset 8
 542              		.cfi_offset 7, -8
 543              		.cfi_offset 14, -4
 544 01ee 82B0     		sub	sp, sp, #8
 545              		.cfi_def_cfa_offset 16
 546 01f0 00AF     		add	r7, sp, #0
 547              		.cfi_def_cfa_register 7
 548 01f2 7860     		str	r0, [r7, #4]
 118:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_micro(10);
 549              		.loc 1 118 0
 550 01f4 0A20     		movs	r0, #10
 551 01f6 FFF7FEFF 		bl	delay_micro
 119:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 552              		.loc 1 119 0
 553 01fa C046     		nop
 554 01fc BD46     		mov	sp, r7
 555 01fe 02B0     		add	sp, sp, #8
 556              		@ sp needed
 557 0200 80BD     		pop	{r7, pc}
 558              		.cfi_endproc
 559              	.LFE10:
 561              		.global	__aeabi_idiv
 562              		.align	1
 563              		.global	delay_micro
 564              		.syntax unified
 565              		.code	16
 566              		.thumb_func
 567              		.fpu softvfp
 569              	delay_micro:
 570              	.LFB11:
 120:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
 121:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void delay_micro(int us)
 122:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 571              		.loc 1 122 0
 572              		.cfi_startproc
 573              		@ args = 0, pretend = 0, frame = 8
 574              		@ frame_needed = 1, uses_anonymous_args = 0
 575 0202 80B5     		push	{r7, lr}
 576              		.cfi_def_cfa_offset 8
 577              		.cfi_offset 7, -8
 578              		.cfi_offset 14, -4
 579 0204 82B0     		sub	sp, sp, #8
 580              		.cfi_def_cfa_offset 16
 581 0206 00AF     		add	r7, sp, #0
 582              		.cfi_def_cfa_register 7
 583 0208 7860     		str	r0, [r7, #4]
 123:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	us = us/10;
 584              		.loc 1 123 0
 585 020a 7B68     		ldr	r3, [r7, #4]
 586 020c 0A21     		movs	r1, #10
 587 020e 1800     		movs	r0, r3
 588 0210 FFF7FEFF 		bl	__aeabi_idiv
 589              	.LVL0:
 590 0214 0300     		movs	r3, r0
 591 0216 7B60     		str	r3, [r7, #4]
 124:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while(us > 0)
 592              		.loc 1 124 0
 593 0218 0AE0     		b	.L30
 594              	.L31:
 595              	.LBB2:
 125:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	{
 126:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_250ns();
 596              		.loc 1 126 0
 597 021a FFF7FEFF 		bl	delay_250ns
 127:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_250ns();
 598              		.loc 1 127 0
 599 021e FFF7FEFF 		bl	delay_250ns
 128:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_250ns();
 600              		.loc 1 128 0
 601 0222 FFF7FEFF 		bl	delay_250ns
 129:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_250ns();
 602              		.loc 1 129 0
 603 0226 FFF7FEFF 		bl	delay_250ns
 130:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	us--;
 604              		.loc 1 130 0
 605 022a 7B68     		ldr	r3, [r7, #4]
 606 022c 013B     		subs	r3, r3, #1
 607 022e 7B60     		str	r3, [r7, #4]
 608              	.L30:
 609              	.LBE2:
 124:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	{
 610              		.loc 1 124 0
 611 0230 7B68     		ldr	r3, [r7, #4]
 612 0232 002B     		cmp	r3, #0
 613 0234 F1DC     		bgt	.L31
 131:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	}
 132:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 614              		.loc 1 132 0
 615 0236 C046     		nop
 616 0238 BD46     		mov	sp, r7
 617 023a 02B0     		add	sp, sp, #8
 618              		@ sp needed
 619 023c 80BD     		pop	{r7, pc}
 620              		.cfi_endproc
 621              	.LFE11:
 623              		.align	1
 624              		.global	delay_250ns
 625              		.syntax unified
 626              		.code	16
 627              		.thumb_func
 628              		.fpu softvfp
 630              	delay_250ns:
 631              	.LFB12:
 133:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
 134:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void delay_250ns(void)
 135:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 632              		.loc 1 135 0
 633              		.cfi_startproc
 634              		@ args = 0, pretend = 0, frame = 8
 635              		@ frame_needed = 1, uses_anonymous_args = 0
 636 023e 80B5     		push	{r7, lr}
 637              		.cfi_def_cfa_offset 8
 638              		.cfi_offset 7, -8
 639              		.cfi_offset 14, -4
 640 0240 82B0     		sub	sp, sp, #8
 641              		.cfi_def_cfa_offset 16
 642 0242 00AF     		add	r7, sp, #0
 643              		.cfi_def_cfa_register 7
 136:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*STK_CTRL = 0;
 644              		.loc 1 136 0
 645 0244 0F4B     		ldr	r3, .L34
 646 0246 0022     		movs	r2, #0
 647 0248 1A60     		str	r2, [r3]
 137:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*STK_LOAD = 0x29; //0x2A - 1
 648              		.loc 1 137 0
 649 024a 0F4B     		ldr	r3, .L34+4
 650 024c 2922     		movs	r2, #41
 651 024e 1A60     		str	r2, [r3]
 138:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*STK_VAL = 0x0;
 652              		.loc 1 138 0
 653 0250 0E4B     		ldr	r3, .L34+8
 654 0252 0022     		movs	r2, #0
 655 0254 1A60     		str	r2, [r3]
 139:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*STK_CTRL = 5;
 656              		.loc 1 139 0
 657 0256 0B4B     		ldr	r3, .L34
 658 0258 0522     		movs	r2, #5
 659 025a 1A60     		str	r2, [r3]
 140:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	unsigned int ctrl = *STK_CTRL & 0x10000;
 660              		.loc 1 140 0
 661 025c 094B     		ldr	r3, .L34
 662 025e 1A68     		ldr	r2, [r3]
 663 0260 8023     		movs	r3, #128
 664 0262 5B02     		lsls	r3, r3, #9
 665 0264 1340     		ands	r3, r2
 666 0266 7B60     		str	r3, [r7, #4]
 141:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while((*STK_CTRL & 0x10000) == 0);
 667              		.loc 1 141 0
 668 0268 C046     		nop
 669              	.L33:
 670              		.loc 1 141 0 is_stmt 0 discriminator 1
 671 026a 064B     		ldr	r3, .L34
 672 026c 1A68     		ldr	r2, [r3]
 673 026e 8023     		movs	r3, #128
 674 0270 5B02     		lsls	r3, r3, #9
 675 0272 1340     		ands	r3, r2
 676 0274 F9D0     		beq	.L33
 142:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*STK_CTRL= 0;
 677              		.loc 1 142 0 is_stmt 1
 678 0276 034B     		ldr	r3, .L34
 679 0278 0022     		movs	r2, #0
 680 027a 1A60     		str	r2, [r3]
 143:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	
 144:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 681              		.loc 1 144 0
 682 027c C046     		nop
 683 027e BD46     		mov	sp, r7
 684 0280 02B0     		add	sp, sp, #8
 685              		@ sp needed
 686 0282 80BD     		pop	{r7, pc}
 687              	.L35:
 688              		.align	2
 689              	.L34:
 690 0284 10E000E0 		.word	-536813552
 691 0288 14E000E0 		.word	-536813548
 692 028c 18E000E0 		.word	-536813544
 693              		.cfi_endproc
 694              	.LFE12:
 696              		.align	1
 697              		.global	ascii_write_char
 698              		.syntax unified
 699              		.code	16
 700              		.thumb_func
 701              		.fpu softvfp
 703              	ascii_write_char:
 704              	.LFB13:
 145:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
 146:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void ascii_write_char(unsigned char c)
 147:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 705              		.loc 1 147 0
 706              		.cfi_startproc
 707              		@ args = 0, pretend = 0, frame = 8
 708              		@ frame_needed = 1, uses_anonymous_args = 0
 709 0290 80B5     		push	{r7, lr}
 710              		.cfi_def_cfa_offset 8
 711              		.cfi_offset 7, -8
 712              		.cfi_offset 14, -4
 713 0292 82B0     		sub	sp, sp, #8
 714              		.cfi_def_cfa_offset 16
 715 0294 00AF     		add	r7, sp, #0
 716              		.cfi_def_cfa_register 7
 717 0296 0200     		movs	r2, r0
 718 0298 FB1D     		adds	r3, r7, #7
 719 029a 1A70     		strb	r2, [r3]
 148:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while((ascii_read_status() & 0x80) == 0x80){}
 720              		.loc 1 148 0
 721 029c C046     		nop
 722              	.L37:
 723              		.loc 1 148 0 is_stmt 0 discriminator 1
 724 029e FFF7FEFF 		bl	ascii_read_status
 725 02a2 0300     		movs	r3, r0
 726 02a4 1A00     		movs	r2, r3
 727 02a6 8023     		movs	r3, #128
 728 02a8 1340     		ands	r3, r2
 729 02aa 802B     		cmp	r3, #128
 730 02ac F7D0     		beq	.L37
 149:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_micro(8);
 731              		.loc 1 149 0 is_stmt 1
 732 02ae 0820     		movs	r0, #8
 733 02b0 FFF7FEFF 		bl	delay_micro
 150:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_write_data(c);
 734              		.loc 1 150 0
 735 02b4 FB1D     		adds	r3, r7, #7
 736 02b6 1B78     		ldrb	r3, [r3]
 737 02b8 1800     		movs	r0, r3
 738 02ba FFF7FEFF 		bl	ascii_write_data
 151:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_micro(45);
 739              		.loc 1 151 0
 740 02be 2D20     		movs	r0, #45
 741 02c0 FFF7FEFF 		bl	delay_micro
 152:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 742              		.loc 1 152 0
 743 02c4 C046     		nop
 744 02c6 BD46     		mov	sp, r7
 745 02c8 02B0     		add	sp, sp, #8
 746              		@ sp needed
 747 02ca 80BD     		pop	{r7, pc}
 748              		.cfi_endproc
 749              	.LFE13:
 751              		.align	1
 752              		.global	ascii_gotoxy
 753              		.syntax unified
 754              		.code	16
 755              		.thumb_func
 756              		.fpu softvfp
 758              	ascii_gotoxy:
 759              	.LFB14:
 153:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
 154:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void ascii_gotoxy(int row, int col)
 155:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 760              		.loc 1 155 0
 761              		.cfi_startproc
 762              		@ args = 0, pretend = 0, frame = 16
 763              		@ frame_needed = 1, uses_anonymous_args = 0
 764 02cc 80B5     		push	{r7, lr}
 765              		.cfi_def_cfa_offset 8
 766              		.cfi_offset 7, -8
 767              		.cfi_offset 14, -4
 768 02ce 84B0     		sub	sp, sp, #16
 769              		.cfi_def_cfa_offset 24
 770 02d0 00AF     		add	r7, sp, #0
 771              		.cfi_def_cfa_register 7
 772 02d2 7860     		str	r0, [r7, #4]
 773 02d4 3960     		str	r1, [r7]
 156:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	unsigned int adress;
 157:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	adress = row -1;
 774              		.loc 1 157 0
 775 02d6 7B68     		ldr	r3, [r7, #4]
 776 02d8 013B     		subs	r3, r3, #1
 777 02da FB60     		str	r3, [r7, #12]
 158:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	if(col == 2)
 778              		.loc 1 158 0
 779 02dc 3B68     		ldr	r3, [r7]
 780 02de 022B     		cmp	r3, #2
 781 02e0 02D1     		bne	.L39
 159:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	{
 160:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 		adress = adress + 0x40;
 782              		.loc 1 160 0
 783 02e2 FB68     		ldr	r3, [r7, #12]
 784 02e4 4033     		adds	r3, r3, #64
 785 02e6 FB60     		str	r3, [r7, #12]
 786              	.L39:
 161:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	}
 162:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_write_cmd(0x80|adress);
 787              		.loc 1 162 0
 788 02e8 FB68     		ldr	r3, [r7, #12]
 789 02ea DBB2     		uxtb	r3, r3
 790 02ec 8022     		movs	r2, #128
 791 02ee 5242     		rsbs	r2, r2, #0
 792 02f0 1343     		orrs	r3, r2
 793 02f2 DBB2     		uxtb	r3, r3
 794 02f4 1800     		movs	r0, r3
 795 02f6 FFF7FEFF 		bl	ascii_write_cmd
 163:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 796              		.loc 1 163 0
 797 02fa C046     		nop
 798 02fc BD46     		mov	sp, r7
 799 02fe 04B0     		add	sp, sp, #16
 800              		@ sp needed
 801 0300 80BD     		pop	{r7, pc}
 802              		.cfi_endproc
 803              	.LFE14:
 805              		.align	1
 806              		.global	ascii_init
 807              		.syntax unified
 808              		.code	16
 809              		.thumb_func
 810              		.fpu softvfp
 812              	ascii_init:
 813              	.LFB15:
 164:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
 165:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void ascii_init(void)
 166:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 814              		.loc 1 166 0
 815              		.cfi_startproc
 816              		@ args = 0, pretend = 0, frame = 0
 817              		@ frame_needed = 1, uses_anonymous_args = 0
 818 0302 80B5     		push	{r7, lr}
 819              		.cfi_def_cfa_offset 8
 820              		.cfi_offset 7, -8
 821              		.cfi_offset 14, -4
 822 0304 00AF     		add	r7, sp, #0
 823              		.cfi_def_cfa_register 7
 167:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while((ascii_read_status() & 0x80) == 0x80){}
 824              		.loc 1 167 0
 825 0306 C046     		nop
 826              	.L41:
 827              		.loc 1 167 0 is_stmt 0 discriminator 1
 828 0308 FFF7FEFF 		bl	ascii_read_status
 829 030c 0300     		movs	r3, r0
 830 030e 1A00     		movs	r2, r3
 831 0310 8023     		movs	r3, #128
 832 0312 1340     		ands	r3, r2
 833 0314 802B     		cmp	r3, #128
 834 0316 F7D0     		beq	.L41
 168:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_micro(8);
 835              		.loc 1 168 0 is_stmt 1
 836 0318 0820     		movs	r0, #8
 837 031a FFF7FEFF 		bl	delay_micro
 169:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_write_cmd(00111000);
 838              		.loc 1 169 0
 839 031e 0020     		movs	r0, #0
 840 0320 FFF7FEFF 		bl	ascii_write_cmd
 170:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_micro(40);
 841              		.loc 1 170 0
 842 0324 2820     		movs	r0, #40
 843 0326 FFF7FEFF 		bl	delay_micro
 171:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	
 172:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while((ascii_read_status() & 0x80) == 0x80){}
 844              		.loc 1 172 0
 845 032a C046     		nop
 846              	.L42:
 847              		.loc 1 172 0 is_stmt 0 discriminator 1
 848 032c FFF7FEFF 		bl	ascii_read_status
 849 0330 0300     		movs	r3, r0
 850 0332 1A00     		movs	r2, r3
 851 0334 8023     		movs	r3, #128
 852 0336 1340     		ands	r3, r2
 853 0338 802B     		cmp	r3, #128
 854 033a F7D0     		beq	.L42
 173:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_micro(8);
 855              		.loc 1 173 0 is_stmt 1
 856 033c 0820     		movs	r0, #8
 857 033e FFF7FEFF 		bl	delay_micro
 174:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_write_cmd(00001110);
 858              		.loc 1 174 0
 859 0342 4820     		movs	r0, #72
 860 0344 FFF7FEFF 		bl	ascii_write_cmd
 175:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_micro(40);
 861              		.loc 1 175 0
 862 0348 2820     		movs	r0, #40
 863 034a FFF7FEFF 		bl	delay_micro
 176:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	
 177:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while((ascii_read_status() & 0x80) == 0x80){}
 864              		.loc 1 177 0
 865 034e C046     		nop
 866              	.L43:
 867              		.loc 1 177 0 is_stmt 0 discriminator 1
 868 0350 FFF7FEFF 		bl	ascii_read_status
 869 0354 0300     		movs	r3, r0
 870 0356 1A00     		movs	r2, r3
 871 0358 8023     		movs	r3, #128
 872 035a 1340     		ands	r3, r2
 873 035c 802B     		cmp	r3, #128
 874 035e F7D0     		beq	.L43
 178:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_micro(8);
 875              		.loc 1 178 0 is_stmt 1
 876 0360 0820     		movs	r0, #8
 877 0362 FFF7FEFF 		bl	delay_micro
 179:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_write_cmd(1);
 878              		.loc 1 179 0
 879 0366 0120     		movs	r0, #1
 880 0368 FFF7FEFF 		bl	ascii_write_cmd
 180:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_milli(2);
 881              		.loc 1 180 0
 882 036c 0220     		movs	r0, #2
 883 036e FFF7FEFF 		bl	delay_milli
 181:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	
 182:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while((ascii_read_status() & 0x80) == 0x80){}
 884              		.loc 1 182 0
 885 0372 C046     		nop
 886              	.L44:
 887              		.loc 1 182 0 is_stmt 0 discriminator 1
 888 0374 FFF7FEFF 		bl	ascii_read_status
 889 0378 0300     		movs	r3, r0
 890 037a 1A00     		movs	r2, r3
 891 037c 8023     		movs	r3, #128
 892 037e 1340     		ands	r3, r2
 893 0380 802B     		cmp	r3, #128
 894 0382 F7D0     		beq	.L44
 183:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_micro(8);
 895              		.loc 1 183 0 is_stmt 1
 896 0384 0820     		movs	r0, #8
 897 0386 FFF7FEFF 		bl	delay_micro
 184:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_write_cmd(00000100); //Rätt? Increment?
 898              		.loc 1 184 0
 899 038a 4020     		movs	r0, #64
 900 038c FFF7FEFF 		bl	ascii_write_cmd
 185:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_micro(39);
 901              		.loc 1 185 0
 902 0390 2720     		movs	r0, #39
 903 0392 FFF7FEFF 		bl	delay_micro
 186:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 904              		.loc 1 186 0
 905 0396 C046     		nop
 906 0398 BD46     		mov	sp, r7
 907              		@ sp needed
 908 039a 80BD     		pop	{r7, pc}
 909              		.cfi_endproc
 910              	.LFE15:
 912              		.section	.rodata
 913              		.align	2
 914              	.LC0:
 915 0000 416C6661 		.ascii	"Alfanumerisk \000"
 915      6E756D65 
 915      7269736B 
 915      2000
 916 000e 0000     		.align	2
 917              	.LC2:
 918 0010 44697370 		.ascii	"Display - test\000"
 918      6C617920 
 918      2D207465 
 918      737400
 919              		.text
 920              		.align	1
 921              		.global	main
 922              		.syntax unified
 923              		.code	16
 924              		.thumb_func
 925              		.fpu softvfp
 927              	main:
 928              	.LFB16:
 187:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
 188:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** int main(int argc, char **argv)
 189:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 929              		.loc 1 189 0
 930              		.cfi_startproc
 931              		@ args = 0, pretend = 0, frame = 48
 932              		@ frame_needed = 1, uses_anonymous_args = 0
 933 039c B0B5     		push	{r4, r5, r7, lr}
 934              		.cfi_def_cfa_offset 16
 935              		.cfi_offset 4, -16
 936              		.cfi_offset 5, -12
 937              		.cfi_offset 7, -8
 938              		.cfi_offset 14, -4
 939 039e 8CB0     		sub	sp, sp, #48
 940              		.cfi_def_cfa_offset 64
 941 03a0 00AF     		add	r7, sp, #0
 942              		.cfi_def_cfa_register 7
 943 03a2 7860     		str	r0, [r7, #4]
 944 03a4 3960     		str	r1, [r7]
 190:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	char *s;
 191:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	char test1[] = "Alfanumerisk ";
 945              		.loc 1 191 0
 946 03a6 1C24     		movs	r4, #28
 947 03a8 3B19     		adds	r3, r7, r4
 948 03aa 1E4A     		ldr	r2, .L51
 949 03ac 23CA     		ldmia	r2!, {r0, r1, r5}
 950 03ae 23C3     		stmia	r3!, {r0, r1, r5}
 951 03b0 1288     		ldrh	r2, [r2]
 952 03b2 1A80     		strh	r2, [r3]
 192:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	char test2[] = "Display - test";
 953              		.loc 1 192 0
 954 03b4 0C23     		movs	r3, #12
 955 03b6 FB18     		adds	r3, r7, r3
 956 03b8 1B4A     		ldr	r2, .L51+4
 957 03ba 23CA     		ldmia	r2!, {r0, r1, r5}
 958 03bc 23C3     		stmia	r3!, {r0, r1, r5}
 959 03be 1188     		ldrh	r1, [r2]
 960 03c0 1980     		strh	r1, [r3]
 961 03c2 9278     		ldrb	r2, [r2, #2]
 962 03c4 9A70     		strb	r2, [r3, #2]
 193:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	
 194:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	init_app();
 963              		.loc 1 194 0
 964 03c6 FFF7FEFF 		bl	init_app
 195:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_init();
 965              		.loc 1 195 0
 966 03ca FFF7FEFF 		bl	ascii_init
 196:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_gotoxy(1,1);
 967              		.loc 1 196 0
 968 03ce 0121     		movs	r1, #1
 969 03d0 0120     		movs	r0, #1
 970 03d2 FFF7FEFF 		bl	ascii_gotoxy
 197:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	s = test1;
 971              		.loc 1 197 0
 972 03d6 3B19     		adds	r3, r7, r4
 973 03d8 FB62     		str	r3, [r7, #44]
 198:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while(*s)
 974              		.loc 1 198 0
 975 03da 06E0     		b	.L46
 976              	.L47:
 199:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	{
 200:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 		ascii_write_char(*s++);
 977              		.loc 1 200 0
 978 03dc FB6A     		ldr	r3, [r7, #44]
 979 03de 5A1C     		adds	r2, r3, #1
 980 03e0 FA62     		str	r2, [r7, #44]
 981 03e2 1B78     		ldrb	r3, [r3]
 982 03e4 1800     		movs	r0, r3
 983 03e6 FFF7FEFF 		bl	ascii_write_char
 984              	.L46:
 198:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while(*s)
 985              		.loc 1 198 0
 986 03ea FB6A     		ldr	r3, [r7, #44]
 987 03ec 1B78     		ldrb	r3, [r3]
 988 03ee 002B     		cmp	r3, #0
 989 03f0 F4D1     		bne	.L47
 201:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	}
 202:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_gotoxy(1,2);
 990              		.loc 1 202 0
 991 03f2 0221     		movs	r1, #2
 992 03f4 0120     		movs	r0, #1
 993 03f6 FFF7FEFF 		bl	ascii_gotoxy
 203:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	s = test2;
 994              		.loc 1 203 0
 995 03fa 0C23     		movs	r3, #12
 996 03fc FB18     		adds	r3, r7, r3
 997 03fe FB62     		str	r3, [r7, #44]
 204:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while(*s)
 998              		.loc 1 204 0
 999 0400 06E0     		b	.L48
 1000              	.L49:
 205:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	{
 206:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 		ascii_write_char(*s++);
 1001              		.loc 1 206 0
 1002 0402 FB6A     		ldr	r3, [r7, #44]
 1003 0404 5A1C     		adds	r2, r3, #1
 1004 0406 FA62     		str	r2, [r7, #44]
 1005 0408 1B78     		ldrb	r3, [r3]
 1006 040a 1800     		movs	r0, r3
 1007 040c FFF7FEFF 		bl	ascii_write_char
 1008              	.L48:
 204:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while(*s)
 1009              		.loc 1 204 0
 1010 0410 FB6A     		ldr	r3, [r7, #44]
 1011 0412 1B78     		ldrb	r3, [r3]
 1012 0414 002B     		cmp	r3, #0
 1013 0416 F4D1     		bne	.L49
 207:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	}
 208:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	return 0;
 1014              		.loc 1 208 0
 1015 0418 0023     		movs	r3, #0
 209:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	
 210:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 1016              		.loc 1 210 0
 1017 041a 1800     		movs	r0, r3
 1018 041c BD46     		mov	sp, r7
 1019 041e 0CB0     		add	sp, sp, #48
 1020              		@ sp needed
 1021 0420 B0BD     		pop	{r4, r5, r7, pc}
 1022              	.L52:
 1023 0422 C046     		.align	2
 1024              	.L51:
 1025 0424 00000000 		.word	.LC0
 1026 0428 10000000 		.word	.LC2
 1027              		.cfi_endproc
 1028              	.LFE16:
 1030              	.Letext0:
