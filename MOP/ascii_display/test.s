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
  38:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*GPIO_MODER = 0x5555;
  67              		.loc 1 38 0
  68 0004 054B     		ldr	r3, .L3
  69 0006 064A     		ldr	r2, .L3+4
  70 0008 1A60     		str	r2, [r3]
  39:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*(GPIO_MODER + 1) = 0x5555;
  71              		.loc 1 39 0
  72 000a 064B     		ldr	r3, .L3+8
  73 000c 044A     		ldr	r2, .L3+4
  74 000e 1A60     		str	r2, [r3]
  40:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*GPIO_OTYPER = 0x00000000;
  75              		.loc 1 40 0
  76 0010 044B     		ldr	r3, .L3+8
  77 0012 0022     		movs	r2, #0
  78 0014 1A80     		strh	r2, [r3]
  41:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
  79              		.loc 1 41 0
  80 0016 C046     		nop
  81 0018 BD46     		mov	sp, r7
  82              		@ sp needed
  83 001a 80BD     		pop	{r7, pc}
  84              	.L4:
  85              		.align	2
  86              	.L3:
  87 001c 00100240 		.word	1073876992
  88 0020 55550000 		.word	21845
  89 0024 04100240 		.word	1073876996
  90              		.cfi_endproc
  91              	.LFE1:
  93              		.align	1
  94              		.global	ascii_ctrl_bit_set
  95              		.syntax unified
  96              		.code	16
  97              		.thumb_func
  98              		.fpu softvfp
 100              	ascii_ctrl_bit_set:
 101              	.LFB2:
  42:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
  43:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void ascii_ctrl_bit_set(unsigned char x)
  44:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 102              		.loc 1 44 0
 103              		.cfi_startproc
 104              		@ args = 0, pretend = 0, frame = 16
 105              		@ frame_needed = 1, uses_anonymous_args = 0
 106 0028 80B5     		push	{r7, lr}
 107              		.cfi_def_cfa_offset 8
 108              		.cfi_offset 7, -8
 109              		.cfi_offset 14, -4
 110 002a 84B0     		sub	sp, sp, #16
 111              		.cfi_def_cfa_offset 24
 112 002c 00AF     		add	r7, sp, #0
 113              		.cfi_def_cfa_register 7
 114 002e 0200     		movs	r2, r0
 115 0030 FB1D     		adds	r3, r7, #7
 116 0032 1A70     		strb	r2, [r3]
  45:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	unsigned char c;
  46:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	c = *GPIO_ODR_LOW;
 117              		.loc 1 46 0
 118 0034 0C4A     		ldr	r2, .L6
 119 0036 0F21     		movs	r1, #15
 120 0038 7B18     		adds	r3, r7, r1
 121 003a 1278     		ldrb	r2, [r2]
 122 003c 1A70     		strb	r2, [r3]
  47:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	c |= ( B_SELECT | x ); //Varför ettställa B_select?
 123              		.loc 1 47 0
 124 003e FA1D     		adds	r2, r7, #7
 125 0040 7B18     		adds	r3, r7, r1
 126 0042 1278     		ldrb	r2, [r2]
 127 0044 1B78     		ldrb	r3, [r3]
 128 0046 1343     		orrs	r3, r2
 129 0048 DAB2     		uxtb	r2, r3
 130 004a 0800     		movs	r0, r1
 131 004c 7B18     		adds	r3, r7, r1
 132 004e 0421     		movs	r1, #4
 133 0050 0A43     		orrs	r2, r1
 134 0052 1A70     		strb	r2, [r3]
  48:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*GPIO_ODR_LOW = c;
 135              		.loc 1 48 0
 136 0054 044A     		ldr	r2, .L6
 137 0056 0100     		movs	r1, r0
 138 0058 7B18     		adds	r3, r7, r1
 139 005a 1B78     		ldrb	r3, [r3]
 140 005c 1370     		strb	r3, [r2]
  49:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 141              		.loc 1 49 0
 142 005e C046     		nop
 143 0060 BD46     		mov	sp, r7
 144 0062 04B0     		add	sp, sp, #16
 145              		@ sp needed
 146 0064 80BD     		pop	{r7, pc}
 147              	.L7:
 148 0066 C046     		.align	2
 149              	.L6:
 150 0068 14100240 		.word	1073877012
 151              		.cfi_endproc
 152              	.LFE2:
 154              		.align	1
 155              		.global	ascii_ctrl_bit_clear
 156              		.syntax unified
 157              		.code	16
 158              		.thumb_func
 159              		.fpu softvfp
 161              	ascii_ctrl_bit_clear:
 162              	.LFB3:
  50:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
  51:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void ascii_ctrl_bit_clear(unsigned char x)
  52:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 163              		.loc 1 52 0
 164              		.cfi_startproc
 165              		@ args = 0, pretend = 0, frame = 16
 166              		@ frame_needed = 1, uses_anonymous_args = 0
 167 006c 80B5     		push	{r7, lr}
 168              		.cfi_def_cfa_offset 8
 169              		.cfi_offset 7, -8
 170              		.cfi_offset 14, -4
 171 006e 84B0     		sub	sp, sp, #16
 172              		.cfi_def_cfa_offset 24
 173 0070 00AF     		add	r7, sp, #0
 174              		.cfi_def_cfa_register 7
 175 0072 0200     		movs	r2, r0
 176 0074 FB1D     		adds	r3, r7, #7
 177 0076 1A70     		strb	r2, [r3]
  53:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	unsigned char c;
  54:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	c = *GPIO_ODR_LOW;
 178              		.loc 1 54 0
 179 0078 0D4A     		ldr	r2, .L9
 180 007a 0F21     		movs	r1, #15
 181 007c 7B18     		adds	r3, r7, r1
 182 007e 1278     		ldrb	r2, [r2]
 183 0080 1A70     		strb	r2, [r3]
  55:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	c &= (B_SELECT | ~x); //~ bildar 1-komplement
 184              		.loc 1 55 0
 185 0082 FB1D     		adds	r3, r7, #7
 186 0084 1B78     		ldrb	r3, [r3]
 187 0086 5BB2     		sxtb	r3, r3
 188 0088 DB43     		mvns	r3, r3
 189 008a 5BB2     		sxtb	r3, r3
 190 008c 0422     		movs	r2, #4
 191 008e 1343     		orrs	r3, r2
 192 0090 5BB2     		sxtb	r3, r3
 193 0092 7A18     		adds	r2, r7, r1
 194 0094 1278     		ldrb	r2, [r2]
 195 0096 52B2     		sxtb	r2, r2
 196 0098 1340     		ands	r3, r2
 197 009a 5AB2     		sxtb	r2, r3
 198 009c 7B18     		adds	r3, r7, r1
 199 009e 1A70     		strb	r2, [r3]
  56:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*GPIO_ODR_LOW = c;
 200              		.loc 1 56 0
 201 00a0 034A     		ldr	r2, .L9
 202 00a2 7B18     		adds	r3, r7, r1
 203 00a4 1B78     		ldrb	r3, [r3]
 204 00a6 1370     		strb	r3, [r2]
  57:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 205              		.loc 1 57 0
 206 00a8 C046     		nop
 207 00aa BD46     		mov	sp, r7
 208 00ac 04B0     		add	sp, sp, #16
 209              		@ sp needed
 210 00ae 80BD     		pop	{r7, pc}
 211              	.L10:
 212              		.align	2
 213              	.L9:
 214 00b0 14100240 		.word	1073877012
 215              		.cfi_endproc
 216              	.LFE3:
 218              		.align	1
 219              		.global	ascii_write_controller
 220              		.syntax unified
 221              		.code	16
 222              		.thumb_func
 223              		.fpu softvfp
 225              	ascii_write_controller:
 226              	.LFB4:
  58:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
  59:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void ascii_write_controller(unsigned char byte)
  60:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 227              		.loc 1 60 0
 228              		.cfi_startproc
 229              		@ args = 0, pretend = 0, frame = 8
 230              		@ frame_needed = 1, uses_anonymous_args = 0
 231 00b4 80B5     		push	{r7, lr}
 232              		.cfi_def_cfa_offset 8
 233              		.cfi_offset 7, -8
 234              		.cfi_offset 14, -4
 235 00b6 82B0     		sub	sp, sp, #8
 236              		.cfi_def_cfa_offset 16
 237 00b8 00AF     		add	r7, sp, #0
 238              		.cfi_def_cfa_register 7
 239 00ba 0200     		movs	r2, r0
 240 00bc FB1D     		adds	r3, r7, #7
 241 00be 1A70     		strb	r2, [r3]
  61:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_set( B_E );
 242              		.loc 1 61 0
 243 00c0 4020     		movs	r0, #64
 244 00c2 FFF7FEFF 		bl	ascii_ctrl_bit_set
  62:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*GPIO_ODR_HIGH = byte;
 245              		.loc 1 62 0
 246 00c6 064A     		ldr	r2, .L12
 247 00c8 FB1D     		adds	r3, r7, #7
 248 00ca 1B78     		ldrb	r3, [r3]
 249 00cc 1370     		strb	r3, [r2]
  63:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_250ns();
 250              		.loc 1 63 0
 251 00ce FFF7FEFF 		bl	delay_250ns
  64:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_clear(B_E);	//Ska delay vara före eller efter detta?
 252              		.loc 1 64 0
 253 00d2 4020     		movs	r0, #64
 254 00d4 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  65:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 255              		.loc 1 65 0
 256 00d8 C046     		nop
 257 00da BD46     		mov	sp, r7
 258 00dc 02B0     		add	sp, sp, #8
 259              		@ sp needed
 260 00de 80BD     		pop	{r7, pc}
 261              	.L13:
 262              		.align	2
 263              	.L12:
 264 00e0 15100240 		.word	1073877013
 265              		.cfi_endproc
 266              	.LFE4:
 268              		.align	1
 269              		.global	ascii_read_controller
 270              		.syntax unified
 271              		.code	16
 272              		.thumb_func
 273              		.fpu softvfp
 275              	ascii_read_controller:
 276              	.LFB5:
  66:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
  67:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** unsigned char ascii_read_controller(void)
  68:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 277              		.loc 1 68 0
 278              		.cfi_startproc
 279              		@ args = 0, pretend = 0, frame = 8
 280              		@ frame_needed = 1, uses_anonymous_args = 0
 281 00e4 80B5     		push	{r7, lr}
 282              		.cfi_def_cfa_offset 8
 283              		.cfi_offset 7, -8
 284              		.cfi_offset 14, -4
 285 00e6 82B0     		sub	sp, sp, #8
 286              		.cfi_def_cfa_offset 16
 287 00e8 00AF     		add	r7, sp, #0
 288              		.cfi_def_cfa_register 7
  69:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	unsigned char rv;
  70:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_set( B_E );
 289              		.loc 1 70 0
 290 00ea 4020     		movs	r0, #64
 291 00ec FFF7FEFF 		bl	ascii_ctrl_bit_set
  71:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_250ns();
 292              		.loc 1 71 0
 293 00f0 FFF7FEFF 		bl	delay_250ns
  72:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_250ns();
 294              		.loc 1 72 0
 295 00f4 FFF7FEFF 		bl	delay_250ns
  73:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	rv = *GPIO_IDR_HIGH;
 296              		.loc 1 73 0
 297 00f8 064A     		ldr	r2, .L16
 298 00fa FB1D     		adds	r3, r7, #7
 299 00fc 1278     		ldrb	r2, [r2]
 300 00fe 1A70     		strb	r2, [r3]
  74:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_clear( B_E );
 301              		.loc 1 74 0
 302 0100 4020     		movs	r0, #64
 303 0102 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  75:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	return rv;
 304              		.loc 1 75 0
 305 0106 FB1D     		adds	r3, r7, #7
 306 0108 1B78     		ldrb	r3, [r3]
  76:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	
  77:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 307              		.loc 1 77 0
 308 010a 1800     		movs	r0, r3
 309 010c BD46     		mov	sp, r7
 310 010e 02B0     		add	sp, sp, #8
 311              		@ sp needed
 312 0110 80BD     		pop	{r7, pc}
 313              	.L17:
 314 0112 C046     		.align	2
 315              	.L16:
 316 0114 11100240 		.word	1073877009
 317              		.cfi_endproc
 318              	.LFE5:
 320              		.align	1
 321              		.global	ascii_write_cmd
 322              		.syntax unified
 323              		.code	16
 324              		.thumb_func
 325              		.fpu softvfp
 327              	ascii_write_cmd:
 328              	.LFB6:
  78:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
  79:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void ascii_write_cmd(unsigned char command)
  80:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 329              		.loc 1 80 0
 330              		.cfi_startproc
 331              		@ args = 0, pretend = 0, frame = 8
 332              		@ frame_needed = 1, uses_anonymous_args = 0
 333 0118 80B5     		push	{r7, lr}
 334              		.cfi_def_cfa_offset 8
 335              		.cfi_offset 7, -8
 336              		.cfi_offset 14, -4
 337 011a 82B0     		sub	sp, sp, #8
 338              		.cfi_def_cfa_offset 16
 339 011c 00AF     		add	r7, sp, #0
 340              		.cfi_def_cfa_register 7
 341 011e 0200     		movs	r2, r0
 342 0120 FB1D     		adds	r3, r7, #7
 343 0122 1A70     		strb	r2, [r3]
  81:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_clear(B_RS);
 344              		.loc 1 81 0
 345 0124 0120     		movs	r0, #1
 346 0126 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  82:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_clear(B_RW);
 347              		.loc 1 82 0
 348 012a 0220     		movs	r0, #2
 349 012c FFF7FEFF 		bl	ascii_ctrl_bit_clear
  83:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_write_controller(command);
 350              		.loc 1 83 0
 351 0130 FB1D     		adds	r3, r7, #7
 352 0132 1B78     		ldrb	r3, [r3]
 353 0134 1800     		movs	r0, r3
 354 0136 FFF7FEFF 		bl	ascii_write_controller
  84:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	
  85:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 355              		.loc 1 85 0
 356 013a C046     		nop
 357 013c BD46     		mov	sp, r7
 358 013e 02B0     		add	sp, sp, #8
 359              		@ sp needed
 360 0140 80BD     		pop	{r7, pc}
 361              		.cfi_endproc
 362              	.LFE6:
 364              		.align	1
 365              		.global	ascii_write_data
 366              		.syntax unified
 367              		.code	16
 368              		.thumb_func
 369              		.fpu softvfp
 371              	ascii_write_data:
 372              	.LFB7:
  86:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
  87:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void ascii_write_data(unsigned char data)
  88:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 373              		.loc 1 88 0
 374              		.cfi_startproc
 375              		@ args = 0, pretend = 0, frame = 8
 376              		@ frame_needed = 1, uses_anonymous_args = 0
 377 0142 80B5     		push	{r7, lr}
 378              		.cfi_def_cfa_offset 8
 379              		.cfi_offset 7, -8
 380              		.cfi_offset 14, -4
 381 0144 82B0     		sub	sp, sp, #8
 382              		.cfi_def_cfa_offset 16
 383 0146 00AF     		add	r7, sp, #0
 384              		.cfi_def_cfa_register 7
 385 0148 0200     		movs	r2, r0
 386 014a FB1D     		adds	r3, r7, #7
 387 014c 1A70     		strb	r2, [r3]
  89:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_set(B_RS);
 388              		.loc 1 89 0
 389 014e 0120     		movs	r0, #1
 390 0150 FFF7FEFF 		bl	ascii_ctrl_bit_set
  90:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_clear(B_RW);
 391              		.loc 1 90 0
 392 0154 0220     		movs	r0, #2
 393 0156 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  91:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_write_controller(data);
 394              		.loc 1 91 0
 395 015a FB1D     		adds	r3, r7, #7
 396 015c 1B78     		ldrb	r3, [r3]
 397 015e 1800     		movs	r0, r3
 398 0160 FFF7FEFF 		bl	ascii_write_controller
  92:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 399              		.loc 1 92 0
 400 0164 C046     		nop
 401 0166 BD46     		mov	sp, r7
 402 0168 02B0     		add	sp, sp, #8
 403              		@ sp needed
 404 016a 80BD     		pop	{r7, pc}
 405              		.cfi_endproc
 406              	.LFE7:
 408              		.align	1
 409              		.global	ascii_read_status
 410              		.syntax unified
 411              		.code	16
 412              		.thumb_func
 413              		.fpu softvfp
 415              	ascii_read_status:
 416              	.LFB8:
  93:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
  94:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
  95:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
  96:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** unsigned char ascii_read_status(void)
  97:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 417              		.loc 1 97 0
 418              		.cfi_startproc
 419              		@ args = 0, pretend = 0, frame = 8
 420              		@ frame_needed = 1, uses_anonymous_args = 0
 421 016c 90B5     		push	{r4, r7, lr}
 422              		.cfi_def_cfa_offset 12
 423              		.cfi_offset 4, -12
 424              		.cfi_offset 7, -8
 425              		.cfi_offset 14, -4
 426 016e 83B0     		sub	sp, sp, #12
 427              		.cfi_def_cfa_offset 24
 428 0170 00AF     		add	r7, sp, #0
 429              		.cfi_def_cfa_register 7
  98:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	unsigned char rv;
  99:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*GPIO_MODER &= 0x00005555;
 430              		.loc 1 99 0
 431 0172 0E4B     		ldr	r3, .L22
 432 0174 1A68     		ldr	r2, [r3]
 433 0176 0D4B     		ldr	r3, .L22
 434 0178 0D49     		ldr	r1, .L22+4
 435 017a 0A40     		ands	r2, r1
 436 017c 1A60     		str	r2, [r3]
 100:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_set(B_RW);
 437              		.loc 1 100 0
 438 017e 0220     		movs	r0, #2
 439 0180 FFF7FEFF 		bl	ascii_ctrl_bit_set
 101:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_clear(B_RS);
 440              		.loc 1 101 0
 441 0184 0120     		movs	r0, #1
 442 0186 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 102:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	rv = ascii_read_controller();
 443              		.loc 1 102 0
 444 018a FC1D     		adds	r4, r7, #7
 445 018c FFF7FEFF 		bl	ascii_read_controller
 446 0190 0300     		movs	r3, r0
 447 0192 2370     		strb	r3, [r4]
 103:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*GPIO_MODER |= 0x55555555;
 448              		.loc 1 103 0
 449 0194 054B     		ldr	r3, .L22
 450 0196 1A68     		ldr	r2, [r3]
 451 0198 044B     		ldr	r3, .L22
 452 019a 0649     		ldr	r1, .L22+8
 453 019c 0A43     		orrs	r2, r1
 454 019e 1A60     		str	r2, [r3]
 104:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	return rv;
 455              		.loc 1 104 0
 456 01a0 FB1D     		adds	r3, r7, #7
 457 01a2 1B78     		ldrb	r3, [r3]
 105:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 458              		.loc 1 105 0
 459 01a4 1800     		movs	r0, r3
 460 01a6 BD46     		mov	sp, r7
 461 01a8 03B0     		add	sp, sp, #12
 462              		@ sp needed
 463 01aa 90BD     		pop	{r4, r7, pc}
 464              	.L23:
 465              		.align	2
 466              	.L22:
 467 01ac 00100240 		.word	1073876992
 468 01b0 55550000 		.word	21845
 469 01b4 55555555 		.word	1431655765
 470              		.cfi_endproc
 471              	.LFE8:
 473              		.align	1
 474              		.global	ascii_read_data
 475              		.syntax unified
 476              		.code	16
 477              		.thumb_func
 478              		.fpu softvfp
 480              	ascii_read_data:
 481              	.LFB9:
 106:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
 107:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** unsigned char ascii_read_data(void)
 108:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 482              		.loc 1 108 0
 483              		.cfi_startproc
 484              		@ args = 0, pretend = 0, frame = 8
 485              		@ frame_needed = 1, uses_anonymous_args = 0
 486 01b8 90B5     		push	{r4, r7, lr}
 487              		.cfi_def_cfa_offset 12
 488              		.cfi_offset 4, -12
 489              		.cfi_offset 7, -8
 490              		.cfi_offset 14, -4
 491 01ba 83B0     		sub	sp, sp, #12
 492              		.cfi_def_cfa_offset 24
 493 01bc 00AF     		add	r7, sp, #0
 494              		.cfi_def_cfa_register 7
 109:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	unsigned char rv;
 110:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*GPIO_MODER &= 0x00005555;
 495              		.loc 1 110 0
 496 01be 0E4B     		ldr	r3, .L26
 497 01c0 1A68     		ldr	r2, [r3]
 498 01c2 0D4B     		ldr	r3, .L26
 499 01c4 0D49     		ldr	r1, .L26+4
 500 01c6 0A40     		ands	r2, r1
 501 01c8 1A60     		str	r2, [r3]
 111:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_set(B_RS);
 502              		.loc 1 111 0
 503 01ca 0120     		movs	r0, #1
 504 01cc FFF7FEFF 		bl	ascii_ctrl_bit_set
 112:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_set(B_RW);
 505              		.loc 1 112 0
 506 01d0 0220     		movs	r0, #2
 507 01d2 FFF7FEFF 		bl	ascii_ctrl_bit_set
 113:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	rv = ascii_read_controller();
 508              		.loc 1 113 0
 509 01d6 FC1D     		adds	r4, r7, #7
 510 01d8 FFF7FEFF 		bl	ascii_read_controller
 511 01dc 0300     		movs	r3, r0
 512 01de 2370     		strb	r3, [r4]
 114:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*GPIO_MODER |= 0x55555555;
 513              		.loc 1 114 0
 514 01e0 054B     		ldr	r3, .L26
 515 01e2 1A68     		ldr	r2, [r3]
 516 01e4 044B     		ldr	r3, .L26
 517 01e6 0649     		ldr	r1, .L26+8
 518 01e8 0A43     		orrs	r2, r1
 519 01ea 1A60     		str	r2, [r3]
 115:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	return rv;
 520              		.loc 1 115 0
 521 01ec FB1D     		adds	r3, r7, #7
 522 01ee 1B78     		ldrb	r3, [r3]
 116:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 523              		.loc 1 116 0
 524 01f0 1800     		movs	r0, r3
 525 01f2 BD46     		mov	sp, r7
 526 01f4 03B0     		add	sp, sp, #12
 527              		@ sp needed
 528 01f6 90BD     		pop	{r4, r7, pc}
 529              	.L27:
 530              		.align	2
 531              	.L26:
 532 01f8 00100240 		.word	1073876992
 533 01fc 55550000 		.word	21845
 534 0200 55555555 		.word	1431655765
 535              		.cfi_endproc
 536              	.LFE9:
 538              		.align	1
 539              		.global	delay_milli
 540              		.syntax unified
 541              		.code	16
 542              		.thumb_func
 543              		.fpu softvfp
 545              	delay_milli:
 546              	.LFB10:
 117:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
 118:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void delay_milli(int ms)
 119:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 547              		.loc 1 119 0
 548              		.cfi_startproc
 549              		@ args = 0, pretend = 0, frame = 8
 550              		@ frame_needed = 1, uses_anonymous_args = 0
 551 0204 80B5     		push	{r7, lr}
 552              		.cfi_def_cfa_offset 8
 553              		.cfi_offset 7, -8
 554              		.cfi_offset 14, -4
 555 0206 82B0     		sub	sp, sp, #8
 556              		.cfi_def_cfa_offset 16
 557 0208 00AF     		add	r7, sp, #0
 558              		.cfi_def_cfa_register 7
 559 020a 7860     		str	r0, [r7, #4]
 120:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_micro(1000);
 560              		.loc 1 120 0
 561 020c FA23     		movs	r3, #250
 562 020e 9B00     		lsls	r3, r3, #2
 563 0210 1800     		movs	r0, r3
 564 0212 FFF7FEFF 		bl	delay_micro
 121:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 565              		.loc 1 121 0
 566 0216 C046     		nop
 567 0218 BD46     		mov	sp, r7
 568 021a 02B0     		add	sp, sp, #8
 569              		@ sp needed
 570 021c 80BD     		pop	{r7, pc}
 571              		.cfi_endproc
 572              	.LFE10:
 574              		.global	__aeabi_idiv
 575              		.align	1
 576              		.global	delay_micro
 577              		.syntax unified
 578              		.code	16
 579              		.thumb_func
 580              		.fpu softvfp
 582              	delay_micro:
 583              	.LFB11:
 122:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
 123:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void delay_micro(int us)
 124:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 584              		.loc 1 124 0
 585              		.cfi_startproc
 586              		@ args = 0, pretend = 0, frame = 8
 587              		@ frame_needed = 1, uses_anonymous_args = 0
 588 021e 80B5     		push	{r7, lr}
 589              		.cfi_def_cfa_offset 8
 590              		.cfi_offset 7, -8
 591              		.cfi_offset 14, -4
 592 0220 82B0     		sub	sp, sp, #8
 593              		.cfi_def_cfa_offset 16
 594 0222 00AF     		add	r7, sp, #0
 595              		.cfi_def_cfa_register 7
 596 0224 7860     		str	r0, [r7, #4]
 125:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	us = us/10;
 597              		.loc 1 125 0
 598 0226 7B68     		ldr	r3, [r7, #4]
 599 0228 0A21     		movs	r1, #10
 600 022a 1800     		movs	r0, r3
 601 022c FFF7FEFF 		bl	__aeabi_idiv
 602              	.LVL0:
 603 0230 0300     		movs	r3, r0
 604 0232 7B60     		str	r3, [r7, #4]
 126:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while(us > 0)
 605              		.loc 1 126 0
 606 0234 0AE0     		b	.L30
 607              	.L31:
 608              	.LBB2:
 127:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	{
 128:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_250ns();
 609              		.loc 1 128 0
 610 0236 FFF7FEFF 		bl	delay_250ns
 129:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_250ns();
 611              		.loc 1 129 0
 612 023a FFF7FEFF 		bl	delay_250ns
 130:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_250ns();
 613              		.loc 1 130 0
 614 023e FFF7FEFF 		bl	delay_250ns
 131:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_250ns();
 615              		.loc 1 131 0
 616 0242 FFF7FEFF 		bl	delay_250ns
 132:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	us--;
 617              		.loc 1 132 0
 618 0246 7B68     		ldr	r3, [r7, #4]
 619 0248 013B     		subs	r3, r3, #1
 620 024a 7B60     		str	r3, [r7, #4]
 621              	.L30:
 622              	.LBE2:
 126:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	{
 623              		.loc 1 126 0
 624 024c 7B68     		ldr	r3, [r7, #4]
 625 024e 002B     		cmp	r3, #0
 626 0250 F1DC     		bgt	.L31
 133:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	}
 134:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 627              		.loc 1 134 0
 628 0252 C046     		nop
 629 0254 BD46     		mov	sp, r7
 630 0256 02B0     		add	sp, sp, #8
 631              		@ sp needed
 632 0258 80BD     		pop	{r7, pc}
 633              		.cfi_endproc
 634              	.LFE11:
 636              		.align	1
 637              		.global	delay_250ns
 638              		.syntax unified
 639              		.code	16
 640              		.thumb_func
 641              		.fpu softvfp
 643              	delay_250ns:
 644              	.LFB12:
 135:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
 136:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void delay_250ns(void)
 137:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 645              		.loc 1 137 0
 646              		.cfi_startproc
 647              		@ args = 0, pretend = 0, frame = 8
 648              		@ frame_needed = 1, uses_anonymous_args = 0
 649 025a 80B5     		push	{r7, lr}
 650              		.cfi_def_cfa_offset 8
 651              		.cfi_offset 7, -8
 652              		.cfi_offset 14, -4
 653 025c 82B0     		sub	sp, sp, #8
 654              		.cfi_def_cfa_offset 16
 655 025e 00AF     		add	r7, sp, #0
 656              		.cfi_def_cfa_register 7
 138:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*STK_CTRL = 0;
 657              		.loc 1 138 0
 658 0260 0F4B     		ldr	r3, .L34
 659 0262 0022     		movs	r2, #0
 660 0264 1A60     		str	r2, [r3]
 139:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*STK_LOAD = 0x29; //0x2A - 1
 661              		.loc 1 139 0
 662 0266 0F4B     		ldr	r3, .L34+4
 663 0268 2922     		movs	r2, #41
 664 026a 1A60     		str	r2, [r3]
 140:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*STK_VAL = 0x0;
 665              		.loc 1 140 0
 666 026c 0E4B     		ldr	r3, .L34+8
 667 026e 0022     		movs	r2, #0
 668 0270 1A60     		str	r2, [r3]
 141:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*STK_CTRL = 5;
 669              		.loc 1 141 0
 670 0272 0B4B     		ldr	r3, .L34
 671 0274 0522     		movs	r2, #5
 672 0276 1A60     		str	r2, [r3]
 142:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	unsigned int ctrl = *STK_CTRL & 0x10000;
 673              		.loc 1 142 0
 674 0278 094B     		ldr	r3, .L34
 675 027a 1A68     		ldr	r2, [r3]
 676 027c 8023     		movs	r3, #128
 677 027e 5B02     		lsls	r3, r3, #9
 678 0280 1340     		ands	r3, r2
 679 0282 7B60     		str	r3, [r7, #4]
 143:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while((*STK_CTRL & 0x10000) == 0);
 680              		.loc 1 143 0
 681 0284 C046     		nop
 682              	.L33:
 683              		.loc 1 143 0 is_stmt 0 discriminator 1
 684 0286 064B     		ldr	r3, .L34
 685 0288 1A68     		ldr	r2, [r3]
 686 028a 8023     		movs	r3, #128
 687 028c 5B02     		lsls	r3, r3, #9
 688 028e 1340     		ands	r3, r2
 689 0290 F9D0     		beq	.L33
 144:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*STK_CTRL= 0;
 690              		.loc 1 144 0 is_stmt 1
 691 0292 034B     		ldr	r3, .L34
 692 0294 0022     		movs	r2, #0
 693 0296 1A60     		str	r2, [r3]
 145:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	
 146:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 694              		.loc 1 146 0
 695 0298 C046     		nop
 696 029a BD46     		mov	sp, r7
 697 029c 02B0     		add	sp, sp, #8
 698              		@ sp needed
 699 029e 80BD     		pop	{r7, pc}
 700              	.L35:
 701              		.align	2
 702              	.L34:
 703 02a0 10E000E0 		.word	-536813552
 704 02a4 14E000E0 		.word	-536813548
 705 02a8 18E000E0 		.word	-536813544
 706              		.cfi_endproc
 707              	.LFE12:
 709              		.align	1
 710              		.global	ascii_write_char
 711              		.syntax unified
 712              		.code	16
 713              		.thumb_func
 714              		.fpu softvfp
 716              	ascii_write_char:
 717              	.LFB13:
 147:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
 148:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void ascii_write_char(unsigned char c)
 149:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 718              		.loc 1 149 0
 719              		.cfi_startproc
 720              		@ args = 0, pretend = 0, frame = 8
 721              		@ frame_needed = 1, uses_anonymous_args = 0
 722 02ac 80B5     		push	{r7, lr}
 723              		.cfi_def_cfa_offset 8
 724              		.cfi_offset 7, -8
 725              		.cfi_offset 14, -4
 726 02ae 82B0     		sub	sp, sp, #8
 727              		.cfi_def_cfa_offset 16
 728 02b0 00AF     		add	r7, sp, #0
 729              		.cfi_def_cfa_register 7
 730 02b2 0200     		movs	r2, r0
 731 02b4 FB1D     		adds	r3, r7, #7
 732 02b6 1A70     		strb	r2, [r3]
 150:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while((ascii_read_status() & 0x80) == 0x80){}
 733              		.loc 1 150 0
 734 02b8 C046     		nop
 735              	.L37:
 736              		.loc 1 150 0 is_stmt 0 discriminator 1
 737 02ba FFF7FEFF 		bl	ascii_read_status
 738 02be 0300     		movs	r3, r0
 739 02c0 1A00     		movs	r2, r3
 740 02c2 8023     		movs	r3, #128
 741 02c4 1340     		ands	r3, r2
 742 02c6 802B     		cmp	r3, #128
 743 02c8 F7D0     		beq	.L37
 151:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_micro(8);
 744              		.loc 1 151 0 is_stmt 1
 745 02ca 0820     		movs	r0, #8
 746 02cc FFF7FEFF 		bl	delay_micro
 152:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_write_data(c);
 747              		.loc 1 152 0
 748 02d0 FB1D     		adds	r3, r7, #7
 749 02d2 1B78     		ldrb	r3, [r3]
 750 02d4 1800     		movs	r0, r3
 751 02d6 FFF7FEFF 		bl	ascii_write_data
 153:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_micro(45);
 752              		.loc 1 153 0
 753 02da 2D20     		movs	r0, #45
 754 02dc FFF7FEFF 		bl	delay_micro
 154:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 755              		.loc 1 154 0
 756 02e0 C046     		nop
 757 02e2 BD46     		mov	sp, r7
 758 02e4 02B0     		add	sp, sp, #8
 759              		@ sp needed
 760 02e6 80BD     		pop	{r7, pc}
 761              		.cfi_endproc
 762              	.LFE13:
 764              		.align	1
 765              		.global	ascii_gotoxy
 766              		.syntax unified
 767              		.code	16
 768              		.thumb_func
 769              		.fpu softvfp
 771              	ascii_gotoxy:
 772              	.LFB14:
 155:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
 156:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void ascii_gotoxy(int row, int col)
 157:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 773              		.loc 1 157 0
 774              		.cfi_startproc
 775              		@ args = 0, pretend = 0, frame = 16
 776              		@ frame_needed = 1, uses_anonymous_args = 0
 777 02e8 80B5     		push	{r7, lr}
 778              		.cfi_def_cfa_offset 8
 779              		.cfi_offset 7, -8
 780              		.cfi_offset 14, -4
 781 02ea 84B0     		sub	sp, sp, #16
 782              		.cfi_def_cfa_offset 24
 783 02ec 00AF     		add	r7, sp, #0
 784              		.cfi_def_cfa_register 7
 785 02ee 7860     		str	r0, [r7, #4]
 786 02f0 3960     		str	r1, [r7]
 158:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	unsigned int adress;
 159:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	adress = row -1;
 787              		.loc 1 159 0
 788 02f2 7B68     		ldr	r3, [r7, #4]
 789 02f4 013B     		subs	r3, r3, #1
 790 02f6 FB60     		str	r3, [r7, #12]
 160:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	if(col == 2)
 791              		.loc 1 160 0
 792 02f8 3B68     		ldr	r3, [r7]
 793 02fa 022B     		cmp	r3, #2
 794 02fc 02D1     		bne	.L39
 161:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	{
 162:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 		adress = adress + 0x40;
 795              		.loc 1 162 0
 796 02fe FB68     		ldr	r3, [r7, #12]
 797 0300 4033     		adds	r3, r3, #64
 798 0302 FB60     		str	r3, [r7, #12]
 799              	.L39:
 163:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	}
 164:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_write_cmd(0x80|adress);
 800              		.loc 1 164 0
 801 0304 FB68     		ldr	r3, [r7, #12]
 802 0306 DBB2     		uxtb	r3, r3
 803 0308 8022     		movs	r2, #128
 804 030a 5242     		rsbs	r2, r2, #0
 805 030c 1343     		orrs	r3, r2
 806 030e DBB2     		uxtb	r3, r3
 807 0310 1800     		movs	r0, r3
 808 0312 FFF7FEFF 		bl	ascii_write_cmd
 165:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 809              		.loc 1 165 0
 810 0316 C046     		nop
 811 0318 BD46     		mov	sp, r7
 812 031a 04B0     		add	sp, sp, #16
 813              		@ sp needed
 814 031c 80BD     		pop	{r7, pc}
 815              		.cfi_endproc
 816              	.LFE14:
 818              		.align	1
 819              		.global	ascii_init
 820              		.syntax unified
 821              		.code	16
 822              		.thumb_func
 823              		.fpu softvfp
 825              	ascii_init:
 826              	.LFB15:
 166:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
 167:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void ascii_init(void)
 168:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 827              		.loc 1 168 0
 828              		.cfi_startproc
 829              		@ args = 0, pretend = 0, frame = 0
 830              		@ frame_needed = 1, uses_anonymous_args = 0
 831 031e 80B5     		push	{r7, lr}
 832              		.cfi_def_cfa_offset 8
 833              		.cfi_offset 7, -8
 834              		.cfi_offset 14, -4
 835 0320 00AF     		add	r7, sp, #0
 836              		.cfi_def_cfa_register 7
 169:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while((ascii_read_status() & 0x80) == 0x80){}
 837              		.loc 1 169 0
 838 0322 C046     		nop
 839              	.L41:
 840              		.loc 1 169 0 is_stmt 0 discriminator 1
 841 0324 FFF7FEFF 		bl	ascii_read_status
 842 0328 0300     		movs	r3, r0
 843 032a 1A00     		movs	r2, r3
 844 032c 8023     		movs	r3, #128
 845 032e 1340     		ands	r3, r2
 846 0330 802B     		cmp	r3, #128
 847 0332 F7D0     		beq	.L41
 170:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_micro(8);
 848              		.loc 1 170 0 is_stmt 1
 849 0334 0820     		movs	r0, #8
 850 0336 FFF7FEFF 		bl	delay_micro
 171:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_write_cmd(0x38); //00111000
 851              		.loc 1 171 0
 852 033a 3820     		movs	r0, #56
 853 033c FFF7FEFF 		bl	ascii_write_cmd
 172:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_micro(40);
 854              		.loc 1 172 0
 855 0340 2820     		movs	r0, #40
 856 0342 FFF7FEFF 		bl	delay_micro
 173:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	
 174:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while((ascii_read_status() & 0x80) == 0x80){}
 857              		.loc 1 174 0
 858 0346 C046     		nop
 859              	.L42:
 860              		.loc 1 174 0 is_stmt 0 discriminator 1
 861 0348 FFF7FEFF 		bl	ascii_read_status
 862 034c 0300     		movs	r3, r0
 863 034e 1A00     		movs	r2, r3
 864 0350 8023     		movs	r3, #128
 865 0352 1340     		ands	r3, r2
 866 0354 802B     		cmp	r3, #128
 867 0356 F7D0     		beq	.L42
 175:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_micro(8);
 868              		.loc 1 175 0 is_stmt 1
 869 0358 0820     		movs	r0, #8
 870 035a FFF7FEFF 		bl	delay_micro
 176:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_write_cmd(0x0D); //00001110
 871              		.loc 1 176 0
 872 035e 0D20     		movs	r0, #13
 873 0360 FFF7FEFF 		bl	ascii_write_cmd
 177:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_micro(40);
 874              		.loc 1 177 0
 875 0364 2820     		movs	r0, #40
 876 0366 FFF7FEFF 		bl	delay_micro
 178:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	
 179:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while((ascii_read_status() & 0x80) == 0x80){}
 877              		.loc 1 179 0
 878 036a C046     		nop
 879              	.L43:
 880              		.loc 1 179 0 is_stmt 0 discriminator 1
 881 036c FFF7FEFF 		bl	ascii_read_status
 882 0370 0300     		movs	r3, r0
 883 0372 1A00     		movs	r2, r3
 884 0374 8023     		movs	r3, #128
 885 0376 1340     		ands	r3, r2
 886 0378 802B     		cmp	r3, #128
 887 037a F7D0     		beq	.L43
 180:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_micro(8);
 888              		.loc 1 180 0 is_stmt 1
 889 037c 0820     		movs	r0, #8
 890 037e FFF7FEFF 		bl	delay_micro
 181:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_write_cmd(1);
 891              		.loc 1 181 0
 892 0382 0120     		movs	r0, #1
 893 0384 FFF7FEFF 		bl	ascii_write_cmd
 182:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_milli(2);
 894              		.loc 1 182 0
 895 0388 0220     		movs	r0, #2
 896 038a FFF7FEFF 		bl	delay_milli
 183:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	
 184:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while((ascii_read_status() & 0x80) == 0x80){}
 897              		.loc 1 184 0
 898 038e C046     		nop
 899              	.L44:
 900              		.loc 1 184 0 is_stmt 0 discriminator 1
 901 0390 FFF7FEFF 		bl	ascii_read_status
 902 0394 0300     		movs	r3, r0
 903 0396 1A00     		movs	r2, r3
 904 0398 8023     		movs	r3, #128
 905 039a 1340     		ands	r3, r2
 906 039c 802B     		cmp	r3, #128
 907 039e F7D0     		beq	.L44
 185:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_micro(8);
 908              		.loc 1 185 0 is_stmt 1
 909 03a0 0820     		movs	r0, #8
 910 03a2 FFF7FEFF 		bl	delay_micro
 186:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_write_cmd(0x04); //Rätt? Increment? 00000100
 911              		.loc 1 186 0
 912 03a6 0420     		movs	r0, #4
 913 03a8 FFF7FEFF 		bl	ascii_write_cmd
 187:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_micro(39);
 914              		.loc 1 187 0
 915 03ac 2720     		movs	r0, #39
 916 03ae FFF7FEFF 		bl	delay_micro
 188:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 917              		.loc 1 188 0
 918 03b2 C046     		nop
 919 03b4 BD46     		mov	sp, r7
 920              		@ sp needed
 921 03b6 80BD     		pop	{r7, pc}
 922              		.cfi_endproc
 923              	.LFE15:
 925              		.section	.rodata
 926              		.align	2
 927              	.LC0:
 928 0000 49662079 		.ascii	"If you can dream it\000"
 928      6F752063 
 928      616E2064 
 928      7265616D 
 928      20697400 
 929              		.align	2
 930              	.LC2:
 931 0014 596F7520 		.ascii	"You can do it!\000"
 931      63616E20 
 931      646F2069 
 931      742100
 932              		.text
 933              		.align	1
 934              		.global	main
 935              		.syntax unified
 936              		.code	16
 937              		.thumb_func
 938              		.fpu softvfp
 940              	main:
 941              	.LFB16:
 189:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
 190:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** int main(int argc, char **argv)
 191:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 942              		.loc 1 191 0
 943              		.cfi_startproc
 944              		@ args = 0, pretend = 0, frame = 48
 945              		@ frame_needed = 1, uses_anonymous_args = 0
 946 03b8 B0B5     		push	{r4, r5, r7, lr}
 947              		.cfi_def_cfa_offset 16
 948              		.cfi_offset 4, -16
 949              		.cfi_offset 5, -12
 950              		.cfi_offset 7, -8
 951              		.cfi_offset 14, -4
 952 03ba 8CB0     		sub	sp, sp, #48
 953              		.cfi_def_cfa_offset 64
 954 03bc 00AF     		add	r7, sp, #0
 955              		.cfi_def_cfa_register 7
 956 03be 7860     		str	r0, [r7, #4]
 957 03c0 3960     		str	r1, [r7]
 192:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	
 193:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	//ascii_ctrl_bit_set(0x01)
 194:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	char *s;
 195:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	char test1[] = "If you can dream it";
 958              		.loc 1 195 0
 959 03c2 1824     		movs	r4, #24
 960 03c4 3B19     		adds	r3, r7, r4
 961 03c6 1E4A     		ldr	r2, .L51
 962 03c8 23CA     		ldmia	r2!, {r0, r1, r5}
 963 03ca 23C3     		stmia	r3!, {r0, r1, r5}
 964 03cc 03CA     		ldmia	r2!, {r0, r1}
 965 03ce 03C3     		stmia	r3!, {r0, r1}
 196:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	char test2[] = "You can do it!";
 966              		.loc 1 196 0
 967 03d0 0823     		movs	r3, #8
 968 03d2 FB18     		adds	r3, r7, r3
 969 03d4 1B4A     		ldr	r2, .L51+4
 970 03d6 23CA     		ldmia	r2!, {r0, r1, r5}
 971 03d8 23C3     		stmia	r3!, {r0, r1, r5}
 972 03da 1188     		ldrh	r1, [r2]
 973 03dc 1980     		strh	r1, [r3]
 974 03de 9278     		ldrb	r2, [r2, #2]
 975 03e0 9A70     		strb	r2, [r3, #2]
 197:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	
 198:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	init_app();
 976              		.loc 1 198 0
 977 03e2 FFF7FEFF 		bl	init_app
 199:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_init();
 978              		.loc 1 199 0
 979 03e6 FFF7FEFF 		bl	ascii_init
 200:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_gotoxy(1,1);
 980              		.loc 1 200 0
 981 03ea 0121     		movs	r1, #1
 982 03ec 0120     		movs	r0, #1
 983 03ee FFF7FEFF 		bl	ascii_gotoxy
 201:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	s = test1;
 984              		.loc 1 201 0
 985 03f2 3B19     		adds	r3, r7, r4
 986 03f4 FB62     		str	r3, [r7, #44]
 202:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while(*s)
 987              		.loc 1 202 0
 988 03f6 06E0     		b	.L46
 989              	.L47:
 203:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	{
 204:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 		ascii_write_char(*s++);
 990              		.loc 1 204 0
 991 03f8 FB6A     		ldr	r3, [r7, #44]
 992 03fa 5A1C     		adds	r2, r3, #1
 993 03fc FA62     		str	r2, [r7, #44]
 994 03fe 1B78     		ldrb	r3, [r3]
 995 0400 1800     		movs	r0, r3
 996 0402 FFF7FEFF 		bl	ascii_write_char
 997              	.L46:
 202:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while(*s)
 998              		.loc 1 202 0
 999 0406 FB6A     		ldr	r3, [r7, #44]
 1000 0408 1B78     		ldrb	r3, [r3]
 1001 040a 002B     		cmp	r3, #0
 1002 040c F4D1     		bne	.L47
 205:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	}
 206:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_gotoxy(1,2);
 1003              		.loc 1 206 0
 1004 040e 0221     		movs	r1, #2
 1005 0410 0120     		movs	r0, #1
 1006 0412 FFF7FEFF 		bl	ascii_gotoxy
 207:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	s = test2;
 1007              		.loc 1 207 0
 1008 0416 0823     		movs	r3, #8
 1009 0418 FB18     		adds	r3, r7, r3
 1010 041a FB62     		str	r3, [r7, #44]
 208:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while(*s)
 1011              		.loc 1 208 0
 1012 041c 06E0     		b	.L48
 1013              	.L49:
 209:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	{
 210:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 		ascii_write_char(*s++);
 1014              		.loc 1 210 0
 1015 041e FB6A     		ldr	r3, [r7, #44]
 1016 0420 5A1C     		adds	r2, r3, #1
 1017 0422 FA62     		str	r2, [r7, #44]
 1018 0424 1B78     		ldrb	r3, [r3]
 1019 0426 1800     		movs	r0, r3
 1020 0428 FFF7FEFF 		bl	ascii_write_char
 1021              	.L48:
 208:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while(*s)
 1022              		.loc 1 208 0
 1023 042c FB6A     		ldr	r3, [r7, #44]
 1024 042e 1B78     		ldrb	r3, [r3]
 1025 0430 002B     		cmp	r3, #0
 1026 0432 F4D1     		bne	.L49
 211:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	}
 212:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	return 0;
 1027              		.loc 1 212 0
 1028 0434 0023     		movs	r3, #0
 213:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	
 214:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 1029              		.loc 1 214 0
 1030 0436 1800     		movs	r0, r3
 1031 0438 BD46     		mov	sp, r7
 1032 043a 0CB0     		add	sp, sp, #48
 1033              		@ sp needed
 1034 043c B0BD     		pop	{r4, r5, r7, pc}
 1035              	.L52:
 1036 043e C046     		.align	2
 1037              	.L51:
 1038 0440 00000000 		.word	.LC0
 1039 0444 14000000 		.word	.LC2
 1040              		.cfi_endproc
 1041              	.LFE16:
 1043              	.Letext0:
