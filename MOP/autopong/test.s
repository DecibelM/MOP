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
  25              		.file 1 "C:/Users/Maria/Documents/IT/MOP/MOP/autopong/startup.c"
   1:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** /*
   2:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c ****  * 	startup.c
   3:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c ****  *
   4:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c ****  */
   5:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** #include <stdint.h>
   6:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   7:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
   8:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** #define GPIO_E 0x40021000
   9:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** #define GPIO_MODER ((volatile unsigned int *) (0x40021000))
  10:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** #define GPIO_OTYPER ((volatile unsigned short *) (0x40021004))
  11:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** #define GPIO_OSPEEDR ((volatile unsigned int *) (0x40021008))
  12:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** #define GPIO_PUPDR ((volatile unsigned int *) (0x4002100C))
  13:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** #define GPIO_IDR_LOW ((volatile unsigned char *) (0x40021010))
  14:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** #define GPIO_IDR_HIGH ((volatile unsigned char *) (0x40021011))
  15:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** #define GPIO_ODR_HIGH ((volatile unsigned char *) (0x40021015))
  16:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** #define GPIO_ODR_LOW ((volatile unsigned char *) (0x40021014))
  17:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
  18:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** #define STK_CTRL ((volatile unsigned int *)(0xE000E010))
  19:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** #define STK_LOAD ((volatile unsigned int *)(0xE000E014))
  20:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** #define STK_VAL ((volatile unsigned int *)(0xE000E018))
  21:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
  22:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** #define B_E 0x40
  23:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** #define B_SELECT 0x04
  24:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** #define B_RW 0x02
  25:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** #define B_RS 0x01
  26:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
  27:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** #define B_RST 0x20
  28:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** #define B_CS2 0x10
  29:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** #define B_CS1 0x08
  30:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
  31:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** #define LCD_ON 0x3F
  32:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** #define LCD_OFF 0x3E
  33:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** #define LCD_SET_ADD 0x40
  34:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** #define LCD_SET_PAGE 0xB8
  35:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** #define LCD_DISP_START 0xC0
  36:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** #define LCD_BUSY 0x80
  37:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
  38:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void startup ( void )
  39:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
  26              		.loc 1 39 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  40:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** __asm volatile(
  31              		.loc 1 40 0
  32              		.syntax divided
  33              	@ 40 "C:/Users/Maria/Documents/IT/MOP/MOP/autopong/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  41:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  42:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	" MOV SP,R0\n"
  43:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	" BL main\n"				/* call main */
  44:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	"_exit: B .\n"				/* never return */
  45:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	) ;
  46:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
  40              		.loc 1 46 0
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
  47:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
  48:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void init_app(void)
  49:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
  57              		.loc 1 49 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  50:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	*GPIO_MODER = 0x55555555;
  67              		.loc 1 50 0
  68 0004 024B     		ldr	r3, .L3
  69 0006 034A     		ldr	r2, .L3+4
  70 0008 1A60     		str	r2, [r3]
  51:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
  71              		.loc 1 51 0
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
  85              		.syntax unified
  86              		.code	16
  87              		.thumb_func
  88              		.fpu softvfp
  90              	graphic_wait_ready:
  91              	.LFB2:
  52:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
  53:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** typedef unsigned char uint8_t;
  54:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
  55:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** typedef struct tPoint
  56:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
  57:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	unsigned char x;
  58:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	unsigned char y;
  59:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }POINT;
  60:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
  61:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** #define MAX_POINTS 20
  62:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
  63:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** typedef struct tGeometry
  64:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
  65:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	int numpoints;
  66:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	int sizex;
  67:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	int sizey;
  68:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	POINT px[ MAX_POINTS];
  69:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }GEOMETRY, *PGEOMETRY;
  70:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
  71:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** typedef struct tObj{
  72:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	PGEOMETRY geo;
  73:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	int dirx, diry;
  74:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	int posx, posy;
  75:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	void(*draw)(struct tObj*);
  76:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	void(*clear)(struct tObj*);
  77:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	void(*move)(struct tObj*);
  78:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	void(*set_speed)(struct tObj*,int,int);
  79:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }OBJECT, *POBJECT;
  80:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
  81:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** static void graphic_wait_ready(void)
  82:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
  92              		.loc 1 82 0
  93              		.cfi_startproc
  94              		@ args = 0, pretend = 0, frame = 8
  95              		@ frame_needed = 1, uses_anonymous_args = 0
  96 0018 80B5     		push	{r7, lr}
  97              		.cfi_def_cfa_offset 8
  98              		.cfi_offset 7, -8
  99              		.cfi_offset 14, -4
 100 001a 82B0     		sub	sp, sp, #8
 101              		.cfi_def_cfa_offset 16
 102 001c 00AF     		add	r7, sp, #0
 103              		.cfi_def_cfa_register 7
  83:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	uint8_t c;
  84:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 104              		.loc 1 84 0
 105 001e 4020     		movs	r0, #64
 106 0020 FFF7FEFF 		bl	graphic_ctrl_bit_clear
  85:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	*GPIO_MODER = 0x00005555;
 107              		.loc 1 85 0
 108 0024 144B     		ldr	r3, .L11
 109 0026 154A     		ldr	r2, .L11+4
 110 0028 1A60     		str	r2, [r3]
  86:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_ctrl_bit_clear(B_RS);
 111              		.loc 1 86 0
 112 002a 0120     		movs	r0, #1
 113 002c FFF7FEFF 		bl	graphic_ctrl_bit_clear
  87:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_ctrl_bit_set(B_RW);
 114              		.loc 1 87 0
 115 0030 0220     		movs	r0, #2
 116 0032 FFF7FEFF 		bl	graphic_ctrl_bit_set
  88:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	delay_500ns();
 117              		.loc 1 88 0
 118 0036 FFF7FEFF 		bl	delay_500ns
 119              	.L8:
  89:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	
  90:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	while(1)
  91:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	{
  92:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		graphic_ctrl_bit_set(B_E);
 120              		.loc 1 92 0
 121 003a 4020     		movs	r0, #64
 122 003c FFF7FEFF 		bl	graphic_ctrl_bit_set
  93:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		delay_500ns();
 123              		.loc 1 93 0
 124 0040 FFF7FEFF 		bl	delay_500ns
  94:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		c = *GPIO_IDR_HIGH & LCD_BUSY; //LCD_BUSY?????
 125              		.loc 1 94 0
 126 0044 0E4B     		ldr	r3, .L11+8
 127 0046 1B78     		ldrb	r3, [r3]
 128 0048 DAB2     		uxtb	r2, r3
 129 004a FB1D     		adds	r3, r7, #7
 130 004c 7F21     		movs	r1, #127
 131 004e 8A43     		bics	r2, r1
 132 0050 1A70     		strb	r2, [r3]
  95:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		graphic_ctrl_bit_clear(B_E);
 133              		.loc 1 95 0
 134 0052 4020     		movs	r0, #64
 135 0054 FFF7FEFF 		bl	graphic_ctrl_bit_clear
  96:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		delay_500ns();
 136              		.loc 1 96 0
 137 0058 FFF7FEFF 		bl	delay_500ns
  97:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		if(c == 0)
 138              		.loc 1 97 0
 139 005c FB1D     		adds	r3, r7, #7
 140 005e 1B78     		ldrb	r3, [r3]
 141 0060 002B     		cmp	r3, #0
 142 0062 00D0     		beq	.L10
  92:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		delay_500ns();
 143              		.loc 1 92 0
 144 0064 E9E7     		b	.L8
 145              	.L10:
  98:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		{
  99:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 			break;
 146              		.loc 1 99 0
 147 0066 C046     		nop
 100:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		}
 101:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 102:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	*GPIO_MODER = 0x55555555;
 148              		.loc 1 102 0
 149 0068 034B     		ldr	r3, .L11
 150 006a 064A     		ldr	r2, .L11+12
 151 006c 1A60     		str	r2, [r3]
 103:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 152              		.loc 1 103 0
 153 006e C046     		nop
 154 0070 BD46     		mov	sp, r7
 155 0072 02B0     		add	sp, sp, #8
 156              		@ sp needed
 157 0074 80BD     		pop	{r7, pc}
 158              	.L12:
 159 0076 C046     		.align	2
 160              	.L11:
 161 0078 00100240 		.word	1073876992
 162 007c 55550000 		.word	21845
 163 0080 11100240 		.word	1073877009
 164 0084 55555555 		.word	1431655765
 165              		.cfi_endproc
 166              	.LFE2:
 168              		.align	1
 169              		.syntax unified
 170              		.code	16
 171              		.thumb_func
 172              		.fpu softvfp
 174              	graphic_read:
 175              	.LFB3:
 104:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 105:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** static uint8_t graphic_read(uint8_t controller)
 106:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 176              		.loc 1 106 0
 177              		.cfi_startproc
 178              		@ args = 0, pretend = 0, frame = 16
 179              		@ frame_needed = 1, uses_anonymous_args = 0
 180 0088 80B5     		push	{r7, lr}
 181              		.cfi_def_cfa_offset 8
 182              		.cfi_offset 7, -8
 183              		.cfi_offset 14, -4
 184 008a 84B0     		sub	sp, sp, #16
 185              		.cfi_def_cfa_offset 24
 186 008c 00AF     		add	r7, sp, #0
 187              		.cfi_def_cfa_register 7
 188 008e 0200     		movs	r2, r0
 189 0090 FB1D     		adds	r3, r7, #7
 190 0092 1A70     		strb	r2, [r3]
 107:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	uint8_t c;
 108:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 191              		.loc 1 108 0
 192 0094 4020     		movs	r0, #64
 193 0096 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 109:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	*GPIO_MODER = 0x00005555;
 194              		.loc 1 109 0
 195 009a 1C4B     		ldr	r3, .L17
 196 009c 1C4A     		ldr	r2, .L17+4
 197 009e 1A60     		str	r2, [r3]
 110:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_ctrl_bit_set(B_RS|B_RW);
 198              		.loc 1 110 0
 199 00a0 0320     		movs	r0, #3
 200 00a2 FFF7FEFF 		bl	graphic_ctrl_bit_set
 111:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	select_controller(controller);
 201              		.loc 1 111 0
 202 00a6 FB1D     		adds	r3, r7, #7
 203 00a8 1B78     		ldrb	r3, [r3]
 204 00aa 1800     		movs	r0, r3
 205 00ac FFF7FEFF 		bl	select_controller
 112:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	delay_500ns();
 206              		.loc 1 112 0
 207 00b0 FFF7FEFF 		bl	delay_500ns
 113:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_ctrl_bit_set(B_E);
 208              		.loc 1 113 0
 209 00b4 4020     		movs	r0, #64
 210 00b6 FFF7FEFF 		bl	graphic_ctrl_bit_set
 114:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	delay_500ns();
 211              		.loc 1 114 0
 212 00ba FFF7FEFF 		bl	delay_500ns
 115:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	c = *GPIO_IDR_HIGH;
 213              		.loc 1 115 0
 214 00be 154A     		ldr	r2, .L17+8
 215 00c0 0F23     		movs	r3, #15
 216 00c2 FB18     		adds	r3, r7, r3
 217 00c4 1278     		ldrb	r2, [r2]
 218 00c6 1A70     		strb	r2, [r3]
 116:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 219              		.loc 1 116 0
 220 00c8 4020     		movs	r0, #64
 221 00ca FFF7FEFF 		bl	graphic_ctrl_bit_clear
 117:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	*GPIO_MODER = 0x55555555;
 222              		.loc 1 117 0
 223 00ce 0F4B     		ldr	r3, .L17
 224 00d0 114A     		ldr	r2, .L17+12
 225 00d2 1A60     		str	r2, [r3]
 118:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	
 119:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	if(controller & B_CS1){
 226              		.loc 1 119 0
 227 00d4 FB1D     		adds	r3, r7, #7
 228 00d6 1B78     		ldrb	r3, [r3]
 229 00d8 0822     		movs	r2, #8
 230 00da 1340     		ands	r3, r2
 231 00dc 04D0     		beq	.L14
 120:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		select_controller(B_CS1);
 232              		.loc 1 120 0
 233 00de 0820     		movs	r0, #8
 234 00e0 FFF7FEFF 		bl	select_controller
 121:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		graphic_wait_ready();
 235              		.loc 1 121 0
 236 00e4 FFF798FF 		bl	graphic_wait_ready
 237              	.L14:
 122:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 123:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	if(controller & B_CS2)
 238              		.loc 1 123 0
 239 00e8 FB1D     		adds	r3, r7, #7
 240 00ea 1B78     		ldrb	r3, [r3]
 241 00ec 1022     		movs	r2, #16
 242 00ee 1340     		ands	r3, r2
 243 00f0 04D0     		beq	.L15
 124:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	{
 125:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		select_controller(B_CS2);
 244              		.loc 1 125 0
 245 00f2 1020     		movs	r0, #16
 246 00f4 FFF7FEFF 		bl	select_controller
 126:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		graphic_wait_ready();
 247              		.loc 1 126 0
 248 00f8 FFF78EFF 		bl	graphic_wait_ready
 249              	.L15:
 127:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 128:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	return c;
 250              		.loc 1 128 0
 251 00fc 0F23     		movs	r3, #15
 252 00fe FB18     		adds	r3, r7, r3
 253 0100 1B78     		ldrb	r3, [r3]
 129:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 254              		.loc 1 129 0
 255 0102 1800     		movs	r0, r3
 256 0104 BD46     		mov	sp, r7
 257 0106 04B0     		add	sp, sp, #16
 258              		@ sp needed
 259 0108 80BD     		pop	{r7, pc}
 260              	.L18:
 261 010a C046     		.align	2
 262              	.L17:
 263 010c 00100240 		.word	1073876992
 264 0110 55550000 		.word	21845
 265 0114 11100240 		.word	1073877009
 266 0118 55555555 		.word	1431655765
 267              		.cfi_endproc
 268              	.LFE3:
 270              		.align	1
 271              		.global	graphic_write
 272              		.syntax unified
 273              		.code	16
 274              		.thumb_func
 275              		.fpu softvfp
 277              	graphic_write:
 278              	.LFB4:
 130:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 131:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void graphic_write(uint8_t value, uint8_t controller)
 132:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 279              		.loc 1 132 0
 280              		.cfi_startproc
 281              		@ args = 0, pretend = 0, frame = 8
 282              		@ frame_needed = 1, uses_anonymous_args = 0
 283 011c 80B5     		push	{r7, lr}
 284              		.cfi_def_cfa_offset 8
 285              		.cfi_offset 7, -8
 286              		.cfi_offset 14, -4
 287 011e 82B0     		sub	sp, sp, #8
 288              		.cfi_def_cfa_offset 16
 289 0120 00AF     		add	r7, sp, #0
 290              		.cfi_def_cfa_register 7
 291 0122 0200     		movs	r2, r0
 292 0124 FB1D     		adds	r3, r7, #7
 293 0126 1A70     		strb	r2, [r3]
 294 0128 BB1D     		adds	r3, r7, #6
 295 012a 0A1C     		adds	r2, r1, #0
 296 012c 1A70     		strb	r2, [r3]
 133:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	uint8_t c;
 134:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	*GPIO_ODR_HIGH = value;
 297              		.loc 1 134 0
 298 012e 1A4A     		ldr	r2, .L22
 299 0130 FB1D     		adds	r3, r7, #7
 300 0132 1B78     		ldrb	r3, [r3]
 301 0134 1370     		strb	r3, [r2]
 135:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	select_controller(controller);
 302              		.loc 1 135 0
 303 0136 BB1D     		adds	r3, r7, #6
 304 0138 1B78     		ldrb	r3, [r3]
 305 013a 1800     		movs	r0, r3
 306 013c FFF7FEFF 		bl	select_controller
 136:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	delay_500ns();
 307              		.loc 1 136 0
 308 0140 FFF7FEFF 		bl	delay_500ns
 137:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_ctrl_bit_set(B_E);
 309              		.loc 1 137 0
 310 0144 4020     		movs	r0, #64
 311 0146 FFF7FEFF 		bl	graphic_ctrl_bit_set
 138:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	delay_500ns();
 312              		.loc 1 138 0
 313 014a FFF7FEFF 		bl	delay_500ns
 139:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 314              		.loc 1 139 0
 315 014e 4020     		movs	r0, #64
 316 0150 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 140:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 141:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	
 142:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	if(controller & B_CS1){
 317              		.loc 1 142 0
 318 0154 BB1D     		adds	r3, r7, #6
 319 0156 1B78     		ldrb	r3, [r3]
 320 0158 0822     		movs	r2, #8
 321 015a 1340     		ands	r3, r2
 322 015c 04D0     		beq	.L20
 143:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		select_controller(B_CS1);
 323              		.loc 1 143 0
 324 015e 0820     		movs	r0, #8
 325 0160 FFF7FEFF 		bl	select_controller
 144:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		graphic_wait_ready();
 326              		.loc 1 144 0
 327 0164 FFF758FF 		bl	graphic_wait_ready
 328              	.L20:
 145:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 146:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	if(controller & B_CS2)
 329              		.loc 1 146 0
 330 0168 BB1D     		adds	r3, r7, #6
 331 016a 1B78     		ldrb	r3, [r3]
 332 016c 1022     		movs	r2, #16
 333 016e 1340     		ands	r3, r2
 334 0170 04D0     		beq	.L21
 147:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	{
 148:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		select_controller(B_CS2);
 335              		.loc 1 148 0
 336 0172 1020     		movs	r0, #16
 337 0174 FFF7FEFF 		bl	select_controller
 149:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		graphic_wait_ready();
 338              		.loc 1 149 0
 339 0178 FFF74EFF 		bl	graphic_wait_ready
 340              	.L21:
 150:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 151:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	*GPIO_ODR_HIGH = 0;
 341              		.loc 1 151 0
 342 017c 064B     		ldr	r3, .L22
 343 017e 0022     		movs	r2, #0
 344 0180 1A70     		strb	r2, [r3]
 152:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_ctrl_bit_set(B_E);
 345              		.loc 1 152 0
 346 0182 4020     		movs	r0, #64
 347 0184 FFF7FEFF 		bl	graphic_ctrl_bit_set
 153:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	select_controller(0);
 348              		.loc 1 153 0
 349 0188 0020     		movs	r0, #0
 350 018a FFF7FEFF 		bl	select_controller
 154:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 351              		.loc 1 154 0
 352 018e C046     		nop
 353 0190 BD46     		mov	sp, r7
 354 0192 02B0     		add	sp, sp, #8
 355              		@ sp needed
 356 0194 80BD     		pop	{r7, pc}
 357              	.L23:
 358 0196 C046     		.align	2
 359              	.L22:
 360 0198 15100240 		.word	1073877013
 361              		.cfi_endproc
 362              	.LFE4:
 364              		.align	1
 365              		.global	graphic_write_command
 366              		.syntax unified
 367              		.code	16
 368              		.thumb_func
 369              		.fpu softvfp
 371              	graphic_write_command:
 372              	.LFB5:
 155:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 156:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void graphic_write_command(uint8_t command, uint8_t controller)
 157:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 373              		.loc 1 157 0
 374              		.cfi_startproc
 375              		@ args = 0, pretend = 0, frame = 8
 376              		@ frame_needed = 1, uses_anonymous_args = 0
 377 019c 80B5     		push	{r7, lr}
 378              		.cfi_def_cfa_offset 8
 379              		.cfi_offset 7, -8
 380              		.cfi_offset 14, -4
 381 019e 82B0     		sub	sp, sp, #8
 382              		.cfi_def_cfa_offset 16
 383 01a0 00AF     		add	r7, sp, #0
 384              		.cfi_def_cfa_register 7
 385 01a2 0200     		movs	r2, r0
 386 01a4 FB1D     		adds	r3, r7, #7
 387 01a6 1A70     		strb	r2, [r3]
 388 01a8 BB1D     		adds	r3, r7, #6
 389 01aa 0A1C     		adds	r2, r1, #0
 390 01ac 1A70     		strb	r2, [r3]
 158:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 391              		.loc 1 158 0
 392 01ae 4020     		movs	r0, #64
 393 01b0 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 159:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	select_controller(controller);
 394              		.loc 1 159 0
 395 01b4 BB1D     		adds	r3, r7, #6
 396 01b6 1B78     		ldrb	r3, [r3]
 397 01b8 1800     		movs	r0, r3
 398 01ba FFF7FEFF 		bl	select_controller
 160:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_ctrl_bit_clear(B_RS | B_RW);
 399              		.loc 1 160 0
 400 01be 0320     		movs	r0, #3
 401 01c0 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 161:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_write(command, controller);
 402              		.loc 1 161 0
 403 01c4 BB1D     		adds	r3, r7, #6
 404 01c6 1A78     		ldrb	r2, [r3]
 405 01c8 FB1D     		adds	r3, r7, #7
 406 01ca 1B78     		ldrb	r3, [r3]
 407 01cc 1100     		movs	r1, r2
 408 01ce 1800     		movs	r0, r3
 409 01d0 FFF7FEFF 		bl	graphic_write
 162:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 410              		.loc 1 162 0
 411 01d4 C046     		nop
 412 01d6 BD46     		mov	sp, r7
 413 01d8 02B0     		add	sp, sp, #8
 414              		@ sp needed
 415 01da 80BD     		pop	{r7, pc}
 416              		.cfi_endproc
 417              	.LFE5:
 419              		.align	1
 420              		.global	graphic_write_data
 421              		.syntax unified
 422              		.code	16
 423              		.thumb_func
 424              		.fpu softvfp
 426              	graphic_write_data:
 427              	.LFB6:
 163:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 164:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void graphic_write_data(uint8_t data, uint8_t controller)
 165:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 428              		.loc 1 165 0
 429              		.cfi_startproc
 430              		@ args = 0, pretend = 0, frame = 8
 431              		@ frame_needed = 1, uses_anonymous_args = 0
 432 01dc 80B5     		push	{r7, lr}
 433              		.cfi_def_cfa_offset 8
 434              		.cfi_offset 7, -8
 435              		.cfi_offset 14, -4
 436 01de 82B0     		sub	sp, sp, #8
 437              		.cfi_def_cfa_offset 16
 438 01e0 00AF     		add	r7, sp, #0
 439              		.cfi_def_cfa_register 7
 440 01e2 0200     		movs	r2, r0
 441 01e4 FB1D     		adds	r3, r7, #7
 442 01e6 1A70     		strb	r2, [r3]
 443 01e8 BB1D     		adds	r3, r7, #6
 444 01ea 0A1C     		adds	r2, r1, #0
 445 01ec 1A70     		strb	r2, [r3]
 166:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 446              		.loc 1 166 0
 447 01ee 4020     		movs	r0, #64
 448 01f0 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 167:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	select_controller(controller);
 449              		.loc 1 167 0
 450 01f4 BB1D     		adds	r3, r7, #6
 451 01f6 1B78     		ldrb	r3, [r3]
 452 01f8 1800     		movs	r0, r3
 453 01fa FFF7FEFF 		bl	select_controller
 168:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_ctrl_bit_clear(B_RW);
 454              		.loc 1 168 0
 455 01fe 0220     		movs	r0, #2
 456 0200 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 169:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_ctrl_bit_set(B_RS);
 457              		.loc 1 169 0
 458 0204 0120     		movs	r0, #1
 459 0206 FFF7FEFF 		bl	graphic_ctrl_bit_set
 170:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_write(data, controller);
 460              		.loc 1 170 0
 461 020a BB1D     		adds	r3, r7, #6
 462 020c 1A78     		ldrb	r2, [r3]
 463 020e FB1D     		adds	r3, r7, #7
 464 0210 1B78     		ldrb	r3, [r3]
 465 0212 1100     		movs	r1, r2
 466 0214 1800     		movs	r0, r3
 467 0216 FFF7FEFF 		bl	graphic_write
 171:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 468              		.loc 1 171 0
 469 021a C046     		nop
 470 021c BD46     		mov	sp, r7
 471 021e 02B0     		add	sp, sp, #8
 472              		@ sp needed
 473 0220 80BD     		pop	{r7, pc}
 474              		.cfi_endproc
 475              	.LFE6:
 477              		.align	1
 478              		.global	graphic_read_data
 479              		.syntax unified
 480              		.code	16
 481              		.thumb_func
 482              		.fpu softvfp
 484              	graphic_read_data:
 485              	.LFB7:
 172:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 173:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** uint8_t graphic_read_data(uint8_t controller)
 174:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 486              		.loc 1 174 0
 487              		.cfi_startproc
 488              		@ args = 0, pretend = 0, frame = 8
 489              		@ frame_needed = 1, uses_anonymous_args = 0
 490 0222 80B5     		push	{r7, lr}
 491              		.cfi_def_cfa_offset 8
 492              		.cfi_offset 7, -8
 493              		.cfi_offset 14, -4
 494 0224 82B0     		sub	sp, sp, #8
 495              		.cfi_def_cfa_offset 16
 496 0226 00AF     		add	r7, sp, #0
 497              		.cfi_def_cfa_register 7
 498 0228 0200     		movs	r2, r0
 499 022a FB1D     		adds	r3, r7, #7
 500 022c 1A70     		strb	r2, [r3]
 175:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_read(controller);
 501              		.loc 1 175 0
 502 022e FB1D     		adds	r3, r7, #7
 503 0230 1B78     		ldrb	r3, [r3]
 504 0232 1800     		movs	r0, r3
 505 0234 FFF728FF 		bl	graphic_read
 176:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	return graphic_read(controller);
 506              		.loc 1 176 0
 507 0238 FB1D     		adds	r3, r7, #7
 508 023a 1B78     		ldrb	r3, [r3]
 509 023c 1800     		movs	r0, r3
 510 023e FFF723FF 		bl	graphic_read
 511 0242 0300     		movs	r3, r0
 177:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 512              		.loc 1 177 0
 513 0244 1800     		movs	r0, r3
 514 0246 BD46     		mov	sp, r7
 515 0248 02B0     		add	sp, sp, #8
 516              		@ sp needed
 517 024a 80BD     		pop	{r7, pc}
 518              		.cfi_endproc
 519              	.LFE7:
 521              		.align	1
 522              		.global	graphic_ctrl_bit_set
 523              		.syntax unified
 524              		.code	16
 525              		.thumb_func
 526              		.fpu softvfp
 528              	graphic_ctrl_bit_set:
 529              	.LFB8:
 178:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 179:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void graphic_ctrl_bit_set(uint8_t x)
 180:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 530              		.loc 1 180 0
 531              		.cfi_startproc
 532              		@ args = 0, pretend = 0, frame = 16
 533              		@ frame_needed = 1, uses_anonymous_args = 0
 534 024c 80B5     		push	{r7, lr}
 535              		.cfi_def_cfa_offset 8
 536              		.cfi_offset 7, -8
 537              		.cfi_offset 14, -4
 538 024e 84B0     		sub	sp, sp, #16
 539              		.cfi_def_cfa_offset 24
 540 0250 00AF     		add	r7, sp, #0
 541              		.cfi_def_cfa_register 7
 542 0252 0200     		movs	r2, r0
 543 0254 FB1D     		adds	r3, r7, #7
 544 0256 1A70     		strb	r2, [r3]
 181:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	unsigned char c;
 182:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	c = *GPIO_ODR_LOW;
 545              		.loc 1 182 0
 546 0258 0C4A     		ldr	r2, .L29
 547 025a 0F21     		movs	r1, #15
 548 025c 7B18     		adds	r3, r7, r1
 549 025e 1278     		ldrb	r2, [r2]
 550 0260 1A70     		strb	r2, [r3]
 183:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	c |= ( ~B_SELECT & x ); //Nollställer B_Select!
 551              		.loc 1 183 0
 552 0262 FB1D     		adds	r3, r7, #7
 553 0264 1B78     		ldrb	r3, [r3]
 554 0266 5BB2     		sxtb	r3, r3
 555 0268 0422     		movs	r2, #4
 556 026a 9343     		bics	r3, r2
 557 026c 5AB2     		sxtb	r2, r3
 558 026e 7B18     		adds	r3, r7, r1
 559 0270 1B78     		ldrb	r3, [r3]
 560 0272 5BB2     		sxtb	r3, r3
 561 0274 1343     		orrs	r3, r2
 562 0276 5AB2     		sxtb	r2, r3
 563 0278 7B18     		adds	r3, r7, r1
 564 027a 1A70     		strb	r2, [r3]
 184:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	*GPIO_ODR_LOW = c;
 565              		.loc 1 184 0
 566 027c 034A     		ldr	r2, .L29
 567 027e 7B18     		adds	r3, r7, r1
 568 0280 1B78     		ldrb	r3, [r3]
 569 0282 1370     		strb	r3, [r2]
 185:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 570              		.loc 1 185 0
 571 0284 C046     		nop
 572 0286 BD46     		mov	sp, r7
 573 0288 04B0     		add	sp, sp, #16
 574              		@ sp needed
 575 028a 80BD     		pop	{r7, pc}
 576              	.L30:
 577              		.align	2
 578              	.L29:
 579 028c 14100240 		.word	1073877012
 580              		.cfi_endproc
 581              	.LFE8:
 583              		.align	1
 584              		.global	graphic_ctrl_bit_clear
 585              		.syntax unified
 586              		.code	16
 587              		.thumb_func
 588              		.fpu softvfp
 590              	graphic_ctrl_bit_clear:
 591              	.LFB9:
 186:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 187:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void graphic_ctrl_bit_clear(unsigned char x)
 188:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 592              		.loc 1 188 0
 593              		.cfi_startproc
 594              		@ args = 0, pretend = 0, frame = 16
 595              		@ frame_needed = 1, uses_anonymous_args = 0
 596 0290 80B5     		push	{r7, lr}
 597              		.cfi_def_cfa_offset 8
 598              		.cfi_offset 7, -8
 599              		.cfi_offset 14, -4
 600 0292 84B0     		sub	sp, sp, #16
 601              		.cfi_def_cfa_offset 24
 602 0294 00AF     		add	r7, sp, #0
 603              		.cfi_def_cfa_register 7
 604 0296 0200     		movs	r2, r0
 605 0298 FB1D     		adds	r3, r7, #7
 606 029a 1A70     		strb	r2, [r3]
 189:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	unsigned char c;
 190:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	c = *GPIO_ODR_LOW;
 607              		.loc 1 190 0
 608 029c 0D4A     		ldr	r2, .L32
 609 029e 0F21     		movs	r1, #15
 610 02a0 7B18     		adds	r3, r7, r1
 611 02a2 1278     		ldrb	r2, [r2]
 612 02a4 1A70     		strb	r2, [r3]
 191:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	c &= (~B_SELECT & ~x); //~ bildar 1-komplement
 613              		.loc 1 191 0
 614 02a6 FB1D     		adds	r3, r7, #7
 615 02a8 1B78     		ldrb	r3, [r3]
 616 02aa DB43     		mvns	r3, r3
 617 02ac DBB2     		uxtb	r3, r3
 618 02ae 7A18     		adds	r2, r7, r1
 619 02b0 1278     		ldrb	r2, [r2]
 620 02b2 1340     		ands	r3, r2
 621 02b4 DAB2     		uxtb	r2, r3
 622 02b6 0800     		movs	r0, r1
 623 02b8 7B18     		adds	r3, r7, r1
 624 02ba 0421     		movs	r1, #4
 625 02bc 8A43     		bics	r2, r1
 626 02be 1A70     		strb	r2, [r3]
 192:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	*GPIO_ODR_LOW = c;
 627              		.loc 1 192 0
 628 02c0 044A     		ldr	r2, .L32
 629 02c2 0100     		movs	r1, r0
 630 02c4 7B18     		adds	r3, r7, r1
 631 02c6 1B78     		ldrb	r3, [r3]
 632 02c8 1370     		strb	r3, [r2]
 193:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 633              		.loc 1 193 0
 634 02ca C046     		nop
 635 02cc BD46     		mov	sp, r7
 636 02ce 04B0     		add	sp, sp, #16
 637              		@ sp needed
 638 02d0 80BD     		pop	{r7, pc}
 639              	.L33:
 640 02d2 C046     		.align	2
 641              	.L32:
 642 02d4 14100240 		.word	1073877012
 643              		.cfi_endproc
 644              	.LFE9:
 646              		.align	1
 647              		.global	select_controller
 648              		.syntax unified
 649              		.code	16
 650              		.thumb_func
 651              		.fpu softvfp
 653              	select_controller:
 654              	.LFB10:
 194:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 195:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void select_controller(uint8_t controller)
 196:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 655              		.loc 1 196 0
 656              		.cfi_startproc
 657              		@ args = 0, pretend = 0, frame = 8
 658              		@ frame_needed = 1, uses_anonymous_args = 0
 659 02d8 80B5     		push	{r7, lr}
 660              		.cfi_def_cfa_offset 8
 661              		.cfi_offset 7, -8
 662              		.cfi_offset 14, -4
 663 02da 82B0     		sub	sp, sp, #8
 664              		.cfi_def_cfa_offset 16
 665 02dc 00AF     		add	r7, sp, #0
 666              		.cfi_def_cfa_register 7
 667 02de 0200     		movs	r2, r0
 668 02e0 FB1D     		adds	r3, r7, #7
 669 02e2 1A70     		strb	r2, [r3]
 197:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	switch(controller){
 670              		.loc 1 197 0
 671 02e4 FB1D     		adds	r3, r7, #7
 672 02e6 1B78     		ldrb	r3, [r3]
 673 02e8 082B     		cmp	r3, #8
 674 02ea 0CD0     		beq	.L36
 675 02ec 02DC     		bgt	.L37
 676 02ee 002B     		cmp	r3, #0
 677 02f0 05D0     		beq	.L38
 198:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		case 0:
 199:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 				graphic_ctrl_bit_clear(B_CS1|B_CS2);
 200:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 				break;
 201:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		case B_CS1:
 202:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 				graphic_ctrl_bit_set(B_CS1);
 203:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 				graphic_ctrl_bit_clear(B_CS2);
 204:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 				break;
 205:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		case B_CS2:
 206:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 				graphic_ctrl_bit_set(B_CS2);
 207:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 				graphic_ctrl_bit_clear(B_CS1);
 208:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 				break;
 209:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		case B_CS1|B_CS2:
 210:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 				graphic_ctrl_bit_set(B_CS1|B_CS2);
 211:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 				break;
 212:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 213:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 678              		.loc 1 213 0
 679 02f2 1AE0     		b	.L41
 680              	.L37:
 197:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	switch(controller){
 681              		.loc 1 197 0
 682 02f4 102B     		cmp	r3, #16
 683 02f6 0DD0     		beq	.L39
 684 02f8 182B     		cmp	r3, #24
 685 02fa 12D0     		beq	.L40
 686              		.loc 1 213 0
 687 02fc 15E0     		b	.L41
 688              	.L38:
 199:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 				break;
 689              		.loc 1 199 0
 690 02fe 1820     		movs	r0, #24
 691 0300 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 200:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		case B_CS1:
 692              		.loc 1 200 0
 693 0304 11E0     		b	.L35
 694              	.L36:
 202:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 				graphic_ctrl_bit_clear(B_CS2);
 695              		.loc 1 202 0
 696 0306 0820     		movs	r0, #8
 697 0308 FFF7FEFF 		bl	graphic_ctrl_bit_set
 203:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 				break;
 698              		.loc 1 203 0
 699 030c 1020     		movs	r0, #16
 700 030e FFF7FEFF 		bl	graphic_ctrl_bit_clear
 204:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		case B_CS2:
 701              		.loc 1 204 0
 702 0312 0AE0     		b	.L35
 703              	.L39:
 206:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 				graphic_ctrl_bit_clear(B_CS1);
 704              		.loc 1 206 0
 705 0314 1020     		movs	r0, #16
 706 0316 FFF7FEFF 		bl	graphic_ctrl_bit_set
 207:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 				break;
 707              		.loc 1 207 0
 708 031a 0820     		movs	r0, #8
 709 031c FFF7FEFF 		bl	graphic_ctrl_bit_clear
 208:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		case B_CS1|B_CS2:
 710              		.loc 1 208 0
 711 0320 03E0     		b	.L35
 712              	.L40:
 210:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 				break;
 713              		.loc 1 210 0
 714 0322 1820     		movs	r0, #24
 715 0324 FFF7FEFF 		bl	graphic_ctrl_bit_set
 211:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 716              		.loc 1 211 0
 717 0328 C046     		nop
 718              	.L35:
 719              	.L41:
 720              		.loc 1 213 0
 721 032a C046     		nop
 722 032c BD46     		mov	sp, r7
 723 032e 02B0     		add	sp, sp, #8
 724              		@ sp needed
 725 0330 80BD     		pop	{r7, pc}
 726              		.cfi_endproc
 727              	.LFE10:
 729              		.align	1
 730              		.global	delay_milli
 731              		.syntax unified
 732              		.code	16
 733              		.thumb_func
 734              		.fpu softvfp
 736              	delay_milli:
 737              	.LFB11:
 214:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 215:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void delay_milli(int ms)
 216:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 738              		.loc 1 216 0
 739              		.cfi_startproc
 740              		@ args = 0, pretend = 0, frame = 8
 741              		@ frame_needed = 1, uses_anonymous_args = 0
 742 0332 80B5     		push	{r7, lr}
 743              		.cfi_def_cfa_offset 8
 744              		.cfi_offset 7, -8
 745              		.cfi_offset 14, -4
 746 0334 82B0     		sub	sp, sp, #8
 747              		.cfi_def_cfa_offset 16
 748 0336 00AF     		add	r7, sp, #0
 749              		.cfi_def_cfa_register 7
 750 0338 7860     		str	r0, [r7, #4]
 217:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	while(ms > 0)
 751              		.loc 1 217 0
 752 033a 05E0     		b	.L43
 753              	.L44:
 754              	.LBB2:
 218:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	{
 219:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	delay_micro(1);
 755              		.loc 1 219 0
 756 033c 0120     		movs	r0, #1
 757 033e FFF7FEFF 		bl	delay_micro
 220:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	ms--;
 758              		.loc 1 220 0
 759 0342 7B68     		ldr	r3, [r7, #4]
 760 0344 013B     		subs	r3, r3, #1
 761 0346 7B60     		str	r3, [r7, #4]
 762              	.L43:
 763              	.LBE2:
 217:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	while(ms > 0)
 764              		.loc 1 217 0
 765 0348 7B68     		ldr	r3, [r7, #4]
 766 034a 002B     		cmp	r3, #0
 767 034c F6DC     		bgt	.L44
 221:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 222:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 768              		.loc 1 222 0
 769 034e C046     		nop
 770 0350 BD46     		mov	sp, r7
 771 0352 02B0     		add	sp, sp, #8
 772              		@ sp needed
 773 0354 80BD     		pop	{r7, pc}
 774              		.cfi_endproc
 775              	.LFE11:
 777              		.align	1
 778              		.global	delay_micro
 779              		.syntax unified
 780              		.code	16
 781              		.thumb_func
 782              		.fpu softvfp
 784              	delay_micro:
 785              	.LFB12:
 223:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 224:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void delay_micro(int us)
 225:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 786              		.loc 1 225 0
 787              		.cfi_startproc
 788              		@ args = 0, pretend = 0, frame = 8
 789              		@ frame_needed = 1, uses_anonymous_args = 0
 790 0356 80B5     		push	{r7, lr}
 791              		.cfi_def_cfa_offset 8
 792              		.cfi_offset 7, -8
 793              		.cfi_offset 14, -4
 794 0358 82B0     		sub	sp, sp, #8
 795              		.cfi_def_cfa_offset 16
 796 035a 00AF     		add	r7, sp, #0
 797              		.cfi_def_cfa_register 7
 798 035c 7860     		str	r0, [r7, #4]
 226:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	while(us > 0)
 799              		.loc 1 226 0
 800 035e 0AE0     		b	.L46
 801              	.L47:
 802              	.LBB3:
 227:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	{
 228:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	delay_250ns();
 803              		.loc 1 228 0
 804 0360 FFF7FEFF 		bl	delay_250ns
 229:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	delay_250ns();
 805              		.loc 1 229 0
 806 0364 FFF7FEFF 		bl	delay_250ns
 230:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	delay_250ns();
 807              		.loc 1 230 0
 808 0368 FFF7FEFF 		bl	delay_250ns
 231:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	delay_250ns();
 809              		.loc 1 231 0
 810 036c FFF7FEFF 		bl	delay_250ns
 232:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	us--;
 811              		.loc 1 232 0
 812 0370 7B68     		ldr	r3, [r7, #4]
 813 0372 013B     		subs	r3, r3, #1
 814 0374 7B60     		str	r3, [r7, #4]
 815              	.L46:
 816              	.LBE3:
 226:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	{
 817              		.loc 1 226 0
 818 0376 7B68     		ldr	r3, [r7, #4]
 819 0378 002B     		cmp	r3, #0
 820 037a F1DC     		bgt	.L47
 233:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 234:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 821              		.loc 1 234 0
 822 037c C046     		nop
 823 037e BD46     		mov	sp, r7
 824 0380 02B0     		add	sp, sp, #8
 825              		@ sp needed
 826 0382 80BD     		pop	{r7, pc}
 827              		.cfi_endproc
 828              	.LFE12:
 830              		.align	1
 831              		.global	delay_250ns
 832              		.syntax unified
 833              		.code	16
 834              		.thumb_func
 835              		.fpu softvfp
 837              	delay_250ns:
 838              	.LFB13:
 235:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 236:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void delay_250ns(void)
 237:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 839              		.loc 1 237 0
 840              		.cfi_startproc
 841              		@ args = 0, pretend = 0, frame = 8
 842              		@ frame_needed = 1, uses_anonymous_args = 0
 843 0384 80B5     		push	{r7, lr}
 844              		.cfi_def_cfa_offset 8
 845              		.cfi_offset 7, -8
 846              		.cfi_offset 14, -4
 847 0386 82B0     		sub	sp, sp, #8
 848              		.cfi_def_cfa_offset 16
 849 0388 00AF     		add	r7, sp, #0
 850              		.cfi_def_cfa_register 7
 238:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	*STK_CTRL = 0;
 851              		.loc 1 238 0
 852 038a 104B     		ldr	r3, .L50
 853 038c 0022     		movs	r2, #0
 854 038e 1A60     		str	r2, [r3]
 239:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	*STK_LOAD = 0x29; //0x2A - 1
 855              		.loc 1 239 0
 856 0390 0F4B     		ldr	r3, .L50+4
 857 0392 2922     		movs	r2, #41
 858 0394 1A60     		str	r2, [r3]
 240:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	*STK_VAL = 0x0;
 859              		.loc 1 240 0
 860 0396 0F4B     		ldr	r3, .L50+8
 861 0398 0022     		movs	r2, #0
 862 039a 1A60     		str	r2, [r3]
 241:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	*STK_CTRL = 5;
 863              		.loc 1 241 0
 864 039c 0B4B     		ldr	r3, .L50
 865 039e 0522     		movs	r2, #5
 866 03a0 1A60     		str	r2, [r3]
 242:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	unsigned int ctrl = *STK_CTRL & 0x10000;
 867              		.loc 1 242 0
 868 03a2 0A4B     		ldr	r3, .L50
 869 03a4 1A68     		ldr	r2, [r3]
 870 03a6 8023     		movs	r3, #128
 871 03a8 5B02     		lsls	r3, r3, #9
 872 03aa 1340     		ands	r3, r2
 873 03ac 7B60     		str	r3, [r7, #4]
 243:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	while((*STK_CTRL & 0x10000) == 0);
 874              		.loc 1 243 0
 875 03ae C046     		nop
 876              	.L49:
 877              		.loc 1 243 0 is_stmt 0 discriminator 1
 878 03b0 064B     		ldr	r3, .L50
 879 03b2 1A68     		ldr	r2, [r3]
 880 03b4 8023     		movs	r3, #128
 881 03b6 5B02     		lsls	r3, r3, #9
 882 03b8 1340     		ands	r3, r2
 883 03ba F9D0     		beq	.L49
 244:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	*STK_CTRL= 0;
 884              		.loc 1 244 0 is_stmt 1
 885 03bc 034B     		ldr	r3, .L50
 886 03be 0022     		movs	r2, #0
 887 03c0 1A60     		str	r2, [r3]
 245:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	
 246:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 888              		.loc 1 246 0
 889 03c2 C046     		nop
 890 03c4 BD46     		mov	sp, r7
 891 03c6 02B0     		add	sp, sp, #8
 892              		@ sp needed
 893 03c8 80BD     		pop	{r7, pc}
 894              	.L51:
 895 03ca C046     		.align	2
 896              	.L50:
 897 03cc 10E000E0 		.word	-536813552
 898 03d0 14E000E0 		.word	-536813548
 899 03d4 18E000E0 		.word	-536813544
 900              		.cfi_endproc
 901              	.LFE13:
 903              		.align	1
 904              		.global	delay_500ns
 905              		.syntax unified
 906              		.code	16
 907              		.thumb_func
 908              		.fpu softvfp
 910              	delay_500ns:
 911              	.LFB14:
 247:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 248:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void delay_500ns(void)
 249:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 912              		.loc 1 249 0
 913              		.cfi_startproc
 914              		@ args = 0, pretend = 0, frame = 0
 915              		@ frame_needed = 1, uses_anonymous_args = 0
 916 03d8 80B5     		push	{r7, lr}
 917              		.cfi_def_cfa_offset 8
 918              		.cfi_offset 7, -8
 919              		.cfi_offset 14, -4
 920 03da 00AF     		add	r7, sp, #0
 921              		.cfi_def_cfa_register 7
 250:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	delay_250ns();
 922              		.loc 1 250 0
 923 03dc FFF7FEFF 		bl	delay_250ns
 251:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	delay_250ns();
 924              		.loc 1 251 0
 925 03e0 FFF7FEFF 		bl	delay_250ns
 252:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 926              		.loc 1 252 0
 927 03e4 C046     		nop
 928 03e6 BD46     		mov	sp, r7
 929              		@ sp needed
 930 03e8 80BD     		pop	{r7, pc}
 931              		.cfi_endproc
 932              	.LFE14:
 934              		.align	1
 935              		.global	graphic_initialize
 936              		.syntax unified
 937              		.code	16
 938              		.thumb_func
 939              		.fpu softvfp
 941              	graphic_initialize:
 942              	.LFB15:
 253:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 254:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void graphic_initialize(void)
 255:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 943              		.loc 1 255 0
 944              		.cfi_startproc
 945              		@ args = 0, pretend = 0, frame = 0
 946              		@ frame_needed = 1, uses_anonymous_args = 0
 947 03ea 80B5     		push	{r7, lr}
 948              		.cfi_def_cfa_offset 8
 949              		.cfi_offset 7, -8
 950              		.cfi_offset 14, -4
 951 03ec 00AF     		add	r7, sp, #0
 952              		.cfi_def_cfa_register 7
 256:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_ctrl_bit_set(B_E);
 953              		.loc 1 256 0
 954 03ee 4020     		movs	r0, #64
 955 03f0 FFF7FEFF 		bl	graphic_ctrl_bit_set
 257:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	delay_micro(10);
 956              		.loc 1 257 0
 957 03f4 0A20     		movs	r0, #10
 958 03f6 FFF7FEFF 		bl	delay_micro
 258:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_ctrl_bit_clear(B_CS1|B_CS2|B_RST|B_E);
 959              		.loc 1 258 0
 960 03fa 7820     		movs	r0, #120
 961 03fc FFF7FEFF 		bl	graphic_ctrl_bit_clear
 259:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	delay_milli(30);
 962              		.loc 1 259 0
 963 0400 1E20     		movs	r0, #30
 964 0402 FFF7FEFF 		bl	delay_milli
 260:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_ctrl_bit_set(B_RST);
 965              		.loc 1 260 0
 966 0406 2020     		movs	r0, #32
 967 0408 FFF7FEFF 		bl	graphic_ctrl_bit_set
 261:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	delay_milli(100);
 968              		.loc 1 261 0
 969 040c 6420     		movs	r0, #100
 970 040e FFF7FEFF 		bl	delay_milli
 262:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_write_command(LCD_OFF, B_CS1|B_CS2);
 971              		.loc 1 262 0
 972 0412 1821     		movs	r1, #24
 973 0414 3E20     		movs	r0, #62
 974 0416 FFF7FEFF 		bl	graphic_write_command
 263:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_write_command(LCD_ON, B_CS1|B_CS2);
 975              		.loc 1 263 0
 976 041a 1821     		movs	r1, #24
 977 041c 3F20     		movs	r0, #63
 978 041e FFF7FEFF 		bl	graphic_write_command
 264:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_write_command(LCD_DISP_START, B_CS1|B_CS2);
 979              		.loc 1 264 0
 980 0422 1821     		movs	r1, #24
 981 0424 C020     		movs	r0, #192
 982 0426 FFF7FEFF 		bl	graphic_write_command
 265:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_write_command(LCD_SET_ADD, B_CS1|B_CS2);
 983              		.loc 1 265 0
 984 042a 1821     		movs	r1, #24
 985 042c 4020     		movs	r0, #64
 986 042e FFF7FEFF 		bl	graphic_write_command
 266:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_write_command(LCD_SET_PAGE, B_CS1|B_CS2);
 987              		.loc 1 266 0
 988 0432 1821     		movs	r1, #24
 989 0434 B820     		movs	r0, #184
 990 0436 FFF7FEFF 		bl	graphic_write_command
 267:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	select_controller(0);
 991              		.loc 1 267 0
 992 043a 0020     		movs	r0, #0
 993 043c FFF7FEFF 		bl	select_controller
 268:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 994              		.loc 1 268 0
 995 0440 C046     		nop
 996 0442 BD46     		mov	sp, r7
 997              		@ sp needed
 998 0444 80BD     		pop	{r7, pc}
 999              		.cfi_endproc
 1000              	.LFE15:
 1002              		.align	1
 1003              		.global	graphic_clear_screen
 1004              		.syntax unified
 1005              		.code	16
 1006              		.thumb_func
 1007              		.fpu softvfp
 1009              	graphic_clear_screen:
 1010              	.LFB16:
 269:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 270:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void graphic_clear_screen(void)
 271:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 1011              		.loc 1 271 0
 1012              		.cfi_startproc
 1013              		@ args = 0, pretend = 0, frame = 8
 1014              		@ frame_needed = 1, uses_anonymous_args = 0
 1015 0446 80B5     		push	{r7, lr}
 1016              		.cfi_def_cfa_offset 8
 1017              		.cfi_offset 7, -8
 1018              		.cfi_offset 14, -4
 1019 0448 82B0     		sub	sp, sp, #8
 1020              		.cfi_def_cfa_offset 16
 1021 044a 00AF     		add	r7, sp, #0
 1022              		.cfi_def_cfa_register 7
 1023              	.LBB4:
 272:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	for(unsigned int page = 0; page < 8; page++)
 1024              		.loc 1 272 0
 1025 044c 0023     		movs	r3, #0
 1026 044e 7B60     		str	r3, [r7, #4]
 1027 0450 1DE0     		b	.L55
 1028              	.L58:
 273:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	{
 274:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		graphic_write_command(LCD_SET_PAGE|page,B_CS1|B_CS2);
 1029              		.loc 1 274 0
 1030 0452 7B68     		ldr	r3, [r7, #4]
 1031 0454 DBB2     		uxtb	r3, r3
 1032 0456 4822     		movs	r2, #72
 1033 0458 5242     		rsbs	r2, r2, #0
 1034 045a 1343     		orrs	r3, r2
 1035 045c DBB2     		uxtb	r3, r3
 1036 045e 1821     		movs	r1, #24
 1037 0460 1800     		movs	r0, r3
 1038 0462 FFF7FEFF 		bl	graphic_write_command
 275:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		graphic_write_command(LCD_SET_ADD|0,B_CS1|B_CS2);
 1039              		.loc 1 275 0
 1040 0466 1821     		movs	r1, #24
 1041 0468 4020     		movs	r0, #64
 1042 046a FFF7FEFF 		bl	graphic_write_command
 1043              	.LBB5:
 276:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		for(unsigned int add = 0; add<64;add++)
 1044              		.loc 1 276 0
 1045 046e 0023     		movs	r3, #0
 1046 0470 3B60     		str	r3, [r7]
 1047 0472 06E0     		b	.L56
 1048              	.L57:
 277:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		{
 278:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 			graphic_write_data(0, B_CS1|B_CS2);
 1049              		.loc 1 278 0 discriminator 3
 1050 0474 1821     		movs	r1, #24
 1051 0476 0020     		movs	r0, #0
 1052 0478 FFF7FEFF 		bl	graphic_write_data
 276:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		for(unsigned int add = 0; add<64;add++)
 1053              		.loc 1 276 0 discriminator 3
 1054 047c 3B68     		ldr	r3, [r7]
 1055 047e 0133     		adds	r3, r3, #1
 1056 0480 3B60     		str	r3, [r7]
 1057              	.L56:
 276:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		for(unsigned int add = 0; add<64;add++)
 1058              		.loc 1 276 0 is_stmt 0 discriminator 1
 1059 0482 3B68     		ldr	r3, [r7]
 1060 0484 3F2B     		cmp	r3, #63
 1061 0486 F5D9     		bls	.L57
 1062              	.LBE5:
 272:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	{
 1063              		.loc 1 272 0 is_stmt 1 discriminator 2
 1064 0488 7B68     		ldr	r3, [r7, #4]
 1065 048a 0133     		adds	r3, r3, #1
 1066 048c 7B60     		str	r3, [r7, #4]
 1067              	.L55:
 272:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	{
 1068              		.loc 1 272 0 is_stmt 0 discriminator 1
 1069 048e 7B68     		ldr	r3, [r7, #4]
 1070 0490 072B     		cmp	r3, #7
 1071 0492 DED9     		bls	.L58
 1072              	.LBE4:
 279:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		}
 280:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 281:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 1073              		.loc 1 281 0 is_stmt 1
 1074 0494 C046     		nop
 1075 0496 BD46     		mov	sp, r7
 1076 0498 02B0     		add	sp, sp, #8
 1077              		@ sp needed
 1078 049a 80BD     		pop	{r7, pc}
 1079              		.cfi_endproc
 1080              	.LFE16:
 1082              		.align	1
 1083              		.global	pixel
 1084              		.syntax unified
 1085              		.code	16
 1086              		.thumb_func
 1087              		.fpu softvfp
 1089              	pixel:
 1090              	.LFB17:
 282:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 283:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void pixel(int x, int y, int set)
 284:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 1091              		.loc 1 284 0
 1092              		.cfi_startproc
 1093              		@ args = 0, pretend = 0, frame = 32
 1094              		@ frame_needed = 1, uses_anonymous_args = 0
 1095 049c B0B5     		push	{r4, r5, r7, lr}
 1096              		.cfi_def_cfa_offset 16
 1097              		.cfi_offset 4, -16
 1098              		.cfi_offset 5, -12
 1099              		.cfi_offset 7, -8
 1100              		.cfi_offset 14, -4
 1101 049e 88B0     		sub	sp, sp, #32
 1102              		.cfi_def_cfa_offset 48
 1103 04a0 00AF     		add	r7, sp, #0
 1104              		.cfi_def_cfa_register 7
 1105 04a2 F860     		str	r0, [r7, #12]
 1106 04a4 B960     		str	r1, [r7, #8]
 1107 04a6 7A60     		str	r2, [r7, #4]
 285:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	uint8_t mask, c, controller;
 286:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	int index;
 287:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	
 288:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	if((x < 1) || (y < 1) || (x > 128) || (y > 64)) return;
 1108              		.loc 1 288 0
 1109 04a8 FB68     		ldr	r3, [r7, #12]
 1110 04aa 002B     		cmp	r3, #0
 1111 04ac 00DC     		bgt	.LCB878
 1112 04ae B6E0     		b	.L80	@long jump
 1113              	.LCB878:
 1114              		.loc 1 288 0 is_stmt 0 discriminator 1
 1115 04b0 BB68     		ldr	r3, [r7, #8]
 1116 04b2 002B     		cmp	r3, #0
 1117 04b4 00DC     		bgt	.LCB881
 1118 04b6 B2E0     		b	.L80	@long jump
 1119              	.LCB881:
 1120              		.loc 1 288 0 discriminator 2
 1121 04b8 FB68     		ldr	r3, [r7, #12]
 1122 04ba 802B     		cmp	r3, #128
 1123 04bc 00DD     		ble	.LCB884
 1124 04be AEE0     		b	.L80	@long jump
 1125              	.LCB884:
 1126              		.loc 1 288 0 discriminator 3
 1127 04c0 BB68     		ldr	r3, [r7, #8]
 1128 04c2 402B     		cmp	r3, #64
 1129 04c4 00DD     		ble	.LCB887
 1130 04c6 AAE0     		b	.L80	@long jump
 1131              	.LCB887:
 289:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	
 290:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	index = (y-1)/8;
 1132              		.loc 1 290 0 is_stmt 1
 1133 04c8 BB68     		ldr	r3, [r7, #8]
 1134 04ca 013B     		subs	r3, r3, #1
 1135 04cc 002B     		cmp	r3, #0
 1136 04ce 00DA     		bge	.L63
 1137 04d0 0733     		adds	r3, r3, #7
 1138              	.L63:
 1139 04d2 DB10     		asrs	r3, r3, #3
 1140 04d4 BB61     		str	r3, [r7, #24]
 291:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	
 292:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	switch((y-1)%8){
 1141              		.loc 1 292 0
 1142 04d6 BB68     		ldr	r3, [r7, #8]
 1143 04d8 013B     		subs	r3, r3, #1
 1144 04da 534A     		ldr	r2, .L81
 1145 04dc 1340     		ands	r3, r2
 1146 04de 04D5     		bpl	.L64
 1147 04e0 013B     		subs	r3, r3, #1
 1148 04e2 0822     		movs	r2, #8
 1149 04e4 5242     		rsbs	r2, r2, #0
 1150 04e6 1343     		orrs	r3, r2
 1151 04e8 0133     		adds	r3, r3, #1
 1152              	.L64:
 1153 04ea 072B     		cmp	r3, #7
 1154 04ec 2CD8     		bhi	.L65
 1155 04ee 9A00     		lsls	r2, r3, #2
 1156 04f0 4E4B     		ldr	r3, .L81+4
 1157 04f2 D318     		adds	r3, r2, r3
 1158 04f4 1B68     		ldr	r3, [r3]
 1159 04f6 9F46     		mov	pc, r3
 1160              		.section	.rodata
 1161              		.align	2
 1162              	.L67:
 1163 0000 F8040000 		.word	.L66
 1164 0004 02050000 		.word	.L68
 1165 0008 0C050000 		.word	.L69
 1166 000c 16050000 		.word	.L70
 1167 0010 20050000 		.word	.L71
 1168 0014 2A050000 		.word	.L72
 1169 0018 34050000 		.word	.L73
 1170 001c 3E050000 		.word	.L74
 1171              		.text
 1172              	.L66:
 293:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		case 0: mask = 1; break;
 1173              		.loc 1 293 0
 1174 04f8 1F23     		movs	r3, #31
 1175 04fa FB18     		adds	r3, r7, r3
 1176 04fc 0122     		movs	r2, #1
 1177 04fe 1A70     		strb	r2, [r3]
 1178 0500 22E0     		b	.L65
 1179              	.L68:
 294:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		case 1: mask = 2; break;
 1180              		.loc 1 294 0
 1181 0502 1F23     		movs	r3, #31
 1182 0504 FB18     		adds	r3, r7, r3
 1183 0506 0222     		movs	r2, #2
 1184 0508 1A70     		strb	r2, [r3]
 1185 050a 1DE0     		b	.L65
 1186              	.L69:
 295:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		case 2: mask = 4; break;
 1187              		.loc 1 295 0
 1188 050c 1F23     		movs	r3, #31
 1189 050e FB18     		adds	r3, r7, r3
 1190 0510 0422     		movs	r2, #4
 1191 0512 1A70     		strb	r2, [r3]
 1192 0514 18E0     		b	.L65
 1193              	.L70:
 296:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		case 3: mask = 8; break;
 1194              		.loc 1 296 0
 1195 0516 1F23     		movs	r3, #31
 1196 0518 FB18     		adds	r3, r7, r3
 1197 051a 0822     		movs	r2, #8
 1198 051c 1A70     		strb	r2, [r3]
 1199 051e 13E0     		b	.L65
 1200              	.L71:
 297:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		case 4: mask = 0x10; break;
 1201              		.loc 1 297 0
 1202 0520 1F23     		movs	r3, #31
 1203 0522 FB18     		adds	r3, r7, r3
 1204 0524 1022     		movs	r2, #16
 1205 0526 1A70     		strb	r2, [r3]
 1206 0528 0EE0     		b	.L65
 1207              	.L72:
 298:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		case 5: mask = 0x20; break;
 1208              		.loc 1 298 0
 1209 052a 1F23     		movs	r3, #31
 1210 052c FB18     		adds	r3, r7, r3
 1211 052e 2022     		movs	r2, #32
 1212 0530 1A70     		strb	r2, [r3]
 1213 0532 09E0     		b	.L65
 1214              	.L73:
 299:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		case 6: mask = 0x40; break;
 1215              		.loc 1 299 0
 1216 0534 1F23     		movs	r3, #31
 1217 0536 FB18     		adds	r3, r7, r3
 1218 0538 4022     		movs	r2, #64
 1219 053a 1A70     		strb	r2, [r3]
 1220 053c 04E0     		b	.L65
 1221              	.L74:
 300:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		case 7: mask = 0x80; break;
 1222              		.loc 1 300 0
 1223 053e 1F23     		movs	r3, #31
 1224 0540 FB18     		adds	r3, r7, r3
 1225 0542 8022     		movs	r2, #128
 1226 0544 1A70     		strb	r2, [r3]
 1227 0546 C046     		nop
 1228              	.L65:
 301:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 302:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	
 303:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	if(set == 0){
 1229              		.loc 1 303 0
 1230 0548 7B68     		ldr	r3, [r7, #4]
 1231 054a 002B     		cmp	r3, #0
 1232 054c 05D1     		bne	.L75
 304:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		mask = ~mask;
 1233              		.loc 1 304 0
 1234 054e 1F22     		movs	r2, #31
 1235 0550 BB18     		adds	r3, r7, r2
 1236 0552 BA18     		adds	r2, r7, r2
 1237 0554 1278     		ldrb	r2, [r2]
 1238 0556 D243     		mvns	r2, r2
 1239 0558 1A70     		strb	r2, [r3]
 1240              	.L75:
 305:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 306:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	if(x>64){
 1241              		.loc 1 306 0
 1242 055a FB68     		ldr	r3, [r7, #12]
 1243 055c 402B     		cmp	r3, #64
 1244 055e 07DD     		ble	.L76
 307:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		controller = B_CS2;
 1245              		.loc 1 307 0
 1246 0560 1E23     		movs	r3, #30
 1247 0562 FB18     		adds	r3, r7, r3
 1248 0564 1022     		movs	r2, #16
 1249 0566 1A70     		strb	r2, [r3]
 308:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		x = x - 65;
 1250              		.loc 1 308 0
 1251 0568 FB68     		ldr	r3, [r7, #12]
 1252 056a 413B     		subs	r3, r3, #65
 1253 056c FB60     		str	r3, [r7, #12]
 1254 056e 06E0     		b	.L77
 1255              	.L76:
 309:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}else{
 310:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		controller = B_CS1;
 1256              		.loc 1 310 0
 1257 0570 1E23     		movs	r3, #30
 1258 0572 FB18     		adds	r3, r7, r3
 1259 0574 0822     		movs	r2, #8
 1260 0576 1A70     		strb	r2, [r3]
 311:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		x = x-1;
 1261              		.loc 1 311 0
 1262 0578 FB68     		ldr	r3, [r7, #12]
 1263 057a 013B     		subs	r3, r3, #1
 1264 057c FB60     		str	r3, [r7, #12]
 1265              	.L77:
 312:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 313:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	
 314:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_write_command(LCD_SET_ADD | x,controller);
 1266              		.loc 1 314 0
 1267 057e FB68     		ldr	r3, [r7, #12]
 1268 0580 5BB2     		sxtb	r3, r3
 1269 0582 4022     		movs	r2, #64
 1270 0584 1343     		orrs	r3, r2
 1271 0586 5BB2     		sxtb	r3, r3
 1272 0588 DAB2     		uxtb	r2, r3
 1273 058a 1E25     		movs	r5, #30
 1274 058c 7B19     		adds	r3, r7, r5
 1275 058e 1B78     		ldrb	r3, [r3]
 1276 0590 1900     		movs	r1, r3
 1277 0592 1000     		movs	r0, r2
 1278 0594 FFF7FEFF 		bl	graphic_write_command
 315:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_write_command(LCD_SET_PAGE| index, controller);
 1279              		.loc 1 315 0
 1280 0598 BB69     		ldr	r3, [r7, #24]
 1281 059a 5BB2     		sxtb	r3, r3
 1282 059c 4822     		movs	r2, #72
 1283 059e 5242     		rsbs	r2, r2, #0
 1284 05a0 1343     		orrs	r3, r2
 1285 05a2 5BB2     		sxtb	r3, r3
 1286 05a4 DAB2     		uxtb	r2, r3
 1287 05a6 7B19     		adds	r3, r7, r5
 1288 05a8 1B78     		ldrb	r3, [r3]
 1289 05aa 1900     		movs	r1, r3
 1290 05ac 1000     		movs	r0, r2
 1291 05ae FFF7FEFF 		bl	graphic_write_command
 316:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	c = graphic_read_data(controller);
 1292              		.loc 1 316 0
 1293 05b2 1723     		movs	r3, #23
 1294 05b4 FC18     		adds	r4, r7, r3
 1295 05b6 7B19     		adds	r3, r7, r5
 1296 05b8 1B78     		ldrb	r3, [r3]
 1297 05ba 1800     		movs	r0, r3
 1298 05bc FFF7FEFF 		bl	graphic_read_data
 1299 05c0 0300     		movs	r3, r0
 1300 05c2 2370     		strb	r3, [r4]
 317:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_write_command(LCD_SET_ADD| x, controller);
 1301              		.loc 1 317 0
 1302 05c4 FB68     		ldr	r3, [r7, #12]
 1303 05c6 5BB2     		sxtb	r3, r3
 1304 05c8 4022     		movs	r2, #64
 1305 05ca 1343     		orrs	r3, r2
 1306 05cc 5BB2     		sxtb	r3, r3
 1307 05ce DAB2     		uxtb	r2, r3
 1308 05d0 7B19     		adds	r3, r7, r5
 1309 05d2 1B78     		ldrb	r3, [r3]
 1310 05d4 1900     		movs	r1, r3
 1311 05d6 1000     		movs	r0, r2
 1312 05d8 FFF7FEFF 		bl	graphic_write_command
 318:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	
 319:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	if(set){
 1313              		.loc 1 319 0
 1314 05dc 7B68     		ldr	r3, [r7, #4]
 1315 05de 002B     		cmp	r3, #0
 1316 05e0 09D0     		beq	.L78
 320:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		mask = mask | c;
 1317              		.loc 1 320 0
 1318 05e2 1F22     		movs	r2, #31
 1319 05e4 BB18     		adds	r3, r7, r2
 1320 05e6 B918     		adds	r1, r7, r2
 1321 05e8 1722     		movs	r2, #23
 1322 05ea BA18     		adds	r2, r7, r2
 1323 05ec 0978     		ldrb	r1, [r1]
 1324 05ee 1278     		ldrb	r2, [r2]
 1325 05f0 0A43     		orrs	r2, r1
 1326 05f2 1A70     		strb	r2, [r3]
 1327 05f4 08E0     		b	.L79
 1328              	.L78:
 321:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}else{
 322:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		mask = mask & c;
 1329              		.loc 1 322 0
 1330 05f6 1F22     		movs	r2, #31
 1331 05f8 BB18     		adds	r3, r7, r2
 1332 05fa BA18     		adds	r2, r7, r2
 1333 05fc 1721     		movs	r1, #23
 1334 05fe 7918     		adds	r1, r7, r1
 1335 0600 1278     		ldrb	r2, [r2]
 1336 0602 0978     		ldrb	r1, [r1]
 1337 0604 0A40     		ands	r2, r1
 1338 0606 1A70     		strb	r2, [r3]
 1339              	.L79:
 323:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 324:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_write_data(mask, controller);
 1340              		.loc 1 324 0
 1341 0608 1E23     		movs	r3, #30
 1342 060a FB18     		adds	r3, r7, r3
 1343 060c 1A78     		ldrb	r2, [r3]
 1344 060e 1F23     		movs	r3, #31
 1345 0610 FB18     		adds	r3, r7, r3
 1346 0612 1B78     		ldrb	r3, [r3]
 1347 0614 1100     		movs	r1, r2
 1348 0616 1800     		movs	r0, r3
 1349 0618 FFF7FEFF 		bl	graphic_write_data
 1350 061c 00E0     		b	.L59
 1351              	.L80:
 288:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	
 1352              		.loc 1 288 0
 1353 061e C046     		nop
 1354              	.L59:
 325:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 1355              		.loc 1 325 0
 1356 0620 BD46     		mov	sp, r7
 1357 0622 08B0     		add	sp, sp, #32
 1358              		@ sp needed
 1359 0624 B0BD     		pop	{r4, r5, r7, pc}
 1360              	.L82:
 1361 0626 C046     		.align	2
 1362              	.L81:
 1363 0628 07000080 		.word	-2147483641
 1364 062c 00000000 		.word	.L67
 1365              		.cfi_endproc
 1366              	.LFE17:
 1368              		.align	1
 1369              		.global	draw_object
 1370              		.syntax unified
 1371              		.code	16
 1372              		.thumb_func
 1373              		.fpu softvfp
 1375              	draw_object:
 1376              	.LFB18:
 326:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 327:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void draw_object(POBJECT obj)
 328:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 1377              		.loc 1 328 0
 1378              		.cfi_startproc
 1379              		@ args = 0, pretend = 0, frame = 16
 1380              		@ frame_needed = 1, uses_anonymous_args = 0
 1381 0630 B0B5     		push	{r4, r5, r7, lr}
 1382              		.cfi_def_cfa_offset 16
 1383              		.cfi_offset 4, -16
 1384              		.cfi_offset 5, -12
 1385              		.cfi_offset 7, -8
 1386              		.cfi_offset 14, -4
 1387 0632 84B0     		sub	sp, sp, #16
 1388              		.cfi_def_cfa_offset 32
 1389 0634 00AF     		add	r7, sp, #0
 1390              		.cfi_def_cfa_register 7
 1391 0636 7860     		str	r0, [r7, #4]
 329:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	uint8_t p;
 330:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	uint8_t n = obj->geo->numpoints;
 1392              		.loc 1 330 0
 1393 0638 7B68     		ldr	r3, [r7, #4]
 1394 063a 1B68     		ldr	r3, [r3]
 1395 063c 1A68     		ldr	r2, [r3]
 1396 063e 0E23     		movs	r3, #14
 1397 0640 FB18     		adds	r3, r7, r3
 1398 0642 1A70     		strb	r2, [r3]
 331:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	uint8_t x_coord;
 332:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	uint8_t y_coord;
 333:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	
 334:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	POINT s;
 335:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	for(p = 0; p<n; p++){
 1399              		.loc 1 335 0
 1400 0644 0F23     		movs	r3, #15
 1401 0646 FB18     		adds	r3, r7, r3
 1402 0648 0022     		movs	r2, #0
 1403 064a 1A70     		strb	r2, [r3]
 1404 064c 2DE0     		b	.L84
 1405              	.L85:
 336:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		//s = obj -> geo -> px[p];
 337:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		x_coord  = obj->posx + obj->geo->px[p].x;
 1406              		.loc 1 337 0 discriminator 3
 1407 064e 7B68     		ldr	r3, [r7, #4]
 1408 0650 DB68     		ldr	r3, [r3, #12]
 1409 0652 D9B2     		uxtb	r1, r3
 1410 0654 7B68     		ldr	r3, [r7, #4]
 1411 0656 1A68     		ldr	r2, [r3]
 1412 0658 0F24     		movs	r4, #15
 1413 065a 3B19     		adds	r3, r7, r4
 1414 065c 1B78     		ldrb	r3, [r3]
 1415 065e 0433     		adds	r3, r3, #4
 1416 0660 5B00     		lsls	r3, r3, #1
 1417 0662 D318     		adds	r3, r2, r3
 1418 0664 0433     		adds	r3, r3, #4
 1419 0666 1A78     		ldrb	r2, [r3]
 1420 0668 0D20     		movs	r0, #13
 1421 066a 3B18     		adds	r3, r7, r0
 1422 066c 8A18     		adds	r2, r1, r2
 1423 066e 1A70     		strb	r2, [r3]
 338:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		y_coord = obj->posy + obj->geo->px[p].y;
 1424              		.loc 1 338 0 discriminator 3
 1425 0670 7B68     		ldr	r3, [r7, #4]
 1426 0672 1B69     		ldr	r3, [r3, #16]
 1427 0674 D9B2     		uxtb	r1, r3
 1428 0676 7B68     		ldr	r3, [r7, #4]
 1429 0678 1A68     		ldr	r2, [r3]
 1430 067a 3B19     		adds	r3, r7, r4
 1431 067c 1B78     		ldrb	r3, [r3]
 1432 067e 0433     		adds	r3, r3, #4
 1433 0680 5B00     		lsls	r3, r3, #1
 1434 0682 D318     		adds	r3, r2, r3
 1435 0684 0533     		adds	r3, r3, #5
 1436 0686 1A78     		ldrb	r2, [r3]
 1437 0688 0C25     		movs	r5, #12
 1438 068a 7B19     		adds	r3, r7, r5
 1439 068c 8A18     		adds	r2, r1, r2
 1440 068e 1A70     		strb	r2, [r3]
 339:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		//point = obj->geo->px;
 340:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		//pixel(s.x, s.y,1);
 341:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		pixel(x_coord,y_coord,1);
 1441              		.loc 1 341 0 discriminator 3
 1442 0690 3B18     		adds	r3, r7, r0
 1443 0692 1878     		ldrb	r0, [r3]
 1444 0694 7B19     		adds	r3, r7, r5
 1445 0696 1B78     		ldrb	r3, [r3]
 1446 0698 0122     		movs	r2, #1
 1447 069a 1900     		movs	r1, r3
 1448 069c FFF7FEFF 		bl	pixel
 335:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		//s = obj -> geo -> px[p];
 1449              		.loc 1 335 0 discriminator 3
 1450 06a0 3B19     		adds	r3, r7, r4
 1451 06a2 1A78     		ldrb	r2, [r3]
 1452 06a4 3B19     		adds	r3, r7, r4
 1453 06a6 0132     		adds	r2, r2, #1
 1454 06a8 1A70     		strb	r2, [r3]
 1455              	.L84:
 335:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		//s = obj -> geo -> px[p];
 1456              		.loc 1 335 0 is_stmt 0 discriminator 1
 1457 06aa 0F23     		movs	r3, #15
 1458 06ac FA18     		adds	r2, r7, r3
 1459 06ae 0E23     		movs	r3, #14
 1460 06b0 FB18     		adds	r3, r7, r3
 1461 06b2 1278     		ldrb	r2, [r2]
 1462 06b4 1B78     		ldrb	r3, [r3]
 1463 06b6 9A42     		cmp	r2, r3
 1464 06b8 C9D3     		bcc	.L85
 342:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 343:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 1465              		.loc 1 343 0 is_stmt 1
 1466 06ba C046     		nop
 1467 06bc BD46     		mov	sp, r7
 1468 06be 04B0     		add	sp, sp, #16
 1469              		@ sp needed
 1470 06c0 B0BD     		pop	{r4, r5, r7, pc}
 1471              		.cfi_endproc
 1472              	.LFE18:
 1474              		.align	1
 1475              		.global	clear_object
 1476              		.syntax unified
 1477              		.code	16
 1478              		.thumb_func
 1479              		.fpu softvfp
 1481              	clear_object:
 1482              	.LFB19:
 344:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 345:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void clear_object(POBJECT obj)
 346:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 1483              		.loc 1 346 0
 1484              		.cfi_startproc
 1485              		@ args = 0, pretend = 0, frame = 16
 1486              		@ frame_needed = 1, uses_anonymous_args = 0
 1487 06c2 B0B5     		push	{r4, r5, r7, lr}
 1488              		.cfi_def_cfa_offset 16
 1489              		.cfi_offset 4, -16
 1490              		.cfi_offset 5, -12
 1491              		.cfi_offset 7, -8
 1492              		.cfi_offset 14, -4
 1493 06c4 84B0     		sub	sp, sp, #16
 1494              		.cfi_def_cfa_offset 32
 1495 06c6 00AF     		add	r7, sp, #0
 1496              		.cfi_def_cfa_register 7
 1497 06c8 7860     		str	r0, [r7, #4]
 347:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	uint8_t p;
 348:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	uint8_t n = obj->geo->numpoints;
 1498              		.loc 1 348 0
 1499 06ca 7B68     		ldr	r3, [r7, #4]
 1500 06cc 1B68     		ldr	r3, [r3]
 1501 06ce 1A68     		ldr	r2, [r3]
 1502 06d0 0E23     		movs	r3, #14
 1503 06d2 FB18     		adds	r3, r7, r3
 1504 06d4 1A70     		strb	r2, [r3]
 349:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	uint8_t x_coord;
 350:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	uint8_t y_coord;
 351:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	for(p = 0; p<n; p++){
 1505              		.loc 1 351 0
 1506 06d6 0F23     		movs	r3, #15
 1507 06d8 FB18     		adds	r3, r7, r3
 1508 06da 0022     		movs	r2, #0
 1509 06dc 1A70     		strb	r2, [r3]
 1510 06de 2DE0     		b	.L87
 1511              	.L88:
 352:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		x_coord  = obj->posx + obj->geo->px[p].x;
 1512              		.loc 1 352 0 discriminator 3
 1513 06e0 7B68     		ldr	r3, [r7, #4]
 1514 06e2 DB68     		ldr	r3, [r3, #12]
 1515 06e4 D9B2     		uxtb	r1, r3
 1516 06e6 7B68     		ldr	r3, [r7, #4]
 1517 06e8 1A68     		ldr	r2, [r3]
 1518 06ea 0F24     		movs	r4, #15
 1519 06ec 3B19     		adds	r3, r7, r4
 1520 06ee 1B78     		ldrb	r3, [r3]
 1521 06f0 0433     		adds	r3, r3, #4
 1522 06f2 5B00     		lsls	r3, r3, #1
 1523 06f4 D318     		adds	r3, r2, r3
 1524 06f6 0433     		adds	r3, r3, #4
 1525 06f8 1A78     		ldrb	r2, [r3]
 1526 06fa 0D20     		movs	r0, #13
 1527 06fc 3B18     		adds	r3, r7, r0
 1528 06fe 8A18     		adds	r2, r1, r2
 1529 0700 1A70     		strb	r2, [r3]
 353:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		y_coord = obj->posy + obj->geo->px[p].y;
 1530              		.loc 1 353 0 discriminator 3
 1531 0702 7B68     		ldr	r3, [r7, #4]
 1532 0704 1B69     		ldr	r3, [r3, #16]
 1533 0706 D9B2     		uxtb	r1, r3
 1534 0708 7B68     		ldr	r3, [r7, #4]
 1535 070a 1A68     		ldr	r2, [r3]
 1536 070c 3B19     		adds	r3, r7, r4
 1537 070e 1B78     		ldrb	r3, [r3]
 1538 0710 0433     		adds	r3, r3, #4
 1539 0712 5B00     		lsls	r3, r3, #1
 1540 0714 D318     		adds	r3, r2, r3
 1541 0716 0533     		adds	r3, r3, #5
 1542 0718 1A78     		ldrb	r2, [r3]
 1543 071a 0C25     		movs	r5, #12
 1544 071c 7B19     		adds	r3, r7, r5
 1545 071e 8A18     		adds	r2, r1, r2
 1546 0720 1A70     		strb	r2, [r3]
 354:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		pixel(x_coord,y_coord,0);
 1547              		.loc 1 354 0 discriminator 3
 1548 0722 3B18     		adds	r3, r7, r0
 1549 0724 1878     		ldrb	r0, [r3]
 1550 0726 7B19     		adds	r3, r7, r5
 1551 0728 1B78     		ldrb	r3, [r3]
 1552 072a 0022     		movs	r2, #0
 1553 072c 1900     		movs	r1, r3
 1554 072e FFF7FEFF 		bl	pixel
 351:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		x_coord  = obj->posx + obj->geo->px[p].x;
 1555              		.loc 1 351 0 discriminator 3
 1556 0732 3B19     		adds	r3, r7, r4
 1557 0734 1A78     		ldrb	r2, [r3]
 1558 0736 3B19     		adds	r3, r7, r4
 1559 0738 0132     		adds	r2, r2, #1
 1560 073a 1A70     		strb	r2, [r3]
 1561              	.L87:
 351:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		x_coord  = obj->posx + obj->geo->px[p].x;
 1562              		.loc 1 351 0 is_stmt 0 discriminator 1
 1563 073c 0F23     		movs	r3, #15
 1564 073e FA18     		adds	r2, r7, r3
 1565 0740 0E23     		movs	r3, #14
 1566 0742 FB18     		adds	r3, r7, r3
 1567 0744 1278     		ldrb	r2, [r2]
 1568 0746 1B78     		ldrb	r3, [r3]
 1569 0748 9A42     		cmp	r2, r3
 1570 074a C9D3     		bcc	.L88
 355:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 356:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 1571              		.loc 1 356 0 is_stmt 1
 1572 074c C046     		nop
 1573 074e BD46     		mov	sp, r7
 1574 0750 04B0     		add	sp, sp, #16
 1575              		@ sp needed
 1576 0752 B0BD     		pop	{r4, r5, r7, pc}
 1577              		.cfi_endproc
 1578              	.LFE19:
 1580              		.align	1
 1581              		.global	set_object_speed
 1582              		.syntax unified
 1583              		.code	16
 1584              		.thumb_func
 1585              		.fpu softvfp
 1587              	set_object_speed:
 1588              	.LFB20:
 357:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 358:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void set_object_speed(POBJECT o, int speedx, int speedy){
 1589              		.loc 1 358 0
 1590              		.cfi_startproc
 1591              		@ args = 0, pretend = 0, frame = 16
 1592              		@ frame_needed = 1, uses_anonymous_args = 0
 1593 0754 80B5     		push	{r7, lr}
 1594              		.cfi_def_cfa_offset 8
 1595              		.cfi_offset 7, -8
 1596              		.cfi_offset 14, -4
 1597 0756 84B0     		sub	sp, sp, #16
 1598              		.cfi_def_cfa_offset 24
 1599 0758 00AF     		add	r7, sp, #0
 1600              		.cfi_def_cfa_register 7
 1601 075a F860     		str	r0, [r7, #12]
 1602 075c B960     		str	r1, [r7, #8]
 1603 075e 7A60     		str	r2, [r7, #4]
 359:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	o->dirx = speedx;
 1604              		.loc 1 359 0
 1605 0760 FB68     		ldr	r3, [r7, #12]
 1606 0762 BA68     		ldr	r2, [r7, #8]
 1607 0764 5A60     		str	r2, [r3, #4]
 360:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	o->diry = speedy;
 1608              		.loc 1 360 0
 1609 0766 FB68     		ldr	r3, [r7, #12]
 1610 0768 7A68     		ldr	r2, [r7, #4]
 1611 076a 9A60     		str	r2, [r3, #8]
 361:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 1612              		.loc 1 361 0
 1613 076c C046     		nop
 1614 076e BD46     		mov	sp, r7
 1615 0770 04B0     		add	sp, sp, #16
 1616              		@ sp needed
 1617 0772 80BD     		pop	{r7, pc}
 1618              		.cfi_endproc
 1619              	.LFE20:
 1621              		.align	1
 1622              		.global	move_object
 1623              		.syntax unified
 1624              		.code	16
 1625              		.thumb_func
 1626              		.fpu softvfp
 1628              	move_object:
 1629              	.LFB21:
 362:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 363:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void move_object(POBJECT o){
 1630              		.loc 1 363 0
 1631              		.cfi_startproc
 1632              		@ args = 0, pretend = 0, frame = 8
 1633              		@ frame_needed = 1, uses_anonymous_args = 0
 1634 0774 80B5     		push	{r7, lr}
 1635              		.cfi_def_cfa_offset 8
 1636              		.cfi_offset 7, -8
 1637              		.cfi_offset 14, -4
 1638 0776 82B0     		sub	sp, sp, #8
 1639              		.cfi_def_cfa_offset 16
 1640 0778 00AF     		add	r7, sp, #0
 1641              		.cfi_def_cfa_register 7
 1642 077a 7860     		str	r0, [r7, #4]
 364:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	clear_object(o);
 1643              		.loc 1 364 0
 1644 077c 7B68     		ldr	r3, [r7, #4]
 1645 077e 1800     		movs	r0, r3
 1646 0780 FFF7FEFF 		bl	clear_object
 365:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	o->posx += o->dirx;
 1647              		.loc 1 365 0
 1648 0784 7B68     		ldr	r3, [r7, #4]
 1649 0786 DA68     		ldr	r2, [r3, #12]
 1650 0788 7B68     		ldr	r3, [r7, #4]
 1651 078a 5B68     		ldr	r3, [r3, #4]
 1652 078c D218     		adds	r2, r2, r3
 1653 078e 7B68     		ldr	r3, [r7, #4]
 1654 0790 DA60     		str	r2, [r3, #12]
 366:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	o->posy += o->diry;
 1655              		.loc 1 366 0
 1656 0792 7B68     		ldr	r3, [r7, #4]
 1657 0794 1A69     		ldr	r2, [r3, #16]
 1658 0796 7B68     		ldr	r3, [r7, #4]
 1659 0798 9B68     		ldr	r3, [r3, #8]
 1660 079a D218     		adds	r2, r2, r3
 1661 079c 7B68     		ldr	r3, [r7, #4]
 1662 079e 1A61     		str	r2, [r3, #16]
 367:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	
 368:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	if(o->posx < 1){
 1663              		.loc 1 368 0
 1664 07a0 7B68     		ldr	r3, [r7, #4]
 1665 07a2 DB68     		ldr	r3, [r3, #12]
 1666 07a4 002B     		cmp	r3, #0
 1667 07a6 04DC     		bgt	.L91
 369:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		o->dirx = -o->dirx;
 1668              		.loc 1 369 0
 1669 07a8 7B68     		ldr	r3, [r7, #4]
 1670 07aa 5B68     		ldr	r3, [r3, #4]
 1671 07ac 5A42     		rsbs	r2, r3, #0
 1672 07ae 7B68     		ldr	r3, [r7, #4]
 1673 07b0 5A60     		str	r2, [r3, #4]
 1674              	.L91:
 370:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 371:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	if(o->posx > 128){
 1675              		.loc 1 371 0
 1676 07b2 7B68     		ldr	r3, [r7, #4]
 1677 07b4 DB68     		ldr	r3, [r3, #12]
 1678 07b6 802B     		cmp	r3, #128
 1679 07b8 04DD     		ble	.L92
 372:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		o->dirx = -o->dirx;
 1680              		.loc 1 372 0
 1681 07ba 7B68     		ldr	r3, [r7, #4]
 1682 07bc 5B68     		ldr	r3, [r3, #4]
 1683 07be 5A42     		rsbs	r2, r3, #0
 1684 07c0 7B68     		ldr	r3, [r7, #4]
 1685 07c2 5A60     		str	r2, [r3, #4]
 1686              	.L92:
 373:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 374:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	if(o->posy < 1){
 1687              		.loc 1 374 0
 1688 07c4 7B68     		ldr	r3, [r7, #4]
 1689 07c6 1B69     		ldr	r3, [r3, #16]
 1690 07c8 002B     		cmp	r3, #0
 1691 07ca 04DC     		bgt	.L93
 375:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		o->diry = -o->diry;
 1692              		.loc 1 375 0
 1693 07cc 7B68     		ldr	r3, [r7, #4]
 1694 07ce 9B68     		ldr	r3, [r3, #8]
 1695 07d0 5A42     		rsbs	r2, r3, #0
 1696 07d2 7B68     		ldr	r3, [r7, #4]
 1697 07d4 9A60     		str	r2, [r3, #8]
 1698              	.L93:
 376:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 377:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	if(o->posy > 64){
 1699              		.loc 1 377 0
 1700 07d6 7B68     		ldr	r3, [r7, #4]
 1701 07d8 1B69     		ldr	r3, [r3, #16]
 1702 07da 402B     		cmp	r3, #64
 1703 07dc 04DD     		ble	.L94
 378:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		o->diry = -o->diry;
 1704              		.loc 1 378 0
 1705 07de 7B68     		ldr	r3, [r7, #4]
 1706 07e0 9B68     		ldr	r3, [r3, #8]
 1707 07e2 5A42     		rsbs	r2, r3, #0
 1708 07e4 7B68     		ldr	r3, [r7, #4]
 1709 07e6 9A60     		str	r2, [r3, #8]
 1710              	.L94:
 379:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 380:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	draw_object(o);
 1711              		.loc 1 380 0
 1712 07e8 7B68     		ldr	r3, [r7, #4]
 1713 07ea 1800     		movs	r0, r3
 1714 07ec FFF7FEFF 		bl	draw_object
 381:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 1715              		.loc 1 381 0
 1716 07f0 C046     		nop
 1717 07f2 BD46     		mov	sp, r7
 1718 07f4 02B0     		add	sp, sp, #8
 1719              		@ sp needed
 1720 07f6 80BD     		pop	{r7, pc}
 1721              		.cfi_endproc
 1722              	.LFE21:
 1724              		.global	ball_geometry
 1725              		.data
 1726              		.align	2
 1729              	ball_geometry:
 1730 0000 0C000000 		.word	12
 1731 0004 04000000 		.word	4
 1732 0008 04000000 		.word	4
 1733 000c 00       		.byte	0
 1734 000d 01       		.byte	1
 1735 000e 00       		.byte	0
 1736 000f 02       		.byte	2
 1737 0010 01       		.byte	1
 1738 0011 00       		.byte	0
 1739 0012 01       		.byte	1
 1740 0013 01       		.byte	1
 1741 0014 01       		.byte	1
 1742 0015 02       		.byte	2
 1743 0016 01       		.byte	1
 1744 0017 03       		.byte	3
 1745 0018 02       		.byte	2
 1746 0019 00       		.byte	0
 1747 001a 02       		.byte	2
 1748 001b 01       		.byte	1
 1749 001c 02       		.byte	2
 1750 001d 02       		.byte	2
 1751 001e 02       		.byte	2
 1752 001f 03       		.byte	3
 1753 0020 03       		.byte	3
 1754 0021 01       		.byte	1
 1755 0022 03       		.byte	3
 1756 0023 02       		.byte	2
 1757 0024 00000000 		.space	16
 1757      00000000 
 1757      00000000 
 1757      00000000 
 1758              		.align	2
 1761              	ball:
 1762 0034 00000000 		.word	ball_geometry
 1763 0038 00000000 		.word	0
 1764 003c 00000000 		.word	0
 1765 0040 01000000 		.word	1
 1766 0044 01000000 		.word	1
 1767 0048 00000000 		.word	draw_object
 1768 004c 00000000 		.word	clear_object
 1769 0050 00000000 		.word	move_object
 1770 0054 00000000 		.word	set_object_speed
 1771              		.text
 1772              		.align	1
 1773              		.global	main
 1774              		.syntax unified
 1775              		.code	16
 1776              		.thumb_func
 1777              		.fpu softvfp
 1779              	main:
 1780              	.LFB22:
 382:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 383:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	GEOMETRY ball_geometry =
 384:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 385:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	12,4,4,{{0,1},{0,2},{1,0},{1,1},{1,2},{1,3},{2,0},{2,1},{2,2},{2,3},{3,1},{3,2}}
 386:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** };
 387:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 388:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** static OBJECT ball=
 389:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {&ball_geometry,
 390:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 0,0,
 391:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 1,1,
 392:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** draw_object,
 393:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** clear_object,
 394:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** move_object,
 395:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** set_object_speed};
 396:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 397:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 398:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void main(void)
 399:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 1781              		.loc 1 399 0
 1782              		.cfi_startproc
 1783              		@ args = 0, pretend = 0, frame = 8
 1784              		@ frame_needed = 1, uses_anonymous_args = 0
 1785 07f8 80B5     		push	{r7, lr}
 1786              		.cfi_def_cfa_offset 8
 1787              		.cfi_offset 7, -8
 1788              		.cfi_offset 14, -4
 1789 07fa 82B0     		sub	sp, sp, #8
 1790              		.cfi_def_cfa_offset 16
 1791 07fc 00AF     		add	r7, sp, #0
 1792              		.cfi_def_cfa_register 7
 400:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	//uint8_t i;
 401:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 402:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	POBJECT p = &ball;
 1793              		.loc 1 402 0
 1794 07fe 0B4B     		ldr	r3, .L97
 1795 0800 7B60     		str	r3, [r7, #4]
 403:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	init_app();
 1796              		.loc 1 403 0
 1797 0802 FFF7FEFF 		bl	init_app
 404:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_initialize();
 1798              		.loc 1 404 0
 1799 0806 FFF7FEFF 		bl	graphic_initialize
 405:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	#ifndef SIMULATOR
 406:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		graphic_clear_screen();
 1800              		.loc 1 406 0
 1801 080a FFF7FEFF 		bl	graphic_clear_screen
 407:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	#endif
 408:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	
 409:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	p->set_speed(p,4,1);
 1802              		.loc 1 409 0
 1803 080e 7B68     		ldr	r3, [r7, #4]
 1804 0810 1B6A     		ldr	r3, [r3, #32]
 1805 0812 7868     		ldr	r0, [r7, #4]
 1806 0814 0122     		movs	r2, #1
 1807 0816 0421     		movs	r1, #4
 1808 0818 9847     		blx	r3
 1809              	.LVL0:
 1810              	.L96:
 410:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	while(1)
 411:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	{
 412:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		p->move(p);
 1811              		.loc 1 412 0 discriminator 1
 1812 081a 7B68     		ldr	r3, [r7, #4]
 1813 081c DB69     		ldr	r3, [r3, #28]
 1814 081e 7A68     		ldr	r2, [r7, #4]
 1815 0820 1000     		movs	r0, r2
 1816 0822 9847     		blx	r3
 1817              	.LVL1:
 413:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		delay_milli(4);
 1818              		.loc 1 413 0 discriminator 1
 1819 0824 0420     		movs	r0, #4
 1820 0826 FFF7FEFF 		bl	delay_milli
 412:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		delay_milli(4);
 1821              		.loc 1 412 0 discriminator 1
 1822 082a F6E7     		b	.L96
 1823              	.L98:
 1824              		.align	2
 1825              	.L97:
 1826 082c 34000000 		.word	ball
 1827              		.cfi_endproc
 1828              	.LFE22:
 1830              	.Letext0:
 1831              		.file 2 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\machine\\_default_types.h"
 1832              		.file 3 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\_stdint.h"
