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
   2:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c ****  * 	startup.c ASCII DISPLAY
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
  68 0004 044B     		ldr	r3, .L3
  69 0006 054A     		ldr	r2, .L3+4
  70 0008 1A60     		str	r2, [r3]
  39:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*GPIO_OTYPER = 0x00000000;
  71              		.loc 1 39 0
  72 000a 054B     		ldr	r3, .L3+8
  73 000c 0022     		movs	r2, #0
  74 000e 1A80     		strh	r2, [r3]
  40:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
  75              		.loc 1 40 0
  76 0010 C046     		nop
  77 0012 BD46     		mov	sp, r7
  78              		@ sp needed
  79 0014 80BD     		pop	{r7, pc}
  80              	.L4:
  81 0016 C046     		.align	2
  82              	.L3:
  83 0018 00100240 		.word	1073876992
  84 001c 55555555 		.word	1431655765
  85 0020 04100240 		.word	1073876996
  86              		.cfi_endproc
  87              	.LFE1:
  89              		.align	1
  90              		.global	ascii_ctrl_bit_set
  91              		.syntax unified
  92              		.code	16
  93              		.thumb_func
  94              		.fpu softvfp
  96              	ascii_ctrl_bit_set:
  97              	.LFB2:
  41:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
  42:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void ascii_ctrl_bit_set(unsigned char x)
  43:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
  98              		.loc 1 43 0
  99              		.cfi_startproc
 100              		@ args = 0, pretend = 0, frame = 16
 101              		@ frame_needed = 1, uses_anonymous_args = 0
 102 0024 80B5     		push	{r7, lr}
 103              		.cfi_def_cfa_offset 8
 104              		.cfi_offset 7, -8
 105              		.cfi_offset 14, -4
 106 0026 84B0     		sub	sp, sp, #16
 107              		.cfi_def_cfa_offset 24
 108 0028 00AF     		add	r7, sp, #0
 109              		.cfi_def_cfa_register 7
 110 002a 0200     		movs	r2, r0
 111 002c FB1D     		adds	r3, r7, #7
 112 002e 1A70     		strb	r2, [r3]
  44:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	unsigned char c;
  45:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	c = *GPIO_ODR_LOW;
 113              		.loc 1 45 0
 114 0030 0C4A     		ldr	r2, .L6
 115 0032 0F21     		movs	r1, #15
 116 0034 7B18     		adds	r3, r7, r1
 117 0036 1278     		ldrb	r2, [r2]
 118 0038 1A70     		strb	r2, [r3]
  46:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	c |= ( B_SELECT | x ); //Varför ettställa B_select?
 119              		.loc 1 46 0
 120 003a FA1D     		adds	r2, r7, #7
 121 003c 7B18     		adds	r3, r7, r1
 122 003e 1278     		ldrb	r2, [r2]
 123 0040 1B78     		ldrb	r3, [r3]
 124 0042 1343     		orrs	r3, r2
 125 0044 DAB2     		uxtb	r2, r3
 126 0046 0800     		movs	r0, r1
 127 0048 7B18     		adds	r3, r7, r1
 128 004a 0421     		movs	r1, #4
 129 004c 0A43     		orrs	r2, r1
 130 004e 1A70     		strb	r2, [r3]
  47:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*GPIO_ODR_LOW = c;
 131              		.loc 1 47 0
 132 0050 044A     		ldr	r2, .L6
 133 0052 0100     		movs	r1, r0
 134 0054 7B18     		adds	r3, r7, r1
 135 0056 1B78     		ldrb	r3, [r3]
 136 0058 1370     		strb	r3, [r2]
  48:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 137              		.loc 1 48 0
 138 005a C046     		nop
 139 005c BD46     		mov	sp, r7
 140 005e 04B0     		add	sp, sp, #16
 141              		@ sp needed
 142 0060 80BD     		pop	{r7, pc}
 143              	.L7:
 144 0062 C046     		.align	2
 145              	.L6:
 146 0064 14100240 		.word	1073877012
 147              		.cfi_endproc
 148              	.LFE2:
 150              		.align	1
 151              		.global	ascii_ctrl_bit_clear
 152              		.syntax unified
 153              		.code	16
 154              		.thumb_func
 155              		.fpu softvfp
 157              	ascii_ctrl_bit_clear:
 158              	.LFB3:
  49:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
  50:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void ascii_ctrl_bit_clear(unsigned char x)
  51:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 159              		.loc 1 51 0
 160              		.cfi_startproc
 161              		@ args = 0, pretend = 0, frame = 16
 162              		@ frame_needed = 1, uses_anonymous_args = 0
 163 0068 80B5     		push	{r7, lr}
 164              		.cfi_def_cfa_offset 8
 165              		.cfi_offset 7, -8
 166              		.cfi_offset 14, -4
 167 006a 84B0     		sub	sp, sp, #16
 168              		.cfi_def_cfa_offset 24
 169 006c 00AF     		add	r7, sp, #0
 170              		.cfi_def_cfa_register 7
 171 006e 0200     		movs	r2, r0
 172 0070 FB1D     		adds	r3, r7, #7
 173 0072 1A70     		strb	r2, [r3]
  52:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	unsigned char c;
  53:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	c = *GPIO_ODR_LOW;
 174              		.loc 1 53 0
 175 0074 0D4A     		ldr	r2, .L9
 176 0076 0F21     		movs	r1, #15
 177 0078 7B18     		adds	r3, r7, r1
 178 007a 1278     		ldrb	r2, [r2]
 179 007c 1A70     		strb	r2, [r3]
  54:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	c &= (B_SELECT | ~x); //~ bildar 1-komplement
 180              		.loc 1 54 0
 181 007e FB1D     		adds	r3, r7, #7
 182 0080 1B78     		ldrb	r3, [r3]
 183 0082 5BB2     		sxtb	r3, r3
 184 0084 DB43     		mvns	r3, r3
 185 0086 5BB2     		sxtb	r3, r3
 186 0088 0422     		movs	r2, #4
 187 008a 1343     		orrs	r3, r2
 188 008c 5BB2     		sxtb	r3, r3
 189 008e 7A18     		adds	r2, r7, r1
 190 0090 1278     		ldrb	r2, [r2]
 191 0092 52B2     		sxtb	r2, r2
 192 0094 1340     		ands	r3, r2
 193 0096 5AB2     		sxtb	r2, r3
 194 0098 7B18     		adds	r3, r7, r1
 195 009a 1A70     		strb	r2, [r3]
  55:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*GPIO_ODR_LOW = c;
 196              		.loc 1 55 0
 197 009c 034A     		ldr	r2, .L9
 198 009e 7B18     		adds	r3, r7, r1
 199 00a0 1B78     		ldrb	r3, [r3]
 200 00a2 1370     		strb	r3, [r2]
  56:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 201              		.loc 1 56 0
 202 00a4 C046     		nop
 203 00a6 BD46     		mov	sp, r7
 204 00a8 04B0     		add	sp, sp, #16
 205              		@ sp needed
 206 00aa 80BD     		pop	{r7, pc}
 207              	.L10:
 208              		.align	2
 209              	.L9:
 210 00ac 14100240 		.word	1073877012
 211              		.cfi_endproc
 212              	.LFE3:
 214              		.align	1
 215              		.global	ascii_write_controller
 216              		.syntax unified
 217              		.code	16
 218              		.thumb_func
 219              		.fpu softvfp
 221              	ascii_write_controller:
 222              	.LFB4:
  57:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
  58:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void ascii_write_controller(unsigned char byte)
  59:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 223              		.loc 1 59 0
 224              		.cfi_startproc
 225              		@ args = 0, pretend = 0, frame = 8
 226              		@ frame_needed = 1, uses_anonymous_args = 0
 227 00b0 80B5     		push	{r7, lr}
 228              		.cfi_def_cfa_offset 8
 229              		.cfi_offset 7, -8
 230              		.cfi_offset 14, -4
 231 00b2 82B0     		sub	sp, sp, #8
 232              		.cfi_def_cfa_offset 16
 233 00b4 00AF     		add	r7, sp, #0
 234              		.cfi_def_cfa_register 7
 235 00b6 0200     		movs	r2, r0
 236 00b8 FB1D     		adds	r3, r7, #7
 237 00ba 1A70     		strb	r2, [r3]
  60:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_set( B_E );
 238              		.loc 1 60 0
 239 00bc 4020     		movs	r0, #64
 240 00be FFF7FEFF 		bl	ascii_ctrl_bit_set
  61:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*GPIO_ODR_HIGH = byte;
 241              		.loc 1 61 0
 242 00c2 064A     		ldr	r2, .L12
 243 00c4 FB1D     		adds	r3, r7, #7
 244 00c6 1B78     		ldrb	r3, [r3]
 245 00c8 1370     		strb	r3, [r2]
  62:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_250ns();
 246              		.loc 1 62 0
 247 00ca FFF7FEFF 		bl	delay_250ns
  63:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_clear(B_E);	//Ska delay vara före eller efter detta?
 248              		.loc 1 63 0
 249 00ce 4020     		movs	r0, #64
 250 00d0 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  64:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 251              		.loc 1 64 0
 252 00d4 C046     		nop
 253 00d6 BD46     		mov	sp, r7
 254 00d8 02B0     		add	sp, sp, #8
 255              		@ sp needed
 256 00da 80BD     		pop	{r7, pc}
 257              	.L13:
 258              		.align	2
 259              	.L12:
 260 00dc 15100240 		.word	1073877013
 261              		.cfi_endproc
 262              	.LFE4:
 264              		.align	1
 265              		.global	ascii_read_controller
 266              		.syntax unified
 267              		.code	16
 268              		.thumb_func
 269              		.fpu softvfp
 271              	ascii_read_controller:
 272              	.LFB5:
  65:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
  66:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** unsigned char ascii_read_controller(void)
  67:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 273              		.loc 1 67 0
 274              		.cfi_startproc
 275              		@ args = 0, pretend = 0, frame = 8
 276              		@ frame_needed = 1, uses_anonymous_args = 0
 277 00e0 80B5     		push	{r7, lr}
 278              		.cfi_def_cfa_offset 8
 279              		.cfi_offset 7, -8
 280              		.cfi_offset 14, -4
 281 00e2 82B0     		sub	sp, sp, #8
 282              		.cfi_def_cfa_offset 16
 283 00e4 00AF     		add	r7, sp, #0
 284              		.cfi_def_cfa_register 7
  68:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	unsigned char rv;
  69:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_set( B_E );
 285              		.loc 1 69 0
 286 00e6 4020     		movs	r0, #64
 287 00e8 FFF7FEFF 		bl	ascii_ctrl_bit_set
  70:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_250ns();
 288              		.loc 1 70 0
 289 00ec FFF7FEFF 		bl	delay_250ns
  71:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_250ns();
 290              		.loc 1 71 0
 291 00f0 FFF7FEFF 		bl	delay_250ns
  72:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	rv = *GPIO_IDR_HIGH;
 292              		.loc 1 72 0
 293 00f4 064A     		ldr	r2, .L16
 294 00f6 FB1D     		adds	r3, r7, #7
 295 00f8 1278     		ldrb	r2, [r2]
 296 00fa 1A70     		strb	r2, [r3]
  73:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_clear( B_E );
 297              		.loc 1 73 0
 298 00fc 4020     		movs	r0, #64
 299 00fe FFF7FEFF 		bl	ascii_ctrl_bit_clear
  74:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	return rv;
 300              		.loc 1 74 0
 301 0102 FB1D     		adds	r3, r7, #7
 302 0104 1B78     		ldrb	r3, [r3]
  75:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	
  76:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 303              		.loc 1 76 0
 304 0106 1800     		movs	r0, r3
 305 0108 BD46     		mov	sp, r7
 306 010a 02B0     		add	sp, sp, #8
 307              		@ sp needed
 308 010c 80BD     		pop	{r7, pc}
 309              	.L17:
 310 010e C046     		.align	2
 311              	.L16:
 312 0110 11100240 		.word	1073877009
 313              		.cfi_endproc
 314              	.LFE5:
 316              		.align	1
 317              		.global	ascii_write_cmd
 318              		.syntax unified
 319              		.code	16
 320              		.thumb_func
 321              		.fpu softvfp
 323              	ascii_write_cmd:
 324              	.LFB6:
  77:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
  78:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void ascii_write_cmd(unsigned char command)
  79:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 325              		.loc 1 79 0
 326              		.cfi_startproc
 327              		@ args = 0, pretend = 0, frame = 8
 328              		@ frame_needed = 1, uses_anonymous_args = 0
 329 0114 80B5     		push	{r7, lr}
 330              		.cfi_def_cfa_offset 8
 331              		.cfi_offset 7, -8
 332              		.cfi_offset 14, -4
 333 0116 82B0     		sub	sp, sp, #8
 334              		.cfi_def_cfa_offset 16
 335 0118 00AF     		add	r7, sp, #0
 336              		.cfi_def_cfa_register 7
 337 011a 0200     		movs	r2, r0
 338 011c FB1D     		adds	r3, r7, #7
 339 011e 1A70     		strb	r2, [r3]
  80:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_clear(B_RS);
 340              		.loc 1 80 0
 341 0120 0120     		movs	r0, #1
 342 0122 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  81:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_clear(B_RW);
 343              		.loc 1 81 0
 344 0126 0220     		movs	r0, #2
 345 0128 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  82:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_write_controller(command);
 346              		.loc 1 82 0
 347 012c FB1D     		adds	r3, r7, #7
 348 012e 1B78     		ldrb	r3, [r3]
 349 0130 1800     		movs	r0, r3
 350 0132 FFF7FEFF 		bl	ascii_write_controller
  83:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	
  84:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 351              		.loc 1 84 0
 352 0136 C046     		nop
 353 0138 BD46     		mov	sp, r7
 354 013a 02B0     		add	sp, sp, #8
 355              		@ sp needed
 356 013c 80BD     		pop	{r7, pc}
 357              		.cfi_endproc
 358              	.LFE6:
 360              		.align	1
 361              		.global	ascii_write_data
 362              		.syntax unified
 363              		.code	16
 364              		.thumb_func
 365              		.fpu softvfp
 367              	ascii_write_data:
 368              	.LFB7:
  85:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
  86:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void ascii_write_data(unsigned char data)
  87:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 369              		.loc 1 87 0
 370              		.cfi_startproc
 371              		@ args = 0, pretend = 0, frame = 8
 372              		@ frame_needed = 1, uses_anonymous_args = 0
 373 013e 80B5     		push	{r7, lr}
 374              		.cfi_def_cfa_offset 8
 375              		.cfi_offset 7, -8
 376              		.cfi_offset 14, -4
 377 0140 82B0     		sub	sp, sp, #8
 378              		.cfi_def_cfa_offset 16
 379 0142 00AF     		add	r7, sp, #0
 380              		.cfi_def_cfa_register 7
 381 0144 0200     		movs	r2, r0
 382 0146 FB1D     		adds	r3, r7, #7
 383 0148 1A70     		strb	r2, [r3]
  88:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_set(B_RS);
 384              		.loc 1 88 0
 385 014a 0120     		movs	r0, #1
 386 014c FFF7FEFF 		bl	ascii_ctrl_bit_set
  89:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_clear(B_RW);
 387              		.loc 1 89 0
 388 0150 0220     		movs	r0, #2
 389 0152 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  90:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_write_controller(data);
 390              		.loc 1 90 0
 391 0156 FB1D     		adds	r3, r7, #7
 392 0158 1B78     		ldrb	r3, [r3]
 393 015a 1800     		movs	r0, r3
 394 015c FFF7FEFF 		bl	ascii_write_controller
  91:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 395              		.loc 1 91 0
 396 0160 C046     		nop
 397 0162 BD46     		mov	sp, r7
 398 0164 02B0     		add	sp, sp, #8
 399              		@ sp needed
 400 0166 80BD     		pop	{r7, pc}
 401              		.cfi_endproc
 402              	.LFE7:
 404              		.align	1
 405              		.global	ascii_read_status
 406              		.syntax unified
 407              		.code	16
 408              		.thumb_func
 409              		.fpu softvfp
 411              	ascii_read_status:
 412              	.LFB8:
  92:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
  93:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
  94:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
  95:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** unsigned char ascii_read_status(void)
  96:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 413              		.loc 1 96 0
 414              		.cfi_startproc
 415              		@ args = 0, pretend = 0, frame = 8
 416              		@ frame_needed = 1, uses_anonymous_args = 0
 417 0168 90B5     		push	{r4, r7, lr}
 418              		.cfi_def_cfa_offset 12
 419              		.cfi_offset 4, -12
 420              		.cfi_offset 7, -8
 421              		.cfi_offset 14, -4
 422 016a 83B0     		sub	sp, sp, #12
 423              		.cfi_def_cfa_offset 24
 424 016c 00AF     		add	r7, sp, #0
 425              		.cfi_def_cfa_register 7
  97:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	unsigned char rv;
  98:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*GPIO_MODER &= 0x00005555;
 426              		.loc 1 98 0
 427 016e 0E4B     		ldr	r3, .L22
 428 0170 1A68     		ldr	r2, [r3]
 429 0172 0D4B     		ldr	r3, .L22
 430 0174 0D49     		ldr	r1, .L22+4
 431 0176 0A40     		ands	r2, r1
 432 0178 1A60     		str	r2, [r3]
  99:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_set(B_RW);
 433              		.loc 1 99 0
 434 017a 0220     		movs	r0, #2
 435 017c FFF7FEFF 		bl	ascii_ctrl_bit_set
 100:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_clear(B_RS);
 436              		.loc 1 100 0
 437 0180 0120     		movs	r0, #1
 438 0182 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 101:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	rv = ascii_read_controller();
 439              		.loc 1 101 0
 440 0186 FC1D     		adds	r4, r7, #7
 441 0188 FFF7FEFF 		bl	ascii_read_controller
 442 018c 0300     		movs	r3, r0
 443 018e 2370     		strb	r3, [r4]
 102:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*GPIO_MODER |= 0x55555555;
 444              		.loc 1 102 0
 445 0190 054B     		ldr	r3, .L22
 446 0192 1A68     		ldr	r2, [r3]
 447 0194 044B     		ldr	r3, .L22
 448 0196 0649     		ldr	r1, .L22+8
 449 0198 0A43     		orrs	r2, r1
 450 019a 1A60     		str	r2, [r3]
 103:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	return rv;
 451              		.loc 1 103 0
 452 019c FB1D     		adds	r3, r7, #7
 453 019e 1B78     		ldrb	r3, [r3]
 104:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 454              		.loc 1 104 0
 455 01a0 1800     		movs	r0, r3
 456 01a2 BD46     		mov	sp, r7
 457 01a4 03B0     		add	sp, sp, #12
 458              		@ sp needed
 459 01a6 90BD     		pop	{r4, r7, pc}
 460              	.L23:
 461              		.align	2
 462              	.L22:
 463 01a8 00100240 		.word	1073876992
 464 01ac 55550000 		.word	21845
 465 01b0 55555555 		.word	1431655765
 466              		.cfi_endproc
 467              	.LFE8:
 469              		.align	1
 470              		.global	ascii_read_data
 471              		.syntax unified
 472              		.code	16
 473              		.thumb_func
 474              		.fpu softvfp
 476              	ascii_read_data:
 477              	.LFB9:
 105:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
 106:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** unsigned char ascii_read_data(void)
 107:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 478              		.loc 1 107 0
 479              		.cfi_startproc
 480              		@ args = 0, pretend = 0, frame = 8
 481              		@ frame_needed = 1, uses_anonymous_args = 0
 482 01b4 90B5     		push	{r4, r7, lr}
 483              		.cfi_def_cfa_offset 12
 484              		.cfi_offset 4, -12
 485              		.cfi_offset 7, -8
 486              		.cfi_offset 14, -4
 487 01b6 83B0     		sub	sp, sp, #12
 488              		.cfi_def_cfa_offset 24
 489 01b8 00AF     		add	r7, sp, #0
 490              		.cfi_def_cfa_register 7
 108:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	unsigned char rv;
 109:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*GPIO_MODER &= 0x00005555;
 491              		.loc 1 109 0
 492 01ba 0E4B     		ldr	r3, .L26
 493 01bc 1A68     		ldr	r2, [r3]
 494 01be 0D4B     		ldr	r3, .L26
 495 01c0 0D49     		ldr	r1, .L26+4
 496 01c2 0A40     		ands	r2, r1
 497 01c4 1A60     		str	r2, [r3]
 110:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_set(B_RS);
 498              		.loc 1 110 0
 499 01c6 0120     		movs	r0, #1
 500 01c8 FFF7FEFF 		bl	ascii_ctrl_bit_set
 111:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_set(B_RW);
 501              		.loc 1 111 0
 502 01cc 0220     		movs	r0, #2
 503 01ce FFF7FEFF 		bl	ascii_ctrl_bit_set
 112:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	rv = ascii_read_controller();
 504              		.loc 1 112 0
 505 01d2 FC1D     		adds	r4, r7, #7
 506 01d4 FFF7FEFF 		bl	ascii_read_controller
 507 01d8 0300     		movs	r3, r0
 508 01da 2370     		strb	r3, [r4]
 113:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*GPIO_MODER |= 0x55555555;
 509              		.loc 1 113 0
 510 01dc 054B     		ldr	r3, .L26
 511 01de 1A68     		ldr	r2, [r3]
 512 01e0 044B     		ldr	r3, .L26
 513 01e2 0649     		ldr	r1, .L26+8
 514 01e4 0A43     		orrs	r2, r1
 515 01e6 1A60     		str	r2, [r3]
 114:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	return rv;
 516              		.loc 1 114 0
 517 01e8 FB1D     		adds	r3, r7, #7
 518 01ea 1B78     		ldrb	r3, [r3]
 115:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 519              		.loc 1 115 0
 520 01ec 1800     		movs	r0, r3
 521 01ee BD46     		mov	sp, r7
 522 01f0 03B0     		add	sp, sp, #12
 523              		@ sp needed
 524 01f2 90BD     		pop	{r4, r7, pc}
 525              	.L27:
 526              		.align	2
 527              	.L26:
 528 01f4 00100240 		.word	1073876992
 529 01f8 55550000 		.word	21845
 530 01fc 55555555 		.word	1431655765
 531              		.cfi_endproc
 532              	.LFE9:
 534              		.align	1
 535              		.global	delay_milli
 536              		.syntax unified
 537              		.code	16
 538              		.thumb_func
 539              		.fpu softvfp
 541              	delay_milli:
 542              	.LFB10:
 116:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
 117:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void delay_milli(int ms)
 118:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 543              		.loc 1 118 0
 544              		.cfi_startproc
 545              		@ args = 0, pretend = 0, frame = 8
 546              		@ frame_needed = 1, uses_anonymous_args = 0
 547 0200 80B5     		push	{r7, lr}
 548              		.cfi_def_cfa_offset 8
 549              		.cfi_offset 7, -8
 550              		.cfi_offset 14, -4
 551 0202 82B0     		sub	sp, sp, #8
 552              		.cfi_def_cfa_offset 16
 553 0204 00AF     		add	r7, sp, #0
 554              		.cfi_def_cfa_register 7
 555 0206 7860     		str	r0, [r7, #4]
 119:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_micro(1);
 556              		.loc 1 119 0
 557 0208 0120     		movs	r0, #1
 558 020a FFF7FEFF 		bl	delay_micro
 120:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 559              		.loc 1 120 0
 560 020e C046     		nop
 561 0210 BD46     		mov	sp, r7
 562 0212 02B0     		add	sp, sp, #8
 563              		@ sp needed
 564 0214 80BD     		pop	{r7, pc}
 565              		.cfi_endproc
 566              	.LFE10:
 568              		.global	__aeabi_idiv
 569              		.align	1
 570              		.global	delay_micro
 571              		.syntax unified
 572              		.code	16
 573              		.thumb_func
 574              		.fpu softvfp
 576              	delay_micro:
 577              	.LFB11:
 121:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
 122:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void delay_micro(int us)
 123:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 578              		.loc 1 123 0
 579              		.cfi_startproc
 580              		@ args = 0, pretend = 0, frame = 8
 581              		@ frame_needed = 1, uses_anonymous_args = 0
 582 0216 80B5     		push	{r7, lr}
 583              		.cfi_def_cfa_offset 8
 584              		.cfi_offset 7, -8
 585              		.cfi_offset 14, -4
 586 0218 82B0     		sub	sp, sp, #8
 587              		.cfi_def_cfa_offset 16
 588 021a 00AF     		add	r7, sp, #0
 589              		.cfi_def_cfa_register 7
 590 021c 7860     		str	r0, [r7, #4]
 124:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	us = us/10;
 591              		.loc 1 124 0
 592 021e 7B68     		ldr	r3, [r7, #4]
 593 0220 0A21     		movs	r1, #10
 594 0222 1800     		movs	r0, r3
 595 0224 FFF7FEFF 		bl	__aeabi_idiv
 596              	.LVL0:
 597 0228 0300     		movs	r3, r0
 598 022a 7B60     		str	r3, [r7, #4]
 125:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while(us > 0)
 599              		.loc 1 125 0
 600 022c 0AE0     		b	.L30
 601              	.L31:
 602              	.LBB2:
 126:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	{
 127:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_250ns();
 603              		.loc 1 127 0
 604 022e FFF7FEFF 		bl	delay_250ns
 128:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_250ns();
 605              		.loc 1 128 0
 606 0232 FFF7FEFF 		bl	delay_250ns
 129:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_250ns();
 607              		.loc 1 129 0
 608 0236 FFF7FEFF 		bl	delay_250ns
 130:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_250ns();
 609              		.loc 1 130 0
 610 023a FFF7FEFF 		bl	delay_250ns
 131:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	us--;
 611              		.loc 1 131 0
 612 023e 7B68     		ldr	r3, [r7, #4]
 613 0240 013B     		subs	r3, r3, #1
 614 0242 7B60     		str	r3, [r7, #4]
 615              	.L30:
 616              	.LBE2:
 125:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	{
 617              		.loc 1 125 0
 618 0244 7B68     		ldr	r3, [r7, #4]
 619 0246 002B     		cmp	r3, #0
 620 0248 F1DC     		bgt	.L31
 132:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	}
 133:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 621              		.loc 1 133 0
 622 024a C046     		nop
 623 024c BD46     		mov	sp, r7
 624 024e 02B0     		add	sp, sp, #8
 625              		@ sp needed
 626 0250 80BD     		pop	{r7, pc}
 627              		.cfi_endproc
 628              	.LFE11:
 630              		.align	1
 631              		.global	delay_250ns
 632              		.syntax unified
 633              		.code	16
 634              		.thumb_func
 635              		.fpu softvfp
 637              	delay_250ns:
 638              	.LFB12:
 134:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
 135:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void delay_250ns(void)
 136:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 639              		.loc 1 136 0
 640              		.cfi_startproc
 641              		@ args = 0, pretend = 0, frame = 8
 642              		@ frame_needed = 1, uses_anonymous_args = 0
 643 0252 80B5     		push	{r7, lr}
 644              		.cfi_def_cfa_offset 8
 645              		.cfi_offset 7, -8
 646              		.cfi_offset 14, -4
 647 0254 82B0     		sub	sp, sp, #8
 648              		.cfi_def_cfa_offset 16
 649 0256 00AF     		add	r7, sp, #0
 650              		.cfi_def_cfa_register 7
 137:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*STK_CTRL = 0;
 651              		.loc 1 137 0
 652 0258 0F4B     		ldr	r3, .L34
 653 025a 0022     		movs	r2, #0
 654 025c 1A60     		str	r2, [r3]
 138:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*STK_LOAD = 0x29; //0x2A - 1
 655              		.loc 1 138 0
 656 025e 0F4B     		ldr	r3, .L34+4
 657 0260 2922     		movs	r2, #41
 658 0262 1A60     		str	r2, [r3]
 139:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*STK_VAL = 0x0;
 659              		.loc 1 139 0
 660 0264 0E4B     		ldr	r3, .L34+8
 661 0266 0022     		movs	r2, #0
 662 0268 1A60     		str	r2, [r3]
 140:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*STK_CTRL = 5;
 663              		.loc 1 140 0
 664 026a 0B4B     		ldr	r3, .L34
 665 026c 0522     		movs	r2, #5
 666 026e 1A60     		str	r2, [r3]
 141:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	unsigned int ctrl = *STK_CTRL & 0x10000;
 667              		.loc 1 141 0
 668 0270 094B     		ldr	r3, .L34
 669 0272 1A68     		ldr	r2, [r3]
 670 0274 8023     		movs	r3, #128
 671 0276 5B02     		lsls	r3, r3, #9
 672 0278 1340     		ands	r3, r2
 673 027a 7B60     		str	r3, [r7, #4]
 142:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while((*STK_CTRL & 0x10000) == 0);
 674              		.loc 1 142 0
 675 027c C046     		nop
 676              	.L33:
 677              		.loc 1 142 0 is_stmt 0 discriminator 1
 678 027e 064B     		ldr	r3, .L34
 679 0280 1A68     		ldr	r2, [r3]
 680 0282 8023     		movs	r3, #128
 681 0284 5B02     		lsls	r3, r3, #9
 682 0286 1340     		ands	r3, r2
 683 0288 F9D0     		beq	.L33
 143:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*STK_CTRL= 0;
 684              		.loc 1 143 0 is_stmt 1
 685 028a 034B     		ldr	r3, .L34
 686 028c 0022     		movs	r2, #0
 687 028e 1A60     		str	r2, [r3]
 144:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	
 145:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 688              		.loc 1 145 0
 689 0290 C046     		nop
 690 0292 BD46     		mov	sp, r7
 691 0294 02B0     		add	sp, sp, #8
 692              		@ sp needed
 693 0296 80BD     		pop	{r7, pc}
 694              	.L35:
 695              		.align	2
 696              	.L34:
 697 0298 10E000E0 		.word	-536813552
 698 029c 14E000E0 		.word	-536813548
 699 02a0 18E000E0 		.word	-536813544
 700              		.cfi_endproc
 701              	.LFE12:
 703              		.align	1
 704              		.global	ascii_write_char
 705              		.syntax unified
 706              		.code	16
 707              		.thumb_func
 708              		.fpu softvfp
 710              	ascii_write_char:
 711              	.LFB13:
 146:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
 147:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void ascii_write_char(unsigned char c)
 148:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 712              		.loc 1 148 0
 713              		.cfi_startproc
 714              		@ args = 0, pretend = 0, frame = 8
 715              		@ frame_needed = 1, uses_anonymous_args = 0
 716 02a4 80B5     		push	{r7, lr}
 717              		.cfi_def_cfa_offset 8
 718              		.cfi_offset 7, -8
 719              		.cfi_offset 14, -4
 720 02a6 82B0     		sub	sp, sp, #8
 721              		.cfi_def_cfa_offset 16
 722 02a8 00AF     		add	r7, sp, #0
 723              		.cfi_def_cfa_register 7
 724 02aa 0200     		movs	r2, r0
 725 02ac FB1D     		adds	r3, r7, #7
 726 02ae 1A70     		strb	r2, [r3]
 149:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while((ascii_read_status() & 0x80) == 0x80){}
 727              		.loc 1 149 0
 728 02b0 C046     		nop
 729              	.L37:
 730              		.loc 1 149 0 is_stmt 0 discriminator 1
 731 02b2 FFF7FEFF 		bl	ascii_read_status
 732 02b6 0300     		movs	r3, r0
 733 02b8 1A00     		movs	r2, r3
 734 02ba 8023     		movs	r3, #128
 735 02bc 1340     		ands	r3, r2
 736 02be 802B     		cmp	r3, #128
 737 02c0 F7D0     		beq	.L37
 150:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_micro(8);
 738              		.loc 1 150 0 is_stmt 1
 739 02c2 0820     		movs	r0, #8
 740 02c4 FFF7FEFF 		bl	delay_micro
 151:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_write_data(c);
 741              		.loc 1 151 0
 742 02c8 FB1D     		adds	r3, r7, #7
 743 02ca 1B78     		ldrb	r3, [r3]
 744 02cc 1800     		movs	r0, r3
 745 02ce FFF7FEFF 		bl	ascii_write_data
 152:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_micro(45);
 746              		.loc 1 152 0
 747 02d2 2D20     		movs	r0, #45
 748 02d4 FFF7FEFF 		bl	delay_micro
 153:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 749              		.loc 1 153 0
 750 02d8 C046     		nop
 751 02da BD46     		mov	sp, r7
 752 02dc 02B0     		add	sp, sp, #8
 753              		@ sp needed
 754 02de 80BD     		pop	{r7, pc}
 755              		.cfi_endproc
 756              	.LFE13:
 758              		.align	1
 759              		.global	ascii_gotoxy
 760              		.syntax unified
 761              		.code	16
 762              		.thumb_func
 763              		.fpu softvfp
 765              	ascii_gotoxy:
 766              	.LFB14:
 154:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
 155:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void ascii_gotoxy(int row, int col)
 156:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 767              		.loc 1 156 0
 768              		.cfi_startproc
 769              		@ args = 0, pretend = 0, frame = 16
 770              		@ frame_needed = 1, uses_anonymous_args = 0
 771 02e0 80B5     		push	{r7, lr}
 772              		.cfi_def_cfa_offset 8
 773              		.cfi_offset 7, -8
 774              		.cfi_offset 14, -4
 775 02e2 84B0     		sub	sp, sp, #16
 776              		.cfi_def_cfa_offset 24
 777 02e4 00AF     		add	r7, sp, #0
 778              		.cfi_def_cfa_register 7
 779 02e6 7860     		str	r0, [r7, #4]
 780 02e8 3960     		str	r1, [r7]
 157:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	unsigned int adress;
 158:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	adress = row -1;
 781              		.loc 1 158 0
 782 02ea 7B68     		ldr	r3, [r7, #4]
 783 02ec 013B     		subs	r3, r3, #1
 784 02ee FB60     		str	r3, [r7, #12]
 159:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	if(col == 2)
 785              		.loc 1 159 0
 786 02f0 3B68     		ldr	r3, [r7]
 787 02f2 022B     		cmp	r3, #2
 788 02f4 02D1     		bne	.L39
 160:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	{
 161:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 		adress = adress + 0x40;
 789              		.loc 1 161 0
 790 02f6 FB68     		ldr	r3, [r7, #12]
 791 02f8 4033     		adds	r3, r3, #64
 792 02fa FB60     		str	r3, [r7, #12]
 793              	.L39:
 162:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	}
 163:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_write_cmd(0x80|adress);
 794              		.loc 1 163 0
 795 02fc FB68     		ldr	r3, [r7, #12]
 796 02fe DBB2     		uxtb	r3, r3
 797 0300 8022     		movs	r2, #128
 798 0302 5242     		rsbs	r2, r2, #0
 799 0304 1343     		orrs	r3, r2
 800 0306 DBB2     		uxtb	r3, r3
 801 0308 1800     		movs	r0, r3
 802 030a FFF7FEFF 		bl	ascii_write_cmd
 164:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 803              		.loc 1 164 0
 804 030e C046     		nop
 805 0310 BD46     		mov	sp, r7
 806 0312 04B0     		add	sp, sp, #16
 807              		@ sp needed
 808 0314 80BD     		pop	{r7, pc}
 809              		.cfi_endproc
 810              	.LFE14:
 812              		.align	1
 813              		.global	ascii_init
 814              		.syntax unified
 815              		.code	16
 816              		.thumb_func
 817              		.fpu softvfp
 819              	ascii_init:
 820              	.LFB15:
 165:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
 166:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void ascii_init(void)
 167:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 821              		.loc 1 167 0
 822              		.cfi_startproc
 823              		@ args = 0, pretend = 0, frame = 0
 824              		@ frame_needed = 1, uses_anonymous_args = 0
 825 0316 80B5     		push	{r7, lr}
 826              		.cfi_def_cfa_offset 8
 827              		.cfi_offset 7, -8
 828              		.cfi_offset 14, -4
 829 0318 00AF     		add	r7, sp, #0
 830              		.cfi_def_cfa_register 7
 168:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while((ascii_read_status() & 0x80) == 0x80){}
 831              		.loc 1 168 0
 832 031a C046     		nop
 833              	.L41:
 834              		.loc 1 168 0 is_stmt 0 discriminator 1
 835 031c FFF7FEFF 		bl	ascii_read_status
 836 0320 0300     		movs	r3, r0
 837 0322 1A00     		movs	r2, r3
 838 0324 8023     		movs	r3, #128
 839 0326 1340     		ands	r3, r2
 840 0328 802B     		cmp	r3, #128
 841 032a F7D0     		beq	.L41
 169:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_micro(8);
 842              		.loc 1 169 0 is_stmt 1
 843 032c 0820     		movs	r0, #8
 844 032e FFF7FEFF 		bl	delay_micro
 170:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_write_cmd(0x38); //00111000
 845              		.loc 1 170 0
 846 0332 3820     		movs	r0, #56
 847 0334 FFF7FEFF 		bl	ascii_write_cmd
 171:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_micro(40);
 848              		.loc 1 171 0
 849 0338 2820     		movs	r0, #40
 850 033a FFF7FEFF 		bl	delay_micro
 172:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	
 173:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while((ascii_read_status() & 0x80) == 0x80){}
 851              		.loc 1 173 0
 852 033e C046     		nop
 853              	.L42:
 854              		.loc 1 173 0 is_stmt 0 discriminator 1
 855 0340 FFF7FEFF 		bl	ascii_read_status
 856 0344 0300     		movs	r3, r0
 857 0346 1A00     		movs	r2, r3
 858 0348 8023     		movs	r3, #128
 859 034a 1340     		ands	r3, r2
 860 034c 802B     		cmp	r3, #128
 861 034e F7D0     		beq	.L42
 174:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_micro(8);
 862              		.loc 1 174 0 is_stmt 1
 863 0350 0820     		movs	r0, #8
 864 0352 FFF7FEFF 		bl	delay_micro
 175:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_write_cmd(0x0D); //00001110
 865              		.loc 1 175 0
 866 0356 0D20     		movs	r0, #13
 867 0358 FFF7FEFF 		bl	ascii_write_cmd
 176:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_micro(40);
 868              		.loc 1 176 0
 869 035c 2820     		movs	r0, #40
 870 035e FFF7FEFF 		bl	delay_micro
 177:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	
 178:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while((ascii_read_status() & 0x80) == 0x80){}
 871              		.loc 1 178 0
 872 0362 C046     		nop
 873              	.L43:
 874              		.loc 1 178 0 is_stmt 0 discriminator 1
 875 0364 FFF7FEFF 		bl	ascii_read_status
 876 0368 0300     		movs	r3, r0
 877 036a 1A00     		movs	r2, r3
 878 036c 8023     		movs	r3, #128
 879 036e 1340     		ands	r3, r2
 880 0370 802B     		cmp	r3, #128
 881 0372 F7D0     		beq	.L43
 179:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_micro(8);
 882              		.loc 1 179 0 is_stmt 1
 883 0374 0820     		movs	r0, #8
 884 0376 FFF7FEFF 		bl	delay_micro
 180:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_write_cmd(1);
 885              		.loc 1 180 0
 886 037a 0120     		movs	r0, #1
 887 037c FFF7FEFF 		bl	ascii_write_cmd
 181:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_milli(2);
 888              		.loc 1 181 0
 889 0380 0220     		movs	r0, #2
 890 0382 FFF7FEFF 		bl	delay_milli
 182:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	
 183:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while((ascii_read_status() & 0x80) == 0x80){}
 891              		.loc 1 183 0
 892 0386 C046     		nop
 893              	.L44:
 894              		.loc 1 183 0 is_stmt 0 discriminator 1
 895 0388 FFF7FEFF 		bl	ascii_read_status
 896 038c 0300     		movs	r3, r0
 897 038e 1A00     		movs	r2, r3
 898 0390 8023     		movs	r3, #128
 899 0392 1340     		ands	r3, r2
 900 0394 802B     		cmp	r3, #128
 901 0396 F7D0     		beq	.L44
 184:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_micro(8);
 902              		.loc 1 184 0 is_stmt 1
 903 0398 0820     		movs	r0, #8
 904 039a FFF7FEFF 		bl	delay_micro
 185:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_write_cmd(0x04); //Rätt? Increment? 00000100
 905              		.loc 1 185 0
 906 039e 0420     		movs	r0, #4
 907 03a0 FFF7FEFF 		bl	ascii_write_cmd
 186:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_micro(39);
 908              		.loc 1 186 0
 909 03a4 2720     		movs	r0, #39
 910 03a6 FFF7FEFF 		bl	delay_micro
 187:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 911              		.loc 1 187 0
 912 03aa C046     		nop
 913 03ac BD46     		mov	sp, r7
 914              		@ sp needed
 915 03ae 80BD     		pop	{r7, pc}
 916              		.cfi_endproc
 917              	.LFE15:
 919              		.section	.rodata
 920              		.align	2
 921              	.LC0:
 922 0000 49662079 		.ascii	"If you can dream it\000"
 922      6F752063 
 922      616E2064 
 922      7265616D 
 922      20697400 
 923              		.align	2
 924              	.LC2:
 925 0014 596F7520 		.ascii	"You can do it!\000"
 925      63616E20 
 925      646F2069 
 925      742100
 926              		.text
 927              		.align	1
 928              		.global	main
 929              		.syntax unified
 930              		.code	16
 931              		.thumb_func
 932              		.fpu softvfp
 934              	main:
 935              	.LFB16:
 188:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
 189:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** int main(int argc, char **argv)
 190:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 936              		.loc 1 190 0
 937              		.cfi_startproc
 938              		@ args = 0, pretend = 0, frame = 48
 939              		@ frame_needed = 1, uses_anonymous_args = 0
 940 03b0 B0B5     		push	{r4, r5, r7, lr}
 941              		.cfi_def_cfa_offset 16
 942              		.cfi_offset 4, -16
 943              		.cfi_offset 5, -12
 944              		.cfi_offset 7, -8
 945              		.cfi_offset 14, -4
 946 03b2 8CB0     		sub	sp, sp, #48
 947              		.cfi_def_cfa_offset 64
 948 03b4 00AF     		add	r7, sp, #0
 949              		.cfi_def_cfa_register 7
 950 03b6 7860     		str	r0, [r7, #4]
 951 03b8 3960     		str	r1, [r7]
 191:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	
 192:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	//ascii_ctrl_bit_set(0x01)
 193:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	char *s;
 194:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	char test1[] = "If you can dream it";
 952              		.loc 1 194 0
 953 03ba 1824     		movs	r4, #24
 954 03bc 3B19     		adds	r3, r7, r4
 955 03be 1E4A     		ldr	r2, .L51
 956 03c0 23CA     		ldmia	r2!, {r0, r1, r5}
 957 03c2 23C3     		stmia	r3!, {r0, r1, r5}
 958 03c4 03CA     		ldmia	r2!, {r0, r1}
 959 03c6 03C3     		stmia	r3!, {r0, r1}
 195:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	char test2[] = "You can do it!";
 960              		.loc 1 195 0
 961 03c8 0823     		movs	r3, #8
 962 03ca FB18     		adds	r3, r7, r3
 963 03cc 1B4A     		ldr	r2, .L51+4
 964 03ce 23CA     		ldmia	r2!, {r0, r1, r5}
 965 03d0 23C3     		stmia	r3!, {r0, r1, r5}
 966 03d2 1188     		ldrh	r1, [r2]
 967 03d4 1980     		strh	r1, [r3]
 968 03d6 9278     		ldrb	r2, [r2, #2]
 969 03d8 9A70     		strb	r2, [r3, #2]
 196:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	
 197:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	init_app();
 970              		.loc 1 197 0
 971 03da FFF7FEFF 		bl	init_app
 198:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_init();
 972              		.loc 1 198 0
 973 03de FFF7FEFF 		bl	ascii_init
 199:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_gotoxy(1,1);
 974              		.loc 1 199 0
 975 03e2 0121     		movs	r1, #1
 976 03e4 0120     		movs	r0, #1
 977 03e6 FFF7FEFF 		bl	ascii_gotoxy
 200:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	s = test1;
 978              		.loc 1 200 0
 979 03ea 3B19     		adds	r3, r7, r4
 980 03ec FB62     		str	r3, [r7, #44]
 201:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while(*s)
 981              		.loc 1 201 0
 982 03ee 06E0     		b	.L46
 983              	.L47:
 202:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	{
 203:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 		ascii_write_char(*s++);
 984              		.loc 1 203 0
 985 03f0 FB6A     		ldr	r3, [r7, #44]
 986 03f2 5A1C     		adds	r2, r3, #1
 987 03f4 FA62     		str	r2, [r7, #44]
 988 03f6 1B78     		ldrb	r3, [r3]
 989 03f8 1800     		movs	r0, r3
 990 03fa FFF7FEFF 		bl	ascii_write_char
 991              	.L46:
 201:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while(*s)
 992              		.loc 1 201 0
 993 03fe FB6A     		ldr	r3, [r7, #44]
 994 0400 1B78     		ldrb	r3, [r3]
 995 0402 002B     		cmp	r3, #0
 996 0404 F4D1     		bne	.L47
 204:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	}
 205:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_gotoxy(1,2);
 997              		.loc 1 205 0
 998 0406 0221     		movs	r1, #2
 999 0408 0120     		movs	r0, #1
 1000 040a FFF7FEFF 		bl	ascii_gotoxy
 206:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	s = test2;
 1001              		.loc 1 206 0
 1002 040e 0823     		movs	r3, #8
 1003 0410 FB18     		adds	r3, r7, r3
 1004 0412 FB62     		str	r3, [r7, #44]
 207:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while(*s)
 1005              		.loc 1 207 0
 1006 0414 06E0     		b	.L48
 1007              	.L49:
 208:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	{
 209:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 		ascii_write_char(*s++);
 1008              		.loc 1 209 0
 1009 0416 FB6A     		ldr	r3, [r7, #44]
 1010 0418 5A1C     		adds	r2, r3, #1
 1011 041a FA62     		str	r2, [r7, #44]
 1012 041c 1B78     		ldrb	r3, [r3]
 1013 041e 1800     		movs	r0, r3
 1014 0420 FFF7FEFF 		bl	ascii_write_char
 1015              	.L48:
 207:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while(*s)
 1016              		.loc 1 207 0
 1017 0424 FB6A     		ldr	r3, [r7, #44]
 1018 0426 1B78     		ldrb	r3, [r3]
 1019 0428 002B     		cmp	r3, #0
 1020 042a F4D1     		bne	.L49
 210:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	}
 211:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	return 0;
 1021              		.loc 1 211 0
 1022 042c 0023     		movs	r3, #0
 212:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	
 213:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 1023              		.loc 1 213 0
 1024 042e 1800     		movs	r0, r3
 1025 0430 BD46     		mov	sp, r7
 1026 0432 0CB0     		add	sp, sp, #48
 1027              		@ sp needed
 1028 0434 B0BD     		pop	{r4, r5, r7, pc}
 1029              	.L52:
 1030 0436 C046     		.align	2
 1031              	.L51:
 1032 0438 00000000 		.word	.LC0
 1033 043c 14000000 		.word	.LC2
 1034              		.cfi_endproc
 1035              	.LFE16:
 1037              	.Letext0:
