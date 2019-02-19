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
  49              		.global	ascii_ctrl_bit_set
  50              		.syntax unified
  51              		.code	16
  52              		.thumb_func
  53              		.fpu softvfp
  55              	ascii_ctrl_bit_set:
  56              	.LFB1:
  35:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
  36:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void ascii_ctrl_bit_set(unsigned char x)
  37:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
  57              		.loc 1 37 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 16
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 84B0     		sub	sp, sp, #16
  66              		.cfi_def_cfa_offset 24
  67 0004 00AF     		add	r7, sp, #0
  68              		.cfi_def_cfa_register 7
  69 0006 0200     		movs	r2, r0
  70 0008 FB1D     		adds	r3, r7, #7
  71 000a 1A70     		strb	r2, [r3]
  38:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	unsigned char c;
  39:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	c = *GPIO_ODR_LOW;
  72              		.loc 1 39 0
  73 000c 0C4A     		ldr	r2, .L3
  74 000e 0F21     		movs	r1, #15
  75 0010 7B18     		adds	r3, r7, r1
  76 0012 1278     		ldrb	r2, [r2]
  77 0014 1A70     		strb	r2, [r3]
  40:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	c |= ( B_SELECT | x ); //Varför ettställa B_select?
  78              		.loc 1 40 0
  79 0016 FA1D     		adds	r2, r7, #7
  80 0018 7B18     		adds	r3, r7, r1
  81 001a 1278     		ldrb	r2, [r2]
  82 001c 1B78     		ldrb	r3, [r3]
  83 001e 1343     		orrs	r3, r2
  84 0020 DAB2     		uxtb	r2, r3
  85 0022 0800     		movs	r0, r1
  86 0024 7B18     		adds	r3, r7, r1
  87 0026 0421     		movs	r1, #4
  88 0028 0A43     		orrs	r2, r1
  89 002a 1A70     		strb	r2, [r3]
  41:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*GPIO_ODR_LOW = c;
  90              		.loc 1 41 0
  91 002c 044A     		ldr	r2, .L3
  92 002e 0100     		movs	r1, r0
  93 0030 7B18     		adds	r3, r7, r1
  94 0032 1B78     		ldrb	r3, [r3]
  95 0034 1370     		strb	r3, [r2]
  42:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
  96              		.loc 1 42 0
  97 0036 C046     		nop
  98 0038 BD46     		mov	sp, r7
  99 003a 04B0     		add	sp, sp, #16
 100              		@ sp needed
 101 003c 80BD     		pop	{r7, pc}
 102              	.L4:
 103 003e C046     		.align	2
 104              	.L3:
 105 0040 14100240 		.word	1073877012
 106              		.cfi_endproc
 107              	.LFE1:
 109              		.align	1
 110              		.global	ascii_ctrl_bit_clear
 111              		.syntax unified
 112              		.code	16
 113              		.thumb_func
 114              		.fpu softvfp
 116              	ascii_ctrl_bit_clear:
 117              	.LFB2:
  43:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
  44:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void ascii_ctrl_bit_clear(unsigned char x)
  45:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 118              		.loc 1 45 0
 119              		.cfi_startproc
 120              		@ args = 0, pretend = 0, frame = 16
 121              		@ frame_needed = 1, uses_anonymous_args = 0
 122 0044 80B5     		push	{r7, lr}
 123              		.cfi_def_cfa_offset 8
 124              		.cfi_offset 7, -8
 125              		.cfi_offset 14, -4
 126 0046 84B0     		sub	sp, sp, #16
 127              		.cfi_def_cfa_offset 24
 128 0048 00AF     		add	r7, sp, #0
 129              		.cfi_def_cfa_register 7
 130 004a 0200     		movs	r2, r0
 131 004c FB1D     		adds	r3, r7, #7
 132 004e 1A70     		strb	r2, [r3]
  46:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	unsigned char c;
  47:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	c = *GPIO_ODR_LOW;
 133              		.loc 1 47 0
 134 0050 0D4A     		ldr	r2, .L6
 135 0052 0F21     		movs	r1, #15
 136 0054 7B18     		adds	r3, r7, r1
 137 0056 1278     		ldrb	r2, [r2]
 138 0058 1A70     		strb	r2, [r3]
  48:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	c &= (B_SELECT | ~x); //~ bildar 1-komplement
 139              		.loc 1 48 0
 140 005a FB1D     		adds	r3, r7, #7
 141 005c 1B78     		ldrb	r3, [r3]
 142 005e 5BB2     		sxtb	r3, r3
 143 0060 DB43     		mvns	r3, r3
 144 0062 5BB2     		sxtb	r3, r3
 145 0064 0422     		movs	r2, #4
 146 0066 1343     		orrs	r3, r2
 147 0068 5BB2     		sxtb	r3, r3
 148 006a 7A18     		adds	r2, r7, r1
 149 006c 1278     		ldrb	r2, [r2]
 150 006e 52B2     		sxtb	r2, r2
 151 0070 1340     		ands	r3, r2
 152 0072 5AB2     		sxtb	r2, r3
 153 0074 7B18     		adds	r3, r7, r1
 154 0076 1A70     		strb	r2, [r3]
  49:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*GPIO_ODR_LOW = c;
 155              		.loc 1 49 0
 156 0078 034A     		ldr	r2, .L6
 157 007a 7B18     		adds	r3, r7, r1
 158 007c 1B78     		ldrb	r3, [r3]
 159 007e 1370     		strb	r3, [r2]
  50:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 160              		.loc 1 50 0
 161 0080 C046     		nop
 162 0082 BD46     		mov	sp, r7
 163 0084 04B0     		add	sp, sp, #16
 164              		@ sp needed
 165 0086 80BD     		pop	{r7, pc}
 166              	.L7:
 167              		.align	2
 168              	.L6:
 169 0088 14100240 		.word	1073877012
 170              		.cfi_endproc
 171              	.LFE2:
 173              		.align	1
 174              		.global	ascii_write_controller
 175              		.syntax unified
 176              		.code	16
 177              		.thumb_func
 178              		.fpu softvfp
 180              	ascii_write_controller:
 181              	.LFB3:
  51:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
  52:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void ascii_write_controller(unsigned char byte)
  53:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 182              		.loc 1 53 0
 183              		.cfi_startproc
 184              		@ args = 0, pretend = 0, frame = 8
 185              		@ frame_needed = 1, uses_anonymous_args = 0
 186 008c 80B5     		push	{r7, lr}
 187              		.cfi_def_cfa_offset 8
 188              		.cfi_offset 7, -8
 189              		.cfi_offset 14, -4
 190 008e 82B0     		sub	sp, sp, #8
 191              		.cfi_def_cfa_offset 16
 192 0090 00AF     		add	r7, sp, #0
 193              		.cfi_def_cfa_register 7
 194 0092 0200     		movs	r2, r0
 195 0094 FB1D     		adds	r3, r7, #7
 196 0096 1A70     		strb	r2, [r3]
  54:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_set( B_E );
 197              		.loc 1 54 0
 198 0098 4020     		movs	r0, #64
 199 009a FFF7FEFF 		bl	ascii_ctrl_bit_set
  55:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*GPIO_ODR_HIGH = byte;
 200              		.loc 1 55 0
 201 009e 064A     		ldr	r2, .L9
 202 00a0 FB1D     		adds	r3, r7, #7
 203 00a2 1B78     		ldrb	r3, [r3]
 204 00a4 1370     		strb	r3, [r2]
  56:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_250ns();
 205              		.loc 1 56 0
 206 00a6 FFF7FEFF 		bl	delay_250ns
  57:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_clear(B_E);	//Ska delay vara före eller efter detta?
 207              		.loc 1 57 0
 208 00aa 4020     		movs	r0, #64
 209 00ac FFF7FEFF 		bl	ascii_ctrl_bit_clear
  58:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 210              		.loc 1 58 0
 211 00b0 C046     		nop
 212 00b2 BD46     		mov	sp, r7
 213 00b4 02B0     		add	sp, sp, #8
 214              		@ sp needed
 215 00b6 80BD     		pop	{r7, pc}
 216              	.L10:
 217              		.align	2
 218              	.L9:
 219 00b8 15100240 		.word	1073877013
 220              		.cfi_endproc
 221              	.LFE3:
 223              		.align	1
 224              		.global	ascii_read_controller
 225              		.syntax unified
 226              		.code	16
 227              		.thumb_func
 228              		.fpu softvfp
 230              	ascii_read_controller:
 231              	.LFB4:
  59:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
  60:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** unsigned char ascii_read_controller(void)
  61:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 232              		.loc 1 61 0
 233              		.cfi_startproc
 234              		@ args = 0, pretend = 0, frame = 8
 235              		@ frame_needed = 1, uses_anonymous_args = 0
 236 00bc 80B5     		push	{r7, lr}
 237              		.cfi_def_cfa_offset 8
 238              		.cfi_offset 7, -8
 239              		.cfi_offset 14, -4
 240 00be 82B0     		sub	sp, sp, #8
 241              		.cfi_def_cfa_offset 16
 242 00c0 00AF     		add	r7, sp, #0
 243              		.cfi_def_cfa_register 7
  62:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	unsigned char rv;
  63:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_set( B_E );
 244              		.loc 1 63 0
 245 00c2 4020     		movs	r0, #64
 246 00c4 FFF7FEFF 		bl	ascii_ctrl_bit_set
  64:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_250ns();
 247              		.loc 1 64 0
 248 00c8 FFF7FEFF 		bl	delay_250ns
  65:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_250ns();
 249              		.loc 1 65 0
 250 00cc FFF7FEFF 		bl	delay_250ns
  66:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	rv = *GPIO_IDR_HIGH;
 251              		.loc 1 66 0
 252 00d0 064A     		ldr	r2, .L13
 253 00d2 FB1D     		adds	r3, r7, #7
 254 00d4 1278     		ldrb	r2, [r2]
 255 00d6 1A70     		strb	r2, [r3]
  67:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_clear( B_E );
 256              		.loc 1 67 0
 257 00d8 4020     		movs	r0, #64
 258 00da FFF7FEFF 		bl	ascii_ctrl_bit_clear
  68:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	return rv;
 259              		.loc 1 68 0
 260 00de FB1D     		adds	r3, r7, #7
 261 00e0 1B78     		ldrb	r3, [r3]
  69:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	
  70:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 262              		.loc 1 70 0
 263 00e2 1800     		movs	r0, r3
 264 00e4 BD46     		mov	sp, r7
 265 00e6 02B0     		add	sp, sp, #8
 266              		@ sp needed
 267 00e8 80BD     		pop	{r7, pc}
 268              	.L14:
 269 00ea C046     		.align	2
 270              	.L13:
 271 00ec 11100240 		.word	1073877009
 272              		.cfi_endproc
 273              	.LFE4:
 275              		.align	1
 276              		.global	ascii_write_cmd
 277              		.syntax unified
 278              		.code	16
 279              		.thumb_func
 280              		.fpu softvfp
 282              	ascii_write_cmd:
 283              	.LFB5:
  71:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
  72:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void ascii_write_cmd(unsigned char command)
  73:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 284              		.loc 1 73 0
 285              		.cfi_startproc
 286              		@ args = 0, pretend = 0, frame = 8
 287              		@ frame_needed = 1, uses_anonymous_args = 0
 288 00f0 80B5     		push	{r7, lr}
 289              		.cfi_def_cfa_offset 8
 290              		.cfi_offset 7, -8
 291              		.cfi_offset 14, -4
 292 00f2 82B0     		sub	sp, sp, #8
 293              		.cfi_def_cfa_offset 16
 294 00f4 00AF     		add	r7, sp, #0
 295              		.cfi_def_cfa_register 7
 296 00f6 0200     		movs	r2, r0
 297 00f8 FB1D     		adds	r3, r7, #7
 298 00fa 1A70     		strb	r2, [r3]
  74:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_clear(B_RS);
 299              		.loc 1 74 0
 300 00fc 0120     		movs	r0, #1
 301 00fe FFF7FEFF 		bl	ascii_ctrl_bit_clear
  75:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_clear(B_RW);
 302              		.loc 1 75 0
 303 0102 0220     		movs	r0, #2
 304 0104 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  76:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_write_controller(command);
 305              		.loc 1 76 0
 306 0108 FB1D     		adds	r3, r7, #7
 307 010a 1B78     		ldrb	r3, [r3]
 308 010c 1800     		movs	r0, r3
 309 010e FFF7FEFF 		bl	ascii_write_controller
  77:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	
  78:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 310              		.loc 1 78 0
 311 0112 C046     		nop
 312 0114 BD46     		mov	sp, r7
 313 0116 02B0     		add	sp, sp, #8
 314              		@ sp needed
 315 0118 80BD     		pop	{r7, pc}
 316              		.cfi_endproc
 317              	.LFE5:
 319              		.align	1
 320              		.global	ascii_write_data
 321              		.syntax unified
 322              		.code	16
 323              		.thumb_func
 324              		.fpu softvfp
 326              	ascii_write_data:
 327              	.LFB6:
  79:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
  80:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void ascii_write_data(unsigned char data)
  81:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 328              		.loc 1 81 0
 329              		.cfi_startproc
 330              		@ args = 0, pretend = 0, frame = 8
 331              		@ frame_needed = 1, uses_anonymous_args = 0
 332 011a 80B5     		push	{r7, lr}
 333              		.cfi_def_cfa_offset 8
 334              		.cfi_offset 7, -8
 335              		.cfi_offset 14, -4
 336 011c 82B0     		sub	sp, sp, #8
 337              		.cfi_def_cfa_offset 16
 338 011e 00AF     		add	r7, sp, #0
 339              		.cfi_def_cfa_register 7
 340 0120 0200     		movs	r2, r0
 341 0122 FB1D     		adds	r3, r7, #7
 342 0124 1A70     		strb	r2, [r3]
  82:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_set(B_RS);
 343              		.loc 1 82 0
 344 0126 0120     		movs	r0, #1
 345 0128 FFF7FEFF 		bl	ascii_ctrl_bit_set
  83:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_clear(B_RW);
 346              		.loc 1 83 0
 347 012c 0220     		movs	r0, #2
 348 012e FFF7FEFF 		bl	ascii_ctrl_bit_clear
  84:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_write_controller(data);
 349              		.loc 1 84 0
 350 0132 FB1D     		adds	r3, r7, #7
 351 0134 1B78     		ldrb	r3, [r3]
 352 0136 1800     		movs	r0, r3
 353 0138 FFF7FEFF 		bl	ascii_write_controller
  85:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 354              		.loc 1 85 0
 355 013c C046     		nop
 356 013e BD46     		mov	sp, r7
 357 0140 02B0     		add	sp, sp, #8
 358              		@ sp needed
 359 0142 80BD     		pop	{r7, pc}
 360              		.cfi_endproc
 361              	.LFE6:
 363              		.align	1
 364              		.global	ascii_read_status
 365              		.syntax unified
 366              		.code	16
 367              		.thumb_func
 368              		.fpu softvfp
 370              	ascii_read_status:
 371              	.LFB7:
  86:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
  87:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
  88:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
  89:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** unsigned char ascii_read_status(void)
  90:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 372              		.loc 1 90 0
 373              		.cfi_startproc
 374              		@ args = 0, pretend = 0, frame = 8
 375              		@ frame_needed = 1, uses_anonymous_args = 0
 376 0144 90B5     		push	{r4, r7, lr}
 377              		.cfi_def_cfa_offset 12
 378              		.cfi_offset 4, -12
 379              		.cfi_offset 7, -8
 380              		.cfi_offset 14, -4
 381 0146 83B0     		sub	sp, sp, #12
 382              		.cfi_def_cfa_offset 24
 383 0148 00AF     		add	r7, sp, #0
 384              		.cfi_def_cfa_register 7
  91:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	unsigned char rv;
  92:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*GPIO_MODER &= 0x00005555;
 385              		.loc 1 92 0
 386 014a 0E4B     		ldr	r3, .L19
 387 014c 1A68     		ldr	r2, [r3]
 388 014e 0D4B     		ldr	r3, .L19
 389 0150 0D49     		ldr	r1, .L19+4
 390 0152 0A40     		ands	r2, r1
 391 0154 1A60     		str	r2, [r3]
  93:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_set(B_RW);
 392              		.loc 1 93 0
 393 0156 0220     		movs	r0, #2
 394 0158 FFF7FEFF 		bl	ascii_ctrl_bit_set
  94:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_clear(B_RS);
 395              		.loc 1 94 0
 396 015c 0120     		movs	r0, #1
 397 015e FFF7FEFF 		bl	ascii_ctrl_bit_clear
  95:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	rv = ascii_read_controller();
 398              		.loc 1 95 0
 399 0162 FC1D     		adds	r4, r7, #7
 400 0164 FFF7FEFF 		bl	ascii_read_controller
 401 0168 0300     		movs	r3, r0
 402 016a 2370     		strb	r3, [r4]
  96:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*GPIO_MODER |= 0x55555555;
 403              		.loc 1 96 0
 404 016c 054B     		ldr	r3, .L19
 405 016e 1A68     		ldr	r2, [r3]
 406 0170 044B     		ldr	r3, .L19
 407 0172 0649     		ldr	r1, .L19+8
 408 0174 0A43     		orrs	r2, r1
 409 0176 1A60     		str	r2, [r3]
  97:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	return rv;
 410              		.loc 1 97 0
 411 0178 FB1D     		adds	r3, r7, #7
 412 017a 1B78     		ldrb	r3, [r3]
  98:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 413              		.loc 1 98 0
 414 017c 1800     		movs	r0, r3
 415 017e BD46     		mov	sp, r7
 416 0180 03B0     		add	sp, sp, #12
 417              		@ sp needed
 418 0182 90BD     		pop	{r4, r7, pc}
 419              	.L20:
 420              		.align	2
 421              	.L19:
 422 0184 00100240 		.word	1073876992
 423 0188 55550000 		.word	21845
 424 018c 55555555 		.word	1431655765
 425              		.cfi_endproc
 426              	.LFE7:
 428              		.align	1
 429              		.global	ascii_read_data
 430              		.syntax unified
 431              		.code	16
 432              		.thumb_func
 433              		.fpu softvfp
 435              	ascii_read_data:
 436              	.LFB8:
  99:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
 100:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** unsigned char ascii_read_data(void)
 101:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 437              		.loc 1 101 0
 438              		.cfi_startproc
 439              		@ args = 0, pretend = 0, frame = 8
 440              		@ frame_needed = 1, uses_anonymous_args = 0
 441 0190 90B5     		push	{r4, r7, lr}
 442              		.cfi_def_cfa_offset 12
 443              		.cfi_offset 4, -12
 444              		.cfi_offset 7, -8
 445              		.cfi_offset 14, -4
 446 0192 83B0     		sub	sp, sp, #12
 447              		.cfi_def_cfa_offset 24
 448 0194 00AF     		add	r7, sp, #0
 449              		.cfi_def_cfa_register 7
 102:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	unsigned char rv;
 103:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*GPIO_MODER &= 0x00005555;
 450              		.loc 1 103 0
 451 0196 0E4B     		ldr	r3, .L23
 452 0198 1A68     		ldr	r2, [r3]
 453 019a 0D4B     		ldr	r3, .L23
 454 019c 0D49     		ldr	r1, .L23+4
 455 019e 0A40     		ands	r2, r1
 456 01a0 1A60     		str	r2, [r3]
 104:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_set(B_RS);
 457              		.loc 1 104 0
 458 01a2 0120     		movs	r0, #1
 459 01a4 FFF7FEFF 		bl	ascii_ctrl_bit_set
 105:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_ctrl_bit_set(B_RW);
 460              		.loc 1 105 0
 461 01a8 0220     		movs	r0, #2
 462 01aa FFF7FEFF 		bl	ascii_ctrl_bit_set
 106:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	rv = ascii_read_controller();
 463              		.loc 1 106 0
 464 01ae FC1D     		adds	r4, r7, #7
 465 01b0 FFF7FEFF 		bl	ascii_read_controller
 466 01b4 0300     		movs	r3, r0
 467 01b6 2370     		strb	r3, [r4]
 107:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*GPIO_MODER |= 0x55555555;
 468              		.loc 1 107 0
 469 01b8 054B     		ldr	r3, .L23
 470 01ba 1A68     		ldr	r2, [r3]
 471 01bc 044B     		ldr	r3, .L23
 472 01be 0649     		ldr	r1, .L23+8
 473 01c0 0A43     		orrs	r2, r1
 474 01c2 1A60     		str	r2, [r3]
 108:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	return rv;
 475              		.loc 1 108 0
 476 01c4 FB1D     		adds	r3, r7, #7
 477 01c6 1B78     		ldrb	r3, [r3]
 109:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 478              		.loc 1 109 0
 479 01c8 1800     		movs	r0, r3
 480 01ca BD46     		mov	sp, r7
 481 01cc 03B0     		add	sp, sp, #12
 482              		@ sp needed
 483 01ce 90BD     		pop	{r4, r7, pc}
 484              	.L24:
 485              		.align	2
 486              	.L23:
 487 01d0 00100240 		.word	1073876992
 488 01d4 55550000 		.word	21845
 489 01d8 55555555 		.word	1431655765
 490              		.cfi_endproc
 491              	.LFE8:
 493              		.align	1
 494              		.global	delay_milli
 495              		.syntax unified
 496              		.code	16
 497              		.thumb_func
 498              		.fpu softvfp
 500              	delay_milli:
 501              	.LFB9:
 110:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
 111:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void delay_milli(int ms)
 112:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 502              		.loc 1 112 0
 503              		.cfi_startproc
 504              		@ args = 0, pretend = 0, frame = 8
 505              		@ frame_needed = 1, uses_anonymous_args = 0
 506 01dc 80B5     		push	{r7, lr}
 507              		.cfi_def_cfa_offset 8
 508              		.cfi_offset 7, -8
 509              		.cfi_offset 14, -4
 510 01de 82B0     		sub	sp, sp, #8
 511              		.cfi_def_cfa_offset 16
 512 01e0 00AF     		add	r7, sp, #0
 513              		.cfi_def_cfa_register 7
 514 01e2 7860     		str	r0, [r7, #4]
 113:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while(ms > 0)
 515              		.loc 1 113 0
 516 01e4 02E0     		b	.L26
 517              	.L27:
 114:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	{
 115:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	#ifndef SIMULATOR
 116:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_micro(1000);
 117:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	#endif
 118:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ms--;
 518              		.loc 1 118 0
 519 01e6 7B68     		ldr	r3, [r7, #4]
 520 01e8 013B     		subs	r3, r3, #1
 521 01ea 7B60     		str	r3, [r7, #4]
 522              	.L26:
 113:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while(ms > 0)
 523              		.loc 1 113 0
 524 01ec 7B68     		ldr	r3, [r7, #4]
 525 01ee 002B     		cmp	r3, #0
 526 01f0 F9DC     		bgt	.L27
 119:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	}
 120:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 527              		.loc 1 120 0
 528 01f2 C046     		nop
 529 01f4 BD46     		mov	sp, r7
 530 01f6 02B0     		add	sp, sp, #8
 531              		@ sp needed
 532 01f8 80BD     		pop	{r7, pc}
 533              		.cfi_endproc
 534              	.LFE9:
 536              		.align	1
 537              		.global	delay_micro
 538              		.syntax unified
 539              		.code	16
 540              		.thumb_func
 541              		.fpu softvfp
 543              	delay_micro:
 544              	.LFB10:
 121:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
 122:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void delay_micro(int us)
 123:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 545              		.loc 1 123 0
 546              		.cfi_startproc
 547              		@ args = 0, pretend = 0, frame = 8
 548              		@ frame_needed = 1, uses_anonymous_args = 0
 549 01fa 80B5     		push	{r7, lr}
 550              		.cfi_def_cfa_offset 8
 551              		.cfi_offset 7, -8
 552              		.cfi_offset 14, -4
 553 01fc 82B0     		sub	sp, sp, #8
 554              		.cfi_def_cfa_offset 16
 555 01fe 00AF     		add	r7, sp, #0
 556              		.cfi_def_cfa_register 7
 557 0200 7860     		str	r0, [r7, #4]
 124:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while(us > 0)
 558              		.loc 1 124 0
 559 0202 02E0     		b	.L29
 560              	.L30:
 125:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	{
 126:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	#ifndef SIMULATOR
 127:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_250ns();
 128:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_250ns();
 129:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_250ns();
 130:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_250ns();
 131:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	#endif
 132:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	us--;
 561              		.loc 1 132 0
 562 0204 7B68     		ldr	r3, [r7, #4]
 563 0206 013B     		subs	r3, r3, #1
 564 0208 7B60     		str	r3, [r7, #4]
 565              	.L29:
 124:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while(us > 0)
 566              		.loc 1 124 0
 567 020a 7B68     		ldr	r3, [r7, #4]
 568 020c 002B     		cmp	r3, #0
 569 020e F9DC     		bgt	.L30
 133:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	}
 134:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 570              		.loc 1 134 0
 571 0210 C046     		nop
 572 0212 BD46     		mov	sp, r7
 573 0214 02B0     		add	sp, sp, #8
 574              		@ sp needed
 575 0216 80BD     		pop	{r7, pc}
 576              		.cfi_endproc
 577              	.LFE10:
 579              		.align	1
 580              		.global	delay_250ns
 581              		.syntax unified
 582              		.code	16
 583              		.thumb_func
 584              		.fpu softvfp
 586              	delay_250ns:
 587              	.LFB11:
 135:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
 136:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void delay_250ns(void)
 137:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 588              		.loc 1 137 0
 589              		.cfi_startproc
 590              		@ args = 0, pretend = 0, frame = 8
 591              		@ frame_needed = 1, uses_anonymous_args = 0
 592 0218 80B5     		push	{r7, lr}
 593              		.cfi_def_cfa_offset 8
 594              		.cfi_offset 7, -8
 595              		.cfi_offset 14, -4
 596 021a 82B0     		sub	sp, sp, #8
 597              		.cfi_def_cfa_offset 16
 598 021c 00AF     		add	r7, sp, #0
 599              		.cfi_def_cfa_register 7
 138:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*STK_CTRL = 0;
 600              		.loc 1 138 0
 601 021e 104B     		ldr	r3, .L33
 602 0220 0022     		movs	r2, #0
 603 0222 1A60     		str	r2, [r3]
 139:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*STK_LOAD = 0x29; //0x2A - 1
 604              		.loc 1 139 0
 605 0224 0F4B     		ldr	r3, .L33+4
 606 0226 2922     		movs	r2, #41
 607 0228 1A60     		str	r2, [r3]
 140:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*STK_VAL = 0x0;
 608              		.loc 1 140 0
 609 022a 0F4B     		ldr	r3, .L33+8
 610 022c 0022     		movs	r2, #0
 611 022e 1A60     		str	r2, [r3]
 141:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*STK_CTRL = 5;
 612              		.loc 1 141 0
 613 0230 0B4B     		ldr	r3, .L33
 614 0232 0522     		movs	r2, #5
 615 0234 1A60     		str	r2, [r3]
 142:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	unsigned int ctrl = *STK_CTRL & 0x10000;
 616              		.loc 1 142 0
 617 0236 0A4B     		ldr	r3, .L33
 618 0238 1A68     		ldr	r2, [r3]
 619 023a 8023     		movs	r3, #128
 620 023c 5B02     		lsls	r3, r3, #9
 621 023e 1340     		ands	r3, r2
 622 0240 7B60     		str	r3, [r7, #4]
 143:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while((*STK_CTRL & 0x10000) == 0);
 623              		.loc 1 143 0
 624 0242 C046     		nop
 625              	.L32:
 626              		.loc 1 143 0 is_stmt 0 discriminator 1
 627 0244 064B     		ldr	r3, .L33
 628 0246 1A68     		ldr	r2, [r3]
 629 0248 8023     		movs	r3, #128
 630 024a 5B02     		lsls	r3, r3, #9
 631 024c 1340     		ands	r3, r2
 632 024e F9D0     		beq	.L32
 144:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*STK_CTRL= 0;
 633              		.loc 1 144 0 is_stmt 1
 634 0250 034B     		ldr	r3, .L33
 635 0252 0022     		movs	r2, #0
 636 0254 1A60     		str	r2, [r3]
 145:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	
 146:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 637              		.loc 1 146 0
 638 0256 C046     		nop
 639 0258 BD46     		mov	sp, r7
 640 025a 02B0     		add	sp, sp, #8
 641              		@ sp needed
 642 025c 80BD     		pop	{r7, pc}
 643              	.L34:
 644 025e C046     		.align	2
 645              	.L33:
 646 0260 10E000E0 		.word	-536813552
 647 0264 14E000E0 		.word	-536813548
 648 0268 18E000E0 		.word	-536813544
 649              		.cfi_endproc
 650              	.LFE11:
 652              		.align	1
 653              		.global	ascii_write_char
 654              		.syntax unified
 655              		.code	16
 656              		.thumb_func
 657              		.fpu softvfp
 659              	ascii_write_char:
 660              	.LFB12:
 147:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
 148:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void ascii_write_char(unsigned char c)
 149:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 661              		.loc 1 149 0
 662              		.cfi_startproc
 663              		@ args = 0, pretend = 0, frame = 8
 664              		@ frame_needed = 1, uses_anonymous_args = 0
 665 026c 80B5     		push	{r7, lr}
 666              		.cfi_def_cfa_offset 8
 667              		.cfi_offset 7, -8
 668              		.cfi_offset 14, -4
 669 026e 82B0     		sub	sp, sp, #8
 670              		.cfi_def_cfa_offset 16
 671 0270 00AF     		add	r7, sp, #0
 672              		.cfi_def_cfa_register 7
 673 0272 0200     		movs	r2, r0
 674 0274 FB1D     		adds	r3, r7, #7
 675 0276 1A70     		strb	r2, [r3]
 150:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while((ascii_read_status() & 0x80) == 0x80){}
 676              		.loc 1 150 0
 677 0278 C046     		nop
 678              	.L36:
 679              		.loc 1 150 0 is_stmt 0 discriminator 1
 680 027a FFF7FEFF 		bl	ascii_read_status
 681 027e 0300     		movs	r3, r0
 682 0280 1A00     		movs	r2, r3
 683 0282 8023     		movs	r3, #128
 684 0284 1340     		ands	r3, r2
 685 0286 802B     		cmp	r3, #128
 686 0288 F7D0     		beq	.L36
 151:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_micro(8);
 687              		.loc 1 151 0 is_stmt 1
 688 028a 0820     		movs	r0, #8
 689 028c FFF7FEFF 		bl	delay_micro
 152:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_write_data(c);
 690              		.loc 1 152 0
 691 0290 FB1D     		adds	r3, r7, #7
 692 0292 1B78     		ldrb	r3, [r3]
 693 0294 1800     		movs	r0, r3
 694 0296 FFF7FEFF 		bl	ascii_write_data
 153:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_micro(45);
 695              		.loc 1 153 0
 696 029a 2D20     		movs	r0, #45
 697 029c FFF7FEFF 		bl	delay_micro
 154:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 698              		.loc 1 154 0
 699 02a0 C046     		nop
 700 02a2 BD46     		mov	sp, r7
 701 02a4 02B0     		add	sp, sp, #8
 702              		@ sp needed
 703 02a6 80BD     		pop	{r7, pc}
 704              		.cfi_endproc
 705              	.LFE12:
 707              		.align	1
 708              		.global	ascii_gotoxy
 709              		.syntax unified
 710              		.code	16
 711              		.thumb_func
 712              		.fpu softvfp
 714              	ascii_gotoxy:
 715              	.LFB13:
 155:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
 156:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void ascii_gotoxy(int row, int col)
 157:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 716              		.loc 1 157 0
 717              		.cfi_startproc
 718              		@ args = 0, pretend = 0, frame = 16
 719              		@ frame_needed = 1, uses_anonymous_args = 0
 720 02a8 80B5     		push	{r7, lr}
 721              		.cfi_def_cfa_offset 8
 722              		.cfi_offset 7, -8
 723              		.cfi_offset 14, -4
 724 02aa 84B0     		sub	sp, sp, #16
 725              		.cfi_def_cfa_offset 24
 726 02ac 00AF     		add	r7, sp, #0
 727              		.cfi_def_cfa_register 7
 728 02ae 7860     		str	r0, [r7, #4]
 729 02b0 3960     		str	r1, [r7]
 158:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	unsigned int adress;
 159:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	adress = row -1;
 730              		.loc 1 159 0
 731 02b2 7B68     		ldr	r3, [r7, #4]
 732 02b4 013B     		subs	r3, r3, #1
 733 02b6 FB60     		str	r3, [r7, #12]
 160:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	if(col == 2)
 734              		.loc 1 160 0
 735 02b8 3B68     		ldr	r3, [r7]
 736 02ba 022B     		cmp	r3, #2
 737 02bc 02D1     		bne	.L38
 161:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	{
 162:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 		adress = adress + 0x40;
 738              		.loc 1 162 0
 739 02be FB68     		ldr	r3, [r7, #12]
 740 02c0 4033     		adds	r3, r3, #64
 741 02c2 FB60     		str	r3, [r7, #12]
 742              	.L38:
 163:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	}
 164:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_write_cmd(0x80|adress);
 743              		.loc 1 164 0
 744 02c4 FB68     		ldr	r3, [r7, #12]
 745 02c6 DBB2     		uxtb	r3, r3
 746 02c8 8022     		movs	r2, #128
 747 02ca 5242     		rsbs	r2, r2, #0
 748 02cc 1343     		orrs	r3, r2
 749 02ce DBB2     		uxtb	r3, r3
 750 02d0 1800     		movs	r0, r3
 751 02d2 FFF7FEFF 		bl	ascii_write_cmd
 165:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 752              		.loc 1 165 0
 753 02d6 C046     		nop
 754 02d8 BD46     		mov	sp, r7
 755 02da 04B0     		add	sp, sp, #16
 756              		@ sp needed
 757 02dc 80BD     		pop	{r7, pc}
 758              		.cfi_endproc
 759              	.LFE13:
 761              		.align	1
 762              		.global	ascii_init
 763              		.syntax unified
 764              		.code	16
 765              		.thumb_func
 766              		.fpu softvfp
 768              	ascii_init:
 769              	.LFB14:
 166:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
 167:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void ascii_init(void)
 168:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 770              		.loc 1 168 0
 771              		.cfi_startproc
 772              		@ args = 0, pretend = 0, frame = 0
 773              		@ frame_needed = 1, uses_anonymous_args = 0
 774 02de 80B5     		push	{r7, lr}
 775              		.cfi_def_cfa_offset 8
 776              		.cfi_offset 7, -8
 777              		.cfi_offset 14, -4
 778 02e0 00AF     		add	r7, sp, #0
 779              		.cfi_def_cfa_register 7
 169:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while((ascii_read_status() & 0x80) == 0x80){}
 780              		.loc 1 169 0
 781 02e2 C046     		nop
 782              	.L40:
 783              		.loc 1 169 0 is_stmt 0 discriminator 1
 784 02e4 FFF7FEFF 		bl	ascii_read_status
 785 02e8 0300     		movs	r3, r0
 786 02ea 1A00     		movs	r2, r3
 787 02ec 8023     		movs	r3, #128
 788 02ee 1340     		ands	r3, r2
 789 02f0 802B     		cmp	r3, #128
 790 02f2 F7D0     		beq	.L40
 170:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_micro(8);
 791              		.loc 1 170 0 is_stmt 1
 792 02f4 0820     		movs	r0, #8
 793 02f6 FFF7FEFF 		bl	delay_micro
 171:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_write_cmd(0x38); //00111000
 794              		.loc 1 171 0
 795 02fa 3820     		movs	r0, #56
 796 02fc FFF7FEFF 		bl	ascii_write_cmd
 172:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_micro(40);
 797              		.loc 1 172 0
 798 0300 2820     		movs	r0, #40
 799 0302 FFF7FEFF 		bl	delay_micro
 173:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	
 174:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while((ascii_read_status() & 0x80) == 0x80){}
 800              		.loc 1 174 0
 801 0306 C046     		nop
 802              	.L41:
 803              		.loc 1 174 0 is_stmt 0 discriminator 1
 804 0308 FFF7FEFF 		bl	ascii_read_status
 805 030c 0300     		movs	r3, r0
 806 030e 1A00     		movs	r2, r3
 807 0310 8023     		movs	r3, #128
 808 0312 1340     		ands	r3, r2
 809 0314 802B     		cmp	r3, #128
 810 0316 F7D0     		beq	.L41
 175:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_micro(8);
 811              		.loc 1 175 0 is_stmt 1
 812 0318 0820     		movs	r0, #8
 813 031a FFF7FEFF 		bl	delay_micro
 176:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_write_cmd(0x0D); //00001110
 814              		.loc 1 176 0
 815 031e 0D20     		movs	r0, #13
 816 0320 FFF7FEFF 		bl	ascii_write_cmd
 177:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_micro(40);
 817              		.loc 1 177 0
 818 0324 2820     		movs	r0, #40
 819 0326 FFF7FEFF 		bl	delay_micro
 178:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	
 179:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while((ascii_read_status() & 0x80) == 0x80){}
 820              		.loc 1 179 0
 821 032a C046     		nop
 822              	.L42:
 823              		.loc 1 179 0 is_stmt 0 discriminator 1
 824 032c FFF7FEFF 		bl	ascii_read_status
 825 0330 0300     		movs	r3, r0
 826 0332 1A00     		movs	r2, r3
 827 0334 8023     		movs	r3, #128
 828 0336 1340     		ands	r3, r2
 829 0338 802B     		cmp	r3, #128
 830 033a F7D0     		beq	.L42
 180:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_micro(8);
 831              		.loc 1 180 0 is_stmt 1
 832 033c 0820     		movs	r0, #8
 833 033e FFF7FEFF 		bl	delay_micro
 181:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_write_cmd(1);
 834              		.loc 1 181 0
 835 0342 0120     		movs	r0, #1
 836 0344 FFF7FEFF 		bl	ascii_write_cmd
 182:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_milli(2);
 837              		.loc 1 182 0
 838 0348 0220     		movs	r0, #2
 839 034a FFF7FEFF 		bl	delay_milli
 183:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	
 184:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while((ascii_read_status() & 0x80) == 0x80){}
 840              		.loc 1 184 0
 841 034e C046     		nop
 842              	.L43:
 843              		.loc 1 184 0 is_stmt 0 discriminator 1
 844 0350 FFF7FEFF 		bl	ascii_read_status
 845 0354 0300     		movs	r3, r0
 846 0356 1A00     		movs	r2, r3
 847 0358 8023     		movs	r3, #128
 848 035a 1340     		ands	r3, r2
 849 035c 802B     		cmp	r3, #128
 850 035e F7D0     		beq	.L43
 185:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_micro(8);
 851              		.loc 1 185 0 is_stmt 1
 852 0360 0820     		movs	r0, #8
 853 0362 FFF7FEFF 		bl	delay_micro
 186:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_write_cmd(0x06); //Rätt? Increment? 00000100
 854              		.loc 1 186 0
 855 0366 0620     		movs	r0, #6
 856 0368 FFF7FEFF 		bl	ascii_write_cmd
 187:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	delay_micro(39);
 857              		.loc 1 187 0
 858 036c 2720     		movs	r0, #39
 859 036e FFF7FEFF 		bl	delay_micro
 188:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 860              		.loc 1 188 0
 861 0372 C046     		nop
 862 0374 BD46     		mov	sp, r7
 863              		@ sp needed
 864 0376 80BD     		pop	{r7, pc}
 865              		.cfi_endproc
 866              	.LFE14:
 868              		.align	1
 869              		.global	init_app
 870              		.syntax unified
 871              		.code	16
 872              		.thumb_func
 873              		.fpu softvfp
 875              	init_app:
 876              	.LFB15:
 189:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
 190:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** void init_app(void)
 191:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 877              		.loc 1 191 0
 878              		.cfi_startproc
 879              		@ args = 0, pretend = 0, frame = 0
 880              		@ frame_needed = 1, uses_anonymous_args = 0
 881 0378 80B5     		push	{r7, lr}
 882              		.cfi_def_cfa_offset 8
 883              		.cfi_offset 7, -8
 884              		.cfi_offset 14, -4
 885 037a 00AF     		add	r7, sp, #0
 886              		.cfi_def_cfa_register 7
 192:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	*GPIO_MODER = 0x55555555;
 887              		.loc 1 192 0
 888 037c 024B     		ldr	r3, .L45
 889 037e 034A     		ldr	r2, .L45+4
 890 0380 1A60     		str	r2, [r3]
 193:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 891              		.loc 1 193 0
 892 0382 C046     		nop
 893 0384 BD46     		mov	sp, r7
 894              		@ sp needed
 895 0386 80BD     		pop	{r7, pc}
 896              	.L46:
 897              		.align	2
 898              	.L45:
 899 0388 00100240 		.word	1073876992
 900 038c 55555555 		.word	1431655765
 901              		.cfi_endproc
 902              	.LFE15:
 904              		.section	.rodata
 905              		.align	2
 906              	.LC0:
 907 0000 49662079 		.ascii	"If you can dream it\000"
 907      6F752063 
 907      616E2064 
 907      7265616D 
 907      20697400 
 908              		.align	2
 909              	.LC2:
 910 0014 596F7520 		.ascii	"You can do it!\000"
 910      63616E20 
 910      646F2069 
 910      742100
 911              		.text
 912              		.align	1
 913              		.global	main
 914              		.syntax unified
 915              		.code	16
 916              		.thumb_func
 917              		.fpu softvfp
 919              	main:
 920              	.LFB16:
 194:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 
 195:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** int main(int argc, char **argv)
 196:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** {
 921              		.loc 1 196 0
 922              		.cfi_startproc
 923              		@ args = 0, pretend = 0, frame = 48
 924              		@ frame_needed = 1, uses_anonymous_args = 0
 925 0390 B0B5     		push	{r4, r5, r7, lr}
 926              		.cfi_def_cfa_offset 16
 927              		.cfi_offset 4, -16
 928              		.cfi_offset 5, -12
 929              		.cfi_offset 7, -8
 930              		.cfi_offset 14, -4
 931 0392 8CB0     		sub	sp, sp, #48
 932              		.cfi_def_cfa_offset 64
 933 0394 00AF     		add	r7, sp, #0
 934              		.cfi_def_cfa_register 7
 935 0396 7860     		str	r0, [r7, #4]
 936 0398 3960     		str	r1, [r7]
 197:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	
 198:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	//ascii_ctrl_bit_set(0x01)
 199:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	char *s;
 200:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	char test1[] = "If you can dream it";
 937              		.loc 1 200 0
 938 039a 1824     		movs	r4, #24
 939 039c 3B19     		adds	r3, r7, r4
 940 039e 1E4A     		ldr	r2, .L53
 941 03a0 23CA     		ldmia	r2!, {r0, r1, r5}
 942 03a2 23C3     		stmia	r3!, {r0, r1, r5}
 943 03a4 03CA     		ldmia	r2!, {r0, r1}
 944 03a6 03C3     		stmia	r3!, {r0, r1}
 201:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	char test2[] = "You can do it!";
 945              		.loc 1 201 0
 946 03a8 0823     		movs	r3, #8
 947 03aa FB18     		adds	r3, r7, r3
 948 03ac 1B4A     		ldr	r2, .L53+4
 949 03ae 23CA     		ldmia	r2!, {r0, r1, r5}
 950 03b0 23C3     		stmia	r3!, {r0, r1, r5}
 951 03b2 1188     		ldrh	r1, [r2]
 952 03b4 1980     		strh	r1, [r3]
 953 03b6 9278     		ldrb	r2, [r2, #2]
 954 03b8 9A70     		strb	r2, [r3, #2]
 202:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	
 203:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	init_app();
 955              		.loc 1 203 0
 956 03ba FFF7FEFF 		bl	init_app
 204:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_init();
 957              		.loc 1 204 0
 958 03be FFF7FEFF 		bl	ascii_init
 205:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_gotoxy(1,1);
 959              		.loc 1 205 0
 960 03c2 0121     		movs	r1, #1
 961 03c4 0120     		movs	r0, #1
 962 03c6 FFF7FEFF 		bl	ascii_gotoxy
 206:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	s = test1;
 963              		.loc 1 206 0
 964 03ca 3B19     		adds	r3, r7, r4
 965 03cc FB62     		str	r3, [r7, #44]
 207:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while(*s)
 966              		.loc 1 207 0
 967 03ce 06E0     		b	.L48
 968              	.L49:
 208:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	{
 209:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 		ascii_write_char(*s++);
 969              		.loc 1 209 0
 970 03d0 FB6A     		ldr	r3, [r7, #44]
 971 03d2 5A1C     		adds	r2, r3, #1
 972 03d4 FA62     		str	r2, [r7, #44]
 973 03d6 1B78     		ldrb	r3, [r3]
 974 03d8 1800     		movs	r0, r3
 975 03da FFF7FEFF 		bl	ascii_write_char
 976              	.L48:
 207:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while(*s)
 977              		.loc 1 207 0
 978 03de FB6A     		ldr	r3, [r7, #44]
 979 03e0 1B78     		ldrb	r3, [r3]
 980 03e2 002B     		cmp	r3, #0
 981 03e4 F4D1     		bne	.L49
 210:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	}
 211:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	ascii_gotoxy(1,2);
 982              		.loc 1 211 0
 983 03e6 0221     		movs	r1, #2
 984 03e8 0120     		movs	r0, #1
 985 03ea FFF7FEFF 		bl	ascii_gotoxy
 212:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	s = test2;
 986              		.loc 1 212 0
 987 03ee 0823     		movs	r3, #8
 988 03f0 FB18     		adds	r3, r7, r3
 989 03f2 FB62     		str	r3, [r7, #44]
 213:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while(*s)
 990              		.loc 1 213 0
 991 03f4 06E0     		b	.L50
 992              	.L51:
 214:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	{
 215:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 		ascii_write_char(*s++);
 993              		.loc 1 215 0
 994 03f6 FB6A     		ldr	r3, [r7, #44]
 995 03f8 5A1C     		adds	r2, r3, #1
 996 03fa FA62     		str	r2, [r7, #44]
 997 03fc 1B78     		ldrb	r3, [r3]
 998 03fe 1800     		movs	r0, r3
 999 0400 FFF7FEFF 		bl	ascii_write_char
 1000              	.L50:
 213:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	while(*s)
 1001              		.loc 1 213 0
 1002 0404 FB6A     		ldr	r3, [r7, #44]
 1003 0406 1B78     		ldrb	r3, [r3]
 1004 0408 002B     		cmp	r3, #0
 1005 040a F4D1     		bne	.L51
 216:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	}
 217:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	return 0;
 1006              		.loc 1 217 0
 1007 040c 0023     		movs	r3, #0
 218:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** 	
 219:C:/Users/Maria/Documents/IT/MOP/MOP/ascii_display\startup.c **** }
 1008              		.loc 1 219 0
 1009 040e 1800     		movs	r0, r3
 1010 0410 BD46     		mov	sp, r7
 1011 0412 0CB0     		add	sp, sp, #48
 1012              		@ sp needed
 1013 0414 B0BD     		pop	{r4, r5, r7, pc}
 1014              	.L54:
 1015 0416 C046     		.align	2
 1016              	.L53:
 1017 0418 00000000 		.word	.LC0
 1018 041c 14000000 		.word	.LC2
 1019              		.cfi_endproc
 1020              	.LFE16:
 1022              	.Letext0:
