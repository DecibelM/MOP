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
  25              		.file 1 "C:/Users/Maria/Documents/IT/MOP/MOP/snake/startup.c"
   1:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** /*
   2:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c ****  * 	startup.c snake
   3:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c ****  *
   4:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c ****  */
   5:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** //#include <stdint.h>
   6:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** #include <gpio.h>
   7:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** #include <structs.h>
   8:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** #include <delay.h>
   9:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** #include <graphic.h>
  10:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** #include <ascii.h>
  11:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
  12:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  13:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
  14:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** void startup ( void )
  15:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** {
  26              		.loc 1 15 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  16:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** __asm volatile(
  31              		.loc 1 16 0
  32              		.syntax divided
  33              	@ 16 "C:/Users/Maria/Documents/IT/MOP/MOP/snake/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  17:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  18:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	" MOV SP,R0\n"
  19:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	" BL main\n"				/* call main */
  20:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	"_exit: B .\n"				/* never return */
  21:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	) ;
  22:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** }
  40              		.loc 1 22 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.comm	snakeLength,4,4
  48              		.comm	snakeVec,4000,4
  49              		.comm	pSnakeVec,400,4
  50              		.text
  51              		.align	1
  52              		.global	set_object_speed
  53              		.syntax unified
  54              		.code	16
  55              		.thumb_func
  56              		.fpu softvfp
  58              	set_object_speed:
  59              	.LFB1:
  23:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
  24:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** int snakeLength;
  25:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** OBJECT snakeVec[100];
  26:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** POBJECT pSnakeVec[100];
  27:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
  28:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
  29:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
  30:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** void set_object_speed(POBJECT o, int speedx, int speedy){
  60              		.loc 1 30 0
  61              		.cfi_startproc
  62              		@ args = 0, pretend = 0, frame = 16
  63              		@ frame_needed = 1, uses_anonymous_args = 0
  64 0000 80B5     		push	{r7, lr}
  65              		.cfi_def_cfa_offset 8
  66              		.cfi_offset 7, -8
  67              		.cfi_offset 14, -4
  68 0002 84B0     		sub	sp, sp, #16
  69              		.cfi_def_cfa_offset 24
  70 0004 00AF     		add	r7, sp, #0
  71              		.cfi_def_cfa_register 7
  72 0006 F860     		str	r0, [r7, #12]
  73 0008 B960     		str	r1, [r7, #8]
  74 000a 7A60     		str	r2, [r7, #4]
  31:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	if(speedx != -o->dirx)
  75              		.loc 1 31 0
  76 000c FB68     		ldr	r3, [r7, #12]
  77 000e 5B68     		ldr	r3, [r3, #4]
  78 0010 5B42     		rsbs	r3, r3, #0
  79 0012 BA68     		ldr	r2, [r7, #8]
  80 0014 9A42     		cmp	r2, r3
  81 0016 02D0     		beq	.L3
  32:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	{
  33:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		o->dirx = speedx;
  82              		.loc 1 33 0
  83 0018 FB68     		ldr	r3, [r7, #12]
  84 001a BA68     		ldr	r2, [r7, #8]
  85 001c 5A60     		str	r2, [r3, #4]
  86              	.L3:
  34:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	}
  35:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	if(speedy != -o->diry){
  87              		.loc 1 35 0
  88 001e FB68     		ldr	r3, [r7, #12]
  89 0020 9B68     		ldr	r3, [r3, #8]
  90 0022 5B42     		rsbs	r3, r3, #0
  91 0024 7A68     		ldr	r2, [r7, #4]
  92 0026 9A42     		cmp	r2, r3
  93 0028 02D0     		beq	.L5
  36:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		o->diry = speedy;
  94              		.loc 1 36 0
  95 002a FB68     		ldr	r3, [r7, #12]
  96 002c 7A68     		ldr	r2, [r7, #4]
  97 002e 9A60     		str	r2, [r3, #8]
  98              	.L5:
  37:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	}
  38:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** }
  99              		.loc 1 38 0
 100 0030 C046     		nop
 101 0032 BD46     		mov	sp, r7
 102 0034 04B0     		add	sp, sp, #16
 103              		@ sp needed
 104 0036 80BD     		pop	{r7, pc}
 105              		.cfi_endproc
 106              	.LFE1:
 108              		.align	1
 109              		.global	move_object
 110              		.syntax unified
 111              		.code	16
 112              		.thumb_func
 113              		.fpu softvfp
 115              	move_object:
 116              	.LFB2:
  39:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
  40:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** void move_object(POBJECT o){
 117              		.loc 1 40 0
 118              		.cfi_startproc
 119              		@ args = 0, pretend = 0, frame = 8
 120              		@ frame_needed = 1, uses_anonymous_args = 0
 121 0038 80B5     		push	{r7, lr}
 122              		.cfi_def_cfa_offset 8
 123              		.cfi_offset 7, -8
 124              		.cfi_offset 14, -4
 125 003a 82B0     		sub	sp, sp, #8
 126              		.cfi_def_cfa_offset 16
 127 003c 00AF     		add	r7, sp, #0
 128              		.cfi_def_cfa_register 7
 129 003e 7860     		str	r0, [r7, #4]
  41:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	//clear_object(o);
  42:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	o->posx += o->dirx;
 130              		.loc 1 42 0
 131 0040 7B68     		ldr	r3, [r7, #4]
 132 0042 DA68     		ldr	r2, [r3, #12]
 133 0044 7B68     		ldr	r3, [r7, #4]
 134 0046 5B68     		ldr	r3, [r3, #4]
 135 0048 D218     		adds	r2, r2, r3
 136 004a 7B68     		ldr	r3, [r7, #4]
 137 004c DA60     		str	r2, [r3, #12]
  43:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	o->posy += o->diry;
 138              		.loc 1 43 0
 139 004e 7B68     		ldr	r3, [r7, #4]
 140 0050 1A69     		ldr	r2, [r3, #16]
 141 0052 7B68     		ldr	r3, [r7, #4]
 142 0054 9B68     		ldr	r3, [r3, #8]
 143 0056 D218     		adds	r2, r2, r3
 144 0058 7B68     		ldr	r3, [r7, #4]
 145 005a 1A61     		str	r2, [r3, #16]
  44:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	
  45:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	if(o->posx <= 1){
 146              		.loc 1 45 0
 147 005c 7B68     		ldr	r3, [r7, #4]
 148 005e DB68     		ldr	r3, [r3, #12]
 149 0060 012B     		cmp	r3, #1
 150 0062 06DC     		bgt	.L7
  46:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		o->posx = 128 - o->geo->sizex;
 151              		.loc 1 46 0
 152 0064 7B68     		ldr	r3, [r7, #4]
 153 0066 1B68     		ldr	r3, [r3]
 154 0068 5B68     		ldr	r3, [r3, #4]
 155 006a 8022     		movs	r2, #128
 156 006c D21A     		subs	r2, r2, r3
 157 006e 7B68     		ldr	r3, [r7, #4]
 158 0070 DA60     		str	r2, [r3, #12]
 159              	.L7:
  47:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	}
  48:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	if(o->posx > 128 - o->geo->sizex){
 160              		.loc 1 48 0
 161 0072 7B68     		ldr	r3, [r7, #4]
 162 0074 DA68     		ldr	r2, [r3, #12]
 163 0076 7B68     		ldr	r3, [r7, #4]
 164 0078 1B68     		ldr	r3, [r3]
 165 007a 5B68     		ldr	r3, [r3, #4]
 166 007c 8021     		movs	r1, #128
 167 007e CB1A     		subs	r3, r1, r3
 168 0080 9A42     		cmp	r2, r3
 169 0082 02DD     		ble	.L8
  49:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		o->posx = 1;
 170              		.loc 1 49 0
 171 0084 7B68     		ldr	r3, [r7, #4]
 172 0086 0122     		movs	r2, #1
 173 0088 DA60     		str	r2, [r3, #12]
 174              	.L8:
  50:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	}
  51:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	if(o->posy <= 1){
 175              		.loc 1 51 0
 176 008a 7B68     		ldr	r3, [r7, #4]
 177 008c 1B69     		ldr	r3, [r3, #16]
 178 008e 012B     		cmp	r3, #1
 179 0090 06DC     		bgt	.L9
  52:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		o->posy = 64 - o->geo->sizey;
 180              		.loc 1 52 0
 181 0092 7B68     		ldr	r3, [r7, #4]
 182 0094 1B68     		ldr	r3, [r3]
 183 0096 9B68     		ldr	r3, [r3, #8]
 184 0098 4022     		movs	r2, #64
 185 009a D21A     		subs	r2, r2, r3
 186 009c 7B68     		ldr	r3, [r7, #4]
 187 009e 1A61     		str	r2, [r3, #16]
 188              	.L9:
  53:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	}
  54:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	if(o->posy > 64 - o->geo->sizey){
 189              		.loc 1 54 0
 190 00a0 7B68     		ldr	r3, [r7, #4]
 191 00a2 1A69     		ldr	r2, [r3, #16]
 192 00a4 7B68     		ldr	r3, [r7, #4]
 193 00a6 1B68     		ldr	r3, [r3]
 194 00a8 9B68     		ldr	r3, [r3, #8]
 195 00aa 4021     		movs	r1, #64
 196 00ac CB1A     		subs	r3, r1, r3
 197 00ae 9A42     		cmp	r2, r3
 198 00b0 02DD     		ble	.L11
  55:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		o->posy = 1 ;
 199              		.loc 1 55 0
 200 00b2 7B68     		ldr	r3, [r7, #4]
 201 00b4 0122     		movs	r2, #1
 202 00b6 1A61     		str	r2, [r3, #16]
 203              	.L11:
  56:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	}
  57:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	//draw_object(o);
  58:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** }
 204              		.loc 1 58 0
 205 00b8 C046     		nop
 206 00ba BD46     		mov	sp, r7
 207 00bc 02B0     		add	sp, sp, #8
 208              		@ sp needed
 209 00be 80BD     		pop	{r7, pc}
 210              		.cfi_endproc
 211              	.LFE2:
 213              		.global	ball_geometry
 214              		.data
 215              		.align	2
 218              	ball_geometry:
 219 0000 0C000000 		.word	12
 220 0004 04000000 		.word	4
 221 0008 04000000 		.word	4
 222 000c 00       		.byte	0
 223 000d 01       		.byte	1
 224 000e 00       		.byte	0
 225 000f 02       		.byte	2
 226 0010 01       		.byte	1
 227 0011 00       		.byte	0
 228 0012 01       		.byte	1
 229 0013 01       		.byte	1
 230 0014 01       		.byte	1
 231 0015 02       		.byte	2
 232 0016 01       		.byte	1
 233 0017 03       		.byte	3
 234 0018 02       		.byte	2
 235 0019 00       		.byte	0
 236 001a 02       		.byte	2
 237 001b 01       		.byte	1
 238 001c 02       		.byte	2
 239 001d 02       		.byte	2
 240 001e 02       		.byte	2
 241 001f 03       		.byte	3
 242 0020 03       		.byte	3
 243 0021 01       		.byte	1
 244 0022 03       		.byte	3
 245 0023 02       		.byte	2
 246 0024 00000000 		.space	76
 246      00000000 
 246      00000000 
 246      00000000 
 246      00000000 
 247              		.align	2
 250              	snake:
 251 0070 00000000 		.word	ball_geometry
 252 0074 00000000 		.word	0
 253 0078 00000000 		.word	0
 254 007c 06000000 		.word	6
 255 0080 02000000 		.word	2
 256 0084 00000000 		.word	draw_object
 257 0088 00000000 		.word	clear_object
 258 008c 00000000 		.word	move_object
 259 0090 00000000 		.word	set_object_speed
 260 0094 00000000 		.space	4
 261              		.align	2
 264              	apple:
 265 0098 00000000 		.word	ball_geometry
 266 009c 00000000 		.word	0
 267 00a0 08000000 		.word	8
 268 00a4 0A000000 		.word	10
 269 00a8 02000000 		.word	2
 270 00ac 00000000 		.word	draw_object
 271 00b0 00000000 		.word	clear_object
 272 00b4 00000000 		.word	move_object
 273 00b8 00000000 		.word	set_object_speed
 274 00bc 00000000 		.space	4
 275              		.text
 276              		.align	1
 277              		.global	init_app
 278              		.syntax unified
 279              		.code	16
 280              		.thumb_func
 281              		.fpu softvfp
 283              	init_app:
 284              	.LFB3:
  59:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
  60:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	GEOMETRY ball_geometry =
  61:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** {
  62:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	12,4,4,{{0,1},{0,2},{1,0},{1,1},{1,2},{1,3},{2,0},{2,1},{2,2},{2,3},{3,1},{3,2}}
  63:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** };
  64:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
  65:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** static OBJECT snake=
  66:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** {&ball_geometry,
  67:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 0,0,
  68:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 6,2,
  69:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** draw_object,
  70:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** clear_object,
  71:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** move_object,
  72:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** set_object_speed};
  73:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
  74:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** static OBJECT apple=
  75:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** {&ball_geometry,
  76:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 0,8,
  77:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 10,2,
  78:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** draw_object,
  79:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** clear_object,
  80:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** move_object,
  81:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** set_object_speed};
  82:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
  83:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
  84:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
  85:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
  86:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** void init_app(void)
  87:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** {
 285              		.loc 1 87 0
 286              		.cfi_startproc
 287              		@ args = 0, pretend = 0, frame = 0
 288              		@ frame_needed = 1, uses_anonymous_args = 0
 289 00c0 80B5     		push	{r7, lr}
 290              		.cfi_def_cfa_offset 8
 291              		.cfi_offset 7, -8
 292              		.cfi_offset 14, -4
 293 00c2 00AF     		add	r7, sp, #0
 294              		.cfi_def_cfa_register 7
  88:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	#ifdef USBDM
  89:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	*((unsigned long*) 0x40023830) = 0x18;
  90:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	__asm volatile("LDR R0,=0x08000209\n BLX R0\n");
  91:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	#endif
  92:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	
  93:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	GPIO_D.moder= 0x55005555;
 295              		.loc 1 93 0
 296 00c4 084B     		ldr	r3, .L13
 297 00c6 094A     		ldr	r2, .L13+4
 298 00c8 1A60     		str	r2, [r3]
  94:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	GPIO_D.otyper = 0x0100;
 299              		.loc 1 94 0
 300 00ca 074B     		ldr	r3, .L13
 301 00cc 8022     		movs	r2, #128
 302 00ce 5200     		lsls	r2, r2, #1
 303 00d0 9A80     		strh	r2, [r3, #4]
  95:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	GPIO_D.pupdr = 0x00AA0000;
 304              		.loc 1 95 0
 305 00d2 054B     		ldr	r3, .L13
 306 00d4 AA22     		movs	r2, #170
 307 00d6 1204     		lsls	r2, r2, #16
 308 00d8 DA60     		str	r2, [r3, #12]
  96:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	GPIO_E.moder = 0x55555555;
 309              		.loc 1 96 0
 310 00da 054B     		ldr	r3, .L13+8
 311 00dc 054A     		ldr	r2, .L13+12
 312 00de 1A60     		str	r2, [r3]
  97:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** }
 313              		.loc 1 97 0
 314 00e0 C046     		nop
 315 00e2 BD46     		mov	sp, r7
 316              		@ sp needed
 317 00e4 80BD     		pop	{r7, pc}
 318              	.L14:
 319 00e6 C046     		.align	2
 320              	.L13:
 321 00e8 000C0240 		.word	1073875968
 322 00ec 55550055 		.word	1426085205
 323 00f0 00100240 		.word	1073876992
 324 00f4 55555555 		.word	1431655765
 325              		.cfi_endproc
 326              	.LFE3:
 328              		.global	points
 329              		.bss
 330              		.align	2
 333              	points:
 334 0000 00000000 		.space	4
 335              		.comm	st,4,4
 336              		.global	string
 337              		.data
 338              		.align	2
 341              	string:
 342 00c0 506F696E 		.ascii	"Points\000"
 342      747300
 343              		.global	__aeabi_idivmod
 344              		.global	__aeabi_idiv
 345              		.section	.rodata
 346              		.align	2
 347              	.LC3:
 348 0000 506F696E 		.ascii	"Points:\000"
 348      74733A00 
 349              		.text
 350              		.align	1
 351              		.global	collision
 352              		.syntax unified
 353              		.code	16
 354              		.thumb_func
 355              		.fpu softvfp
 357              	collision:
 358              	.LFB4:
  98:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
  99:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** int points =0;
 100:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** char *st;
 101:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** char string[] = "Points";
 102:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
 103:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** void collision(POBJECT pSnakeVec[], POBJECT a)
 104:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** {
 359              		.loc 1 104 0
 360              		.cfi_startproc
 361              		@ args = 0, pretend = 0, frame = 32
 362              		@ frame_needed = 1, uses_anonymous_args = 0
 363 00f8 90B5     		push	{r4, r7, lr}
 364              		.cfi_def_cfa_offset 12
 365              		.cfi_offset 4, -12
 366              		.cfi_offset 7, -8
 367              		.cfi_offset 14, -4
 368 00fa 89B0     		sub	sp, sp, #36
 369              		.cfi_def_cfa_offset 48
 370 00fc 00AF     		add	r7, sp, #0
 371              		.cfi_def_cfa_register 7
 372 00fe 7860     		str	r0, [r7, #4]
 373 0100 3960     		str	r1, [r7]
 105:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	POBJECT p = pSnakeVec[0];
 374              		.loc 1 105 0
 375 0102 7B68     		ldr	r3, [r7, #4]
 376 0104 1B68     		ldr	r3, [r3]
 377 0106 FB61     		str	r3, [r7, #28]
 106:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	if(p->posx +4 >= a->posx & p->posx <= a->posx + 4)
 378              		.loc 1 106 0
 379 0108 FB69     		ldr	r3, [r7, #28]
 380 010a DB68     		ldr	r3, [r3, #12]
 381 010c 1A1D     		adds	r2, r3, #4
 382 010e 3B68     		ldr	r3, [r7]
 383 0110 DB68     		ldr	r3, [r3, #12]
 384 0112 D017     		asrs	r0, r2, #31
 385 0114 D90F     		lsrs	r1, r3, #31
 386 0116 9A42     		cmp	r2, r3
 387 0118 4841     		adcs	r0, r0, r1
 388 011a 0300     		movs	r3, r0
 389 011c D9B2     		uxtb	r1, r3
 390 011e FB69     		ldr	r3, [r7, #28]
 391 0120 DB68     		ldr	r3, [r3, #12]
 392 0122 3A68     		ldr	r2, [r7]
 393 0124 D268     		ldr	r2, [r2, #12]
 394 0126 0432     		adds	r2, r2, #4
 395 0128 DC0F     		lsrs	r4, r3, #31
 396 012a D017     		asrs	r0, r2, #31
 397 012c 9A42     		cmp	r2, r3
 398 012e 4441     		adcs	r4, r4, r0
 399 0130 2300     		movs	r3, r4
 400 0132 DBB2     		uxtb	r3, r3
 401 0134 0B40     		ands	r3, r1
 402 0136 DBB2     		uxtb	r3, r3
 403 0138 002B     		cmp	r3, #0
 404 013a 00D1     		bne	.LCB233
 405 013c B3E0     		b	.L21	@long jump
 406              	.LCB233:
 107:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	{
 108:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		if(p->posy +4 >= a->posy & p->posy <= a->posy + 4)
 407              		.loc 1 108 0
 408 013e FB69     		ldr	r3, [r7, #28]
 409 0140 1B69     		ldr	r3, [r3, #16]
 410 0142 1A1D     		adds	r2, r3, #4
 411 0144 3B68     		ldr	r3, [r7]
 412 0146 1B69     		ldr	r3, [r3, #16]
 413 0148 D017     		asrs	r0, r2, #31
 414 014a D90F     		lsrs	r1, r3, #31
 415 014c 9A42     		cmp	r2, r3
 416 014e 4841     		adcs	r0, r0, r1
 417 0150 0300     		movs	r3, r0
 418 0152 D9B2     		uxtb	r1, r3
 419 0154 FB69     		ldr	r3, [r7, #28]
 420 0156 1B69     		ldr	r3, [r3, #16]
 421 0158 3A68     		ldr	r2, [r7]
 422 015a 1269     		ldr	r2, [r2, #16]
 423 015c 0432     		adds	r2, r2, #4
 424 015e DC0F     		lsrs	r4, r3, #31
 425 0160 D017     		asrs	r0, r2, #31
 426 0162 9A42     		cmp	r2, r3
 427 0164 4441     		adcs	r4, r4, r0
 428 0166 2300     		movs	r3, r4
 429 0168 DBB2     		uxtb	r3, r3
 430 016a 0B40     		ands	r3, r1
 431 016c DBB2     		uxtb	r3, r3
 432 016e 002B     		cmp	r3, #0
 433 0170 00D1     		bne	.LCB257
 434 0172 98E0     		b	.L21	@long jump
 435              	.LCB257:
 436              	.LBB2:
 109:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		{
 110:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			clear_object(a);
 437              		.loc 1 110 0
 438 0174 3B68     		ldr	r3, [r7]
 439 0176 1800     		movs	r0, r3
 440 0178 FFF7FEFF 		bl	clear_object
 111:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			points++;
 441              		.loc 1 111 0
 442 017c 4C4B     		ldr	r3, .L22
 443 017e 1B68     		ldr	r3, [r3]
 444 0180 5A1C     		adds	r2, r3, #1
 445 0182 4B4B     		ldr	r3, .L22
 446 0184 1A60     		str	r2, [r3]
 112:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			POBJECT x = pSnakeVec[snakeLength-1];
 447              		.loc 1 112 0
 448 0186 4B4B     		ldr	r3, .L22+4
 449 0188 1B68     		ldr	r3, [r3]
 450 018a 4B4A     		ldr	r2, .L22+8
 451 018c 9446     		mov	ip, r2
 452 018e 6344     		add	r3, r3, ip
 453 0190 9B00     		lsls	r3, r3, #2
 454 0192 7A68     		ldr	r2, [r7, #4]
 455 0194 D318     		adds	r3, r2, r3
 456 0196 1B68     		ldr	r3, [r3]
 457 0198 BB61     		str	r3, [r7, #24]
 113:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			POBJECT y = &snakeVec[snakeLength];
 458              		.loc 1 113 0
 459 019a 464B     		ldr	r3, .L22+4
 460 019c 1A68     		ldr	r2, [r3]
 461 019e 1300     		movs	r3, r2
 462 01a0 9B00     		lsls	r3, r3, #2
 463 01a2 9B18     		adds	r3, r3, r2
 464 01a4 DB00     		lsls	r3, r3, #3
 465 01a6 454A     		ldr	r2, .L22+12
 466 01a8 9B18     		adds	r3, r3, r2
 467 01aa 7B61     		str	r3, [r7, #20]
 114:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			
 115:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			extend_snake(&snakeVec[snakeLength],pSnakeVec[snakeLength-1] );
 468              		.loc 1 115 0
 469 01ac 414B     		ldr	r3, .L22+4
 470 01ae 1A68     		ldr	r2, [r3]
 471 01b0 1300     		movs	r3, r2
 472 01b2 9B00     		lsls	r3, r3, #2
 473 01b4 9B18     		adds	r3, r3, r2
 474 01b6 DB00     		lsls	r3, r3, #3
 475 01b8 404A     		ldr	r2, .L22+12
 476 01ba 9818     		adds	r0, r3, r2
 477 01bc 3D4B     		ldr	r3, .L22+4
 478 01be 1B68     		ldr	r3, [r3]
 479 01c0 3D4A     		ldr	r2, .L22+8
 480 01c2 9446     		mov	ip, r2
 481 01c4 6344     		add	r3, r3, ip
 482 01c6 9B00     		lsls	r3, r3, #2
 483 01c8 7A68     		ldr	r2, [r7, #4]
 484 01ca D318     		adds	r3, r2, r3
 485 01cc 1B68     		ldr	r3, [r3]
 486 01ce 1900     		movs	r1, r3
 487 01d0 FFF7FEFF 		bl	extend_snake
 116:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			pSnakeVec[snakeLength] = &snakeVec[snakeLength];
 488              		.loc 1 116 0
 489 01d4 374B     		ldr	r3, .L22+4
 490 01d6 1968     		ldr	r1, [r3]
 491 01d8 364B     		ldr	r3, .L22+4
 492 01da 1B68     		ldr	r3, [r3]
 493 01dc 9B00     		lsls	r3, r3, #2
 494 01de 7A68     		ldr	r2, [r7, #4]
 495 01e0 D218     		adds	r2, r2, r3
 496 01e2 0B00     		movs	r3, r1
 497 01e4 9B00     		lsls	r3, r3, #2
 498 01e6 5B18     		adds	r3, r3, r1
 499 01e8 DB00     		lsls	r3, r3, #3
 500 01ea 3449     		ldr	r1, .L22+12
 501 01ec 5B18     		adds	r3, r3, r1
 502 01ee 1360     		str	r3, [r2]
 117:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			snakeLength++;
 503              		.loc 1 117 0
 504 01f0 304B     		ldr	r3, .L22+4
 505 01f2 1B68     		ldr	r3, [r3]
 506 01f4 5A1C     		adds	r2, r3, #1
 507 01f6 2F4B     		ldr	r3, .L22+4
 508 01f8 1A60     		str	r2, [r3]
 118:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			
 119:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			char string[] = "Points:";
 509              		.loc 1 119 0
 510 01fa 0821     		movs	r1, #8
 511 01fc 7B18     		adds	r3, r7, r1
 512 01fe 304A     		ldr	r2, .L22+16
 513 0200 11CA     		ldmia	r2!, {r0, r4}
 514 0202 11C3     		stmia	r3!, {r0, r4}
 120:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			st = string;
 515              		.loc 1 120 0
 516 0204 2F4B     		ldr	r3, .L22+20
 517 0206 7A18     		adds	r2, r7, r1
 518 0208 1A60     		str	r2, [r3]
 121:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			ascii_gotoxy(1,1);
 519              		.loc 1 121 0
 520 020a 0121     		movs	r1, #1
 521 020c 0120     		movs	r0, #1
 522 020e FFF7FEFF 		bl	ascii_gotoxy
 122:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			
 123:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			
 124:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			while(*st)
 523              		.loc 1 124 0
 524 0212 08E0     		b	.L17
 525              	.L18:
 125:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			{
 126:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			ascii_write_char(*st++);
 526              		.loc 1 126 0
 527 0214 2B4B     		ldr	r3, .L22+20
 528 0216 1B68     		ldr	r3, [r3]
 529 0218 591C     		adds	r1, r3, #1
 530 021a 2A4A     		ldr	r2, .L22+20
 531 021c 1160     		str	r1, [r2]
 532 021e 1B78     		ldrb	r3, [r3]
 533 0220 1800     		movs	r0, r3
 534 0222 FFF7FEFF 		bl	ascii_write_char
 535              	.L17:
 124:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			{
 536              		.loc 1 124 0
 537 0226 274B     		ldr	r3, .L22+20
 538 0228 1B68     		ldr	r3, [r3]
 539 022a 1B78     		ldrb	r3, [r3]
 540 022c 002B     		cmp	r3, #0
 541 022e F1D1     		bne	.L18
 127:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			}
 128:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			
 129:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			if(points > 9){
 542              		.loc 1 129 0
 543 0230 1F4B     		ldr	r3, .L22
 544 0232 1B68     		ldr	r3, [r3]
 545 0234 092B     		cmp	r3, #9
 546 0236 25DD     		ble	.L19
 547              	.LBB3:
 130:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 				char ental = points % 10 + '0';
 548              		.loc 1 130 0
 549 0238 1D4B     		ldr	r3, .L22
 550 023a 1B68     		ldr	r3, [r3]
 551 023c 0A21     		movs	r1, #10
 552 023e 1800     		movs	r0, r3
 553 0240 FFF7FEFF 		bl	__aeabi_idivmod
 554              	.LVL0:
 555 0244 0B00     		movs	r3, r1
 556 0246 DAB2     		uxtb	r2, r3
 557 0248 1224     		movs	r4, #18
 558 024a 3B19     		adds	r3, r7, r4
 559 024c 3032     		adds	r2, r2, #48
 560 024e 1A70     		strb	r2, [r3]
 131:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 				char tiotal = (points - ental)/10 + '0';
 561              		.loc 1 131 0
 562 0250 174B     		ldr	r3, .L22
 563 0252 1A68     		ldr	r2, [r3]
 564 0254 3B19     		adds	r3, r7, r4
 565 0256 1B78     		ldrb	r3, [r3]
 566 0258 D31A     		subs	r3, r2, r3
 567 025a 0A21     		movs	r1, #10
 568 025c 1800     		movs	r0, r3
 569 025e FFF7FEFF 		bl	__aeabi_idiv
 570              	.LVL1:
 571 0262 0300     		movs	r3, r0
 572 0264 DAB2     		uxtb	r2, r3
 573 0266 1121     		movs	r1, #17
 574 0268 7B18     		adds	r3, r7, r1
 575 026a 3032     		adds	r2, r2, #48
 576 026c 1A70     		strb	r2, [r3]
 132:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 				ascii_write_char(tiotal);
 577              		.loc 1 132 0
 578 026e 7B18     		adds	r3, r7, r1
 579 0270 1B78     		ldrb	r3, [r3]
 580 0272 1800     		movs	r0, r3
 581 0274 FFF7FEFF 		bl	ascii_write_char
 133:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 				ascii_write_char(ental);
 582              		.loc 1 133 0
 583 0278 3B19     		adds	r3, r7, r4
 584 027a 1B78     		ldrb	r3, [r3]
 585 027c 1800     		movs	r0, r3
 586 027e FFF7FEFF 		bl	ascii_write_char
 587              	.LBE3:
 588 0282 0BE0     		b	.L20
 589              	.L19:
 590              	.LBB4:
 134:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			}else{
 135:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 				char pts = points + '0';
 591              		.loc 1 135 0
 592 0284 0A4B     		ldr	r3, .L22
 593 0286 1B68     		ldr	r3, [r3]
 594 0288 DAB2     		uxtb	r2, r3
 595 028a 1321     		movs	r1, #19
 596 028c 7B18     		adds	r3, r7, r1
 597 028e 3032     		adds	r2, r2, #48
 598 0290 1A70     		strb	r2, [r3]
 136:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 				ascii_write_char(pts);
 599              		.loc 1 136 0
 600 0292 7B18     		adds	r3, r7, r1
 601 0294 1B78     		ldrb	r3, [r3]
 602 0296 1800     		movs	r0, r3
 603 0298 FFF7FEFF 		bl	ascii_write_char
 604              	.L20:
 605              	.LBE4:
 137:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			}
 138:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			
 139:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			
 140:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			
 141:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			
 142:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			a->move(a);
 606              		.loc 1 142 0
 607 029c 3B68     		ldr	r3, [r7]
 608 029e DB69     		ldr	r3, [r3, #28]
 609 02a0 3A68     		ldr	r2, [r7]
 610 02a2 1000     		movs	r0, r2
 611 02a4 9847     		blx	r3
 612              	.LVL2:
 613              	.L21:
 614              	.LBE2:
 143:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		}
 144:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	}
 145:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** }
 615              		.loc 1 145 0
 616 02a6 C046     		nop
 617 02a8 BD46     		mov	sp, r7
 618 02aa 09B0     		add	sp, sp, #36
 619              		@ sp needed
 620 02ac 90BD     		pop	{r4, r7, pc}
 621              	.L23:
 622 02ae C046     		.align	2
 623              	.L22:
 624 02b0 00000000 		.word	points
 625 02b4 00000000 		.word	snakeLength
 626 02b8 FFFFFF3F 		.word	1073741823
 627 02bc 00000000 		.word	snakeVec
 628 02c0 00000000 		.word	.LC3
 629 02c4 00000000 		.word	st
 630              		.cfi_endproc
 631              	.LFE4:
 633              		.global	s
 634              		.data
 635 00c7 00       		.align	2
 638              	s:
 639 00c8 70000000 		.word	snake
 640              		.section	.rodata
 641              		.align	2
 642              	.LC6:
 643 0008 47616D65 		.ascii	"Game Over\000"
 643      204F7665 
 643      7200
 644              		.text
 645              		.align	1
 646              		.global	gameOver
 647              		.syntax unified
 648              		.code	16
 649              		.thumb_func
 650              		.fpu softvfp
 652              	gameOver:
 653              	.LFB5:
 146:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
 147:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** POBJECT s = &snake;
 148:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
 149:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** void gameOver(void)
 150:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** {
 654              		.loc 1 150 0
 655              		.cfi_startproc
 656              		@ args = 0, pretend = 0, frame = 16
 657              		@ frame_needed = 1, uses_anonymous_args = 0
 658 02c8 80B5     		push	{r7, lr}
 659              		.cfi_def_cfa_offset 8
 660              		.cfi_offset 7, -8
 661              		.cfi_offset 14, -4
 662 02ca 84B0     		sub	sp, sp, #16
 663              		.cfi_def_cfa_offset 24
 664 02cc 00AF     		add	r7, sp, #0
 665              		.cfi_def_cfa_register 7
 151:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	char string[] = "Game Over";
 666              		.loc 1 151 0
 667 02ce 3B1D     		adds	r3, r7, #4
 668 02d0 134A     		ldr	r2, .L27
 669 02d2 03CA     		ldmia	r2!, {r0, r1}
 670 02d4 03C3     		stmia	r3!, {r0, r1}
 671 02d6 1288     		ldrh	r2, [r2]
 672 02d8 1A80     		strh	r2, [r3]
 152:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	st = string;
 673              		.loc 1 152 0
 674 02da 124B     		ldr	r3, .L27+4
 675 02dc 3A1D     		adds	r2, r7, #4
 676 02de 1A60     		str	r2, [r3]
 153:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	ascii_gotoxy(1,1);
 677              		.loc 1 153 0
 678 02e0 0121     		movs	r1, #1
 679 02e2 0120     		movs	r0, #1
 680 02e4 FFF7FEFF 		bl	ascii_gotoxy
 154:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	
 155:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	while(*st)
 681              		.loc 1 155 0
 682 02e8 08E0     		b	.L25
 683              	.L26:
 156:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	{
 157:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	ascii_write_char(*st++);
 684              		.loc 1 157 0
 685 02ea 0E4B     		ldr	r3, .L27+4
 686 02ec 1B68     		ldr	r3, [r3]
 687 02ee 591C     		adds	r1, r3, #1
 688 02f0 0C4A     		ldr	r2, .L27+4
 689 02f2 1160     		str	r1, [r2]
 690 02f4 1B78     		ldrb	r3, [r3]
 691 02f6 1800     		movs	r0, r3
 692 02f8 FFF7FEFF 		bl	ascii_write_char
 693              	.L25:
 155:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	{
 694              		.loc 1 155 0
 695 02fc 094B     		ldr	r3, .L27+4
 696 02fe 1B68     		ldr	r3, [r3]
 697 0300 1B78     		ldrb	r3, [r3]
 698 0302 002B     		cmp	r3, #0
 699 0304 F1D1     		bne	.L26
 158:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	}
 159:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	
 160:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	s->dirx = 0;
 700              		.loc 1 160 0
 701 0306 084B     		ldr	r3, .L27+8
 702 0308 1B68     		ldr	r3, [r3]
 703 030a 0022     		movs	r2, #0
 704 030c 5A60     		str	r2, [r3, #4]
 161:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	s->diry = 0;
 705              		.loc 1 161 0
 706 030e 064B     		ldr	r3, .L27+8
 707 0310 1B68     		ldr	r3, [r3]
 708 0312 0022     		movs	r2, #0
 709 0314 9A60     		str	r2, [r3, #8]
 162:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	
 163:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** }
 710              		.loc 1 163 0
 711 0316 C046     		nop
 712 0318 BD46     		mov	sp, r7
 713 031a 04B0     		add	sp, sp, #16
 714              		@ sp needed
 715 031c 80BD     		pop	{r7, pc}
 716              	.L28:
 717 031e C046     		.align	2
 718              	.L27:
 719 0320 08000000 		.word	.LC6
 720 0324 00000000 		.word	st
 721 0328 00000000 		.word	s
 722              		.cfi_endproc
 723              	.LFE5:
 725              		.align	1
 726              		.global	move_snake
 727              		.syntax unified
 728              		.code	16
 729              		.thumb_func
 730              		.fpu softvfp
 732              	move_snake:
 733              	.LFB6:
 164:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
 165:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
 166:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
 167:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
 168:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** void move_snake(POBJECT o, int i){
 734              		.loc 1 168 0
 735              		.cfi_startproc
 736              		@ args = 0, pretend = 0, frame = 8
 737              		@ frame_needed = 1, uses_anonymous_args = 0
 738 032c 80B5     		push	{r7, lr}
 739              		.cfi_def_cfa_offset 8
 740              		.cfi_offset 7, -8
 741              		.cfi_offset 14, -4
 742 032e 82B0     		sub	sp, sp, #8
 743              		.cfi_def_cfa_offset 16
 744 0330 00AF     		add	r7, sp, #0
 745              		.cfi_def_cfa_register 7
 746 0332 7860     		str	r0, [r7, #4]
 747 0334 3960     		str	r1, [r7]
 169:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	//clear_object(o);
 170:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	o->posx = pSnakeVec[i-1]->posx;
 748              		.loc 1 170 0
 749 0336 3B68     		ldr	r3, [r7]
 750 0338 5A1E     		subs	r2, r3, #1
 751 033a 094B     		ldr	r3, .L30
 752 033c 9200     		lsls	r2, r2, #2
 753 033e D358     		ldr	r3, [r2, r3]
 754 0340 DA68     		ldr	r2, [r3, #12]
 755 0342 7B68     		ldr	r3, [r7, #4]
 756 0344 DA60     		str	r2, [r3, #12]
 171:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	o->posy = pSnakeVec[i-1]->posy;
 757              		.loc 1 171 0
 758 0346 3B68     		ldr	r3, [r7]
 759 0348 5A1E     		subs	r2, r3, #1
 760 034a 054B     		ldr	r3, .L30
 761 034c 9200     		lsls	r2, r2, #2
 762 034e D358     		ldr	r3, [r2, r3]
 763 0350 1A69     		ldr	r2, [r3, #16]
 764 0352 7B68     		ldr	r3, [r7, #4]
 765 0354 1A61     		str	r2, [r3, #16]
 172:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** }
 766              		.loc 1 172 0
 767 0356 C046     		nop
 768 0358 BD46     		mov	sp, r7
 769 035a 02B0     		add	sp, sp, #8
 770              		@ sp needed
 771 035c 80BD     		pop	{r7, pc}
 772              	.L31:
 773 035e C046     		.align	2
 774              	.L30:
 775 0360 00000000 		.word	pSnakeVec
 776              		.cfi_endproc
 777              	.LFE6:
 779              		.global	p2
 780              		.data
 781              		.align	2
 784              	p2:
 785 00cc 00000000 		.word	ball_geometry
 786 00d0 00000000 		.word	0
 787 00d4 00000000 		.word	0
 788 00d8 02000000 		.word	2
 789 00dc 02000000 		.word	2
 790 00e0 00000000 		.word	draw_object
 791 00e4 00000000 		.word	clear_object
 792 00e8 00000000 		.word	move_snake
 793 00ec 00000000 		.word	set_object_speed
 794 00f0 00000000 		.space	4
 795              		.global	pp2
 796              		.align	2
 799              	pp2:
 800 00f4 00000000 		.word	p2
 801              		.global	a
 802              		.align	2
 805              	a:
 806 00f8 98000000 		.word	apple
 807              		.text
 808              		.align	1
 809              		.global	extend_snake
 810              		.syntax unified
 811              		.code	16
 812              		.thumb_func
 813              		.fpu softvfp
 815              	extend_snake:
 816              	.LFB7:
 173:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
 174:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** OBJECT p2 = {&ball_geometry,
 175:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	0,0,
 176:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	2,2,
 177:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	draw_object,
 178:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	clear_object,
 179:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	move_snake,
 180:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	set_object_speed};
 181:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
 182:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
 183:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** POBJECT pp2 = &p2;
 184:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** POBJECT a = &apple;
 185:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
 186:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
 187:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
 188:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** void extend_snake(POBJECT new, POBJECT tail)
 189:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** {
 817              		.loc 1 189 0
 818              		.cfi_startproc
 819              		@ args = 0, pretend = 0, frame = 8
 820              		@ frame_needed = 1, uses_anonymous_args = 0
 821 0364 80B5     		push	{r7, lr}
 822              		.cfi_def_cfa_offset 8
 823              		.cfi_offset 7, -8
 824              		.cfi_offset 14, -4
 825 0366 82B0     		sub	sp, sp, #8
 826              		.cfi_def_cfa_offset 16
 827 0368 00AF     		add	r7, sp, #0
 828              		.cfi_def_cfa_register 7
 829 036a 7860     		str	r0, [r7, #4]
 830 036c 3960     		str	r1, [r7]
 190:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	new->geo = &ball_geometry;
 831              		.loc 1 190 0
 832 036e 7B68     		ldr	r3, [r7, #4]
 833 0370 114A     		ldr	r2, .L33
 834 0372 1A60     		str	r2, [r3]
 191:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	new->dirx = tail->dirx;
 835              		.loc 1 191 0
 836 0374 3B68     		ldr	r3, [r7]
 837 0376 5A68     		ldr	r2, [r3, #4]
 838 0378 7B68     		ldr	r3, [r7, #4]
 839 037a 5A60     		str	r2, [r3, #4]
 192:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	new->diry = tail->diry;
 840              		.loc 1 192 0
 841 037c 3B68     		ldr	r3, [r7]
 842 037e 9A68     		ldr	r2, [r3, #8]
 843 0380 7B68     		ldr	r3, [r7, #4]
 844 0382 9A60     		str	r2, [r3, #8]
 193:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	new->posx = tail->posx - tail->geo->sizex;
 845              		.loc 1 193 0
 846 0384 3B68     		ldr	r3, [r7]
 847 0386 DA68     		ldr	r2, [r3, #12]
 848 0388 3B68     		ldr	r3, [r7]
 849 038a 1B68     		ldr	r3, [r3]
 850 038c 5B68     		ldr	r3, [r3, #4]
 851 038e D21A     		subs	r2, r2, r3
 852 0390 7B68     		ldr	r3, [r7, #4]
 853 0392 DA60     		str	r2, [r3, #12]
 194:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	new->posy = tail->posy;
 854              		.loc 1 194 0
 855 0394 3B68     		ldr	r3, [r7]
 856 0396 1A69     		ldr	r2, [r3, #16]
 857 0398 7B68     		ldr	r3, [r7, #4]
 858 039a 1A61     		str	r2, [r3, #16]
 195:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	new->draw = draw_object;
 859              		.loc 1 195 0
 860 039c 7B68     		ldr	r3, [r7, #4]
 861 039e 074A     		ldr	r2, .L33+4
 862 03a0 5A61     		str	r2, [r3, #20]
 196:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	new->clear = clear_object;
 863              		.loc 1 196 0
 864 03a2 7B68     		ldr	r3, [r7, #4]
 865 03a4 064A     		ldr	r2, .L33+8
 866 03a6 9A61     		str	r2, [r3, #24]
 197:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	new->smove = move_snake;
 867              		.loc 1 197 0
 868 03a8 7B68     		ldr	r3, [r7, #4]
 869 03aa 064A     		ldr	r2, .L33+12
 870 03ac 5A62     		str	r2, [r3, #36]
 198:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** }
 871              		.loc 1 198 0
 872 03ae C046     		nop
 873 03b0 BD46     		mov	sp, r7
 874 03b2 02B0     		add	sp, sp, #8
 875              		@ sp needed
 876 03b4 80BD     		pop	{r7, pc}
 877              	.L34:
 878 03b6 C046     		.align	2
 879              	.L33:
 880 03b8 00000000 		.word	ball_geometry
 881 03bc 00000000 		.word	draw_object
 882 03c0 00000000 		.word	clear_object
 883 03c4 00000000 		.word	move_snake
 884              		.cfi_endproc
 885              	.LFE7:
 887              		.align	1
 888              		.global	main
 889              		.syntax unified
 890              		.code	16
 891              		.thumb_func
 892              		.fpu softvfp
 894              	main:
 895              	.LFB8:
 199:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
 200:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** void main(void)
 201:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** {
 896              		.loc 1 201 0
 897              		.cfi_startproc
 898              		@ args = 0, pretend = 0, frame = 32
 899              		@ frame_needed = 1, uses_anonymous_args = 0
 900 03c8 90B5     		push	{r4, r7, lr}
 901              		.cfi_def_cfa_offset 12
 902              		.cfi_offset 4, -12
 903              		.cfi_offset 7, -8
 904              		.cfi_offset 14, -4
 905 03ca 89B0     		sub	sp, sp, #36
 906              		.cfi_def_cfa_offset 48
 907 03cc 00AF     		add	r7, sp, #0
 908              		.cfi_def_cfa_register 7
 202:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	char c;
 203:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	pSnakeVec[0] = s;
 909              		.loc 1 203 0
 910 03ce 684B     		ldr	r3, .L51
 911 03d0 1A68     		ldr	r2, [r3]
 912 03d2 684B     		ldr	r3, .L51+4
 913 03d4 1A60     		str	r2, [r3]
 204:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	pSnakeVec[1] = pp2;
 914              		.loc 1 204 0
 915 03d6 684B     		ldr	r3, .L51+8
 916 03d8 1A68     		ldr	r2, [r3]
 917 03da 664B     		ldr	r3, .L51+4
 918 03dc 5A60     		str	r2, [r3, #4]
 205:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	
 206:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	snakeLength = 2;
 919              		.loc 1 206 0
 920 03de 674B     		ldr	r3, .L51+12
 921 03e0 0222     		movs	r2, #2
 922 03e2 1A60     		str	r2, [r3]
 207:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	
 208:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	init_app();
 923              		.loc 1 208 0
 924 03e4 FFF7FEFF 		bl	init_app
 209:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	graphic_initialize();
 925              		.loc 1 209 0
 926 03e8 FFF7FEFF 		bl	graphic_initialize
 210:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	ascii_init();
 927              		.loc 1 210 0
 928 03ec FFF7FEFF 		bl	ascii_init
 211:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	ascii_gotoxy(1,1);
 929              		.loc 1 211 0
 930 03f0 0121     		movs	r1, #1
 931 03f2 0120     		movs	r0, #1
 932 03f4 FFF7FEFF 		bl	ascii_gotoxy
 933              	.L50:
 934              	.LBB5:
 212:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	
 213:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	#ifndef SIMULATOR
 214:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		graphic_clear_screen();
 215:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	#endif
 216:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	
 217:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	while(1)
 218:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	{
 219:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		s->move(s);
 935              		.loc 1 219 0
 936 03f8 5D4B     		ldr	r3, .L51
 937 03fa 1B68     		ldr	r3, [r3]
 938 03fc DA69     		ldr	r2, [r3, #28]
 939 03fe 5C4B     		ldr	r3, .L51
 940 0400 1B68     		ldr	r3, [r3]
 941 0402 1800     		movs	r0, r3
 942 0404 9047     		blx	r2
 943              	.LVL3:
 220:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		draw_object(s);
 944              		.loc 1 220 0
 945 0406 5A4B     		ldr	r3, .L51
 946 0408 1B68     		ldr	r3, [r3]
 947 040a 1800     		movs	r0, r3
 948 040c FFF7FEFF 		bl	draw_object
 949              	.LBB6:
 221:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		
 222:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		for(int i = snakeLength -1; i>0; i--)
 950              		.loc 1 222 0
 951 0410 5A4B     		ldr	r3, .L51+12
 952 0412 1B68     		ldr	r3, [r3]
 953 0414 013B     		subs	r3, r3, #1
 954 0416 FB61     		str	r3, [r7, #28]
 955 0418 0EE0     		b	.L36
 956              	.L37:
 957              	.LBB7:
 223:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		{
 224:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			POBJECT px = pSnakeVec[i];
 958              		.loc 1 224 0 discriminator 3
 959 041a 564B     		ldr	r3, .L51+4
 960 041c FA69     		ldr	r2, [r7, #28]
 961 041e 9200     		lsls	r2, r2, #2
 962 0420 D358     		ldr	r3, [r2, r3]
 963 0422 3B60     		str	r3, [r7]
 225:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			draw_object(pSnakeVec[i]);			
 964              		.loc 1 225 0 discriminator 3
 965 0424 534B     		ldr	r3, .L51+4
 966 0426 FA69     		ldr	r2, [r7, #28]
 967 0428 9200     		lsls	r2, r2, #2
 968 042a D358     		ldr	r3, [r2, r3]
 969 042c 1800     		movs	r0, r3
 970 042e FFF7FEFF 		bl	draw_object
 971              	.LBE7:
 222:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		{
 972              		.loc 1 222 0 discriminator 3
 973 0432 FB69     		ldr	r3, [r7, #28]
 974 0434 013B     		subs	r3, r3, #1
 975 0436 FB61     		str	r3, [r7, #28]
 976              	.L36:
 222:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		{
 977              		.loc 1 222 0 is_stmt 0 discriminator 1
 978 0438 FB69     		ldr	r3, [r7, #28]
 979 043a 002B     		cmp	r3, #0
 980 043c EDDC     		bgt	.L37
 981              	.LBE6:
 982              	.LBB8:
 226:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		}
 227:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		
 228:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		for(int i = snakeLength -1; i>= 0; i--)
 983              		.loc 1 228 0 is_stmt 1
 984 043e 4F4B     		ldr	r3, .L51+12
 985 0440 1B68     		ldr	r3, [r3]
 986 0442 013B     		subs	r3, r3, #1
 987 0444 BB61     		str	r3, [r7, #24]
 988 0446 1AE0     		b	.L38
 989              	.L40:
 990              	.LBB9:
 229:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		{
 230:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			POBJECT px = pSnakeVec[i];
 991              		.loc 1 230 0
 992 0448 4A4B     		ldr	r3, .L51+4
 993 044a BA69     		ldr	r2, [r7, #24]
 994 044c 9200     		lsls	r2, r2, #2
 995 044e D358     		ldr	r3, [r2, r3]
 996 0450 7B60     		str	r3, [r7, #4]
 231:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			clear_object(pSnakeVec[i]);
 997              		.loc 1 231 0
 998 0452 484B     		ldr	r3, .L51+4
 999 0454 BA69     		ldr	r2, [r7, #24]
 1000 0456 9200     		lsls	r2, r2, #2
 1001 0458 D358     		ldr	r3, [r2, r3]
 1002 045a 1800     		movs	r0, r3
 1003 045c FFF7FEFF 		bl	clear_object
 232:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			if(i!=0){
 1004              		.loc 1 232 0
 1005 0460 BB69     		ldr	r3, [r7, #24]
 1006 0462 002B     		cmp	r3, #0
 1007 0464 08D0     		beq	.L39
 233:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 				move_snake(pSnakeVec[i], i);
 1008              		.loc 1 233 0
 1009 0466 434B     		ldr	r3, .L51+4
 1010 0468 BA69     		ldr	r2, [r7, #24]
 1011 046a 9200     		lsls	r2, r2, #2
 1012 046c D358     		ldr	r3, [r2, r3]
 1013 046e BA69     		ldr	r2, [r7, #24]
 1014 0470 1100     		movs	r1, r2
 1015 0472 1800     		movs	r0, r3
 1016 0474 FFF7FEFF 		bl	move_snake
 1017              	.L39:
 1018              	.LBE9:
 228:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		{
 1019              		.loc 1 228 0 discriminator 2
 1020 0478 BB69     		ldr	r3, [r7, #24]
 1021 047a 013B     		subs	r3, r3, #1
 1022 047c BB61     		str	r3, [r7, #24]
 1023              	.L38:
 228:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		{
 1024              		.loc 1 228 0 is_stmt 0 discriminator 1
 1025 047e BB69     		ldr	r3, [r7, #24]
 1026 0480 002B     		cmp	r3, #0
 1027 0482 E1DA     		bge	.L40
 1028              	.LBE8:
 234:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			}
 235:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		}
 236:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		
 237:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		draw_object(a);
 1029              		.loc 1 237 0 is_stmt 1
 1030 0484 3E4B     		ldr	r3, .L51+16
 1031 0486 1B68     		ldr	r3, [r3]
 1032 0488 1800     		movs	r0, r3
 1033 048a FFF7FEFF 		bl	draw_object
 238:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		collision(pSnakeVec,a);
 1034              		.loc 1 238 0
 1035 048e 3C4B     		ldr	r3, .L51+16
 1036 0490 1A68     		ldr	r2, [r3]
 1037 0492 384B     		ldr	r3, .L51+4
 1038 0494 1100     		movs	r1, r2
 1039 0496 1800     		movs	r0, r3
 1040 0498 FFF7FEFF 		bl	collision
 1041              	.LBB10:
 239:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		
 240:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		for(int i = snakeLength -1; i> 1; i--)
 1042              		.loc 1 240 0
 1043 049c 374B     		ldr	r3, .L51+12
 1044 049e 1B68     		ldr	r3, [r3]
 1045 04a0 013B     		subs	r3, r3, #1
 1046 04a2 7B61     		str	r3, [r7, #20]
 1047 04a4 20E0     		b	.L41
 1048              	.L43:
 1049              	.LBB11:
 241:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		{
 242:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			POBJECT xx = pSnakeVec[i];
 1050              		.loc 1 242 0
 1051 04a6 334B     		ldr	r3, .L51+4
 1052 04a8 7A69     		ldr	r2, [r7, #20]
 1053 04aa 9200     		lsls	r2, r2, #2
 1054 04ac D358     		ldr	r3, [r2, r3]
 1055 04ae FB60     		str	r3, [r7, #12]
 243:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			POBJECT ss = s;
 1056              		.loc 1 243 0
 1057 04b0 2F4B     		ldr	r3, .L51
 1058 04b2 1B68     		ldr	r3, [r3]
 1059 04b4 BB60     		str	r3, [r7, #8]
 244:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		if(s->posx == pSnakeVec[i]->posx)
 1060              		.loc 1 244 0
 1061 04b6 2E4B     		ldr	r3, .L51
 1062 04b8 1B68     		ldr	r3, [r3]
 1063 04ba DA68     		ldr	r2, [r3, #12]
 1064 04bc 2D4B     		ldr	r3, .L51+4
 1065 04be 7969     		ldr	r1, [r7, #20]
 1066 04c0 8900     		lsls	r1, r1, #2
 1067 04c2 CB58     		ldr	r3, [r1, r3]
 1068 04c4 DB68     		ldr	r3, [r3, #12]
 1069 04c6 9A42     		cmp	r2, r3
 1070 04c8 0BD1     		bne	.L42
 245:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		{
 246:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			if(s->posy == pSnakeVec[i]->posy)
 1071              		.loc 1 246 0
 1072 04ca 294B     		ldr	r3, .L51
 1073 04cc 1B68     		ldr	r3, [r3]
 1074 04ce 1A69     		ldr	r2, [r3, #16]
 1075 04d0 284B     		ldr	r3, .L51+4
 1076 04d2 7969     		ldr	r1, [r7, #20]
 1077 04d4 8900     		lsls	r1, r1, #2
 1078 04d6 CB58     		ldr	r3, [r1, r3]
 1079 04d8 1B69     		ldr	r3, [r3, #16]
 1080 04da 9A42     		cmp	r2, r3
 1081 04dc 01D1     		bne	.L42
 247:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			{
 248:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 				gameOver();
 1082              		.loc 1 248 0
 1083 04de FFF7FEFF 		bl	gameOver
 1084              	.L42:
 1085              	.LBE11:
 240:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		{
 1086              		.loc 1 240 0 discriminator 2
 1087 04e2 7B69     		ldr	r3, [r7, #20]
 1088 04e4 013B     		subs	r3, r3, #1
 1089 04e6 7B61     		str	r3, [r7, #20]
 1090              	.L41:
 240:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		{
 1091              		.loc 1 240 0 is_stmt 0 discriminator 1
 1092 04e8 7B69     		ldr	r3, [r7, #20]
 1093 04ea 012B     		cmp	r3, #1
 1094 04ec DBDC     		bgt	.L43
 1095              	.LBE10:
 249:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			}		
 250:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		}
 251:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	
 252:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		}
 253:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		
 254:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		
 255:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		
 256:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		delay_milli(40);
 1096              		.loc 1 256 0 is_stmt 1
 1097 04ee 2820     		movs	r0, #40
 1098 04f0 FFF7FEFF 		bl	delay_milli
 257:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		c = keyb();
 1099              		.loc 1 257 0
 1100 04f4 FFF7FEFF 		bl	keyb
 1101 04f8 0200     		movs	r2, r0
 1102 04fa 1321     		movs	r1, #19
 1103 04fc 7B18     		adds	r3, r7, r1
 1104 04fe 1A70     		strb	r2, [r3]
 258:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		switch(c)
 1105              		.loc 1 258 0
 1106 0500 7B18     		adds	r3, r7, r1
 1107 0502 1B78     		ldrb	r3, [r3]
 1108 0504 042B     		cmp	r3, #4
 1109 0506 12D0     		beq	.L45
 1110 0508 02DC     		bgt	.L46
 1111 050a 022B     		cmp	r3, #2
 1112 050c 1AD0     		beq	.L47
 1113 050e 2EE0     		b	.L44
 1114              	.L46:
 1115 0510 062B     		cmp	r3, #6
 1116 0512 02D0     		beq	.L48
 1117 0514 082B     		cmp	r3, #8
 1118 0516 20D0     		beq	.L49
 1119 0518 29E0     		b	.L44
 1120              	.L48:
 259:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		{
 260:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			case 6: s->set_speed(s,4,0); break;
 1121              		.loc 1 260 0
 1122 051a 154B     		ldr	r3, .L51
 1123 051c 1B68     		ldr	r3, [r3]
 1124 051e 1C6A     		ldr	r4, [r3, #32]
 1125 0520 134B     		ldr	r3, .L51
 1126 0522 1B68     		ldr	r3, [r3]
 1127 0524 0022     		movs	r2, #0
 1128 0526 0421     		movs	r1, #4
 1129 0528 1800     		movs	r0, r3
 1130 052a A047     		blx	r4
 1131              	.LVL4:
 1132 052c 1FE0     		b	.L44
 1133              	.L45:
 261:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			case 4: s->set_speed(s,-4,0); break;
 1134              		.loc 1 261 0
 1135 052e 104B     		ldr	r3, .L51
 1136 0530 1B68     		ldr	r3, [r3]
 1137 0532 1C6A     		ldr	r4, [r3, #32]
 1138 0534 0E4B     		ldr	r3, .L51
 1139 0536 1868     		ldr	r0, [r3]
 1140 0538 0423     		movs	r3, #4
 1141 053a 5B42     		rsbs	r3, r3, #0
 1142 053c 0022     		movs	r2, #0
 1143 053e 1900     		movs	r1, r3
 1144 0540 A047     		blx	r4
 1145              	.LVL5:
 1146 0542 14E0     		b	.L44
 1147              	.L47:
 262:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			case 2: s->set_speed(s,0,-4); break;
 1148              		.loc 1 262 0
 1149 0544 0A4B     		ldr	r3, .L51
 1150 0546 1B68     		ldr	r3, [r3]
 1151 0548 1C6A     		ldr	r4, [r3, #32]
 1152 054a 094B     		ldr	r3, .L51
 1153 054c 1868     		ldr	r0, [r3]
 1154 054e 0423     		movs	r3, #4
 1155 0550 5B42     		rsbs	r3, r3, #0
 1156 0552 1A00     		movs	r2, r3
 1157 0554 0021     		movs	r1, #0
 1158 0556 A047     		blx	r4
 1159              	.LVL6:
 1160 0558 09E0     		b	.L44
 1161              	.L49:
 263:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			case 8: s->set_speed(s,0,4); break;
 1162              		.loc 1 263 0
 1163 055a 054B     		ldr	r3, .L51
 1164 055c 1B68     		ldr	r3, [r3]
 1165 055e 1C6A     		ldr	r4, [r3, #32]
 1166 0560 034B     		ldr	r3, .L51
 1167 0562 1B68     		ldr	r3, [r3]
 1168 0564 0422     		movs	r2, #4
 1169 0566 0021     		movs	r1, #0
 1170 0568 1800     		movs	r0, r3
 1171 056a A047     		blx	r4
 1172              	.LVL7:
 1173 056c C046     		nop
 1174              	.L44:
 1175              	.LBE5:
 218:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		s->move(s);
 1176              		.loc 1 218 0
 1177 056e 43E7     		b	.L50
 1178              	.L52:
 1179              		.align	2
 1180              	.L51:
 1181 0570 00000000 		.word	s
 1182 0574 00000000 		.word	pSnakeVec
 1183 0578 00000000 		.word	pp2
 1184 057c 00000000 		.word	snakeLength
 1185 0580 00000000 		.word	a
 1186              		.cfi_endproc
 1187              	.LFE8:
 1189              	.Letext0:
 1190              		.file 2 "./gpio.h"
 1191              		.file 3 "./structs.h"
