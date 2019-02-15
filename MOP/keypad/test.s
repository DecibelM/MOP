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
  25              		.file 1 "C:/Users/Maria/Documents/IT/MOP/MOP/keypad/startup.c"
   1:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c **** /*
   2:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****  *  startup.c
   3:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****  *
   4:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****  */
   5:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   6:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c **** #define GPIO_D 0x40020C00 
   7:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c **** #define GPIO_MODER ((volatile unsigned int *) (GPIO_D))  
   8:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c **** #define GPIO_OTYPER ((volatile unsigned short *) (GPIO_D+0x4))  
   9:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c **** #define GPIO_PUPDR ((volatile unsigned int *) (GPIO_D+0xC)) 
  10:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c **** #define GPIO_IDR_LOW ((volatile unsigned char *) (GPIO_D+0x10))  
  11:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c **** #define GPIO_IDR_HIGH ((volatile unsigned char *) (GPIO_D+0x11))  
  12:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c **** #define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_D+0x14))  
  13:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c **** #define GPIO_ODR_HIGH ((volatile unsigned char *) (GPIO_D+0x15)) 
  14:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c **** void startup ( void )
  15:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c **** {
  26              		.loc 1 15 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  16:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c **** __asm volatile(
  31              		.loc 1 16 0
  32              		.syntax divided
  33              	@ 16 "C:/Users/Maria/Documents/IT/MOP/MOP/keypad/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  17:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****  " LDR R0,=0x2001C000\n"  /* set stack */
  18:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****  " MOV SP,R0\n"
  19:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****  " BL main\n"    /* call main */
  20:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****  "_exit: B .\n"    /* never return */
  21:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****  ) ;
  22:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c **** }
  40              		.loc 1 22 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.text
  48              		.align	1
  49              		.global	app_init
  50              		.syntax unified
  51              		.code	16
  52              		.thumb_func
  53              		.fpu softvfp
  55              	app_init:
  56              	.LFB1:
  23:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c **** 
  24:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c **** 
  25:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c **** void app_init(void)
  26:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c **** {
  57              		.loc 1 26 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  27:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****  * ( (unsigned int *) GPIO_MODER )= 0x55005555;
  67              		.loc 1 27 0
  68 0004 064B     		ldr	r3, .L3
  69 0006 074A     		ldr	r2, .L3+4
  70 0008 1A60     		str	r2, [r3]
  28:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****  * ( (unsigned short *) GPIO_OTYPER) = 0x0100;
  71              		.loc 1 28 0
  72 000a 074B     		ldr	r3, .L3+8
  73 000c 8022     		movs	r2, #128
  74 000e 5200     		lsls	r2, r2, #1
  75 0010 1A80     		strh	r2, [r3]
  29:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****  * ( (unsigned int *) GPIO_PUPDR) = 0x00AA0000;
  76              		.loc 1 29 0
  77 0012 064B     		ldr	r3, .L3+12
  78 0014 AA22     		movs	r2, #170
  79 0016 1204     		lsls	r2, r2, #16
  80 0018 1A60     		str	r2, [r3]
  30:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c **** }
  81              		.loc 1 30 0
  82 001a C046     		nop
  83 001c BD46     		mov	sp, r7
  84              		@ sp needed
  85 001e 80BD     		pop	{r7, pc}
  86              	.L4:
  87              		.align	2
  88              	.L3:
  89 0020 000C0240 		.word	1073875968
  90 0024 55550055 		.word	1426085205
  91 0028 040C0240 		.word	1073875972
  92 002c 0C0C0240 		.word	1073875980
  93              		.cfi_endproc
  94              	.LFE1:
  96              		.section	.rodata
  97              		.align	2
  98              	.LC0:
  99 0000 01       		.byte	1
 100 0001 02       		.byte	2
 101 0002 03       		.byte	3
 102 0003 0A       		.byte	10
 103 0004 04       		.byte	4
 104 0005 05       		.byte	5
 105 0006 06       		.byte	6
 106 0007 0B       		.byte	11
 107 0008 07       		.byte	7
 108 0009 08       		.byte	8
 109 000a 09       		.byte	9
 110 000b 0C       		.byte	12
 111 000c 0E       		.byte	14
 112 000d 00       		.byte	0
 113 000e 0F       		.byte	15
 114 000f 0D       		.byte	13
 115              		.text
 116              		.align	1
 117              		.global	keyb
 118              		.syntax unified
 119              		.code	16
 120              		.thumb_func
 121              		.fpu softvfp
 123              	keyb:
 124              	.LFB2:
  31:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c **** 
  32:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c **** unsigned char keyb(void) 
  33:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c **** { 
 125              		.loc 1 33 0
 126              		.cfi_startproc
 127              		@ args = 0, pretend = 0, frame = 24
 128              		@ frame_needed = 1, uses_anonymous_args = 0
 129 0030 90B5     		push	{r4, r7, lr}
 130              		.cfi_def_cfa_offset 12
 131              		.cfi_offset 4, -12
 132              		.cfi_offset 7, -8
 133              		.cfi_offset 14, -4
 134 0032 87B0     		sub	sp, sp, #28
 135              		.cfi_def_cfa_offset 40
 136 0034 00AF     		add	r7, sp, #0
 137              		.cfi_def_cfa_register 7
  34:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****  unsigned char key[]={1,2,3,0xA,4,5,6,0xB,7,8,9,0xC,0xE,0,0xF,0xD}; 
 138              		.loc 1 34 0
 139 0036 3B00     		movs	r3, r7
 140 0038 164A     		ldr	r2, .L11
 141 003a 13CA     		ldmia	r2!, {r0, r1, r4}
 142 003c 13C3     		stmia	r3!, {r0, r1, r4}
 143 003e 1268     		ldr	r2, [r2]
 144 0040 1A60     		str	r2, [r3]
  35:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****  int row, col; 
  36:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****  for (row=1; row <=4 ; row++ ) { 
 145              		.loc 1 36 0
 146 0042 0123     		movs	r3, #1
 147 0044 7B61     		str	r3, [r7, #20]
 148 0046 19E0     		b	.L6
 149              	.L9:
 150              	.LBB2:
  37:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****   kbdActivate(row); 
 151              		.loc 1 37 0
 152 0048 7B69     		ldr	r3, [r7, #20]
 153 004a 1800     		movs	r0, r3
 154 004c FFF7FEFF 		bl	kbdActivate
  38:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****   col = kbdGetCol();
 155              		.loc 1 38 0
 156 0050 FFF7FEFF 		bl	kbdGetCol
 157 0054 0300     		movs	r3, r0
 158 0056 3B61     		str	r3, [r7, #16]
  39:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****   if( col != 0 ) { 
 159              		.loc 1 39 0
 160 0058 3B69     		ldr	r3, [r7, #16]
 161 005a 002B     		cmp	r3, #0
 162 005c 0BD0     		beq	.L7
  40:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****    kbdActivate( 0 ); 
 163              		.loc 1 40 0
 164 005e 0020     		movs	r0, #0
 165 0060 FFF7FEFF 		bl	kbdActivate
  41:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****    return key [4*(row-1)+(col-1) ]; 
 166              		.loc 1 41 0
 167 0064 7B69     		ldr	r3, [r7, #20]
 168 0066 013B     		subs	r3, r3, #1
 169 0068 9A00     		lsls	r2, r3, #2
 170 006a 3B69     		ldr	r3, [r7, #16]
 171 006c 013B     		subs	r3, r3, #1
 172 006e D318     		adds	r3, r2, r3
 173 0070 3A00     		movs	r2, r7
 174 0072 D35C     		ldrb	r3, [r2, r3]
 175 0074 09E0     		b	.L10
 176              	.L7:
 177              	.LBE2:
  36:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****   kbdActivate(row); 
 178              		.loc 1 36 0 discriminator 2
 179 0076 7B69     		ldr	r3, [r7, #20]
 180 0078 0133     		adds	r3, r3, #1
 181 007a 7B61     		str	r3, [r7, #20]
 182              	.L6:
  36:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****   kbdActivate(row); 
 183              		.loc 1 36 0 is_stmt 0 discriminator 1
 184 007c 7B69     		ldr	r3, [r7, #20]
 185 007e 042B     		cmp	r3, #4
 186 0080 E2DD     		ble	.L9
  42:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****   } 
  43:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****  } 
  44:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****  kbdActivate( 0 ); 
 187              		.loc 1 44 0 is_stmt 1
 188 0082 0020     		movs	r0, #0
 189 0084 FFF7FEFF 		bl	kbdActivate
  45:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****  return 0xFF; 
 190              		.loc 1 45 0
 191 0088 FF23     		movs	r3, #255
 192              	.L10:
  46:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c **** }
 193              		.loc 1 46 0 discriminator 1
 194 008a 1800     		movs	r0, r3
 195 008c BD46     		mov	sp, r7
 196 008e 07B0     		add	sp, sp, #28
 197              		@ sp needed
 198 0090 90BD     		pop	{r4, r7, pc}
 199              	.L12:
 200 0092 C046     		.align	2
 201              	.L11:
 202 0094 00000000 		.word	.LC0
 203              		.cfi_endproc
 204              	.LFE2:
 206              		.align	1
 207              		.global	kbdActivate
 208              		.syntax unified
 209              		.code	16
 210              		.thumb_func
 211              		.fpu softvfp
 213              	kbdActivate:
 214              	.LFB3:
  47:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c **** 
  48:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c **** void kbdActivate( unsigned int row ) /* Aktivera angiven rad hos tangentbordet, eller * deaktivera 
  49:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c **** {  
 215              		.loc 1 49 0
 216              		.cfi_startproc
 217              		@ args = 0, pretend = 0, frame = 8
 218              		@ frame_needed = 1, uses_anonymous_args = 0
 219 0098 80B5     		push	{r7, lr}
 220              		.cfi_def_cfa_offset 8
 221              		.cfi_offset 7, -8
 222              		.cfi_offset 14, -4
 223 009a 82B0     		sub	sp, sp, #8
 224              		.cfi_def_cfa_offset 16
 225 009c 00AF     		add	r7, sp, #0
 226              		.cfi_def_cfa_register 7
 227 009e 7860     		str	r0, [r7, #4]
  50:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****  switch( row ) 
 228              		.loc 1 50 0
 229 00a0 7B68     		ldr	r3, [r7, #4]
 230 00a2 042B     		cmp	r3, #4
 231 00a4 19D8     		bhi	.L21
 232 00a6 7B68     		ldr	r3, [r7, #4]
 233 00a8 9A00     		lsls	r2, r3, #2
 234 00aa 0E4B     		ldr	r3, .L22
 235 00ac D318     		adds	r3, r2, r3
 236 00ae 1B68     		ldr	r3, [r3]
 237 00b0 9F46     		mov	pc, r3
 238              		.section	.rodata
 239              		.align	2
 240              	.L16:
 241 0010 D2000000 		.word	.L15
 242 0014 B2000000 		.word	.L17
 243 0018 BA000000 		.word	.L18
 244 001c C2000000 		.word	.L19
 245 0020 CA000000 		.word	.L20
 246              		.text
 247              	.L17:
  51:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****  { 
  52:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****   case 1: *GPIO_ODR_HIGH = 0x10; break; 
 248              		.loc 1 52 0
 249 00b2 0D4B     		ldr	r3, .L22+4
 250 00b4 1022     		movs	r2, #16
 251 00b6 1A70     		strb	r2, [r3]
 252 00b8 0FE0     		b	.L14
 253              	.L18:
  53:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****   case 2: *GPIO_ODR_HIGH = 0x20; break; 
 254              		.loc 1 53 0
 255 00ba 0B4B     		ldr	r3, .L22+4
 256 00bc 2022     		movs	r2, #32
 257 00be 1A70     		strb	r2, [r3]
 258 00c0 0BE0     		b	.L14
 259              	.L19:
  54:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****   case 3: *GPIO_ODR_HIGH = 0x40; break; 
 260              		.loc 1 54 0
 261 00c2 094B     		ldr	r3, .L22+4
 262 00c4 4022     		movs	r2, #64
 263 00c6 1A70     		strb	r2, [r3]
 264 00c8 07E0     		b	.L14
 265              	.L20:
  55:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****   case 4: *GPIO_ODR_HIGH = 0x80; break; 
 266              		.loc 1 55 0
 267 00ca 074B     		ldr	r3, .L22+4
 268 00cc 8022     		movs	r2, #128
 269 00ce 1A70     		strb	r2, [r3]
 270 00d0 03E0     		b	.L14
 271              	.L15:
  56:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****   case 0: *GPIO_ODR_HIGH = 0x00; break; 
 272              		.loc 1 56 0
 273 00d2 054B     		ldr	r3, .L22+4
 274 00d4 0022     		movs	r2, #0
 275 00d6 1A70     		strb	r2, [r3]
 276 00d8 C046     		nop
 277              	.L14:
 278              	.L21:
  57:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****  } 
  58:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c **** }
 279              		.loc 1 58 0
 280 00da C046     		nop
 281 00dc BD46     		mov	sp, r7
 282 00de 02B0     		add	sp, sp, #8
 283              		@ sp needed
 284 00e0 80BD     		pop	{r7, pc}
 285              	.L23:
 286 00e2 C046     		.align	2
 287              	.L22:
 288 00e4 10000000 		.word	.L16
 289 00e8 150C0240 		.word	1073875989
 290              		.cfi_endproc
 291              	.LFE3:
 293              		.align	1
 294              		.global	kbdGetCol
 295              		.syntax unified
 296              		.code	16
 297              		.thumb_func
 298              		.fpu softvfp
 300              	kbdGetCol:
 301              	.LFB4:
  59:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c **** int kbdGetCol ( void )  /* Om någon tangent (i aktiverad rad) * är nedtryckt, returnera dess kolu
  60:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c **** {
 302              		.loc 1 60 0
 303              		.cfi_startproc
 304              		@ args = 0, pretend = 0, frame = 8
 305              		@ frame_needed = 1, uses_anonymous_args = 0
 306 00ec 80B5     		push	{r7, lr}
 307              		.cfi_def_cfa_offset 8
 308              		.cfi_offset 7, -8
 309              		.cfi_offset 14, -4
 310 00ee 82B0     		sub	sp, sp, #8
 311              		.cfi_def_cfa_offset 16
 312 00f0 00AF     		add	r7, sp, #0
 313              		.cfi_def_cfa_register 7
  61:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****  unsigned char c; 
  62:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****  c = *GPIO_IDR_HIGH; 
 314              		.loc 1 62 0
 315 00f2 124A     		ldr	r2, .L30
 316 00f4 FB1D     		adds	r3, r7, #7
 317 00f6 1278     		ldrb	r2, [r2]
 318 00f8 1A70     		strb	r2, [r3]
  63:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****  if ( c & 0x8 ) return 4; 
 319              		.loc 1 63 0
 320 00fa FB1D     		adds	r3, r7, #7
 321 00fc 1B78     		ldrb	r3, [r3]
 322 00fe 0822     		movs	r2, #8
 323 0100 1340     		ands	r3, r2
 324 0102 01D0     		beq	.L25
 325              		.loc 1 63 0 is_stmt 0 discriminator 1
 326 0104 0423     		movs	r3, #4
 327 0106 15E0     		b	.L26
 328              	.L25:
  64:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****  if ( c & 0x4 ) return 3;
 329              		.loc 1 64 0 is_stmt 1
 330 0108 FB1D     		adds	r3, r7, #7
 331 010a 1B78     		ldrb	r3, [r3]
 332 010c 0422     		movs	r2, #4
 333 010e 1340     		ands	r3, r2
 334 0110 01D0     		beq	.L27
 335              		.loc 1 64 0 is_stmt 0 discriminator 1
 336 0112 0323     		movs	r3, #3
 337 0114 0EE0     		b	.L26
 338              	.L27:
  65:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****  if ( c & 0x2 ) return 2;
 339              		.loc 1 65 0 is_stmt 1
 340 0116 FB1D     		adds	r3, r7, #7
 341 0118 1B78     		ldrb	r3, [r3]
 342 011a 0222     		movs	r2, #2
 343 011c 1340     		ands	r3, r2
 344 011e 01D0     		beq	.L28
 345              		.loc 1 65 0 is_stmt 0 discriminator 1
 346 0120 0223     		movs	r3, #2
 347 0122 07E0     		b	.L26
 348              	.L28:
  66:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****  if ( c & 0x1 ) return 1; 
 349              		.loc 1 66 0 is_stmt 1
 350 0124 FB1D     		adds	r3, r7, #7
 351 0126 1B78     		ldrb	r3, [r3]
 352 0128 0122     		movs	r2, #1
 353 012a 1340     		ands	r3, r2
 354 012c 01D0     		beq	.L29
 355              		.loc 1 66 0 is_stmt 0 discriminator 1
 356 012e 0123     		movs	r3, #1
 357 0130 00E0     		b	.L26
 358              	.L29:
  67:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****  return 0; 
 359              		.loc 1 67 0 is_stmt 1
 360 0132 0023     		movs	r3, #0
 361              	.L26:
  68:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c **** }
 362              		.loc 1 68 0
 363 0134 1800     		movs	r0, r3
 364 0136 BD46     		mov	sp, r7
 365 0138 02B0     		add	sp, sp, #8
 366              		@ sp needed
 367 013a 80BD     		pop	{r7, pc}
 368              	.L31:
 369              		.align	2
 370              	.L30:
 371 013c 110C0240 		.word	1073875985
 372              		.cfi_endproc
 373              	.LFE4:
 375              		.section	.rodata
 376              		.align	2
 377              	.LC1:
 378 0024 3F       		.byte	63
 379 0025 06       		.byte	6
 380 0026 5B       		.byte	91
 381 0027 4F       		.byte	79
 382 0028 66       		.byte	102
 383 0029 6D       		.byte	109
 384 002a 7D       		.byte	125
 385 002b 07       		.byte	7
 386 002c 7F       		.byte	127
 387 002d 6F       		.byte	111
 388 002e 77       		.byte	119
 389 002f 7C       		.byte	124
 390 0030 39       		.byte	57
 391 0031 5E       		.byte	94
 392 0032 79       		.byte	121
 393 0033 71       		.byte	113
 394              		.text
 395              		.align	1
 396              		.global	out7seg
 397              		.syntax unified
 398              		.code	16
 399              		.thumb_func
 400              		.fpu softvfp
 402              	out7seg:
 403              	.LFB5:
  69:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c **** 
  70:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c **** void out7seg(unsigned char c)
  71:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c **** {
 404              		.loc 1 71 0
 405              		.cfi_startproc
 406              		@ args = 0, pretend = 0, frame = 32
 407              		@ frame_needed = 1, uses_anonymous_args = 0
 408 0140 90B5     		push	{r4, r7, lr}
 409              		.cfi_def_cfa_offset 12
 410              		.cfi_offset 4, -12
 411              		.cfi_offset 7, -8
 412              		.cfi_offset 14, -4
 413 0142 89B0     		sub	sp, sp, #36
 414              		.cfi_def_cfa_offset 48
 415 0144 00AF     		add	r7, sp, #0
 416              		.cfi_def_cfa_register 7
 417 0146 0200     		movs	r2, r0
 418 0148 FB1D     		adds	r3, r7, #7
 419 014a 1A70     		strb	r2, [r3]
  72:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****  unsigned char key[] = {0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F,0x77,0x7C,0x39,0x5E,0x79,
 420              		.loc 1 72 0
 421 014c 0C23     		movs	r3, #12
 422 014e FB18     		adds	r3, r7, r3
 423 0150 0E4A     		ldr	r2, .L36
 424 0152 13CA     		ldmia	r2!, {r0, r1, r4}
 425 0154 13C3     		stmia	r3!, {r0, r1, r4}
 426 0156 1268     		ldr	r2, [r2]
 427 0158 1A60     		str	r2, [r3]
  73:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****  if(c <=15)
 428              		.loc 1 73 0
 429 015a FB1D     		adds	r3, r7, #7
 430 015c 1B78     		ldrb	r3, [r3]
 431 015e 0F2B     		cmp	r3, #15
 432 0160 0CD8     		bhi	.L33
 433              	.LBB3:
  74:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****  {
  75:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****   unsigned char ourKey = key[c];
 434              		.loc 1 75 0
 435 0162 FB1D     		adds	r3, r7, #7
 436 0164 1A78     		ldrb	r2, [r3]
 437 0166 1F20     		movs	r0, #31
 438 0168 3B18     		adds	r3, r7, r0
 439 016a 0C21     		movs	r1, #12
 440 016c 7918     		adds	r1, r7, r1
 441 016e 8A5C     		ldrb	r2, [r1, r2]
 442 0170 1A70     		strb	r2, [r3]
  76:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****   *GPIO_ODR_LOW = ourKey;
 443              		.loc 1 76 0
 444 0172 074A     		ldr	r2, .L36+4
 445 0174 3B18     		adds	r3, r7, r0
 446 0176 1B78     		ldrb	r3, [r3]
 447 0178 1370     		strb	r3, [r2]
 448              	.LBE3:
  77:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****  }
  78:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****  else 
  79:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****  {
  80:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****   *GPIO_ODR_LOW = 0x00;
  81:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****  }
  82:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c **** }
 449              		.loc 1 82 0
 450 017a 02E0     		b	.L35
 451              	.L33:
  80:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****  }
 452              		.loc 1 80 0
 453 017c 044B     		ldr	r3, .L36+4
 454 017e 0022     		movs	r2, #0
 455 0180 1A70     		strb	r2, [r3]
 456              	.L35:
 457              		.loc 1 82 0
 458 0182 C046     		nop
 459 0184 BD46     		mov	sp, r7
 460 0186 09B0     		add	sp, sp, #36
 461              		@ sp needed
 462 0188 90BD     		pop	{r4, r7, pc}
 463              	.L37:
 464 018a C046     		.align	2
 465              	.L36:
 466 018c 24000000 		.word	.LC1
 467 0190 140C0240 		.word	1073875988
 468              		.cfi_endproc
 469              	.LFE5:
 471              		.align	1
 472              		.global	main
 473              		.syntax unified
 474              		.code	16
 475              		.thumb_func
 476              		.fpu softvfp
 478              	main:
 479              	.LFB6:
  83:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****  
  84:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****  void main(void)
  85:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c **** {
 480              		.loc 1 85 0
 481              		.cfi_startproc
 482              		@ args = 0, pretend = 0, frame = 8
 483              		@ frame_needed = 1, uses_anonymous_args = 0
 484 0194 90B5     		push	{r4, r7, lr}
 485              		.cfi_def_cfa_offset 12
 486              		.cfi_offset 4, -12
 487              		.cfi_offset 7, -8
 488              		.cfi_offset 14, -4
 489 0196 83B0     		sub	sp, sp, #12
 490              		.cfi_def_cfa_offset 24
 491 0198 00AF     		add	r7, sp, #0
 492              		.cfi_def_cfa_register 7
  86:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****  app_init();
 493              		.loc 1 86 0
 494 019a FFF7FEFF 		bl	app_init
 495              	.L39:
 496              	.LBB4:
  87:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****  while(1)
  88:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****  {
  89:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****   unsigned char key = keyb();
 497              		.loc 1 89 0 discriminator 1
 498 019e FC1D     		adds	r4, r7, #7
 499 01a0 FFF7FEFF 		bl	keyb
 500 01a4 0300     		movs	r3, r0
 501 01a6 2370     		strb	r3, [r4]
  90:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****   out7seg(key);
 502              		.loc 1 90 0 discriminator 1
 503 01a8 FB1D     		adds	r3, r7, #7
 504 01aa 1B78     		ldrb	r3, [r3]
 505 01ac 1800     		movs	r0, r3
 506 01ae FFF7FEFF 		bl	out7seg
 507              	.LBE4:
  88:C:/Users/Maria/Documents/IT/MOP/MOP/keypad\startup.c ****   unsigned char key = keyb();
 508              		.loc 1 88 0 discriminator 1
 509 01b2 F4E7     		b	.L39
 510              		.cfi_endproc
 511              	.LFE6:
 513              	.Letext0:
