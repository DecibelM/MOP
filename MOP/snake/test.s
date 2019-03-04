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
  47              		.text
  48              		.align	1
  49              		.global	set_object_speed
  50              		.syntax unified
  51              		.code	16
  52              		.thumb_func
  53              		.fpu softvfp
  55              	set_object_speed:
  56              	.LFB1:
  23:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
  24:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** void set_object_speed(POBJECT o, int speedx, int speedy){
  57              		.loc 1 24 0
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
  69 0006 F860     		str	r0, [r7, #12]
  70 0008 B960     		str	r1, [r7, #8]
  71 000a 7A60     		str	r2, [r7, #4]
  25:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	o->dirx = speedx;
  72              		.loc 1 25 0
  73 000c FB68     		ldr	r3, [r7, #12]
  74 000e BA68     		ldr	r2, [r7, #8]
  75 0010 5A60     		str	r2, [r3, #4]
  26:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	o->diry = speedy;
  76              		.loc 1 26 0
  77 0012 FB68     		ldr	r3, [r7, #12]
  78 0014 7A68     		ldr	r2, [r7, #4]
  79 0016 9A60     		str	r2, [r3, #8]
  27:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	/*
  28:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	if(o->dirx == -speedx | o->diry == -speedy)
  29:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	{
  30:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	
  31:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	}else{
  32:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		
  33:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	}
  34:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	 */
  35:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** }
  80              		.loc 1 35 0
  81 0018 C046     		nop
  82 001a BD46     		mov	sp, r7
  83 001c 04B0     		add	sp, sp, #16
  84              		@ sp needed
  85 001e 80BD     		pop	{r7, pc}
  86              		.cfi_endproc
  87              	.LFE1:
  89              		.align	1
  90              		.global	move_object
  91              		.syntax unified
  92              		.code	16
  93              		.thumb_func
  94              		.fpu softvfp
  96              	move_object:
  97              	.LFB2:
  36:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
  37:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** void move_object(POBJECT o){
  98              		.loc 1 37 0
  99              		.cfi_startproc
 100              		@ args = 0, pretend = 0, frame = 8
 101              		@ frame_needed = 1, uses_anonymous_args = 0
 102 0020 80B5     		push	{r7, lr}
 103              		.cfi_def_cfa_offset 8
 104              		.cfi_offset 7, -8
 105              		.cfi_offset 14, -4
 106 0022 82B0     		sub	sp, sp, #8
 107              		.cfi_def_cfa_offset 16
 108 0024 00AF     		add	r7, sp, #0
 109              		.cfi_def_cfa_register 7
 110 0026 7860     		str	r0, [r7, #4]
  38:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	clear_object(o);
 111              		.loc 1 38 0
 112 0028 7B68     		ldr	r3, [r7, #4]
 113 002a 1800     		movs	r0, r3
 114 002c FFF7FEFF 		bl	clear_object
  39:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	o->posx += o->dirx;
 115              		.loc 1 39 0
 116 0030 7B68     		ldr	r3, [r7, #4]
 117 0032 DA68     		ldr	r2, [r3, #12]
 118 0034 7B68     		ldr	r3, [r7, #4]
 119 0036 5B68     		ldr	r3, [r3, #4]
 120 0038 D218     		adds	r2, r2, r3
 121 003a 7B68     		ldr	r3, [r7, #4]
 122 003c DA60     		str	r2, [r3, #12]
  40:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	o->posy += o->diry;
 123              		.loc 1 40 0
 124 003e 7B68     		ldr	r3, [r7, #4]
 125 0040 1A69     		ldr	r2, [r3, #16]
 126 0042 7B68     		ldr	r3, [r7, #4]
 127 0044 9B68     		ldr	r3, [r3, #8]
 128 0046 D218     		adds	r2, r2, r3
 129 0048 7B68     		ldr	r3, [r7, #4]
 130 004a 1A61     		str	r2, [r3, #16]
  41:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	
  42:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	if(o->posx <= 1){
 131              		.loc 1 42 0
 132 004c 7B68     		ldr	r3, [r7, #4]
 133 004e DB68     		ldr	r3, [r3, #12]
 134 0050 012B     		cmp	r3, #1
 135 0052 06DC     		bgt	.L4
  43:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		o->posx = 128 - o->geo->sizex;
 136              		.loc 1 43 0
 137 0054 7B68     		ldr	r3, [r7, #4]
 138 0056 1B68     		ldr	r3, [r3]
 139 0058 5B68     		ldr	r3, [r3, #4]
 140 005a 8022     		movs	r2, #128
 141 005c D21A     		subs	r2, r2, r3
 142 005e 7B68     		ldr	r3, [r7, #4]
 143 0060 DA60     		str	r2, [r3, #12]
 144              	.L4:
  44:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	}
  45:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	if(o->posx > 128 - o->geo->sizex){
 145              		.loc 1 45 0
 146 0062 7B68     		ldr	r3, [r7, #4]
 147 0064 DA68     		ldr	r2, [r3, #12]
 148 0066 7B68     		ldr	r3, [r7, #4]
 149 0068 1B68     		ldr	r3, [r3]
 150 006a 5B68     		ldr	r3, [r3, #4]
 151 006c 8021     		movs	r1, #128
 152 006e CB1A     		subs	r3, r1, r3
 153 0070 9A42     		cmp	r2, r3
 154 0072 02DD     		ble	.L5
  46:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		o->posx = 1;
 155              		.loc 1 46 0
 156 0074 7B68     		ldr	r3, [r7, #4]
 157 0076 0122     		movs	r2, #1
 158 0078 DA60     		str	r2, [r3, #12]
 159              	.L5:
  47:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	}
  48:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	if(o->posy <= 1){
 160              		.loc 1 48 0
 161 007a 7B68     		ldr	r3, [r7, #4]
 162 007c 1B69     		ldr	r3, [r3, #16]
 163 007e 012B     		cmp	r3, #1
 164 0080 06DC     		bgt	.L6
  49:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		o->posy = 64 - o->geo->sizey;
 165              		.loc 1 49 0
 166 0082 7B68     		ldr	r3, [r7, #4]
 167 0084 1B68     		ldr	r3, [r3]
 168 0086 9B68     		ldr	r3, [r3, #8]
 169 0088 4022     		movs	r2, #64
 170 008a D21A     		subs	r2, r2, r3
 171 008c 7B68     		ldr	r3, [r7, #4]
 172 008e 1A61     		str	r2, [r3, #16]
 173              	.L6:
  50:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	}
  51:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	if(o->posy > 64 - o->geo->sizey){
 174              		.loc 1 51 0
 175 0090 7B68     		ldr	r3, [r7, #4]
 176 0092 1A69     		ldr	r2, [r3, #16]
 177 0094 7B68     		ldr	r3, [r7, #4]
 178 0096 1B68     		ldr	r3, [r3]
 179 0098 9B68     		ldr	r3, [r3, #8]
 180 009a 4021     		movs	r1, #64
 181 009c CB1A     		subs	r3, r1, r3
 182 009e 9A42     		cmp	r2, r3
 183 00a0 02DD     		ble	.L7
  52:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		o->posy = 1 ;
 184              		.loc 1 52 0
 185 00a2 7B68     		ldr	r3, [r7, #4]
 186 00a4 0122     		movs	r2, #1
 187 00a6 1A61     		str	r2, [r3, #16]
 188              	.L7:
  53:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	}
  54:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	draw_object(o);
 189              		.loc 1 54 0
 190 00a8 7B68     		ldr	r3, [r7, #4]
 191 00aa 1800     		movs	r0, r3
 192 00ac FFF7FEFF 		bl	draw_object
  55:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** }
 193              		.loc 1 55 0
 194 00b0 C046     		nop
 195 00b2 BD46     		mov	sp, r7
 196 00b4 02B0     		add	sp, sp, #8
 197              		@ sp needed
 198 00b6 80BD     		pop	{r7, pc}
 199              		.cfi_endproc
 200              	.LFE2:
 202              		.global	ball_geometry
 203              		.data
 204              		.align	2
 207              	ball_geometry:
 208 0000 0C000000 		.word	12
 209 0004 04000000 		.word	4
 210 0008 04000000 		.word	4
 211 000c 00       		.byte	0
 212 000d 01       		.byte	1
 213 000e 00       		.byte	0
 214 000f 02       		.byte	2
 215 0010 01       		.byte	1
 216 0011 00       		.byte	0
 217 0012 01       		.byte	1
 218 0013 01       		.byte	1
 219 0014 01       		.byte	1
 220 0015 02       		.byte	2
 221 0016 01       		.byte	1
 222 0017 03       		.byte	3
 223 0018 02       		.byte	2
 224 0019 00       		.byte	0
 225 001a 02       		.byte	2
 226 001b 01       		.byte	1
 227 001c 02       		.byte	2
 228 001d 02       		.byte	2
 229 001e 02       		.byte	2
 230 001f 03       		.byte	3
 231 0020 03       		.byte	3
 232 0021 01       		.byte	1
 233 0022 03       		.byte	3
 234 0023 02       		.byte	2
 235 0024 00000000 		.space	16
 235      00000000 
 235      00000000 
 235      00000000 
 236              		.align	2
 239              	ball:
 240 0034 00000000 		.word	ball_geometry
 241 0038 00000000 		.word	0
 242 003c 00000000 		.word	0
 243 0040 02000000 		.word	2
 244 0044 02000000 		.word	2
 245 0048 00000000 		.word	draw_object
 246 004c 00000000 		.word	clear_object
 247 0050 00000000 		.word	move_object
 248 0054 00000000 		.word	set_object_speed
 249              		.align	2
 252              	apple:
 253 0058 00000000 		.word	ball_geometry
 254 005c 00000000 		.word	0
 255 0060 00000000 		.word	0
 256 0064 07000000 		.word	7
 257 0068 07000000 		.word	7
 258 006c 00000000 		.word	draw_object
 259 0070 00000000 		.word	clear_object
 260 0074 00000000 		.word	move_object
 261 0078 00000000 		.word	set_object_speed
 262              		.text
 263              		.align	1
 264              		.global	init_app
 265              		.syntax unified
 266              		.code	16
 267              		.thumb_func
 268              		.fpu softvfp
 270              	init_app:
 271              	.LFB3:
  56:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
  57:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	GEOMETRY ball_geometry =
  58:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** {
  59:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	12,4,4,{{0,1},{0,2},{1,0},{1,1},{1,2},{1,3},{2,0},{2,1},{2,2},{2,3},{3,1},{3,2}}
  60:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** };
  61:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
  62:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** static OBJECT ball=
  63:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** {&ball_geometry,
  64:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 0,0,
  65:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 2,2,
  66:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** draw_object,
  67:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** clear_object,
  68:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** move_object,
  69:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** set_object_speed};
  70:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
  71:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** static OBJECT apple=
  72:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** {&ball_geometry,
  73:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 0,0,
  74:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 7,7,
  75:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** draw_object,
  76:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** clear_object,
  77:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** move_object,
  78:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** set_object_speed};
  79:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
  80:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
  81:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** void init_app(void)
  82:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** {
 272              		.loc 1 82 0
 273              		.cfi_startproc
 274              		@ args = 0, pretend = 0, frame = 0
 275              		@ frame_needed = 1, uses_anonymous_args = 0
 276 00b8 80B5     		push	{r7, lr}
 277              		.cfi_def_cfa_offset 8
 278              		.cfi_offset 7, -8
 279              		.cfi_offset 14, -4
 280 00ba 00AF     		add	r7, sp, #0
 281              		.cfi_def_cfa_register 7
  83:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	#ifdef USBDM
  84:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	*((unsigned long*) 0x40023830) = 0x18;
  85:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	__asm volatile("LDR R0,=0x08000209\n BLX R0\n");
  86:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	#endif
  87:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	
  88:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	GPIO_D.moder= 0x55005555;
 282              		.loc 1 88 0
 283 00bc 084B     		ldr	r3, .L9
 284 00be 094A     		ldr	r2, .L9+4
 285 00c0 1A60     		str	r2, [r3]
  89:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	GPIO_D.otyper = 0x0100;
 286              		.loc 1 89 0
 287 00c2 074B     		ldr	r3, .L9
 288 00c4 8022     		movs	r2, #128
 289 00c6 5200     		lsls	r2, r2, #1
 290 00c8 9A80     		strh	r2, [r3, #4]
  90:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	GPIO_D.pupdr = 0x00AA0000;
 291              		.loc 1 90 0
 292 00ca 054B     		ldr	r3, .L9
 293 00cc AA22     		movs	r2, #170
 294 00ce 1204     		lsls	r2, r2, #16
 295 00d0 DA60     		str	r2, [r3, #12]
  91:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c ****  
  92:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	GPIO_E.moder = 0x55555555;
 296              		.loc 1 92 0
 297 00d2 054B     		ldr	r3, .L9+8
 298 00d4 054A     		ldr	r2, .L9+12
 299 00d6 1A60     		str	r2, [r3]
  93:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	
  94:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** }
 300              		.loc 1 94 0
 301 00d8 C046     		nop
 302 00da BD46     		mov	sp, r7
 303              		@ sp needed
 304 00dc 80BD     		pop	{r7, pc}
 305              	.L10:
 306 00de C046     		.align	2
 307              	.L9:
 308 00e0 000C0240 		.word	1073875968
 309 00e4 55550055 		.word	1426085205
 310 00e8 00100240 		.word	1073876992
 311 00ec 55555555 		.word	1431655765
 312              		.cfi_endproc
 313              	.LFE3:
 315              		.global	points
 316              		.bss
 317              		.align	2
 320              	points:
 321 0000 00000000 		.space	4
 322              		.comm	s,4,4
 323              		.global	string
 324              		.data
 325              		.align	2
 328              	string:
 329 007c 506F696E 		.ascii	"Points\000"
 329      747300
 330              		.section	.rodata
 331              		.align	2
 332              	.LC1:
 333 0000 506F696E 		.ascii	"Points:\000"
 333      74733A00 
 334              		.text
 335              		.align	1
 336              		.global	collision
 337              		.syntax unified
 338              		.code	16
 339              		.thumb_func
 340              		.fpu softvfp
 342              	collision:
 343              	.LFB4:
  95:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
  96:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** int points =0;
  97:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** char *s;
  98:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** char string[] = "Points";
  99:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
 100:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** void collision(POBJECT p, POBJECT a)
 101:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** {
 344              		.loc 1 101 0
 345              		.cfi_startproc
 346              		@ args = 0, pretend = 0, frame = 24
 347              		@ frame_needed = 1, uses_anonymous_args = 0
 348 00f0 90B5     		push	{r4, r7, lr}
 349              		.cfi_def_cfa_offset 12
 350              		.cfi_offset 4, -12
 351              		.cfi_offset 7, -8
 352              		.cfi_offset 14, -4
 353 00f2 87B0     		sub	sp, sp, #28
 354              		.cfi_def_cfa_offset 40
 355 00f4 00AF     		add	r7, sp, #0
 356              		.cfi_def_cfa_register 7
 357 00f6 7860     		str	r0, [r7, #4]
 358 00f8 3960     		str	r1, [r7]
 102:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	if(p->posx +4 >= a->posx & p->posx <= a->posx + 4)
 359              		.loc 1 102 0
 360 00fa 7B68     		ldr	r3, [r7, #4]
 361 00fc DB68     		ldr	r3, [r3, #12]
 362 00fe 1A1D     		adds	r2, r3, #4
 363 0100 3B68     		ldr	r3, [r7]
 364 0102 DB68     		ldr	r3, [r3, #12]
 365 0104 D017     		asrs	r0, r2, #31
 366 0106 D90F     		lsrs	r1, r3, #31
 367 0108 9A42     		cmp	r2, r3
 368 010a 4841     		adcs	r0, r0, r1
 369 010c 0300     		movs	r3, r0
 370 010e D9B2     		uxtb	r1, r3
 371 0110 7B68     		ldr	r3, [r7, #4]
 372 0112 DB68     		ldr	r3, [r3, #12]
 373 0114 3A68     		ldr	r2, [r7]
 374 0116 D268     		ldr	r2, [r2, #12]
 375 0118 0432     		adds	r2, r2, #4
 376 011a DC0F     		lsrs	r4, r3, #31
 377 011c D017     		asrs	r0, r2, #31
 378 011e 9A42     		cmp	r2, r3
 379 0120 4441     		adcs	r4, r4, r0
 380 0122 2300     		movs	r3, r4
 381 0124 DBB2     		uxtb	r3, r3
 382 0126 0B40     		ands	r3, r1
 383 0128 DBB2     		uxtb	r3, r3
 384 012a 002B     		cmp	r3, #0
 385 012c 53D0     		beq	.L15
 103:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	{
 104:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		if(p->posy +4 >= a->posy & p->posy <= a->posy + 4)
 386              		.loc 1 104 0
 387 012e 7B68     		ldr	r3, [r7, #4]
 388 0130 1B69     		ldr	r3, [r3, #16]
 389 0132 1A1D     		adds	r2, r3, #4
 390 0134 3B68     		ldr	r3, [r7]
 391 0136 1B69     		ldr	r3, [r3, #16]
 392 0138 D017     		asrs	r0, r2, #31
 393 013a D90F     		lsrs	r1, r3, #31
 394 013c 9A42     		cmp	r2, r3
 395 013e 4841     		adcs	r0, r0, r1
 396 0140 0300     		movs	r3, r0
 397 0142 D9B2     		uxtb	r1, r3
 398 0144 7B68     		ldr	r3, [r7, #4]
 399 0146 1B69     		ldr	r3, [r3, #16]
 400 0148 3A68     		ldr	r2, [r7]
 401 014a 1269     		ldr	r2, [r2, #16]
 402 014c 0432     		adds	r2, r2, #4
 403 014e DC0F     		lsrs	r4, r3, #31
 404 0150 D017     		asrs	r0, r2, #31
 405 0152 9A42     		cmp	r2, r3
 406 0154 4441     		adcs	r4, r4, r0
 407 0156 2300     		movs	r3, r4
 408 0158 DBB2     		uxtb	r3, r3
 409 015a 0B40     		ands	r3, r1
 410 015c DBB2     		uxtb	r3, r3
 411 015e 002B     		cmp	r3, #0
 412 0160 39D0     		beq	.L15
 413              	.LBB2:
 105:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		{
 106:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			clear_object(a);
 414              		.loc 1 106 0
 415 0162 3B68     		ldr	r3, [r7]
 416 0164 1800     		movs	r0, r3
 417 0166 FFF7FEFF 		bl	clear_object
 107:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			points++;
 418              		.loc 1 107 0
 419 016a 1D4B     		ldr	r3, .L16
 420 016c 1B68     		ldr	r3, [r3]
 421 016e 5A1C     		adds	r2, r3, #1
 422 0170 1B4B     		ldr	r3, .L16
 423 0172 1A60     		str	r2, [r3]
 108:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			
 109:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			char string[] = "Points:";
 424              		.loc 1 109 0
 425 0174 0C21     		movs	r1, #12
 426 0176 7B18     		adds	r3, r7, r1
 427 0178 1A4A     		ldr	r2, .L16+4
 428 017a 11CA     		ldmia	r2!, {r0, r4}
 429 017c 11C3     		stmia	r3!, {r0, r4}
 110:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			s = string;
 430              		.loc 1 110 0
 431 017e 1A4B     		ldr	r3, .L16+8
 432 0180 7A18     		adds	r2, r7, r1
 433 0182 1A60     		str	r2, [r3]
 111:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			ascii_gotoxy(1,1);
 434              		.loc 1 111 0
 435 0184 0121     		movs	r1, #1
 436 0186 0120     		movs	r0, #1
 437 0188 FFF7FEFF 		bl	ascii_gotoxy
 112:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			while(*s)
 438              		.loc 1 112 0
 439 018c 08E0     		b	.L13
 440              	.L14:
 113:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			{
 114:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			ascii_write_char(*s++);
 441              		.loc 1 114 0
 442 018e 164B     		ldr	r3, .L16+8
 443 0190 1B68     		ldr	r3, [r3]
 444 0192 591C     		adds	r1, r3, #1
 445 0194 144A     		ldr	r2, .L16+8
 446 0196 1160     		str	r1, [r2]
 447 0198 1B78     		ldrb	r3, [r3]
 448 019a 1800     		movs	r0, r3
 449 019c FFF7FEFF 		bl	ascii_write_char
 450              	.L13:
 112:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			while(*s)
 451              		.loc 1 112 0
 452 01a0 114B     		ldr	r3, .L16+8
 453 01a2 1B68     		ldr	r3, [r3]
 454 01a4 1B78     		ldrb	r3, [r3]
 455 01a6 002B     		cmp	r3, #0
 456 01a8 F1D1     		bne	.L14
 115:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			}
 116:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			char pts = points + '0';
 457              		.loc 1 116 0
 458 01aa 0D4B     		ldr	r3, .L16
 459 01ac 1B68     		ldr	r3, [r3]
 460 01ae DAB2     		uxtb	r2, r3
 461 01b0 1721     		movs	r1, #23
 462 01b2 7B18     		adds	r3, r7, r1
 463 01b4 3032     		adds	r2, r2, #48
 464 01b6 1A70     		strb	r2, [r3]
 117:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			ascii_write_char(pts);
 465              		.loc 1 117 0
 466 01b8 7B18     		adds	r3, r7, r1
 467 01ba 1B78     		ldrb	r3, [r3]
 468 01bc 1800     		movs	r0, r3
 469 01be FFF7FEFF 		bl	ascii_write_char
 118:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			
 119:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			a->posx = a->posx + 5;
 470              		.loc 1 119 0
 471 01c2 3B68     		ldr	r3, [r7]
 472 01c4 DB68     		ldr	r3, [r3, #12]
 473 01c6 5A1D     		adds	r2, r3, #5
 474 01c8 3B68     		ldr	r3, [r7]
 475 01ca DA60     		str	r2, [r3, #12]
 120:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			a->posy = a->posy + 5;
 476              		.loc 1 120 0
 477 01cc 3B68     		ldr	r3, [r7]
 478 01ce 1B69     		ldr	r3, [r3, #16]
 479 01d0 5A1D     		adds	r2, r3, #5
 480 01d2 3B68     		ldr	r3, [r7]
 481 01d4 1A61     		str	r2, [r3, #16]
 482              	.L15:
 483              	.LBE2:
 121:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		}
 122:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	}
 123:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** }
 484              		.loc 1 123 0
 485 01d6 C046     		nop
 486 01d8 BD46     		mov	sp, r7
 487 01da 07B0     		add	sp, sp, #28
 488              		@ sp needed
 489 01dc 90BD     		pop	{r4, r7, pc}
 490              	.L17:
 491 01de C046     		.align	2
 492              	.L16:
 493 01e0 00000000 		.word	points
 494 01e4 00000000 		.word	.LC1
 495 01e8 00000000 		.word	s
 496              		.cfi_endproc
 497              	.LFE4:
 499              		.align	1
 500              		.global	main
 501              		.syntax unified
 502              		.code	16
 503              		.thumb_func
 504              		.fpu softvfp
 506              	main:
 507              	.LFB5:
 124:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 
 125:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** void main(void)
 126:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** {
 508              		.loc 1 126 0
 509              		.cfi_startproc
 510              		@ args = 0, pretend = 0, frame = 16
 511              		@ frame_needed = 1, uses_anonymous_args = 0
 512 01ec 80B5     		push	{r7, lr}
 513              		.cfi_def_cfa_offset 8
 514              		.cfi_offset 7, -8
 515              		.cfi_offset 14, -4
 516 01ee 84B0     		sub	sp, sp, #16
 517              		.cfi_def_cfa_offset 24
 518 01f0 00AF     		add	r7, sp, #0
 519              		.cfi_def_cfa_register 7
 127:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	char c;
 128:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	
 129:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	POBJECT p = &ball;
 520              		.loc 1 129 0
 521 01f2 284B     		ldr	r3, .L26
 522 01f4 FB60     		str	r3, [r7, #12]
 130:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	POBJECT a = &apple;
 523              		.loc 1 130 0
 524 01f6 284B     		ldr	r3, .L26+4
 525 01f8 BB60     		str	r3, [r7, #8]
 131:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	init_app();
 526              		.loc 1 131 0
 527 01fa FFF7FEFF 		bl	init_app
 132:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	graphic_initialize();
 528              		.loc 1 132 0
 529 01fe FFF7FEFF 		bl	graphic_initialize
 133:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	ascii_init();
 530              		.loc 1 133 0
 531 0202 FFF7FEFF 		bl	ascii_init
 134:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	ascii_gotoxy(1,1);
 532              		.loc 1 134 0
 533 0206 0121     		movs	r1, #1
 534 0208 0120     		movs	r0, #1
 535 020a FFF7FEFF 		bl	ascii_gotoxy
 536              	.L25:
 537              	.LBB3:
 135:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	
 136:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	#ifndef SIMULATOR
 137:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		graphic_clear_screen();
 138:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	#endif
 139:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	
 140:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	while(1)
 141:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 	{
 142:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		p->move(p);
 538              		.loc 1 142 0
 539 020e FB68     		ldr	r3, [r7, #12]
 540 0210 DB69     		ldr	r3, [r3, #28]
 541 0212 FA68     		ldr	r2, [r7, #12]
 542 0214 1000     		movs	r0, r2
 543 0216 9847     		blx	r3
 544              	.LVL0:
 143:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		draw_object(a);
 545              		.loc 1 143 0
 546 0218 BB68     		ldr	r3, [r7, #8]
 547 021a 1800     		movs	r0, r3
 548 021c FFF7FEFF 		bl	draw_object
 144:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		
 145:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		collision(p,a);
 549              		.loc 1 145 0
 550 0220 BA68     		ldr	r2, [r7, #8]
 551 0222 FB68     		ldr	r3, [r7, #12]
 552 0224 1100     		movs	r1, r2
 553 0226 1800     		movs	r0, r3
 554 0228 FFF7FEFF 		bl	collision
 146:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		
 147:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		delay_milli(40);
 555              		.loc 1 147 0
 556 022c 2820     		movs	r0, #40
 557 022e FFF7FEFF 		bl	delay_milli
 148:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		c = keyb();
 558              		.loc 1 148 0
 559 0232 FFF7FEFF 		bl	keyb
 560 0236 0200     		movs	r2, r0
 561 0238 FB1D     		adds	r3, r7, #7
 562 023a 1A70     		strb	r2, [r3]
 149:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		switch(c)
 563              		.loc 1 149 0
 564 023c FB1D     		adds	r3, r7, #7
 565 023e 1B78     		ldrb	r3, [r3]
 566 0240 042B     		cmp	r3, #4
 567 0242 0FD0     		beq	.L20
 568 0244 02DC     		bgt	.L21
 569 0246 022B     		cmp	r3, #2
 570 0248 14D0     		beq	.L22
 571 024a 22E0     		b	.L19
 572              	.L21:
 573 024c 062B     		cmp	r3, #6
 574 024e 02D0     		beq	.L23
 575 0250 082B     		cmp	r3, #8
 576 0252 17D0     		beq	.L24
 577 0254 1DE0     		b	.L19
 578              	.L23:
 150:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		{
 151:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			case 6: p->set_speed(p,2,0); break;
 579              		.loc 1 151 0
 580 0256 FB68     		ldr	r3, [r7, #12]
 581 0258 1B6A     		ldr	r3, [r3, #32]
 582 025a F868     		ldr	r0, [r7, #12]
 583 025c 0022     		movs	r2, #0
 584 025e 0221     		movs	r1, #2
 585 0260 9847     		blx	r3
 586              	.LVL1:
 587 0262 16E0     		b	.L19
 588              	.L20:
 152:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			case 4: p->set_speed(p,-2,0); break;
 589              		.loc 1 152 0
 590 0264 FB68     		ldr	r3, [r7, #12]
 591 0266 1B6A     		ldr	r3, [r3, #32]
 592 0268 0222     		movs	r2, #2
 593 026a 5142     		rsbs	r1, r2, #0
 594 026c F868     		ldr	r0, [r7, #12]
 595 026e 0022     		movs	r2, #0
 596 0270 9847     		blx	r3
 597              	.LVL2:
 598 0272 0EE0     		b	.L19
 599              	.L22:
 153:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			case 2: p->set_speed(p,0,-2); break;
 600              		.loc 1 153 0
 601 0274 FB68     		ldr	r3, [r7, #12]
 602 0276 1B6A     		ldr	r3, [r3, #32]
 603 0278 0222     		movs	r2, #2
 604 027a 5242     		rsbs	r2, r2, #0
 605 027c F868     		ldr	r0, [r7, #12]
 606 027e 0021     		movs	r1, #0
 607 0280 9847     		blx	r3
 608              	.LVL3:
 609 0282 06E0     		b	.L19
 610              	.L24:
 154:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 			case 8: p->set_speed(p,0,2); break;
 611              		.loc 1 154 0
 612 0284 FB68     		ldr	r3, [r7, #12]
 613 0286 1B6A     		ldr	r3, [r3, #32]
 614 0288 F868     		ldr	r0, [r7, #12]
 615 028a 0222     		movs	r2, #2
 616 028c 0021     		movs	r1, #0
 617 028e 9847     		blx	r3
 618              	.LVL4:
 619 0290 C046     		nop
 620              	.L19:
 621              	.LBE3:
 141:C:/Users/Maria/Documents/IT/MOP/MOP/snake\startup.c **** 		p->move(p);
 622              		.loc 1 141 0
 623 0292 BCE7     		b	.L25
 624              	.L27:
 625              		.align	2
 626              	.L26:
 627 0294 34000000 		.word	ball
 628 0298 58000000 		.word	apple
 629              		.cfi_endproc
 630              	.LFE5:
 632              	.Letext0:
 633              		.file 2 "./gpio.h"
 634              		.file 3 "./structs.h"
