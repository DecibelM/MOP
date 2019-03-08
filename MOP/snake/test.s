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
  28:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** void set_object_speed(POBJECT o, int speedx, int speedy){
  60              		.loc 1 28 0
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
  29:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	if(speedx != -o->dirx)
  75              		.loc 1 29 0
  76 000c FB68     		ldr	r3, [r7, #12]
  77 000e 5B68     		ldr	r3, [r3, #4]
  78 0010 5B42     		rsbs	r3, r3, #0
  79 0012 BA68     		ldr	r2, [r7, #8]
  80 0014 9A42     		cmp	r2, r3
  81 0016 02D0     		beq	.L3
  30:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	{
  31:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		o->dirx = speedx;
  82              		.loc 1 31 0
  83 0018 FB68     		ldr	r3, [r7, #12]
  84 001a BA68     		ldr	r2, [r7, #8]
  85 001c 5A60     		str	r2, [r3, #4]
  86              	.L3:
  32:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	}
  33:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	if(speedy != -o->diry){
  87              		.loc 1 33 0
  88 001e FB68     		ldr	r3, [r7, #12]
  89 0020 9B68     		ldr	r3, [r3, #8]
  90 0022 5B42     		rsbs	r3, r3, #0
  91 0024 7A68     		ldr	r2, [r7, #4]
  92 0026 9A42     		cmp	r2, r3
  93 0028 02D0     		beq	.L5
  34:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		o->diry = speedy;
  94              		.loc 1 34 0
  95 002a FB68     		ldr	r3, [r7, #12]
  96 002c 7A68     		ldr	r2, [r7, #4]
  97 002e 9A60     		str	r2, [r3, #8]
  98              	.L5:
  35:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	}
  36:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** }
  99              		.loc 1 36 0
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
  37:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
  38:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** void move_object(POBJECT o){
 117              		.loc 1 38 0
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
  39:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	//clear_object(o);
  40:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	o->posx += o->dirx;
 130              		.loc 1 40 0
 131 0040 7B68     		ldr	r3, [r7, #4]
 132 0042 DA68     		ldr	r2, [r3, #12]
 133 0044 7B68     		ldr	r3, [r7, #4]
 134 0046 5B68     		ldr	r3, [r3, #4]
 135 0048 D218     		adds	r2, r2, r3
 136 004a 7B68     		ldr	r3, [r7, #4]
 137 004c DA60     		str	r2, [r3, #12]
  41:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	o->posy += o->diry;
 138              		.loc 1 41 0
 139 004e 7B68     		ldr	r3, [r7, #4]
 140 0050 1A69     		ldr	r2, [r3, #16]
 141 0052 7B68     		ldr	r3, [r7, #4]
 142 0054 9B68     		ldr	r3, [r3, #8]
 143 0056 D218     		adds	r2, r2, r3
 144 0058 7B68     		ldr	r3, [r7, #4]
 145 005a 1A61     		str	r2, [r3, #16]
  42:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	
  43:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	if(o->posx <= 1){
 146              		.loc 1 43 0
 147 005c 7B68     		ldr	r3, [r7, #4]
 148 005e DB68     		ldr	r3, [r3, #12]
 149 0060 012B     		cmp	r3, #1
 150 0062 06DC     		bgt	.L7
  44:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		o->posx = 128 - o->geo->sizex;
 151              		.loc 1 44 0
 152 0064 7B68     		ldr	r3, [r7, #4]
 153 0066 1B68     		ldr	r3, [r3]
 154 0068 5B68     		ldr	r3, [r3, #4]
 155 006a 8022     		movs	r2, #128
 156 006c D21A     		subs	r2, r2, r3
 157 006e 7B68     		ldr	r3, [r7, #4]
 158 0070 DA60     		str	r2, [r3, #12]
 159              	.L7:
  45:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	}
  46:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	if(o->posx > 128 - o->geo->sizex){
 160              		.loc 1 46 0
 161 0072 7B68     		ldr	r3, [r7, #4]
 162 0074 DA68     		ldr	r2, [r3, #12]
 163 0076 7B68     		ldr	r3, [r7, #4]
 164 0078 1B68     		ldr	r3, [r3]
 165 007a 5B68     		ldr	r3, [r3, #4]
 166 007c 8021     		movs	r1, #128
 167 007e CB1A     		subs	r3, r1, r3
 168 0080 9A42     		cmp	r2, r3
 169 0082 02DD     		ble	.L8
  47:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		o->posx = 1;
 170              		.loc 1 47 0
 171 0084 7B68     		ldr	r3, [r7, #4]
 172 0086 0122     		movs	r2, #1
 173 0088 DA60     		str	r2, [r3, #12]
 174              	.L8:
  48:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	}
  49:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	if(o->posy <= 1){
 175              		.loc 1 49 0
 176 008a 7B68     		ldr	r3, [r7, #4]
 177 008c 1B69     		ldr	r3, [r3, #16]
 178 008e 012B     		cmp	r3, #1
 179 0090 06DC     		bgt	.L9
  50:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		o->posy = 64 - o->geo->sizey;
 180              		.loc 1 50 0
 181 0092 7B68     		ldr	r3, [r7, #4]
 182 0094 1B68     		ldr	r3, [r3]
 183 0096 9B68     		ldr	r3, [r3, #8]
 184 0098 4022     		movs	r2, #64
 185 009a D21A     		subs	r2, r2, r3
 186 009c 7B68     		ldr	r3, [r7, #4]
 187 009e 1A61     		str	r2, [r3, #16]
 188              	.L9:
  51:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	}
  52:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	if(o->posy > 64 - o->geo->sizey){
 189              		.loc 1 52 0
 190 00a0 7B68     		ldr	r3, [r7, #4]
 191 00a2 1A69     		ldr	r2, [r3, #16]
 192 00a4 7B68     		ldr	r3, [r7, #4]
 193 00a6 1B68     		ldr	r3, [r3]
 194 00a8 9B68     		ldr	r3, [r3, #8]
 195 00aa 4021     		movs	r1, #64
 196 00ac CB1A     		subs	r3, r1, r3
 197 00ae 9A42     		cmp	r2, r3
 198 00b0 02DD     		ble	.L11
  53:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		o->posy = 1 ;
 199              		.loc 1 53 0
 200 00b2 7B68     		ldr	r3, [r7, #4]
 201 00b4 0122     		movs	r2, #1
 202 00b6 1A61     		str	r2, [r3, #16]
 203              	.L11:
  54:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	}
  55:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	//draw_object(o);
  56:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** }
 204              		.loc 1 56 0
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
 267 00a0 04000000 		.word	4
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
  57:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
  58:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	GEOMETRY ball_geometry =
  59:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** {
  60:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	12,4,4,{{0,1},{0,2},{1,0},{1,1},{1,2},{1,3},{2,0},{2,1},{2,2},{2,3},{3,1},{3,2}}
  61:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** };
  62:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
  63:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** static OBJECT snake=
  64:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** {&ball_geometry,
  65:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 0,0,
  66:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 6,2,
  67:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** draw_object,
  68:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** clear_object,
  69:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** move_object,
  70:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** set_object_speed};
  71:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
  72:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** static OBJECT apple=
  73:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** {&ball_geometry,
  74:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 0,4,
  75:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 10,2,
  76:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** draw_object,
  77:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** clear_object,
  78:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** move_object,
  79:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** set_object_speed};
  80:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
  81:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
  82:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** void init_app(void)
  83:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** {
 285              		.loc 1 83 0
 286              		.cfi_startproc
 287              		@ args = 0, pretend = 0, frame = 0
 288              		@ frame_needed = 1, uses_anonymous_args = 0
 289 00c0 80B5     		push	{r7, lr}
 290              		.cfi_def_cfa_offset 8
 291              		.cfi_offset 7, -8
 292              		.cfi_offset 14, -4
 293 00c2 00AF     		add	r7, sp, #0
 294              		.cfi_def_cfa_register 7
  84:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	#ifdef USBDM
  85:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	*((unsigned long*) 0x40023830) = 0x18;
  86:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	__asm volatile("LDR R0,=0x08000209\n BLX R0\n");
  87:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	#endif
  88:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	
  89:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	GPIO_D.moder= 0x55005555;
 295              		.loc 1 89 0
 296 00c4 084B     		ldr	r3, .L13
 297 00c6 094A     		ldr	r2, .L13+4
 298 00c8 1A60     		str	r2, [r3]
  90:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	GPIO_D.otyper = 0x0100;
 299              		.loc 1 90 0
 300 00ca 074B     		ldr	r3, .L13
 301 00cc 8022     		movs	r2, #128
 302 00ce 5200     		lsls	r2, r2, #1
 303 00d0 9A80     		strh	r2, [r3, #4]
  91:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	GPIO_D.pupdr = 0x00AA0000;
 304              		.loc 1 91 0
 305 00d2 054B     		ldr	r3, .L13
 306 00d4 AA22     		movs	r2, #170
 307 00d6 1204     		lsls	r2, r2, #16
 308 00d8 DA60     		str	r2, [r3, #12]
  92:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	GPIO_E.moder = 0x55555555;
 309              		.loc 1 92 0
 310 00da 054B     		ldr	r3, .L13+8
 311 00dc 054A     		ldr	r2, .L13+12
 312 00de 1A60     		str	r2, [r3]
  93:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** }
 313              		.loc 1 93 0
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
 335              		.comm	s,4,4
 336              		.global	string
 337              		.data
 338              		.align	2
 341              	string:
 342 00c0 506F696E 		.ascii	"Points\000"
 342      747300
 343              		.section	.rodata
 344              		.align	2
 345              	.LC3:
 346 0000 506F696E 		.ascii	"Points:\000"
 346      74733A00 
 347              		.text
 348              		.align	1
 349              		.global	collision
 350              		.syntax unified
 351              		.code	16
 352              		.thumb_func
 353              		.fpu softvfp
 355              	collision:
 356              	.LFB4:
  94:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
  95:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** int points =0;
  96:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** char *s;
  97:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** char string[] = "Points";
  98:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
  99:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** void collision(POBJECT pSnakeVec[], POBJECT a)
 100:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** {
 357              		.loc 1 100 0
 358              		.cfi_startproc
 359              		@ args = 0, pretend = 0, frame = 32
 360              		@ frame_needed = 1, uses_anonymous_args = 0
 361 00f8 90B5     		push	{r4, r7, lr}
 362              		.cfi_def_cfa_offset 12
 363              		.cfi_offset 4, -12
 364              		.cfi_offset 7, -8
 365              		.cfi_offset 14, -4
 366 00fa 89B0     		sub	sp, sp, #36
 367              		.cfi_def_cfa_offset 48
 368 00fc 00AF     		add	r7, sp, #0
 369              		.cfi_def_cfa_register 7
 370 00fe 7860     		str	r0, [r7, #4]
 371 0100 3960     		str	r1, [r7]
 101:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	POBJECT p = pSnakeVec[0];
 372              		.loc 1 101 0
 373 0102 7B68     		ldr	r3, [r7, #4]
 374 0104 1B68     		ldr	r3, [r3]
 375 0106 FB61     		str	r3, [r7, #28]
 102:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	if(p->posx +4 >= a->posx & p->posx <= a->posx + 4)
 376              		.loc 1 102 0
 377 0108 FB69     		ldr	r3, [r7, #28]
 378 010a DB68     		ldr	r3, [r3, #12]
 379 010c 1A1D     		adds	r2, r3, #4
 380 010e 3B68     		ldr	r3, [r7]
 381 0110 DB68     		ldr	r3, [r3, #12]
 382 0112 D017     		asrs	r0, r2, #31
 383 0114 D90F     		lsrs	r1, r3, #31
 384 0116 9A42     		cmp	r2, r3
 385 0118 4841     		adcs	r0, r0, r1
 386 011a 0300     		movs	r3, r0
 387 011c D9B2     		uxtb	r1, r3
 388 011e FB69     		ldr	r3, [r7, #28]
 389 0120 DB68     		ldr	r3, [r3, #12]
 390 0122 3A68     		ldr	r2, [r7]
 391 0124 D268     		ldr	r2, [r2, #12]
 392 0126 0432     		adds	r2, r2, #4
 393 0128 DC0F     		lsrs	r4, r3, #31
 394 012a D017     		asrs	r0, r2, #31
 395 012c 9A42     		cmp	r2, r3
 396 012e 4441     		adcs	r4, r4, r0
 397 0130 2300     		movs	r3, r4
 398 0132 DBB2     		uxtb	r3, r3
 399 0134 0B40     		ands	r3, r1
 400 0136 DBB2     		uxtb	r3, r3
 401 0138 002B     		cmp	r3, #0
 402 013a 00D1     		bne	.LCB233
 403 013c 88E0     		b	.L19	@long jump
 404              	.LCB233:
 103:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	{
 104:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		if(p->posy +4 >= a->posy & p->posy <= a->posy + 4)
 405              		.loc 1 104 0
 406 013e FB69     		ldr	r3, [r7, #28]
 407 0140 1B69     		ldr	r3, [r3, #16]
 408 0142 1A1D     		adds	r2, r3, #4
 409 0144 3B68     		ldr	r3, [r7]
 410 0146 1B69     		ldr	r3, [r3, #16]
 411 0148 D017     		asrs	r0, r2, #31
 412 014a D90F     		lsrs	r1, r3, #31
 413 014c 9A42     		cmp	r2, r3
 414 014e 4841     		adcs	r0, r0, r1
 415 0150 0300     		movs	r3, r0
 416 0152 D9B2     		uxtb	r1, r3
 417 0154 FB69     		ldr	r3, [r7, #28]
 418 0156 1B69     		ldr	r3, [r3, #16]
 419 0158 3A68     		ldr	r2, [r7]
 420 015a 1269     		ldr	r2, [r2, #16]
 421 015c 0432     		adds	r2, r2, #4
 422 015e DC0F     		lsrs	r4, r3, #31
 423 0160 D017     		asrs	r0, r2, #31
 424 0162 9A42     		cmp	r2, r3
 425 0164 4441     		adcs	r4, r4, r0
 426 0166 2300     		movs	r3, r4
 427 0168 DBB2     		uxtb	r3, r3
 428 016a 0B40     		ands	r3, r1
 429 016c DBB2     		uxtb	r3, r3
 430 016e 002B     		cmp	r3, #0
 431 0170 6ED0     		beq	.L19
 432              	.LBB2:
 105:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		{
 106:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			clear_object(a);
 433              		.loc 1 106 0
 434 0172 3B68     		ldr	r3, [r7]
 435 0174 1800     		movs	r0, r3
 436 0176 FFF7FEFF 		bl	clear_object
 107:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			points++;
 437              		.loc 1 107 0
 438 017a 374B     		ldr	r3, .L20
 439 017c 1B68     		ldr	r3, [r3]
 440 017e 5A1C     		adds	r2, r3, #1
 441 0180 354B     		ldr	r3, .L20
 442 0182 1A60     		str	r2, [r3]
 108:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			POBJECT x = pSnakeVec[snakeLength-1];
 443              		.loc 1 108 0
 444 0184 354B     		ldr	r3, .L20+4
 445 0186 1B68     		ldr	r3, [r3]
 446 0188 354A     		ldr	r2, .L20+8
 447 018a 9446     		mov	ip, r2
 448 018c 6344     		add	r3, r3, ip
 449 018e 9B00     		lsls	r3, r3, #2
 450 0190 7A68     		ldr	r2, [r7, #4]
 451 0192 D318     		adds	r3, r2, r3
 452 0194 1B68     		ldr	r3, [r3]
 453 0196 BB61     		str	r3, [r7, #24]
 109:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			POBJECT y = &snakeVec[snakeLength];
 454              		.loc 1 109 0
 455 0198 304B     		ldr	r3, .L20+4
 456 019a 1A68     		ldr	r2, [r3]
 457 019c 1300     		movs	r3, r2
 458 019e 9B00     		lsls	r3, r3, #2
 459 01a0 9B18     		adds	r3, r3, r2
 460 01a2 DB00     		lsls	r3, r3, #3
 461 01a4 2F4A     		ldr	r2, .L20+12
 462 01a6 9B18     		adds	r3, r3, r2
 463 01a8 7B61     		str	r3, [r7, #20]
 110:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			extend_snake(&snakeVec[snakeLength],pSnakeVec[snakeLength-1] );
 464              		.loc 1 110 0
 465 01aa 2C4B     		ldr	r3, .L20+4
 466 01ac 1A68     		ldr	r2, [r3]
 467 01ae 1300     		movs	r3, r2
 468 01b0 9B00     		lsls	r3, r3, #2
 469 01b2 9B18     		adds	r3, r3, r2
 470 01b4 DB00     		lsls	r3, r3, #3
 471 01b6 2B4A     		ldr	r2, .L20+12
 472 01b8 9818     		adds	r0, r3, r2
 473 01ba 284B     		ldr	r3, .L20+4
 474 01bc 1B68     		ldr	r3, [r3]
 475 01be 284A     		ldr	r2, .L20+8
 476 01c0 9446     		mov	ip, r2
 477 01c2 6344     		add	r3, r3, ip
 478 01c4 9B00     		lsls	r3, r3, #2
 479 01c6 7A68     		ldr	r2, [r7, #4]
 480 01c8 D318     		adds	r3, r2, r3
 481 01ca 1B68     		ldr	r3, [r3]
 482 01cc 1900     		movs	r1, r3
 483 01ce FFF7FEFF 		bl	extend_snake
 111:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			pSnakeVec[snakeLength] = &snakeVec[snakeLength];
 484              		.loc 1 111 0
 485 01d2 224B     		ldr	r3, .L20+4
 486 01d4 1968     		ldr	r1, [r3]
 487 01d6 214B     		ldr	r3, .L20+4
 488 01d8 1B68     		ldr	r3, [r3]
 489 01da 9B00     		lsls	r3, r3, #2
 490 01dc 7A68     		ldr	r2, [r7, #4]
 491 01de D218     		adds	r2, r2, r3
 492 01e0 0B00     		movs	r3, r1
 493 01e2 9B00     		lsls	r3, r3, #2
 494 01e4 5B18     		adds	r3, r3, r1
 495 01e6 DB00     		lsls	r3, r3, #3
 496 01e8 1E49     		ldr	r1, .L20+12
 497 01ea 5B18     		adds	r3, r3, r1
 498 01ec 1360     		str	r3, [r2]
 112:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			snakeLength++;
 499              		.loc 1 112 0
 500 01ee 1B4B     		ldr	r3, .L20+4
 501 01f0 1B68     		ldr	r3, [r3]
 502 01f2 5A1C     		adds	r2, r3, #1
 503 01f4 194B     		ldr	r3, .L20+4
 504 01f6 1A60     		str	r2, [r3]
 113:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			
 114:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			char string[] = "Points:";
 505              		.loc 1 114 0
 506 01f8 0821     		movs	r1, #8
 507 01fa 7B18     		adds	r3, r7, r1
 508 01fc 1A4A     		ldr	r2, .L20+16
 509 01fe 11CA     		ldmia	r2!, {r0, r4}
 510 0200 11C3     		stmia	r3!, {r0, r4}
 115:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			s = string;
 511              		.loc 1 115 0
 512 0202 1A4B     		ldr	r3, .L20+20
 513 0204 7A18     		adds	r2, r7, r1
 514 0206 1A60     		str	r2, [r3]
 116:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			ascii_gotoxy(1,1);
 515              		.loc 1 116 0
 516 0208 0121     		movs	r1, #1
 517 020a 0120     		movs	r0, #1
 518 020c FFF7FEFF 		bl	ascii_gotoxy
 117:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			while(*s)
 519              		.loc 1 117 0
 520 0210 08E0     		b	.L17
 521              	.L18:
 118:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			{
 119:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			ascii_write_char(*s++);
 522              		.loc 1 119 0
 523 0212 164B     		ldr	r3, .L20+20
 524 0214 1B68     		ldr	r3, [r3]
 525 0216 591C     		adds	r1, r3, #1
 526 0218 144A     		ldr	r2, .L20+20
 527 021a 1160     		str	r1, [r2]
 528 021c 1B78     		ldrb	r3, [r3]
 529 021e 1800     		movs	r0, r3
 530 0220 FFF7FEFF 		bl	ascii_write_char
 531              	.L17:
 117:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			while(*s)
 532              		.loc 1 117 0
 533 0224 114B     		ldr	r3, .L20+20
 534 0226 1B68     		ldr	r3, [r3]
 535 0228 1B78     		ldrb	r3, [r3]
 536 022a 002B     		cmp	r3, #0
 537 022c F1D1     		bne	.L18
 120:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			}
 121:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			char pts = points + '0';
 538              		.loc 1 121 0
 539 022e 0A4B     		ldr	r3, .L20
 540 0230 1B68     		ldr	r3, [r3]
 541 0232 DAB2     		uxtb	r2, r3
 542 0234 1321     		movs	r1, #19
 543 0236 7B18     		adds	r3, r7, r1
 544 0238 3032     		adds	r2, r2, #48
 545 023a 1A70     		strb	r2, [r3]
 122:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			ascii_write_char(pts);
 546              		.loc 1 122 0
 547 023c 7B18     		adds	r3, r7, r1
 548 023e 1B78     		ldrb	r3, [r3]
 549 0240 1800     		movs	r0, r3
 550 0242 FFF7FEFF 		bl	ascii_write_char
 123:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			
 124:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			a->move(a);
 551              		.loc 1 124 0
 552 0246 3B68     		ldr	r3, [r7]
 553 0248 DB69     		ldr	r3, [r3, #28]
 554 024a 3A68     		ldr	r2, [r7]
 555 024c 1000     		movs	r0, r2
 556 024e 9847     		blx	r3
 557              	.LVL0:
 558              	.L19:
 559              	.LBE2:
 125:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		}
 126:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	}
 127:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** }
 560              		.loc 1 127 0
 561 0250 C046     		nop
 562 0252 BD46     		mov	sp, r7
 563 0254 09B0     		add	sp, sp, #36
 564              		@ sp needed
 565 0256 90BD     		pop	{r4, r7, pc}
 566              	.L21:
 567              		.align	2
 568              	.L20:
 569 0258 00000000 		.word	points
 570 025c 00000000 		.word	snakeLength
 571 0260 FFFFFF3F 		.word	1073741823
 572 0264 00000000 		.word	snakeVec
 573 0268 00000000 		.word	.LC3
 574 026c 00000000 		.word	s
 575              		.cfi_endproc
 576              	.LFE4:
 578              		.align	1
 579              		.global	move_snake
 580              		.syntax unified
 581              		.code	16
 582              		.thumb_func
 583              		.fpu softvfp
 585              	move_snake:
 586              	.LFB5:
 128:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
 129:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** void move_snake(POBJECT o, int i){
 587              		.loc 1 129 0
 588              		.cfi_startproc
 589              		@ args = 0, pretend = 0, frame = 8
 590              		@ frame_needed = 1, uses_anonymous_args = 0
 591 0270 80B5     		push	{r7, lr}
 592              		.cfi_def_cfa_offset 8
 593              		.cfi_offset 7, -8
 594              		.cfi_offset 14, -4
 595 0272 82B0     		sub	sp, sp, #8
 596              		.cfi_def_cfa_offset 16
 597 0274 00AF     		add	r7, sp, #0
 598              		.cfi_def_cfa_register 7
 599 0276 7860     		str	r0, [r7, #4]
 600 0278 3960     		str	r1, [r7]
 130:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	//clear_object(o);
 131:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	o->posx = pSnakeVec[i-1]->posx;
 601              		.loc 1 131 0
 602 027a 3B68     		ldr	r3, [r7]
 603 027c 5A1E     		subs	r2, r3, #1
 604 027e 094B     		ldr	r3, .L23
 605 0280 9200     		lsls	r2, r2, #2
 606 0282 D358     		ldr	r3, [r2, r3]
 607 0284 DA68     		ldr	r2, [r3, #12]
 608 0286 7B68     		ldr	r3, [r7, #4]
 609 0288 DA60     		str	r2, [r3, #12]
 132:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	o->posy = pSnakeVec[i-1]->posy;
 610              		.loc 1 132 0
 611 028a 3B68     		ldr	r3, [r7]
 612 028c 5A1E     		subs	r2, r3, #1
 613 028e 054B     		ldr	r3, .L23
 614 0290 9200     		lsls	r2, r2, #2
 615 0292 D358     		ldr	r3, [r2, r3]
 616 0294 1A69     		ldr	r2, [r3, #16]
 617 0296 7B68     		ldr	r3, [r7, #4]
 618 0298 1A61     		str	r2, [r3, #16]
 133:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** }
 619              		.loc 1 133 0
 620 029a C046     		nop
 621 029c BD46     		mov	sp, r7
 622 029e 02B0     		add	sp, sp, #8
 623              		@ sp needed
 624 02a0 80BD     		pop	{r7, pc}
 625              	.L24:
 626 02a2 C046     		.align	2
 627              	.L23:
 628 02a4 00000000 		.word	pSnakeVec
 629              		.cfi_endproc
 630              	.LFE5:
 632              		.align	1
 633              		.global	extend_snake
 634              		.syntax unified
 635              		.code	16
 636              		.thumb_func
 637              		.fpu softvfp
 639              	extend_snake:
 640              	.LFB6:
 134:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
 135:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
 136:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** void extend_snake(POBJECT new, POBJECT tail)
 137:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** {
 641              		.loc 1 137 0
 642              		.cfi_startproc
 643              		@ args = 0, pretend = 0, frame = 8
 644              		@ frame_needed = 1, uses_anonymous_args = 0
 645 02a8 80B5     		push	{r7, lr}
 646              		.cfi_def_cfa_offset 8
 647              		.cfi_offset 7, -8
 648              		.cfi_offset 14, -4
 649 02aa 82B0     		sub	sp, sp, #8
 650              		.cfi_def_cfa_offset 16
 651 02ac 00AF     		add	r7, sp, #0
 652              		.cfi_def_cfa_register 7
 653 02ae 7860     		str	r0, [r7, #4]
 654 02b0 3960     		str	r1, [r7]
 138:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	new->geo = &ball_geometry;
 655              		.loc 1 138 0
 656 02b2 7B68     		ldr	r3, [r7, #4]
 657 02b4 114A     		ldr	r2, .L26
 658 02b6 1A60     		str	r2, [r3]
 139:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	new->dirx = tail->dirx;
 659              		.loc 1 139 0
 660 02b8 3B68     		ldr	r3, [r7]
 661 02ba 5A68     		ldr	r2, [r3, #4]
 662 02bc 7B68     		ldr	r3, [r7, #4]
 663 02be 5A60     		str	r2, [r3, #4]
 140:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	new->diry = tail->diry;
 664              		.loc 1 140 0
 665 02c0 3B68     		ldr	r3, [r7]
 666 02c2 9A68     		ldr	r2, [r3, #8]
 667 02c4 7B68     		ldr	r3, [r7, #4]
 668 02c6 9A60     		str	r2, [r3, #8]
 141:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	new->posx = tail->posx - tail->geo->sizex;
 669              		.loc 1 141 0
 670 02c8 3B68     		ldr	r3, [r7]
 671 02ca DA68     		ldr	r2, [r3, #12]
 672 02cc 3B68     		ldr	r3, [r7]
 673 02ce 1B68     		ldr	r3, [r3]
 674 02d0 5B68     		ldr	r3, [r3, #4]
 675 02d2 D21A     		subs	r2, r2, r3
 676 02d4 7B68     		ldr	r3, [r7, #4]
 677 02d6 DA60     		str	r2, [r3, #12]
 142:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	new->posy = tail->posy;
 678              		.loc 1 142 0
 679 02d8 3B68     		ldr	r3, [r7]
 680 02da 1A69     		ldr	r2, [r3, #16]
 681 02dc 7B68     		ldr	r3, [r7, #4]
 682 02de 1A61     		str	r2, [r3, #16]
 143:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	new->draw = draw_object;
 683              		.loc 1 143 0
 684 02e0 7B68     		ldr	r3, [r7, #4]
 685 02e2 074A     		ldr	r2, .L26+4
 686 02e4 5A61     		str	r2, [r3, #20]
 144:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	new->clear = clear_object;
 687              		.loc 1 144 0
 688 02e6 7B68     		ldr	r3, [r7, #4]
 689 02e8 064A     		ldr	r2, .L26+8
 690 02ea 9A61     		str	r2, [r3, #24]
 145:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	new->smove = move_snake;
 691              		.loc 1 145 0
 692 02ec 7B68     		ldr	r3, [r7, #4]
 693 02ee 064A     		ldr	r2, .L26+12
 694 02f0 5A62     		str	r2, [r3, #36]
 146:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** }
 695              		.loc 1 146 0
 696 02f2 C046     		nop
 697 02f4 BD46     		mov	sp, r7
 698 02f6 02B0     		add	sp, sp, #8
 699              		@ sp needed
 700 02f8 80BD     		pop	{r7, pc}
 701              	.L27:
 702 02fa C046     		.align	2
 703              	.L26:
 704 02fc 00000000 		.word	ball_geometry
 705 0300 00000000 		.word	draw_object
 706 0304 00000000 		.word	clear_object
 707 0308 00000000 		.word	move_snake
 708              		.cfi_endproc
 709              	.LFE6:
 711              		.global	p2
 712              		.data
 713 00c7 00       		.align	2
 716              	p2:
 717 00c8 00000000 		.word	ball_geometry
 718 00cc 00000000 		.word	0
 719 00d0 00000000 		.word	0
 720 00d4 02000000 		.word	2
 721 00d8 02000000 		.word	2
 722 00dc 00000000 		.word	draw_object
 723 00e0 00000000 		.word	clear_object
 724 00e4 00000000 		.word	move_snake
 725 00e8 00000000 		.word	set_object_speed
 726 00ec 00000000 		.space	4
 727              		.text
 728              		.align	1
 729              		.global	main
 730              		.syntax unified
 731              		.code	16
 732              		.thumb_func
 733              		.fpu softvfp
 735              	main:
 736              	.LFB7:
 147:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
 148:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
 149:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
 150:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** OBJECT p2 = {&ball_geometry,
 151:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	0,0,
 152:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	2,2,
 153:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	draw_object,
 154:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	clear_object,
 155:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	move_snake,
 156:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	set_object_speed};
 157:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
 158:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** void main(void)
 159:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** {
 737              		.loc 1 159 0
 738              		.cfi_startproc
 739              		@ args = 0, pretend = 0, frame = 32
 740              		@ frame_needed = 1, uses_anonymous_args = 0
 741 030c 80B5     		push	{r7, lr}
 742              		.cfi_def_cfa_offset 8
 743              		.cfi_offset 7, -8
 744              		.cfi_offset 14, -4
 745 030e 88B0     		sub	sp, sp, #32
 746              		.cfi_def_cfa_offset 40
 747 0310 00AF     		add	r7, sp, #0
 748              		.cfi_def_cfa_register 7
 160:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	char c;
 161:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	
 162:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	POBJECT s = &snake;
 749              		.loc 1 162 0
 750 0312 4D4B     		ldr	r3, .L41
 751 0314 7B61     		str	r3, [r7, #20]
 163:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	POBJECT pp2 = &p2;
 752              		.loc 1 163 0
 753 0316 4D4B     		ldr	r3, .L41+4
 754 0318 3B61     		str	r3, [r7, #16]
 164:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	POBJECT a = &apple;
 755              		.loc 1 164 0
 756 031a 4D4B     		ldr	r3, .L41+8
 757 031c FB60     		str	r3, [r7, #12]
 165:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	pSnakeVec[0] = s;
 758              		.loc 1 165 0
 759 031e 4D4B     		ldr	r3, .L41+12
 760 0320 7A69     		ldr	r2, [r7, #20]
 761 0322 1A60     		str	r2, [r3]
 166:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	pSnakeVec[1] = pp2;
 762              		.loc 1 166 0
 763 0324 4B4B     		ldr	r3, .L41+12
 764 0326 3A69     		ldr	r2, [r7, #16]
 765 0328 5A60     		str	r2, [r3, #4]
 167:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	
 168:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	snakeLength = 2;
 766              		.loc 1 168 0
 767 032a 4B4B     		ldr	r3, .L41+16
 768 032c 0222     		movs	r2, #2
 769 032e 1A60     		str	r2, [r3]
 169:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	
 170:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	init_app();
 770              		.loc 1 170 0
 771 0330 FFF7FEFF 		bl	init_app
 171:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	graphic_initialize();
 772              		.loc 1 171 0
 773 0334 FFF7FEFF 		bl	graphic_initialize
 172:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	ascii_init();
 774              		.loc 1 172 0
 775 0338 FFF7FEFF 		bl	ascii_init
 173:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	ascii_gotoxy(1,1);
 776              		.loc 1 173 0
 777 033c 0121     		movs	r1, #1
 778 033e 0120     		movs	r0, #1
 779 0340 FFF7FEFF 		bl	ascii_gotoxy
 780              	.L40:
 781              	.LBB3:
 174:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	
 175:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	#ifndef SIMULATOR
 176:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		graphic_clear_screen();
 177:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	#endif
 178:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	
 179:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	while(1)
 180:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	{
 181:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		s->move(s);
 782              		.loc 1 181 0
 783 0344 7B69     		ldr	r3, [r7, #20]
 784 0346 DB69     		ldr	r3, [r3, #28]
 785 0348 7A69     		ldr	r2, [r7, #20]
 786 034a 1000     		movs	r0, r2
 787 034c 9847     		blx	r3
 788              	.LVL1:
 182:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		draw_object(s);
 789              		.loc 1 182 0
 790 034e 7B69     		ldr	r3, [r7, #20]
 791 0350 1800     		movs	r0, r3
 792 0352 FFF7FEFF 		bl	draw_object
 793              	.LBB4:
 183:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		
 184:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		for(int i = snakeLength -1; i>0; i--)
 794              		.loc 1 184 0
 795 0356 404B     		ldr	r3, .L41+16
 796 0358 1B68     		ldr	r3, [r3]
 797 035a 013B     		subs	r3, r3, #1
 798 035c FB61     		str	r3, [r7, #28]
 799 035e 0EE0     		b	.L29
 800              	.L30:
 801              	.LBB5:
 185:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		{
 186:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			POBJECT px = pSnakeVec[i];
 802              		.loc 1 186 0 discriminator 3
 803 0360 3C4B     		ldr	r3, .L41+12
 804 0362 FA69     		ldr	r2, [r7, #28]
 805 0364 9200     		lsls	r2, r2, #2
 806 0366 D358     		ldr	r3, [r2, r3]
 807 0368 3B60     		str	r3, [r7]
 187:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			draw_object(pSnakeVec[i]);			
 808              		.loc 1 187 0 discriminator 3
 809 036a 3A4B     		ldr	r3, .L41+12
 810 036c FA69     		ldr	r2, [r7, #28]
 811 036e 9200     		lsls	r2, r2, #2
 812 0370 D358     		ldr	r3, [r2, r3]
 813 0372 1800     		movs	r0, r3
 814 0374 FFF7FEFF 		bl	draw_object
 815              	.LBE5:
 184:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		{
 816              		.loc 1 184 0 discriminator 3
 817 0378 FB69     		ldr	r3, [r7, #28]
 818 037a 013B     		subs	r3, r3, #1
 819 037c FB61     		str	r3, [r7, #28]
 820              	.L29:
 184:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		{
 821              		.loc 1 184 0 is_stmt 0 discriminator 1
 822 037e FB69     		ldr	r3, [r7, #28]
 823 0380 002B     		cmp	r3, #0
 824 0382 EDDC     		bgt	.L30
 825              	.LBE4:
 826              	.LBB6:
 188:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		}
 189:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		
 190:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		for(int i = snakeLength -1; i>= 0; i--)
 827              		.loc 1 190 0 is_stmt 1
 828 0384 344B     		ldr	r3, .L41+16
 829 0386 1B68     		ldr	r3, [r3]
 830 0388 013B     		subs	r3, r3, #1
 831 038a BB61     		str	r3, [r7, #24]
 832 038c 1AE0     		b	.L31
 833              	.L33:
 834              	.LBB7:
 191:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		{
 192:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			POBJECT px = pSnakeVec[i];
 835              		.loc 1 192 0
 836 038e 314B     		ldr	r3, .L41+12
 837 0390 BA69     		ldr	r2, [r7, #24]
 838 0392 9200     		lsls	r2, r2, #2
 839 0394 D358     		ldr	r3, [r2, r3]
 840 0396 7B60     		str	r3, [r7, #4]
 193:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			clear_object(pSnakeVec[i]);
 841              		.loc 1 193 0
 842 0398 2E4B     		ldr	r3, .L41+12
 843 039a BA69     		ldr	r2, [r7, #24]
 844 039c 9200     		lsls	r2, r2, #2
 845 039e D358     		ldr	r3, [r2, r3]
 846 03a0 1800     		movs	r0, r3
 847 03a2 FFF7FEFF 		bl	clear_object
 194:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			if(i!=0){
 848              		.loc 1 194 0
 849 03a6 BB69     		ldr	r3, [r7, #24]
 850 03a8 002B     		cmp	r3, #0
 851 03aa 08D0     		beq	.L32
 195:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 				move_snake(pSnakeVec[i], i);
 852              		.loc 1 195 0
 853 03ac 294B     		ldr	r3, .L41+12
 854 03ae BA69     		ldr	r2, [r7, #24]
 855 03b0 9200     		lsls	r2, r2, #2
 856 03b2 D358     		ldr	r3, [r2, r3]
 857 03b4 BA69     		ldr	r2, [r7, #24]
 858 03b6 1100     		movs	r1, r2
 859 03b8 1800     		movs	r0, r3
 860 03ba FFF7FEFF 		bl	move_snake
 861              	.L32:
 862              	.LBE7:
 190:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		{
 863              		.loc 1 190 0 discriminator 2
 864 03be BB69     		ldr	r3, [r7, #24]
 865 03c0 013B     		subs	r3, r3, #1
 866 03c2 BB61     		str	r3, [r7, #24]
 867              	.L31:
 190:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		{
 868              		.loc 1 190 0 is_stmt 0 discriminator 1
 869 03c4 BB69     		ldr	r3, [r7, #24]
 870 03c6 002B     		cmp	r3, #0
 871 03c8 E1DA     		bge	.L33
 872              	.LBE6:
 196:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			}
 197:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		}
 198:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		
 199:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		draw_object(a);
 873              		.loc 1 199 0 is_stmt 1
 874 03ca FB68     		ldr	r3, [r7, #12]
 875 03cc 1800     		movs	r0, r3
 876 03ce FFF7FEFF 		bl	draw_object
 200:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		collision(pSnakeVec,a);
 877              		.loc 1 200 0
 878 03d2 FA68     		ldr	r2, [r7, #12]
 879 03d4 1F4B     		ldr	r3, .L41+12
 880 03d6 1100     		movs	r1, r2
 881 03d8 1800     		movs	r0, r3
 882 03da FFF7FEFF 		bl	collision
 201:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		
 202:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		delay_milli(40);
 883              		.loc 1 202 0
 884 03de 2820     		movs	r0, #40
 885 03e0 FFF7FEFF 		bl	delay_milli
 203:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		c = keyb();
 886              		.loc 1 203 0
 887 03e4 FFF7FEFF 		bl	keyb
 888 03e8 0200     		movs	r2, r0
 889 03ea 0B21     		movs	r1, #11
 890 03ec 7B18     		adds	r3, r7, r1
 891 03ee 1A70     		strb	r2, [r3]
 204:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		switch(c)
 892              		.loc 1 204 0
 893 03f0 7B18     		adds	r3, r7, r1
 894 03f2 1B78     		ldrb	r3, [r3]
 895 03f4 042B     		cmp	r3, #4
 896 03f6 0FD0     		beq	.L35
 897 03f8 02DC     		bgt	.L36
 898 03fa 022B     		cmp	r3, #2
 899 03fc 14D0     		beq	.L37
 900 03fe 22E0     		b	.L34
 901              	.L36:
 902 0400 062B     		cmp	r3, #6
 903 0402 02D0     		beq	.L38
 904 0404 082B     		cmp	r3, #8
 905 0406 17D0     		beq	.L39
 906 0408 1DE0     		b	.L34
 907              	.L38:
 205:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		{
 206:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			case 6: s->set_speed(s,4,0); break;
 908              		.loc 1 206 0
 909 040a 7B69     		ldr	r3, [r7, #20]
 910 040c 1B6A     		ldr	r3, [r3, #32]
 911 040e 7869     		ldr	r0, [r7, #20]
 912 0410 0022     		movs	r2, #0
 913 0412 0421     		movs	r1, #4
 914 0414 9847     		blx	r3
 915              	.LVL2:
 916 0416 16E0     		b	.L34
 917              	.L35:
 207:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			case 4: s->set_speed(s,-4,0); break;
 918              		.loc 1 207 0
 919 0418 7B69     		ldr	r3, [r7, #20]
 920 041a 1B6A     		ldr	r3, [r3, #32]
 921 041c 0422     		movs	r2, #4
 922 041e 5142     		rsbs	r1, r2, #0
 923 0420 7869     		ldr	r0, [r7, #20]
 924 0422 0022     		movs	r2, #0
 925 0424 9847     		blx	r3
 926              	.LVL3:
 927 0426 0EE0     		b	.L34
 928              	.L37:
 208:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			case 2: s->set_speed(s,0,-4); break;
 929              		.loc 1 208 0
 930 0428 7B69     		ldr	r3, [r7, #20]
 931 042a 1B6A     		ldr	r3, [r3, #32]
 932 042c 0422     		movs	r2, #4
 933 042e 5242     		rsbs	r2, r2, #0
 934 0430 7869     		ldr	r0, [r7, #20]
 935 0432 0021     		movs	r1, #0
 936 0434 9847     		blx	r3
 937              	.LVL4:
 938 0436 06E0     		b	.L34
 939              	.L39:
 209:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			case 8: s->set_speed(s,0,4); break;
 940              		.loc 1 209 0
 941 0438 7B69     		ldr	r3, [r7, #20]
 942 043a 1B6A     		ldr	r3, [r3, #32]
 943 043c 7869     		ldr	r0, [r7, #20]
 944 043e 0422     		movs	r2, #4
 945 0440 0021     		movs	r1, #0
 946 0442 9847     		blx	r3
 947              	.LVL5:
 948 0444 C046     		nop
 949              	.L34:
 950              	.LBE3:
 180:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		s->move(s);
 951              		.loc 1 180 0
 952 0446 7DE7     		b	.L40
 953              	.L42:
 954              		.align	2
 955              	.L41:
 956 0448 70000000 		.word	snake
 957 044c 00000000 		.word	p2
 958 0450 98000000 		.word	apple
 959 0454 00000000 		.word	pSnakeVec
 960 0458 00000000 		.word	snakeLength
 961              		.cfi_endproc
 962              	.LFE7:
 964              	.Letext0:
 965              		.file 2 "./gpio.h"
 966              		.file 3 "./structs.h"
