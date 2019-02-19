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
  49              		.syntax unified
  50              		.code	16
  51              		.thumb_func
  52              		.fpu softvfp
  54              	graphic_wait_ready:
  55              	.LFB1:
  47:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
  48:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** typedef unsigned char uint8_t;
  49:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
  50:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** typedef struct tPoint
  51:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
  52:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	unsigned char x;
  53:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	unsigned char y;
  54:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }POINT;
  55:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
  56:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** #define MAX_POINTS 20
  57:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
  58:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** typedef struct tGeometry
  59:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
  60:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	int numpoints;
  61:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	int sizex;
  62:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	int sizey;
  63:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	POINT px[ MAX_POINTS];
  64:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }GEOMETRY, *PGEOMETRY;
  65:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
  66:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** typedef struct tObj{
  67:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	PGEOMETRY geo;
  68:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	int dirx, diry;
  69:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	int posx, posy;
  70:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	void(*draw)(struct tObj*);
  71:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	void(*clear)(struct tObj*);
  72:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	void(*move)(struct tObj*);
  73:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	void(*set_speed)(struct tObj*,int,int);
  74:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }OBJECT, *POBJECT;
  75:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
  76:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** static void graphic_wait_ready(void)
  77:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
  56              		.loc 1 77 0
  57              		.cfi_startproc
  58              		@ args = 0, pretend = 0, frame = 8
  59              		@ frame_needed = 1, uses_anonymous_args = 0
  60 0000 80B5     		push	{r7, lr}
  61              		.cfi_def_cfa_offset 8
  62              		.cfi_offset 7, -8
  63              		.cfi_offset 14, -4
  64 0002 82B0     		sub	sp, sp, #8
  65              		.cfi_def_cfa_offset 16
  66 0004 00AF     		add	r7, sp, #0
  67              		.cfi_def_cfa_register 7
  78:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	uint8_t c;
  79:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_ctrl_bit_clear(B_E);
  68              		.loc 1 79 0
  69 0006 4020     		movs	r0, #64
  70 0008 FFF7FEFF 		bl	graphic_ctrl_bit_clear
  80:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	*GPIO_MODER = 0x00005555;
  71              		.loc 1 80 0
  72 000c 144B     		ldr	r3, .L8
  73 000e 154A     		ldr	r2, .L8+4
  74 0010 1A60     		str	r2, [r3]
  81:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_ctrl_bit_clear(B_RS);
  75              		.loc 1 81 0
  76 0012 0120     		movs	r0, #1
  77 0014 FFF7FEFF 		bl	graphic_ctrl_bit_clear
  82:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_ctrl_bit_set(B_RW);
  78              		.loc 1 82 0
  79 0018 0220     		movs	r0, #2
  80 001a FFF7FEFF 		bl	graphic_ctrl_bit_set
  83:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	delay_500ns();
  81              		.loc 1 83 0
  82 001e FFF7FEFF 		bl	delay_500ns
  83              	.L5:
  84:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	
  85:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	while(1)
  86:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	{
  87:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		graphic_ctrl_bit_set(B_E);
  84              		.loc 1 87 0
  85 0022 4020     		movs	r0, #64
  86 0024 FFF7FEFF 		bl	graphic_ctrl_bit_set
  88:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		delay_500ns();
  87              		.loc 1 88 0
  88 0028 FFF7FEFF 		bl	delay_500ns
  89:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		c = *GPIO_IDR_HIGH & LCD_BUSY; //LCD_BUSY?????
  89              		.loc 1 89 0
  90 002c 0E4B     		ldr	r3, .L8+8
  91 002e 1B78     		ldrb	r3, [r3]
  92 0030 DAB2     		uxtb	r2, r3
  93 0032 FB1D     		adds	r3, r7, #7
  94 0034 7F21     		movs	r1, #127
  95 0036 8A43     		bics	r2, r1
  96 0038 1A70     		strb	r2, [r3]
  90:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		graphic_ctrl_bit_clear(B_E);
  97              		.loc 1 90 0
  98 003a 4020     		movs	r0, #64
  99 003c FFF7FEFF 		bl	graphic_ctrl_bit_clear
  91:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		delay_500ns();
 100              		.loc 1 91 0
 101 0040 FFF7FEFF 		bl	delay_500ns
  92:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		if(c == 0)
 102              		.loc 1 92 0
 103 0044 FB1D     		adds	r3, r7, #7
 104 0046 1B78     		ldrb	r3, [r3]
 105 0048 002B     		cmp	r3, #0
 106 004a 00D0     		beq	.L7
  87:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		delay_500ns();
 107              		.loc 1 87 0
 108 004c E9E7     		b	.L5
 109              	.L7:
  93:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		{
  94:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 			break;
 110              		.loc 1 94 0
 111 004e C046     		nop
  95:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		}
  96:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
  97:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	*GPIO_MODER = 0x55555555;
 112              		.loc 1 97 0
 113 0050 034B     		ldr	r3, .L8
 114 0052 064A     		ldr	r2, .L8+12
 115 0054 1A60     		str	r2, [r3]
  98:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 116              		.loc 1 98 0
 117 0056 C046     		nop
 118 0058 BD46     		mov	sp, r7
 119 005a 02B0     		add	sp, sp, #8
 120              		@ sp needed
 121 005c 80BD     		pop	{r7, pc}
 122              	.L9:
 123 005e C046     		.align	2
 124              	.L8:
 125 0060 00100240 		.word	1073876992
 126 0064 55550000 		.word	21845
 127 0068 11100240 		.word	1073877009
 128 006c 55555555 		.word	1431655765
 129              		.cfi_endproc
 130              	.LFE1:
 132              		.align	1
 133              		.syntax unified
 134              		.code	16
 135              		.thumb_func
 136              		.fpu softvfp
 138              	graphic_read:
 139              	.LFB2:
  99:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 100:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** static uint8_t graphic_read(uint8_t controller)
 101:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 140              		.loc 1 101 0
 141              		.cfi_startproc
 142              		@ args = 0, pretend = 0, frame = 16
 143              		@ frame_needed = 1, uses_anonymous_args = 0
 144 0070 80B5     		push	{r7, lr}
 145              		.cfi_def_cfa_offset 8
 146              		.cfi_offset 7, -8
 147              		.cfi_offset 14, -4
 148 0072 84B0     		sub	sp, sp, #16
 149              		.cfi_def_cfa_offset 24
 150 0074 00AF     		add	r7, sp, #0
 151              		.cfi_def_cfa_register 7
 152 0076 0200     		movs	r2, r0
 153 0078 FB1D     		adds	r3, r7, #7
 154 007a 1A70     		strb	r2, [r3]
 102:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	uint8_t c;
 103:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 155              		.loc 1 103 0
 156 007c 4020     		movs	r0, #64
 157 007e FFF7FEFF 		bl	graphic_ctrl_bit_clear
 104:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	*GPIO_MODER = 0x00005555;
 158              		.loc 1 104 0
 159 0082 1C4B     		ldr	r3, .L14
 160 0084 1C4A     		ldr	r2, .L14+4
 161 0086 1A60     		str	r2, [r3]
 105:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_ctrl_bit_set(B_RS|B_RW);
 162              		.loc 1 105 0
 163 0088 0320     		movs	r0, #3
 164 008a FFF7FEFF 		bl	graphic_ctrl_bit_set
 106:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	select_controller(controller);
 165              		.loc 1 106 0
 166 008e FB1D     		adds	r3, r7, #7
 167 0090 1B78     		ldrb	r3, [r3]
 168 0092 1800     		movs	r0, r3
 169 0094 FFF7FEFF 		bl	select_controller
 107:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	delay_500ns();
 170              		.loc 1 107 0
 171 0098 FFF7FEFF 		bl	delay_500ns
 108:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_ctrl_bit_set(B_E);
 172              		.loc 1 108 0
 173 009c 4020     		movs	r0, #64
 174 009e FFF7FEFF 		bl	graphic_ctrl_bit_set
 109:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	delay_500ns();
 175              		.loc 1 109 0
 176 00a2 FFF7FEFF 		bl	delay_500ns
 110:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	c = *GPIO_IDR_HIGH;
 177              		.loc 1 110 0
 178 00a6 154A     		ldr	r2, .L14+8
 179 00a8 0F23     		movs	r3, #15
 180 00aa FB18     		adds	r3, r7, r3
 181 00ac 1278     		ldrb	r2, [r2]
 182 00ae 1A70     		strb	r2, [r3]
 111:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 183              		.loc 1 111 0
 184 00b0 4020     		movs	r0, #64
 185 00b2 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 112:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	*GPIO_MODER = 0x55555555;
 186              		.loc 1 112 0
 187 00b6 0F4B     		ldr	r3, .L14
 188 00b8 114A     		ldr	r2, .L14+12
 189 00ba 1A60     		str	r2, [r3]
 113:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	
 114:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	if(controller & B_CS1){
 190              		.loc 1 114 0
 191 00bc FB1D     		adds	r3, r7, #7
 192 00be 1B78     		ldrb	r3, [r3]
 193 00c0 0822     		movs	r2, #8
 194 00c2 1340     		ands	r3, r2
 195 00c4 04D0     		beq	.L11
 115:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		select_controller(B_CS1);
 196              		.loc 1 115 0
 197 00c6 0820     		movs	r0, #8
 198 00c8 FFF7FEFF 		bl	select_controller
 116:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		graphic_wait_ready();
 199              		.loc 1 116 0
 200 00cc FFF798FF 		bl	graphic_wait_ready
 201              	.L11:
 117:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 118:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	if(controller & B_CS2)
 202              		.loc 1 118 0
 203 00d0 FB1D     		adds	r3, r7, #7
 204 00d2 1B78     		ldrb	r3, [r3]
 205 00d4 1022     		movs	r2, #16
 206 00d6 1340     		ands	r3, r2
 207 00d8 04D0     		beq	.L12
 119:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	{
 120:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		select_controller(B_CS2);
 208              		.loc 1 120 0
 209 00da 1020     		movs	r0, #16
 210 00dc FFF7FEFF 		bl	select_controller
 121:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		graphic_wait_ready();
 211              		.loc 1 121 0
 212 00e0 FFF78EFF 		bl	graphic_wait_ready
 213              	.L12:
 122:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 123:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	return c;
 214              		.loc 1 123 0
 215 00e4 0F23     		movs	r3, #15
 216 00e6 FB18     		adds	r3, r7, r3
 217 00e8 1B78     		ldrb	r3, [r3]
 124:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 218              		.loc 1 124 0
 219 00ea 1800     		movs	r0, r3
 220 00ec BD46     		mov	sp, r7
 221 00ee 04B0     		add	sp, sp, #16
 222              		@ sp needed
 223 00f0 80BD     		pop	{r7, pc}
 224              	.L15:
 225 00f2 C046     		.align	2
 226              	.L14:
 227 00f4 00100240 		.word	1073876992
 228 00f8 55550000 		.word	21845
 229 00fc 11100240 		.word	1073877009
 230 0100 55555555 		.word	1431655765
 231              		.cfi_endproc
 232              	.LFE2:
 234              		.align	1
 235              		.global	graphic_write
 236              		.syntax unified
 237              		.code	16
 238              		.thumb_func
 239              		.fpu softvfp
 241              	graphic_write:
 242              	.LFB3:
 125:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 126:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void graphic_write(uint8_t value, uint8_t controller)
 127:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 243              		.loc 1 127 0
 244              		.cfi_startproc
 245              		@ args = 0, pretend = 0, frame = 8
 246              		@ frame_needed = 1, uses_anonymous_args = 0
 247 0104 80B5     		push	{r7, lr}
 248              		.cfi_def_cfa_offset 8
 249              		.cfi_offset 7, -8
 250              		.cfi_offset 14, -4
 251 0106 82B0     		sub	sp, sp, #8
 252              		.cfi_def_cfa_offset 16
 253 0108 00AF     		add	r7, sp, #0
 254              		.cfi_def_cfa_register 7
 255 010a 0200     		movs	r2, r0
 256 010c FB1D     		adds	r3, r7, #7
 257 010e 1A70     		strb	r2, [r3]
 258 0110 BB1D     		adds	r3, r7, #6
 259 0112 0A1C     		adds	r2, r1, #0
 260 0114 1A70     		strb	r2, [r3]
 128:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	uint8_t c;
 129:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	*GPIO_ODR_HIGH = value;
 261              		.loc 1 129 0
 262 0116 1A4A     		ldr	r2, .L19
 263 0118 FB1D     		adds	r3, r7, #7
 264 011a 1B78     		ldrb	r3, [r3]
 265 011c 1370     		strb	r3, [r2]
 130:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	select_controller(controller);
 266              		.loc 1 130 0
 267 011e BB1D     		adds	r3, r7, #6
 268 0120 1B78     		ldrb	r3, [r3]
 269 0122 1800     		movs	r0, r3
 270 0124 FFF7FEFF 		bl	select_controller
 131:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	delay_500ns();
 271              		.loc 1 131 0
 272 0128 FFF7FEFF 		bl	delay_500ns
 132:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_ctrl_bit_set(B_E);
 273              		.loc 1 132 0
 274 012c 4020     		movs	r0, #64
 275 012e FFF7FEFF 		bl	graphic_ctrl_bit_set
 133:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	delay_500ns();
 276              		.loc 1 133 0
 277 0132 FFF7FEFF 		bl	delay_500ns
 134:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 278              		.loc 1 134 0
 279 0136 4020     		movs	r0, #64
 280 0138 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 135:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 136:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	
 137:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	if(controller & B_CS1){
 281              		.loc 1 137 0
 282 013c BB1D     		adds	r3, r7, #6
 283 013e 1B78     		ldrb	r3, [r3]
 284 0140 0822     		movs	r2, #8
 285 0142 1340     		ands	r3, r2
 286 0144 04D0     		beq	.L17
 138:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		select_controller(B_CS1);
 287              		.loc 1 138 0
 288 0146 0820     		movs	r0, #8
 289 0148 FFF7FEFF 		bl	select_controller
 139:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		graphic_wait_ready();
 290              		.loc 1 139 0
 291 014c FFF758FF 		bl	graphic_wait_ready
 292              	.L17:
 140:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 141:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	if(controller & B_CS2)
 293              		.loc 1 141 0
 294 0150 BB1D     		adds	r3, r7, #6
 295 0152 1B78     		ldrb	r3, [r3]
 296 0154 1022     		movs	r2, #16
 297 0156 1340     		ands	r3, r2
 298 0158 04D0     		beq	.L18
 142:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	{
 143:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		select_controller(B_CS2);
 299              		.loc 1 143 0
 300 015a 1020     		movs	r0, #16
 301 015c FFF7FEFF 		bl	select_controller
 144:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		graphic_wait_ready();
 302              		.loc 1 144 0
 303 0160 FFF74EFF 		bl	graphic_wait_ready
 304              	.L18:
 145:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 146:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	*GPIO_ODR_HIGH = 0;
 305              		.loc 1 146 0
 306 0164 064B     		ldr	r3, .L19
 307 0166 0022     		movs	r2, #0
 308 0168 1A70     		strb	r2, [r3]
 147:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_ctrl_bit_set(B_E);
 309              		.loc 1 147 0
 310 016a 4020     		movs	r0, #64
 311 016c FFF7FEFF 		bl	graphic_ctrl_bit_set
 148:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	select_controller(0);
 312              		.loc 1 148 0
 313 0170 0020     		movs	r0, #0
 314 0172 FFF7FEFF 		bl	select_controller
 149:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 315              		.loc 1 149 0
 316 0176 C046     		nop
 317 0178 BD46     		mov	sp, r7
 318 017a 02B0     		add	sp, sp, #8
 319              		@ sp needed
 320 017c 80BD     		pop	{r7, pc}
 321              	.L20:
 322 017e C046     		.align	2
 323              	.L19:
 324 0180 15100240 		.word	1073877013
 325              		.cfi_endproc
 326              	.LFE3:
 328              		.align	1
 329              		.global	graphic_write_command
 330              		.syntax unified
 331              		.code	16
 332              		.thumb_func
 333              		.fpu softvfp
 335              	graphic_write_command:
 336              	.LFB4:
 150:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 151:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void graphic_write_command(uint8_t command, uint8_t controller)
 152:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 337              		.loc 1 152 0
 338              		.cfi_startproc
 339              		@ args = 0, pretend = 0, frame = 8
 340              		@ frame_needed = 1, uses_anonymous_args = 0
 341 0184 80B5     		push	{r7, lr}
 342              		.cfi_def_cfa_offset 8
 343              		.cfi_offset 7, -8
 344              		.cfi_offset 14, -4
 345 0186 82B0     		sub	sp, sp, #8
 346              		.cfi_def_cfa_offset 16
 347 0188 00AF     		add	r7, sp, #0
 348              		.cfi_def_cfa_register 7
 349 018a 0200     		movs	r2, r0
 350 018c FB1D     		adds	r3, r7, #7
 351 018e 1A70     		strb	r2, [r3]
 352 0190 BB1D     		adds	r3, r7, #6
 353 0192 0A1C     		adds	r2, r1, #0
 354 0194 1A70     		strb	r2, [r3]
 153:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 355              		.loc 1 153 0
 356 0196 4020     		movs	r0, #64
 357 0198 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 154:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	select_controller(controller);
 358              		.loc 1 154 0
 359 019c BB1D     		adds	r3, r7, #6
 360 019e 1B78     		ldrb	r3, [r3]
 361 01a0 1800     		movs	r0, r3
 362 01a2 FFF7FEFF 		bl	select_controller
 155:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_ctrl_bit_clear(B_RS | B_RW);
 363              		.loc 1 155 0
 364 01a6 0320     		movs	r0, #3
 365 01a8 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 156:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_write(command, controller);
 366              		.loc 1 156 0
 367 01ac BB1D     		adds	r3, r7, #6
 368 01ae 1A78     		ldrb	r2, [r3]
 369 01b0 FB1D     		adds	r3, r7, #7
 370 01b2 1B78     		ldrb	r3, [r3]
 371 01b4 1100     		movs	r1, r2
 372 01b6 1800     		movs	r0, r3
 373 01b8 FFF7FEFF 		bl	graphic_write
 157:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 374              		.loc 1 157 0
 375 01bc C046     		nop
 376 01be BD46     		mov	sp, r7
 377 01c0 02B0     		add	sp, sp, #8
 378              		@ sp needed
 379 01c2 80BD     		pop	{r7, pc}
 380              		.cfi_endproc
 381              	.LFE4:
 383              		.align	1
 384              		.global	graphic_write_data
 385              		.syntax unified
 386              		.code	16
 387              		.thumb_func
 388              		.fpu softvfp
 390              	graphic_write_data:
 391              	.LFB5:
 158:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 159:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void graphic_write_data(uint8_t data, uint8_t controller)
 160:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 392              		.loc 1 160 0
 393              		.cfi_startproc
 394              		@ args = 0, pretend = 0, frame = 8
 395              		@ frame_needed = 1, uses_anonymous_args = 0
 396 01c4 80B5     		push	{r7, lr}
 397              		.cfi_def_cfa_offset 8
 398              		.cfi_offset 7, -8
 399              		.cfi_offset 14, -4
 400 01c6 82B0     		sub	sp, sp, #8
 401              		.cfi_def_cfa_offset 16
 402 01c8 00AF     		add	r7, sp, #0
 403              		.cfi_def_cfa_register 7
 404 01ca 0200     		movs	r2, r0
 405 01cc FB1D     		adds	r3, r7, #7
 406 01ce 1A70     		strb	r2, [r3]
 407 01d0 BB1D     		adds	r3, r7, #6
 408 01d2 0A1C     		adds	r2, r1, #0
 409 01d4 1A70     		strb	r2, [r3]
 161:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 410              		.loc 1 161 0
 411 01d6 4020     		movs	r0, #64
 412 01d8 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 162:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	select_controller(controller);
 413              		.loc 1 162 0
 414 01dc BB1D     		adds	r3, r7, #6
 415 01de 1B78     		ldrb	r3, [r3]
 416 01e0 1800     		movs	r0, r3
 417 01e2 FFF7FEFF 		bl	select_controller
 163:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_ctrl_bit_clear(B_RW);
 418              		.loc 1 163 0
 419 01e6 0220     		movs	r0, #2
 420 01e8 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 164:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_ctrl_bit_set(B_RS);
 421              		.loc 1 164 0
 422 01ec 0120     		movs	r0, #1
 423 01ee FFF7FEFF 		bl	graphic_ctrl_bit_set
 165:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_write(data, controller);
 424              		.loc 1 165 0
 425 01f2 BB1D     		adds	r3, r7, #6
 426 01f4 1A78     		ldrb	r2, [r3]
 427 01f6 FB1D     		adds	r3, r7, #7
 428 01f8 1B78     		ldrb	r3, [r3]
 429 01fa 1100     		movs	r1, r2
 430 01fc 1800     		movs	r0, r3
 431 01fe FFF7FEFF 		bl	graphic_write
 166:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 432              		.loc 1 166 0
 433 0202 C046     		nop
 434 0204 BD46     		mov	sp, r7
 435 0206 02B0     		add	sp, sp, #8
 436              		@ sp needed
 437 0208 80BD     		pop	{r7, pc}
 438              		.cfi_endproc
 439              	.LFE5:
 441              		.align	1
 442              		.global	graphic_read_data
 443              		.syntax unified
 444              		.code	16
 445              		.thumb_func
 446              		.fpu softvfp
 448              	graphic_read_data:
 449              	.LFB6:
 167:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 168:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** uint8_t graphic_read_data(uint8_t controller)
 169:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 450              		.loc 1 169 0
 451              		.cfi_startproc
 452              		@ args = 0, pretend = 0, frame = 8
 453              		@ frame_needed = 1, uses_anonymous_args = 0
 454 020a 80B5     		push	{r7, lr}
 455              		.cfi_def_cfa_offset 8
 456              		.cfi_offset 7, -8
 457              		.cfi_offset 14, -4
 458 020c 82B0     		sub	sp, sp, #8
 459              		.cfi_def_cfa_offset 16
 460 020e 00AF     		add	r7, sp, #0
 461              		.cfi_def_cfa_register 7
 462 0210 0200     		movs	r2, r0
 463 0212 FB1D     		adds	r3, r7, #7
 464 0214 1A70     		strb	r2, [r3]
 170:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_read(controller);
 465              		.loc 1 170 0
 466 0216 FB1D     		adds	r3, r7, #7
 467 0218 1B78     		ldrb	r3, [r3]
 468 021a 1800     		movs	r0, r3
 469 021c FFF728FF 		bl	graphic_read
 171:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	return graphic_read(controller);
 470              		.loc 1 171 0
 471 0220 FB1D     		adds	r3, r7, #7
 472 0222 1B78     		ldrb	r3, [r3]
 473 0224 1800     		movs	r0, r3
 474 0226 FFF723FF 		bl	graphic_read
 475 022a 0300     		movs	r3, r0
 172:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 476              		.loc 1 172 0
 477 022c 1800     		movs	r0, r3
 478 022e BD46     		mov	sp, r7
 479 0230 02B0     		add	sp, sp, #8
 480              		@ sp needed
 481 0232 80BD     		pop	{r7, pc}
 482              		.cfi_endproc
 483              	.LFE6:
 485              		.align	1
 486              		.global	graphic_ctrl_bit_set
 487              		.syntax unified
 488              		.code	16
 489              		.thumb_func
 490              		.fpu softvfp
 492              	graphic_ctrl_bit_set:
 493              	.LFB7:
 173:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 174:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void graphic_ctrl_bit_set(uint8_t x)
 175:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 494              		.loc 1 175 0
 495              		.cfi_startproc
 496              		@ args = 0, pretend = 0, frame = 16
 497              		@ frame_needed = 1, uses_anonymous_args = 0
 498 0234 80B5     		push	{r7, lr}
 499              		.cfi_def_cfa_offset 8
 500              		.cfi_offset 7, -8
 501              		.cfi_offset 14, -4
 502 0236 84B0     		sub	sp, sp, #16
 503              		.cfi_def_cfa_offset 24
 504 0238 00AF     		add	r7, sp, #0
 505              		.cfi_def_cfa_register 7
 506 023a 0200     		movs	r2, r0
 507 023c FB1D     		adds	r3, r7, #7
 508 023e 1A70     		strb	r2, [r3]
 176:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	unsigned char c;
 177:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	c = *GPIO_ODR_LOW;
 509              		.loc 1 177 0
 510 0240 0C4A     		ldr	r2, .L26
 511 0242 0F21     		movs	r1, #15
 512 0244 7B18     		adds	r3, r7, r1
 513 0246 1278     		ldrb	r2, [r2]
 514 0248 1A70     		strb	r2, [r3]
 178:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	c |= ( ~B_SELECT & x ); //Nollställer B_Select!
 515              		.loc 1 178 0
 516 024a FB1D     		adds	r3, r7, #7
 517 024c 1B78     		ldrb	r3, [r3]
 518 024e 5BB2     		sxtb	r3, r3
 519 0250 0422     		movs	r2, #4
 520 0252 9343     		bics	r3, r2
 521 0254 5AB2     		sxtb	r2, r3
 522 0256 7B18     		adds	r3, r7, r1
 523 0258 1B78     		ldrb	r3, [r3]
 524 025a 5BB2     		sxtb	r3, r3
 525 025c 1343     		orrs	r3, r2
 526 025e 5AB2     		sxtb	r2, r3
 527 0260 7B18     		adds	r3, r7, r1
 528 0262 1A70     		strb	r2, [r3]
 179:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	*GPIO_ODR_LOW = c;
 529              		.loc 1 179 0
 530 0264 034A     		ldr	r2, .L26
 531 0266 7B18     		adds	r3, r7, r1
 532 0268 1B78     		ldrb	r3, [r3]
 533 026a 1370     		strb	r3, [r2]
 180:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 534              		.loc 1 180 0
 535 026c C046     		nop
 536 026e BD46     		mov	sp, r7
 537 0270 04B0     		add	sp, sp, #16
 538              		@ sp needed
 539 0272 80BD     		pop	{r7, pc}
 540              	.L27:
 541              		.align	2
 542              	.L26:
 543 0274 14100240 		.word	1073877012
 544              		.cfi_endproc
 545              	.LFE7:
 547              		.align	1
 548              		.global	graphic_ctrl_bit_clear
 549              		.syntax unified
 550              		.code	16
 551              		.thumb_func
 552              		.fpu softvfp
 554              	graphic_ctrl_bit_clear:
 555              	.LFB8:
 181:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 182:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void graphic_ctrl_bit_clear(unsigned char x)
 183:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 556              		.loc 1 183 0
 557              		.cfi_startproc
 558              		@ args = 0, pretend = 0, frame = 16
 559              		@ frame_needed = 1, uses_anonymous_args = 0
 560 0278 80B5     		push	{r7, lr}
 561              		.cfi_def_cfa_offset 8
 562              		.cfi_offset 7, -8
 563              		.cfi_offset 14, -4
 564 027a 84B0     		sub	sp, sp, #16
 565              		.cfi_def_cfa_offset 24
 566 027c 00AF     		add	r7, sp, #0
 567              		.cfi_def_cfa_register 7
 568 027e 0200     		movs	r2, r0
 569 0280 FB1D     		adds	r3, r7, #7
 570 0282 1A70     		strb	r2, [r3]
 184:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	unsigned char c;
 185:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	c = *GPIO_ODR_LOW;
 571              		.loc 1 185 0
 572 0284 0D4A     		ldr	r2, .L29
 573 0286 0F21     		movs	r1, #15
 574 0288 7B18     		adds	r3, r7, r1
 575 028a 1278     		ldrb	r2, [r2]
 576 028c 1A70     		strb	r2, [r3]
 186:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	c &= (~B_SELECT & ~x); //~ bildar 1-komplement
 577              		.loc 1 186 0
 578 028e FB1D     		adds	r3, r7, #7
 579 0290 1B78     		ldrb	r3, [r3]
 580 0292 DB43     		mvns	r3, r3
 581 0294 DBB2     		uxtb	r3, r3
 582 0296 7A18     		adds	r2, r7, r1
 583 0298 1278     		ldrb	r2, [r2]
 584 029a 1340     		ands	r3, r2
 585 029c DAB2     		uxtb	r2, r3
 586 029e 0800     		movs	r0, r1
 587 02a0 7B18     		adds	r3, r7, r1
 588 02a2 0421     		movs	r1, #4
 589 02a4 8A43     		bics	r2, r1
 590 02a6 1A70     		strb	r2, [r3]
 187:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	*GPIO_ODR_LOW = c;
 591              		.loc 1 187 0
 592 02a8 044A     		ldr	r2, .L29
 593 02aa 0100     		movs	r1, r0
 594 02ac 7B18     		adds	r3, r7, r1
 595 02ae 1B78     		ldrb	r3, [r3]
 596 02b0 1370     		strb	r3, [r2]
 188:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 597              		.loc 1 188 0
 598 02b2 C046     		nop
 599 02b4 BD46     		mov	sp, r7
 600 02b6 04B0     		add	sp, sp, #16
 601              		@ sp needed
 602 02b8 80BD     		pop	{r7, pc}
 603              	.L30:
 604 02ba C046     		.align	2
 605              	.L29:
 606 02bc 14100240 		.word	1073877012
 607              		.cfi_endproc
 608              	.LFE8:
 610              		.align	1
 611              		.global	select_controller
 612              		.syntax unified
 613              		.code	16
 614              		.thumb_func
 615              		.fpu softvfp
 617              	select_controller:
 618              	.LFB9:
 189:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 190:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void select_controller(uint8_t controller)
 191:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 619              		.loc 1 191 0
 620              		.cfi_startproc
 621              		@ args = 0, pretend = 0, frame = 8
 622              		@ frame_needed = 1, uses_anonymous_args = 0
 623 02c0 80B5     		push	{r7, lr}
 624              		.cfi_def_cfa_offset 8
 625              		.cfi_offset 7, -8
 626              		.cfi_offset 14, -4
 627 02c2 82B0     		sub	sp, sp, #8
 628              		.cfi_def_cfa_offset 16
 629 02c4 00AF     		add	r7, sp, #0
 630              		.cfi_def_cfa_register 7
 631 02c6 0200     		movs	r2, r0
 632 02c8 FB1D     		adds	r3, r7, #7
 633 02ca 1A70     		strb	r2, [r3]
 192:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	switch(controller){
 634              		.loc 1 192 0
 635 02cc FB1D     		adds	r3, r7, #7
 636 02ce 1B78     		ldrb	r3, [r3]
 637 02d0 082B     		cmp	r3, #8
 638 02d2 0CD0     		beq	.L33
 639 02d4 02DC     		bgt	.L34
 640 02d6 002B     		cmp	r3, #0
 641 02d8 05D0     		beq	.L35
 193:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		case 0:
 194:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 				graphic_ctrl_bit_clear(B_CS1|B_CS2);
 195:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 				break;
 196:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		case B_CS1:
 197:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 				graphic_ctrl_bit_set(B_CS1);
 198:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 				graphic_ctrl_bit_clear(B_CS2);
 199:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 				break;
 200:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		case B_CS2:
 201:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 				graphic_ctrl_bit_set(B_CS2);
 202:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 				graphic_ctrl_bit_clear(B_CS1);
 203:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 				break;
 204:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		case B_CS1|B_CS2:
 205:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 				graphic_ctrl_bit_set(B_CS1|B_CS2);
 206:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 				break;
 207:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 208:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 642              		.loc 1 208 0
 643 02da 1AE0     		b	.L38
 644              	.L34:
 192:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	switch(controller){
 645              		.loc 1 192 0
 646 02dc 102B     		cmp	r3, #16
 647 02de 0DD0     		beq	.L36
 648 02e0 182B     		cmp	r3, #24
 649 02e2 12D0     		beq	.L37
 650              		.loc 1 208 0
 651 02e4 15E0     		b	.L38
 652              	.L35:
 194:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 				break;
 653              		.loc 1 194 0
 654 02e6 1820     		movs	r0, #24
 655 02e8 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 195:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		case B_CS1:
 656              		.loc 1 195 0
 657 02ec 11E0     		b	.L32
 658              	.L33:
 197:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 				graphic_ctrl_bit_clear(B_CS2);
 659              		.loc 1 197 0
 660 02ee 0820     		movs	r0, #8
 661 02f0 FFF7FEFF 		bl	graphic_ctrl_bit_set
 198:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 				break;
 662              		.loc 1 198 0
 663 02f4 1020     		movs	r0, #16
 664 02f6 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 199:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		case B_CS2:
 665              		.loc 1 199 0
 666 02fa 0AE0     		b	.L32
 667              	.L36:
 201:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 				graphic_ctrl_bit_clear(B_CS1);
 668              		.loc 1 201 0
 669 02fc 1020     		movs	r0, #16
 670 02fe FFF7FEFF 		bl	graphic_ctrl_bit_set
 202:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 				break;
 671              		.loc 1 202 0
 672 0302 0820     		movs	r0, #8
 673 0304 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 203:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		case B_CS1|B_CS2:
 674              		.loc 1 203 0
 675 0308 03E0     		b	.L32
 676              	.L37:
 205:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 				break;
 677              		.loc 1 205 0
 678 030a 1820     		movs	r0, #24
 679 030c FFF7FEFF 		bl	graphic_ctrl_bit_set
 206:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 680              		.loc 1 206 0
 681 0310 C046     		nop
 682              	.L32:
 683              	.L38:
 684              		.loc 1 208 0
 685 0312 C046     		nop
 686 0314 BD46     		mov	sp, r7
 687 0316 02B0     		add	sp, sp, #8
 688              		@ sp needed
 689 0318 80BD     		pop	{r7, pc}
 690              		.cfi_endproc
 691              	.LFE9:
 693              		.align	1
 694              		.global	delay_milli
 695              		.syntax unified
 696              		.code	16
 697              		.thumb_func
 698              		.fpu softvfp
 700              	delay_milli:
 701              	.LFB10:
 209:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 210:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void delay_milli(int ms)
 211:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 702              		.loc 1 211 0
 703              		.cfi_startproc
 704              		@ args = 0, pretend = 0, frame = 8
 705              		@ frame_needed = 1, uses_anonymous_args = 0
 706 031a 80B5     		push	{r7, lr}
 707              		.cfi_def_cfa_offset 8
 708              		.cfi_offset 7, -8
 709              		.cfi_offset 14, -4
 710 031c 82B0     		sub	sp, sp, #8
 711              		.cfi_def_cfa_offset 16
 712 031e 00AF     		add	r7, sp, #0
 713              		.cfi_def_cfa_register 7
 714 0320 7860     		str	r0, [r7, #4]
 212:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	while(ms > 0)
 715              		.loc 1 212 0
 716 0322 02E0     		b	.L40
 717              	.L41:
 213:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	{
 214:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	#ifndef SIMULATOR
 215:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	delay_micro(1000);
 216:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	#endif
 217:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	ms--;
 718              		.loc 1 217 0
 719 0324 7B68     		ldr	r3, [r7, #4]
 720 0326 013B     		subs	r3, r3, #1
 721 0328 7B60     		str	r3, [r7, #4]
 722              	.L40:
 212:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	while(ms > 0)
 723              		.loc 1 212 0
 724 032a 7B68     		ldr	r3, [r7, #4]
 725 032c 002B     		cmp	r3, #0
 726 032e F9DC     		bgt	.L41
 218:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 219:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 727              		.loc 1 219 0
 728 0330 C046     		nop
 729 0332 BD46     		mov	sp, r7
 730 0334 02B0     		add	sp, sp, #8
 731              		@ sp needed
 732 0336 80BD     		pop	{r7, pc}
 733              		.cfi_endproc
 734              	.LFE10:
 736              		.align	1
 737              		.global	delay_micro
 738              		.syntax unified
 739              		.code	16
 740              		.thumb_func
 741              		.fpu softvfp
 743              	delay_micro:
 744              	.LFB11:
 220:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 221:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void delay_micro(int us)
 222:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 745              		.loc 1 222 0
 746              		.cfi_startproc
 747              		@ args = 0, pretend = 0, frame = 8
 748              		@ frame_needed = 1, uses_anonymous_args = 0
 749 0338 80B5     		push	{r7, lr}
 750              		.cfi_def_cfa_offset 8
 751              		.cfi_offset 7, -8
 752              		.cfi_offset 14, -4
 753 033a 82B0     		sub	sp, sp, #8
 754              		.cfi_def_cfa_offset 16
 755 033c 00AF     		add	r7, sp, #0
 756              		.cfi_def_cfa_register 7
 757 033e 7860     		str	r0, [r7, #4]
 223:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	while(us > 0)
 758              		.loc 1 223 0
 759 0340 02E0     		b	.L43
 760              	.L44:
 224:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	{
 225:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	#ifndef SIMULATOR
 226:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	delay_250ns();
 227:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	delay_250ns();
 228:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	delay_250ns();
 229:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	delay_250ns();
 230:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	#endif
 231:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	us--;
 761              		.loc 1 231 0
 762 0342 7B68     		ldr	r3, [r7, #4]
 763 0344 013B     		subs	r3, r3, #1
 764 0346 7B60     		str	r3, [r7, #4]
 765              	.L43:
 223:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	while(us > 0)
 766              		.loc 1 223 0
 767 0348 7B68     		ldr	r3, [r7, #4]
 768 034a 002B     		cmp	r3, #0
 769 034c F9DC     		bgt	.L44
 232:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 233:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 770              		.loc 1 233 0
 771 034e C046     		nop
 772 0350 BD46     		mov	sp, r7
 773 0352 02B0     		add	sp, sp, #8
 774              		@ sp needed
 775 0354 80BD     		pop	{r7, pc}
 776              		.cfi_endproc
 777              	.LFE11:
 779              		.align	1
 780              		.global	delay_250ns
 781              		.syntax unified
 782              		.code	16
 783              		.thumb_func
 784              		.fpu softvfp
 786              	delay_250ns:
 787              	.LFB12:
 234:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 235:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void delay_250ns(void)
 236:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 788              		.loc 1 236 0
 789              		.cfi_startproc
 790              		@ args = 0, pretend = 0, frame = 8
 791              		@ frame_needed = 1, uses_anonymous_args = 0
 792 0356 80B5     		push	{r7, lr}
 793              		.cfi_def_cfa_offset 8
 794              		.cfi_offset 7, -8
 795              		.cfi_offset 14, -4
 796 0358 82B0     		sub	sp, sp, #8
 797              		.cfi_def_cfa_offset 16
 798 035a 00AF     		add	r7, sp, #0
 799              		.cfi_def_cfa_register 7
 237:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	*STK_CTRL = 0;
 800              		.loc 1 237 0
 801 035c 0F4B     		ldr	r3, .L47
 802 035e 0022     		movs	r2, #0
 803 0360 1A60     		str	r2, [r3]
 238:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	*STK_LOAD = 0x29; //0x2A - 1
 804              		.loc 1 238 0
 805 0362 0F4B     		ldr	r3, .L47+4
 806 0364 2922     		movs	r2, #41
 807 0366 1A60     		str	r2, [r3]
 239:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	*STK_VAL = 0x0;
 808              		.loc 1 239 0
 809 0368 0E4B     		ldr	r3, .L47+8
 810 036a 0022     		movs	r2, #0
 811 036c 1A60     		str	r2, [r3]
 240:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	*STK_CTRL = 5;
 812              		.loc 1 240 0
 813 036e 0B4B     		ldr	r3, .L47
 814 0370 0522     		movs	r2, #5
 815 0372 1A60     		str	r2, [r3]
 241:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	unsigned int ctrl = *STK_CTRL & 0x10000;
 816              		.loc 1 241 0
 817 0374 094B     		ldr	r3, .L47
 818 0376 1A68     		ldr	r2, [r3]
 819 0378 8023     		movs	r3, #128
 820 037a 5B02     		lsls	r3, r3, #9
 821 037c 1340     		ands	r3, r2
 822 037e 7B60     		str	r3, [r7, #4]
 242:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	while((*STK_CTRL & 0x10000) == 0);
 823              		.loc 1 242 0
 824 0380 C046     		nop
 825              	.L46:
 826              		.loc 1 242 0 is_stmt 0 discriminator 1
 827 0382 064B     		ldr	r3, .L47
 828 0384 1A68     		ldr	r2, [r3]
 829 0386 8023     		movs	r3, #128
 830 0388 5B02     		lsls	r3, r3, #9
 831 038a 1340     		ands	r3, r2
 832 038c F9D0     		beq	.L46
 243:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	*STK_CTRL= 0;
 833              		.loc 1 243 0 is_stmt 1
 834 038e 034B     		ldr	r3, .L47
 835 0390 0022     		movs	r2, #0
 836 0392 1A60     		str	r2, [r3]
 244:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	
 245:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 837              		.loc 1 245 0
 838 0394 C046     		nop
 839 0396 BD46     		mov	sp, r7
 840 0398 02B0     		add	sp, sp, #8
 841              		@ sp needed
 842 039a 80BD     		pop	{r7, pc}
 843              	.L48:
 844              		.align	2
 845              	.L47:
 846 039c 10E000E0 		.word	-536813552
 847 03a0 14E000E0 		.word	-536813548
 848 03a4 18E000E0 		.word	-536813544
 849              		.cfi_endproc
 850              	.LFE12:
 852              		.align	1
 853              		.global	delay_500ns
 854              		.syntax unified
 855              		.code	16
 856              		.thumb_func
 857              		.fpu softvfp
 859              	delay_500ns:
 860              	.LFB13:
 246:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 247:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void delay_500ns(void)
 248:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 861              		.loc 1 248 0
 862              		.cfi_startproc
 863              		@ args = 0, pretend = 0, frame = 0
 864              		@ frame_needed = 1, uses_anonymous_args = 0
 865 03a8 80B5     		push	{r7, lr}
 866              		.cfi_def_cfa_offset 8
 867              		.cfi_offset 7, -8
 868              		.cfi_offset 14, -4
 869 03aa 00AF     		add	r7, sp, #0
 870              		.cfi_def_cfa_register 7
 249:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	#ifndef SIMULATOR
 250:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	delay_250ns();
 251:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	delay_250ns();
 252:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	#endif
 253:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 871              		.loc 1 253 0
 872 03ac C046     		nop
 873 03ae BD46     		mov	sp, r7
 874              		@ sp needed
 875 03b0 80BD     		pop	{r7, pc}
 876              		.cfi_endproc
 877              	.LFE13:
 879              		.align	1
 880              		.global	graphic_initialize
 881              		.syntax unified
 882              		.code	16
 883              		.thumb_func
 884              		.fpu softvfp
 886              	graphic_initialize:
 887              	.LFB14:
 254:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 255:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void graphic_initialize(void)
 256:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 888              		.loc 1 256 0
 889              		.cfi_startproc
 890              		@ args = 0, pretend = 0, frame = 0
 891              		@ frame_needed = 1, uses_anonymous_args = 0
 892 03b2 80B5     		push	{r7, lr}
 893              		.cfi_def_cfa_offset 8
 894              		.cfi_offset 7, -8
 895              		.cfi_offset 14, -4
 896 03b4 00AF     		add	r7, sp, #0
 897              		.cfi_def_cfa_register 7
 257:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_ctrl_bit_set(B_E);
 898              		.loc 1 257 0
 899 03b6 4020     		movs	r0, #64
 900 03b8 FFF7FEFF 		bl	graphic_ctrl_bit_set
 258:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	delay_micro(10);
 901              		.loc 1 258 0
 902 03bc 0A20     		movs	r0, #10
 903 03be FFF7FEFF 		bl	delay_micro
 259:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_ctrl_bit_clear(B_CS1|B_CS2|B_RST|B_E);
 904              		.loc 1 259 0
 905 03c2 7820     		movs	r0, #120
 906 03c4 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 260:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	delay_milli(30);
 907              		.loc 1 260 0
 908 03c8 1E20     		movs	r0, #30
 909 03ca FFF7FEFF 		bl	delay_milli
 261:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_ctrl_bit_set(B_RST);
 910              		.loc 1 261 0
 911 03ce 2020     		movs	r0, #32
 912 03d0 FFF7FEFF 		bl	graphic_ctrl_bit_set
 262:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	delay_milli(100);
 913              		.loc 1 262 0
 914 03d4 6420     		movs	r0, #100
 915 03d6 FFF7FEFF 		bl	delay_milli
 263:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_write_command(LCD_OFF, B_CS1|B_CS2);
 916              		.loc 1 263 0
 917 03da 1821     		movs	r1, #24
 918 03dc 3E20     		movs	r0, #62
 919 03de FFF7FEFF 		bl	graphic_write_command
 264:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_write_command(LCD_ON, B_CS1|B_CS2);
 920              		.loc 1 264 0
 921 03e2 1821     		movs	r1, #24
 922 03e4 3F20     		movs	r0, #63
 923 03e6 FFF7FEFF 		bl	graphic_write_command
 265:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_write_command(LCD_DISP_START, B_CS1|B_CS2);
 924              		.loc 1 265 0
 925 03ea 1821     		movs	r1, #24
 926 03ec C020     		movs	r0, #192
 927 03ee FFF7FEFF 		bl	graphic_write_command
 266:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_write_command(LCD_SET_ADD, B_CS1|B_CS2);
 928              		.loc 1 266 0
 929 03f2 1821     		movs	r1, #24
 930 03f4 4020     		movs	r0, #64
 931 03f6 FFF7FEFF 		bl	graphic_write_command
 267:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_write_command(LCD_SET_PAGE, B_CS1|B_CS2);
 932              		.loc 1 267 0
 933 03fa 1821     		movs	r1, #24
 934 03fc B820     		movs	r0, #184
 935 03fe FFF7FEFF 		bl	graphic_write_command
 268:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	select_controller(0);
 936              		.loc 1 268 0
 937 0402 0020     		movs	r0, #0
 938 0404 FFF7FEFF 		bl	select_controller
 269:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 939              		.loc 1 269 0
 940 0408 C046     		nop
 941 040a BD46     		mov	sp, r7
 942              		@ sp needed
 943 040c 80BD     		pop	{r7, pc}
 944              		.cfi_endproc
 945              	.LFE14:
 947              		.align	1
 948              		.global	graphic_clear_screen
 949              		.syntax unified
 950              		.code	16
 951              		.thumb_func
 952              		.fpu softvfp
 954              	graphic_clear_screen:
 955              	.LFB15:
 270:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 271:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void graphic_clear_screen(void)
 272:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 956              		.loc 1 272 0
 957              		.cfi_startproc
 958              		@ args = 0, pretend = 0, frame = 8
 959              		@ frame_needed = 1, uses_anonymous_args = 0
 960 040e 80B5     		push	{r7, lr}
 961              		.cfi_def_cfa_offset 8
 962              		.cfi_offset 7, -8
 963              		.cfi_offset 14, -4
 964 0410 82B0     		sub	sp, sp, #8
 965              		.cfi_def_cfa_offset 16
 966 0412 00AF     		add	r7, sp, #0
 967              		.cfi_def_cfa_register 7
 968              	.LBB2:
 273:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	for(unsigned int page = 0; page < 8; page++)
 969              		.loc 1 273 0
 970 0414 0023     		movs	r3, #0
 971 0416 7B60     		str	r3, [r7, #4]
 972 0418 1DE0     		b	.L52
 973              	.L55:
 274:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	{
 275:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		graphic_write_command(LCD_SET_PAGE|page,B_CS1|B_CS2);
 974              		.loc 1 275 0
 975 041a 7B68     		ldr	r3, [r7, #4]
 976 041c DBB2     		uxtb	r3, r3
 977 041e 4822     		movs	r2, #72
 978 0420 5242     		rsbs	r2, r2, #0
 979 0422 1343     		orrs	r3, r2
 980 0424 DBB2     		uxtb	r3, r3
 981 0426 1821     		movs	r1, #24
 982 0428 1800     		movs	r0, r3
 983 042a FFF7FEFF 		bl	graphic_write_command
 276:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		graphic_write_command(LCD_SET_ADD|0,B_CS1|B_CS2);
 984              		.loc 1 276 0
 985 042e 1821     		movs	r1, #24
 986 0430 4020     		movs	r0, #64
 987 0432 FFF7FEFF 		bl	graphic_write_command
 988              	.LBB3:
 277:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		for(unsigned int add = 0; add<64;add++)
 989              		.loc 1 277 0
 990 0436 0023     		movs	r3, #0
 991 0438 3B60     		str	r3, [r7]
 992 043a 06E0     		b	.L53
 993              	.L54:
 278:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		{
 279:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 			graphic_write_data(0, B_CS1|B_CS2);
 994              		.loc 1 279 0 discriminator 3
 995 043c 1821     		movs	r1, #24
 996 043e 0020     		movs	r0, #0
 997 0440 FFF7FEFF 		bl	graphic_write_data
 277:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		for(unsigned int add = 0; add<64;add++)
 998              		.loc 1 277 0 discriminator 3
 999 0444 3B68     		ldr	r3, [r7]
 1000 0446 0133     		adds	r3, r3, #1
 1001 0448 3B60     		str	r3, [r7]
 1002              	.L53:
 277:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		for(unsigned int add = 0; add<64;add++)
 1003              		.loc 1 277 0 is_stmt 0 discriminator 1
 1004 044a 3B68     		ldr	r3, [r7]
 1005 044c 3F2B     		cmp	r3, #63
 1006 044e F5D9     		bls	.L54
 1007              	.LBE3:
 273:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	{
 1008              		.loc 1 273 0 is_stmt 1 discriminator 2
 1009 0450 7B68     		ldr	r3, [r7, #4]
 1010 0452 0133     		adds	r3, r3, #1
 1011 0454 7B60     		str	r3, [r7, #4]
 1012              	.L52:
 273:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	{
 1013              		.loc 1 273 0 is_stmt 0 discriminator 1
 1014 0456 7B68     		ldr	r3, [r7, #4]
 1015 0458 072B     		cmp	r3, #7
 1016 045a DED9     		bls	.L55
 1017              	.LBE2:
 280:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		}
 281:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 282:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 1018              		.loc 1 282 0 is_stmt 1
 1019 045c C046     		nop
 1020 045e BD46     		mov	sp, r7
 1021 0460 02B0     		add	sp, sp, #8
 1022              		@ sp needed
 1023 0462 80BD     		pop	{r7, pc}
 1024              		.cfi_endproc
 1025              	.LFE15:
 1027              		.align	1
 1028              		.global	pixel
 1029              		.syntax unified
 1030              		.code	16
 1031              		.thumb_func
 1032              		.fpu softvfp
 1034              	pixel:
 1035              	.LFB16:
 283:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 284:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void pixel(int x, int y, int set)
 285:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 1036              		.loc 1 285 0
 1037              		.cfi_startproc
 1038              		@ args = 0, pretend = 0, frame = 32
 1039              		@ frame_needed = 1, uses_anonymous_args = 0
 1040 0464 B0B5     		push	{r4, r5, r7, lr}
 1041              		.cfi_def_cfa_offset 16
 1042              		.cfi_offset 4, -16
 1043              		.cfi_offset 5, -12
 1044              		.cfi_offset 7, -8
 1045              		.cfi_offset 14, -4
 1046 0466 88B0     		sub	sp, sp, #32
 1047              		.cfi_def_cfa_offset 48
 1048 0468 00AF     		add	r7, sp, #0
 1049              		.cfi_def_cfa_register 7
 1050 046a F860     		str	r0, [r7, #12]
 1051 046c B960     		str	r1, [r7, #8]
 1052 046e 7A60     		str	r2, [r7, #4]
 286:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	uint8_t mask, c, controller;
 287:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	int index;
 288:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	
 289:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	if((x < 1) || (y < 1) || (x > 128) || (y > 64)) return;
 1053              		.loc 1 289 0
 1054 0470 FB68     		ldr	r3, [r7, #12]
 1055 0472 002B     		cmp	r3, #0
 1056 0474 00DC     		bgt	.LCB840
 1057 0476 B6E0     		b	.L77	@long jump
 1058              	.LCB840:
 1059              		.loc 1 289 0 is_stmt 0 discriminator 1
 1060 0478 BB68     		ldr	r3, [r7, #8]
 1061 047a 002B     		cmp	r3, #0
 1062 047c 00DC     		bgt	.LCB843
 1063 047e B2E0     		b	.L77	@long jump
 1064              	.LCB843:
 1065              		.loc 1 289 0 discriminator 2
 1066 0480 FB68     		ldr	r3, [r7, #12]
 1067 0482 802B     		cmp	r3, #128
 1068 0484 00DD     		ble	.LCB846
 1069 0486 AEE0     		b	.L77	@long jump
 1070              	.LCB846:
 1071              		.loc 1 289 0 discriminator 3
 1072 0488 BB68     		ldr	r3, [r7, #8]
 1073 048a 402B     		cmp	r3, #64
 1074 048c 00DD     		ble	.LCB849
 1075 048e AAE0     		b	.L77	@long jump
 1076              	.LCB849:
 290:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	
 291:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	index = (y-1)/8;
 1077              		.loc 1 291 0 is_stmt 1
 1078 0490 BB68     		ldr	r3, [r7, #8]
 1079 0492 013B     		subs	r3, r3, #1
 1080 0494 002B     		cmp	r3, #0
 1081 0496 00DA     		bge	.L60
 1082 0498 0733     		adds	r3, r3, #7
 1083              	.L60:
 1084 049a DB10     		asrs	r3, r3, #3
 1085 049c BB61     		str	r3, [r7, #24]
 292:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	
 293:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	switch((y-1)%8){
 1086              		.loc 1 293 0
 1087 049e BB68     		ldr	r3, [r7, #8]
 1088 04a0 013B     		subs	r3, r3, #1
 1089 04a2 534A     		ldr	r2, .L78
 1090 04a4 1340     		ands	r3, r2
 1091 04a6 04D5     		bpl	.L61
 1092 04a8 013B     		subs	r3, r3, #1
 1093 04aa 0822     		movs	r2, #8
 1094 04ac 5242     		rsbs	r2, r2, #0
 1095 04ae 1343     		orrs	r3, r2
 1096 04b0 0133     		adds	r3, r3, #1
 1097              	.L61:
 1098 04b2 072B     		cmp	r3, #7
 1099 04b4 2CD8     		bhi	.L62
 1100 04b6 9A00     		lsls	r2, r3, #2
 1101 04b8 4E4B     		ldr	r3, .L78+4
 1102 04ba D318     		adds	r3, r2, r3
 1103 04bc 1B68     		ldr	r3, [r3]
 1104 04be 9F46     		mov	pc, r3
 1105              		.section	.rodata
 1106              		.align	2
 1107              	.L64:
 1108 0000 C0040000 		.word	.L63
 1109 0004 CA040000 		.word	.L65
 1110 0008 D4040000 		.word	.L66
 1111 000c DE040000 		.word	.L67
 1112 0010 E8040000 		.word	.L68
 1113 0014 F2040000 		.word	.L69
 1114 0018 FC040000 		.word	.L70
 1115 001c 06050000 		.word	.L71
 1116              		.text
 1117              	.L63:
 294:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		case 0: mask = 1; break;
 1118              		.loc 1 294 0
 1119 04c0 1F23     		movs	r3, #31
 1120 04c2 FB18     		adds	r3, r7, r3
 1121 04c4 0122     		movs	r2, #1
 1122 04c6 1A70     		strb	r2, [r3]
 1123 04c8 22E0     		b	.L62
 1124              	.L65:
 295:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		case 1: mask = 2; break;
 1125              		.loc 1 295 0
 1126 04ca 1F23     		movs	r3, #31
 1127 04cc FB18     		adds	r3, r7, r3
 1128 04ce 0222     		movs	r2, #2
 1129 04d0 1A70     		strb	r2, [r3]
 1130 04d2 1DE0     		b	.L62
 1131              	.L66:
 296:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		case 2: mask = 4; break;
 1132              		.loc 1 296 0
 1133 04d4 1F23     		movs	r3, #31
 1134 04d6 FB18     		adds	r3, r7, r3
 1135 04d8 0422     		movs	r2, #4
 1136 04da 1A70     		strb	r2, [r3]
 1137 04dc 18E0     		b	.L62
 1138              	.L67:
 297:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		case 3: mask = 8; break;
 1139              		.loc 1 297 0
 1140 04de 1F23     		movs	r3, #31
 1141 04e0 FB18     		adds	r3, r7, r3
 1142 04e2 0822     		movs	r2, #8
 1143 04e4 1A70     		strb	r2, [r3]
 1144 04e6 13E0     		b	.L62
 1145              	.L68:
 298:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		case 4: mask = 0x10; break;
 1146              		.loc 1 298 0
 1147 04e8 1F23     		movs	r3, #31
 1148 04ea FB18     		adds	r3, r7, r3
 1149 04ec 1022     		movs	r2, #16
 1150 04ee 1A70     		strb	r2, [r3]
 1151 04f0 0EE0     		b	.L62
 1152              	.L69:
 299:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		case 5: mask = 0x20; break;
 1153              		.loc 1 299 0
 1154 04f2 1F23     		movs	r3, #31
 1155 04f4 FB18     		adds	r3, r7, r3
 1156 04f6 2022     		movs	r2, #32
 1157 04f8 1A70     		strb	r2, [r3]
 1158 04fa 09E0     		b	.L62
 1159              	.L70:
 300:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		case 6: mask = 0x40; break;
 1160              		.loc 1 300 0
 1161 04fc 1F23     		movs	r3, #31
 1162 04fe FB18     		adds	r3, r7, r3
 1163 0500 4022     		movs	r2, #64
 1164 0502 1A70     		strb	r2, [r3]
 1165 0504 04E0     		b	.L62
 1166              	.L71:
 301:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		case 7: mask = 0x80; break;
 1167              		.loc 1 301 0
 1168 0506 1F23     		movs	r3, #31
 1169 0508 FB18     		adds	r3, r7, r3
 1170 050a 8022     		movs	r2, #128
 1171 050c 1A70     		strb	r2, [r3]
 1172 050e C046     		nop
 1173              	.L62:
 302:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 303:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	
 304:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	if(set == 0){
 1174              		.loc 1 304 0
 1175 0510 7B68     		ldr	r3, [r7, #4]
 1176 0512 002B     		cmp	r3, #0
 1177 0514 05D1     		bne	.L72
 305:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		mask = ~mask;
 1178              		.loc 1 305 0
 1179 0516 1F22     		movs	r2, #31
 1180 0518 BB18     		adds	r3, r7, r2
 1181 051a BA18     		adds	r2, r7, r2
 1182 051c 1278     		ldrb	r2, [r2]
 1183 051e D243     		mvns	r2, r2
 1184 0520 1A70     		strb	r2, [r3]
 1185              	.L72:
 306:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 307:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	if(x>64){
 1186              		.loc 1 307 0
 1187 0522 FB68     		ldr	r3, [r7, #12]
 1188 0524 402B     		cmp	r3, #64
 1189 0526 07DD     		ble	.L73
 308:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		controller = B_CS2;
 1190              		.loc 1 308 0
 1191 0528 1E23     		movs	r3, #30
 1192 052a FB18     		adds	r3, r7, r3
 1193 052c 1022     		movs	r2, #16
 1194 052e 1A70     		strb	r2, [r3]
 309:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		x = x - 65;
 1195              		.loc 1 309 0
 1196 0530 FB68     		ldr	r3, [r7, #12]
 1197 0532 413B     		subs	r3, r3, #65
 1198 0534 FB60     		str	r3, [r7, #12]
 1199 0536 06E0     		b	.L74
 1200              	.L73:
 310:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}else{
 311:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		controller = B_CS1;
 1201              		.loc 1 311 0
 1202 0538 1E23     		movs	r3, #30
 1203 053a FB18     		adds	r3, r7, r3
 1204 053c 0822     		movs	r2, #8
 1205 053e 1A70     		strb	r2, [r3]
 312:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		x = x-1;
 1206              		.loc 1 312 0
 1207 0540 FB68     		ldr	r3, [r7, #12]
 1208 0542 013B     		subs	r3, r3, #1
 1209 0544 FB60     		str	r3, [r7, #12]
 1210              	.L74:
 313:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 314:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	
 315:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_write_command(LCD_SET_ADD | x,controller);
 1211              		.loc 1 315 0
 1212 0546 FB68     		ldr	r3, [r7, #12]
 1213 0548 5BB2     		sxtb	r3, r3
 1214 054a 4022     		movs	r2, #64
 1215 054c 1343     		orrs	r3, r2
 1216 054e 5BB2     		sxtb	r3, r3
 1217 0550 DAB2     		uxtb	r2, r3
 1218 0552 1E25     		movs	r5, #30
 1219 0554 7B19     		adds	r3, r7, r5
 1220 0556 1B78     		ldrb	r3, [r3]
 1221 0558 1900     		movs	r1, r3
 1222 055a 1000     		movs	r0, r2
 1223 055c FFF7FEFF 		bl	graphic_write_command
 316:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_write_command(LCD_SET_PAGE| index, controller);
 1224              		.loc 1 316 0
 1225 0560 BB69     		ldr	r3, [r7, #24]
 1226 0562 5BB2     		sxtb	r3, r3
 1227 0564 4822     		movs	r2, #72
 1228 0566 5242     		rsbs	r2, r2, #0
 1229 0568 1343     		orrs	r3, r2
 1230 056a 5BB2     		sxtb	r3, r3
 1231 056c DAB2     		uxtb	r2, r3
 1232 056e 7B19     		adds	r3, r7, r5
 1233 0570 1B78     		ldrb	r3, [r3]
 1234 0572 1900     		movs	r1, r3
 1235 0574 1000     		movs	r0, r2
 1236 0576 FFF7FEFF 		bl	graphic_write_command
 317:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	c = graphic_read_data(controller);
 1237              		.loc 1 317 0
 1238 057a 1723     		movs	r3, #23
 1239 057c FC18     		adds	r4, r7, r3
 1240 057e 7B19     		adds	r3, r7, r5
 1241 0580 1B78     		ldrb	r3, [r3]
 1242 0582 1800     		movs	r0, r3
 1243 0584 FFF7FEFF 		bl	graphic_read_data
 1244 0588 0300     		movs	r3, r0
 1245 058a 2370     		strb	r3, [r4]
 318:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_write_command(LCD_SET_ADD| x, controller);
 1246              		.loc 1 318 0
 1247 058c FB68     		ldr	r3, [r7, #12]
 1248 058e 5BB2     		sxtb	r3, r3
 1249 0590 4022     		movs	r2, #64
 1250 0592 1343     		orrs	r3, r2
 1251 0594 5BB2     		sxtb	r3, r3
 1252 0596 DAB2     		uxtb	r2, r3
 1253 0598 7B19     		adds	r3, r7, r5
 1254 059a 1B78     		ldrb	r3, [r3]
 1255 059c 1900     		movs	r1, r3
 1256 059e 1000     		movs	r0, r2
 1257 05a0 FFF7FEFF 		bl	graphic_write_command
 319:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	
 320:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	if(set){
 1258              		.loc 1 320 0
 1259 05a4 7B68     		ldr	r3, [r7, #4]
 1260 05a6 002B     		cmp	r3, #0
 1261 05a8 09D0     		beq	.L75
 321:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		mask = mask | c;
 1262              		.loc 1 321 0
 1263 05aa 1F22     		movs	r2, #31
 1264 05ac BB18     		adds	r3, r7, r2
 1265 05ae B918     		adds	r1, r7, r2
 1266 05b0 1722     		movs	r2, #23
 1267 05b2 BA18     		adds	r2, r7, r2
 1268 05b4 0978     		ldrb	r1, [r1]
 1269 05b6 1278     		ldrb	r2, [r2]
 1270 05b8 0A43     		orrs	r2, r1
 1271 05ba 1A70     		strb	r2, [r3]
 1272 05bc 08E0     		b	.L76
 1273              	.L75:
 322:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}else{
 323:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		mask = mask & c;
 1274              		.loc 1 323 0
 1275 05be 1F22     		movs	r2, #31
 1276 05c0 BB18     		adds	r3, r7, r2
 1277 05c2 BA18     		adds	r2, r7, r2
 1278 05c4 1721     		movs	r1, #23
 1279 05c6 7918     		adds	r1, r7, r1
 1280 05c8 1278     		ldrb	r2, [r2]
 1281 05ca 0978     		ldrb	r1, [r1]
 1282 05cc 0A40     		ands	r2, r1
 1283 05ce 1A70     		strb	r2, [r3]
 1284              	.L76:
 324:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 325:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_write_data(mask, controller);
 1285              		.loc 1 325 0
 1286 05d0 1E23     		movs	r3, #30
 1287 05d2 FB18     		adds	r3, r7, r3
 1288 05d4 1A78     		ldrb	r2, [r3]
 1289 05d6 1F23     		movs	r3, #31
 1290 05d8 FB18     		adds	r3, r7, r3
 1291 05da 1B78     		ldrb	r3, [r3]
 1292 05dc 1100     		movs	r1, r2
 1293 05de 1800     		movs	r0, r3
 1294 05e0 FFF7FEFF 		bl	graphic_write_data
 1295 05e4 00E0     		b	.L56
 1296              	.L77:
 289:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	
 1297              		.loc 1 289 0
 1298 05e6 C046     		nop
 1299              	.L56:
 326:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 1300              		.loc 1 326 0
 1301 05e8 BD46     		mov	sp, r7
 1302 05ea 08B0     		add	sp, sp, #32
 1303              		@ sp needed
 1304 05ec B0BD     		pop	{r4, r5, r7, pc}
 1305              	.L79:
 1306 05ee C046     		.align	2
 1307              	.L78:
 1308 05f0 07000080 		.word	-2147483641
 1309 05f4 00000000 		.word	.L64
 1310              		.cfi_endproc
 1311              	.LFE16:
 1313              		.align	1
 1314              		.global	draw_object
 1315              		.syntax unified
 1316              		.code	16
 1317              		.thumb_func
 1318              		.fpu softvfp
 1320              	draw_object:
 1321              	.LFB17:
 327:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 328:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void draw_object(POBJECT obj)
 329:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 1322              		.loc 1 329 0
 1323              		.cfi_startproc
 1324              		@ args = 0, pretend = 0, frame = 16
 1325              		@ frame_needed = 1, uses_anonymous_args = 0
 1326 05f8 B0B5     		push	{r4, r5, r7, lr}
 1327              		.cfi_def_cfa_offset 16
 1328              		.cfi_offset 4, -16
 1329              		.cfi_offset 5, -12
 1330              		.cfi_offset 7, -8
 1331              		.cfi_offset 14, -4
 1332 05fa 84B0     		sub	sp, sp, #16
 1333              		.cfi_def_cfa_offset 32
 1334 05fc 00AF     		add	r7, sp, #0
 1335              		.cfi_def_cfa_register 7
 1336 05fe 7860     		str	r0, [r7, #4]
 330:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	uint8_t p;
 331:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	uint8_t n = obj->geo->numpoints;
 1337              		.loc 1 331 0
 1338 0600 7B68     		ldr	r3, [r7, #4]
 1339 0602 1B68     		ldr	r3, [r3]
 1340 0604 1A68     		ldr	r2, [r3]
 1341 0606 0E23     		movs	r3, #14
 1342 0608 FB18     		adds	r3, r7, r3
 1343 060a 1A70     		strb	r2, [r3]
 332:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	uint8_t x_coord;
 333:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	uint8_t y_coord;
 334:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	
 335:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	POINT s;
 336:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	for(p = 0; p<n; p++){
 1344              		.loc 1 336 0
 1345 060c 0F23     		movs	r3, #15
 1346 060e FB18     		adds	r3, r7, r3
 1347 0610 0022     		movs	r2, #0
 1348 0612 1A70     		strb	r2, [r3]
 1349 0614 2DE0     		b	.L81
 1350              	.L82:
 337:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		//s = obj -> geo -> px[p];
 338:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		x_coord  = obj->posx + obj->geo->px[p].x;
 1351              		.loc 1 338 0 discriminator 3
 1352 0616 7B68     		ldr	r3, [r7, #4]
 1353 0618 DB68     		ldr	r3, [r3, #12]
 1354 061a D9B2     		uxtb	r1, r3
 1355 061c 7B68     		ldr	r3, [r7, #4]
 1356 061e 1A68     		ldr	r2, [r3]
 1357 0620 0F24     		movs	r4, #15
 1358 0622 3B19     		adds	r3, r7, r4
 1359 0624 1B78     		ldrb	r3, [r3]
 1360 0626 0433     		adds	r3, r3, #4
 1361 0628 5B00     		lsls	r3, r3, #1
 1362 062a D318     		adds	r3, r2, r3
 1363 062c 0433     		adds	r3, r3, #4
 1364 062e 1A78     		ldrb	r2, [r3]
 1365 0630 0D20     		movs	r0, #13
 1366 0632 3B18     		adds	r3, r7, r0
 1367 0634 8A18     		adds	r2, r1, r2
 1368 0636 1A70     		strb	r2, [r3]
 339:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		y_coord = obj->posy + obj->geo->px[p].y;
 1369              		.loc 1 339 0 discriminator 3
 1370 0638 7B68     		ldr	r3, [r7, #4]
 1371 063a 1B69     		ldr	r3, [r3, #16]
 1372 063c D9B2     		uxtb	r1, r3
 1373 063e 7B68     		ldr	r3, [r7, #4]
 1374 0640 1A68     		ldr	r2, [r3]
 1375 0642 3B19     		adds	r3, r7, r4
 1376 0644 1B78     		ldrb	r3, [r3]
 1377 0646 0433     		adds	r3, r3, #4
 1378 0648 5B00     		lsls	r3, r3, #1
 1379 064a D318     		adds	r3, r2, r3
 1380 064c 0533     		adds	r3, r3, #5
 1381 064e 1A78     		ldrb	r2, [r3]
 1382 0650 0C25     		movs	r5, #12
 1383 0652 7B19     		adds	r3, r7, r5
 1384 0654 8A18     		adds	r2, r1, r2
 1385 0656 1A70     		strb	r2, [r3]
 340:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		//point = obj->geo->px;
 341:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		//pixel(s.x, s.y,1);
 342:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		pixel(x_coord,y_coord,1);
 1386              		.loc 1 342 0 discriminator 3
 1387 0658 3B18     		adds	r3, r7, r0
 1388 065a 1878     		ldrb	r0, [r3]
 1389 065c 7B19     		adds	r3, r7, r5
 1390 065e 1B78     		ldrb	r3, [r3]
 1391 0660 0122     		movs	r2, #1
 1392 0662 1900     		movs	r1, r3
 1393 0664 FFF7FEFF 		bl	pixel
 336:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		//s = obj -> geo -> px[p];
 1394              		.loc 1 336 0 discriminator 3
 1395 0668 3B19     		adds	r3, r7, r4
 1396 066a 1A78     		ldrb	r2, [r3]
 1397 066c 3B19     		adds	r3, r7, r4
 1398 066e 0132     		adds	r2, r2, #1
 1399 0670 1A70     		strb	r2, [r3]
 1400              	.L81:
 336:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		//s = obj -> geo -> px[p];
 1401              		.loc 1 336 0 is_stmt 0 discriminator 1
 1402 0672 0F23     		movs	r3, #15
 1403 0674 FA18     		adds	r2, r7, r3
 1404 0676 0E23     		movs	r3, #14
 1405 0678 FB18     		adds	r3, r7, r3
 1406 067a 1278     		ldrb	r2, [r2]
 1407 067c 1B78     		ldrb	r3, [r3]
 1408 067e 9A42     		cmp	r2, r3
 1409 0680 C9D3     		bcc	.L82
 343:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 344:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 1410              		.loc 1 344 0 is_stmt 1
 1411 0682 C046     		nop
 1412 0684 BD46     		mov	sp, r7
 1413 0686 04B0     		add	sp, sp, #16
 1414              		@ sp needed
 1415 0688 B0BD     		pop	{r4, r5, r7, pc}
 1416              		.cfi_endproc
 1417              	.LFE17:
 1419              		.align	1
 1420              		.global	clear_object
 1421              		.syntax unified
 1422              		.code	16
 1423              		.thumb_func
 1424              		.fpu softvfp
 1426              	clear_object:
 1427              	.LFB18:
 345:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 346:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void clear_object(POBJECT obj)
 347:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 1428              		.loc 1 347 0
 1429              		.cfi_startproc
 1430              		@ args = 0, pretend = 0, frame = 16
 1431              		@ frame_needed = 1, uses_anonymous_args = 0
 1432 068a B0B5     		push	{r4, r5, r7, lr}
 1433              		.cfi_def_cfa_offset 16
 1434              		.cfi_offset 4, -16
 1435              		.cfi_offset 5, -12
 1436              		.cfi_offset 7, -8
 1437              		.cfi_offset 14, -4
 1438 068c 84B0     		sub	sp, sp, #16
 1439              		.cfi_def_cfa_offset 32
 1440 068e 00AF     		add	r7, sp, #0
 1441              		.cfi_def_cfa_register 7
 1442 0690 7860     		str	r0, [r7, #4]
 348:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	uint8_t p;
 349:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	uint8_t n = obj->geo->numpoints;
 1443              		.loc 1 349 0
 1444 0692 7B68     		ldr	r3, [r7, #4]
 1445 0694 1B68     		ldr	r3, [r3]
 1446 0696 1A68     		ldr	r2, [r3]
 1447 0698 0E23     		movs	r3, #14
 1448 069a FB18     		adds	r3, r7, r3
 1449 069c 1A70     		strb	r2, [r3]
 350:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	uint8_t x_coord;
 351:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	uint8_t y_coord;
 352:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	for(p = 0; p<n; p++){
 1450              		.loc 1 352 0
 1451 069e 0F23     		movs	r3, #15
 1452 06a0 FB18     		adds	r3, r7, r3
 1453 06a2 0022     		movs	r2, #0
 1454 06a4 1A70     		strb	r2, [r3]
 1455 06a6 2DE0     		b	.L84
 1456              	.L85:
 353:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		x_coord  = obj->posx + obj->geo->px[p].x;
 1457              		.loc 1 353 0 discriminator 3
 1458 06a8 7B68     		ldr	r3, [r7, #4]
 1459 06aa DB68     		ldr	r3, [r3, #12]
 1460 06ac D9B2     		uxtb	r1, r3
 1461 06ae 7B68     		ldr	r3, [r7, #4]
 1462 06b0 1A68     		ldr	r2, [r3]
 1463 06b2 0F24     		movs	r4, #15
 1464 06b4 3B19     		adds	r3, r7, r4
 1465 06b6 1B78     		ldrb	r3, [r3]
 1466 06b8 0433     		adds	r3, r3, #4
 1467 06ba 5B00     		lsls	r3, r3, #1
 1468 06bc D318     		adds	r3, r2, r3
 1469 06be 0433     		adds	r3, r3, #4
 1470 06c0 1A78     		ldrb	r2, [r3]
 1471 06c2 0D20     		movs	r0, #13
 1472 06c4 3B18     		adds	r3, r7, r0
 1473 06c6 8A18     		adds	r2, r1, r2
 1474 06c8 1A70     		strb	r2, [r3]
 354:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		y_coord = obj->posy + obj->geo->px[p].y;
 1475              		.loc 1 354 0 discriminator 3
 1476 06ca 7B68     		ldr	r3, [r7, #4]
 1477 06cc 1B69     		ldr	r3, [r3, #16]
 1478 06ce D9B2     		uxtb	r1, r3
 1479 06d0 7B68     		ldr	r3, [r7, #4]
 1480 06d2 1A68     		ldr	r2, [r3]
 1481 06d4 3B19     		adds	r3, r7, r4
 1482 06d6 1B78     		ldrb	r3, [r3]
 1483 06d8 0433     		adds	r3, r3, #4
 1484 06da 5B00     		lsls	r3, r3, #1
 1485 06dc D318     		adds	r3, r2, r3
 1486 06de 0533     		adds	r3, r3, #5
 1487 06e0 1A78     		ldrb	r2, [r3]
 1488 06e2 0C25     		movs	r5, #12
 1489 06e4 7B19     		adds	r3, r7, r5
 1490 06e6 8A18     		adds	r2, r1, r2
 1491 06e8 1A70     		strb	r2, [r3]
 355:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		pixel(x_coord,y_coord,0);
 1492              		.loc 1 355 0 discriminator 3
 1493 06ea 3B18     		adds	r3, r7, r0
 1494 06ec 1878     		ldrb	r0, [r3]
 1495 06ee 7B19     		adds	r3, r7, r5
 1496 06f0 1B78     		ldrb	r3, [r3]
 1497 06f2 0022     		movs	r2, #0
 1498 06f4 1900     		movs	r1, r3
 1499 06f6 FFF7FEFF 		bl	pixel
 352:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		x_coord  = obj->posx + obj->geo->px[p].x;
 1500              		.loc 1 352 0 discriminator 3
 1501 06fa 3B19     		adds	r3, r7, r4
 1502 06fc 1A78     		ldrb	r2, [r3]
 1503 06fe 3B19     		adds	r3, r7, r4
 1504 0700 0132     		adds	r2, r2, #1
 1505 0702 1A70     		strb	r2, [r3]
 1506              	.L84:
 352:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		x_coord  = obj->posx + obj->geo->px[p].x;
 1507              		.loc 1 352 0 is_stmt 0 discriminator 1
 1508 0704 0F23     		movs	r3, #15
 1509 0706 FA18     		adds	r2, r7, r3
 1510 0708 0E23     		movs	r3, #14
 1511 070a FB18     		adds	r3, r7, r3
 1512 070c 1278     		ldrb	r2, [r2]
 1513 070e 1B78     		ldrb	r3, [r3]
 1514 0710 9A42     		cmp	r2, r3
 1515 0712 C9D3     		bcc	.L85
 356:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 357:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 1516              		.loc 1 357 0 is_stmt 1
 1517 0714 C046     		nop
 1518 0716 BD46     		mov	sp, r7
 1519 0718 04B0     		add	sp, sp, #16
 1520              		@ sp needed
 1521 071a B0BD     		pop	{r4, r5, r7, pc}
 1522              		.cfi_endproc
 1523              	.LFE18:
 1525              		.align	1
 1526              		.global	set_object_speed
 1527              		.syntax unified
 1528              		.code	16
 1529              		.thumb_func
 1530              		.fpu softvfp
 1532              	set_object_speed:
 1533              	.LFB19:
 358:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 359:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void set_object_speed(POBJECT o, int speedx, int speedy){
 1534              		.loc 1 359 0
 1535              		.cfi_startproc
 1536              		@ args = 0, pretend = 0, frame = 16
 1537              		@ frame_needed = 1, uses_anonymous_args = 0
 1538 071c 80B5     		push	{r7, lr}
 1539              		.cfi_def_cfa_offset 8
 1540              		.cfi_offset 7, -8
 1541              		.cfi_offset 14, -4
 1542 071e 84B0     		sub	sp, sp, #16
 1543              		.cfi_def_cfa_offset 24
 1544 0720 00AF     		add	r7, sp, #0
 1545              		.cfi_def_cfa_register 7
 1546 0722 F860     		str	r0, [r7, #12]
 1547 0724 B960     		str	r1, [r7, #8]
 1548 0726 7A60     		str	r2, [r7, #4]
 360:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	o->dirx = speedx;
 1549              		.loc 1 360 0
 1550 0728 FB68     		ldr	r3, [r7, #12]
 1551 072a BA68     		ldr	r2, [r7, #8]
 1552 072c 5A60     		str	r2, [r3, #4]
 361:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	o->diry = speedy;
 1553              		.loc 1 361 0
 1554 072e FB68     		ldr	r3, [r7, #12]
 1555 0730 7A68     		ldr	r2, [r7, #4]
 1556 0732 9A60     		str	r2, [r3, #8]
 362:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 1557              		.loc 1 362 0
 1558 0734 C046     		nop
 1559 0736 BD46     		mov	sp, r7
 1560 0738 04B0     		add	sp, sp, #16
 1561              		@ sp needed
 1562 073a 80BD     		pop	{r7, pc}
 1563              		.cfi_endproc
 1564              	.LFE19:
 1566              		.align	1
 1567              		.global	move_object
 1568              		.syntax unified
 1569              		.code	16
 1570              		.thumb_func
 1571              		.fpu softvfp
 1573              	move_object:
 1574              	.LFB20:
 363:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 364:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void move_object(POBJECT o){
 1575              		.loc 1 364 0
 1576              		.cfi_startproc
 1577              		@ args = 0, pretend = 0, frame = 8
 1578              		@ frame_needed = 1, uses_anonymous_args = 0
 1579 073c 80B5     		push	{r7, lr}
 1580              		.cfi_def_cfa_offset 8
 1581              		.cfi_offset 7, -8
 1582              		.cfi_offset 14, -4
 1583 073e 82B0     		sub	sp, sp, #8
 1584              		.cfi_def_cfa_offset 16
 1585 0740 00AF     		add	r7, sp, #0
 1586              		.cfi_def_cfa_register 7
 1587 0742 7860     		str	r0, [r7, #4]
 365:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	clear_object(o);
 1588              		.loc 1 365 0
 1589 0744 7B68     		ldr	r3, [r7, #4]
 1590 0746 1800     		movs	r0, r3
 1591 0748 FFF7FEFF 		bl	clear_object
 366:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	o->posx += o->dirx;
 1592              		.loc 1 366 0
 1593 074c 7B68     		ldr	r3, [r7, #4]
 1594 074e DA68     		ldr	r2, [r3, #12]
 1595 0750 7B68     		ldr	r3, [r7, #4]
 1596 0752 5B68     		ldr	r3, [r3, #4]
 1597 0754 D218     		adds	r2, r2, r3
 1598 0756 7B68     		ldr	r3, [r7, #4]
 1599 0758 DA60     		str	r2, [r3, #12]
 367:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	o->posy += o->diry;
 1600              		.loc 1 367 0
 1601 075a 7B68     		ldr	r3, [r7, #4]
 1602 075c 1A69     		ldr	r2, [r3, #16]
 1603 075e 7B68     		ldr	r3, [r7, #4]
 1604 0760 9B68     		ldr	r3, [r3, #8]
 1605 0762 D218     		adds	r2, r2, r3
 1606 0764 7B68     		ldr	r3, [r7, #4]
 1607 0766 1A61     		str	r2, [r3, #16]
 368:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	
 369:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	if(o->posx < 1){
 1608              		.loc 1 369 0
 1609 0768 7B68     		ldr	r3, [r7, #4]
 1610 076a DB68     		ldr	r3, [r3, #12]
 1611 076c 002B     		cmp	r3, #0
 1612 076e 04DC     		bgt	.L88
 370:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		o->dirx = -o->dirx;
 1613              		.loc 1 370 0
 1614 0770 7B68     		ldr	r3, [r7, #4]
 1615 0772 5B68     		ldr	r3, [r3, #4]
 1616 0774 5A42     		rsbs	r2, r3, #0
 1617 0776 7B68     		ldr	r3, [r7, #4]
 1618 0778 5A60     		str	r2, [r3, #4]
 1619              	.L88:
 371:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 372:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	if(o->posx > 128){
 1620              		.loc 1 372 0
 1621 077a 7B68     		ldr	r3, [r7, #4]
 1622 077c DB68     		ldr	r3, [r3, #12]
 1623 077e 802B     		cmp	r3, #128
 1624 0780 04DD     		ble	.L89
 373:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		o->dirx = -o->dirx;
 1625              		.loc 1 373 0
 1626 0782 7B68     		ldr	r3, [r7, #4]
 1627 0784 5B68     		ldr	r3, [r3, #4]
 1628 0786 5A42     		rsbs	r2, r3, #0
 1629 0788 7B68     		ldr	r3, [r7, #4]
 1630 078a 5A60     		str	r2, [r3, #4]
 1631              	.L89:
 374:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 375:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	if(o->posy < 1){
 1632              		.loc 1 375 0
 1633 078c 7B68     		ldr	r3, [r7, #4]
 1634 078e 1B69     		ldr	r3, [r3, #16]
 1635 0790 002B     		cmp	r3, #0
 1636 0792 04DC     		bgt	.L90
 376:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		o->diry = -o->diry;
 1637              		.loc 1 376 0
 1638 0794 7B68     		ldr	r3, [r7, #4]
 1639 0796 9B68     		ldr	r3, [r3, #8]
 1640 0798 5A42     		rsbs	r2, r3, #0
 1641 079a 7B68     		ldr	r3, [r7, #4]
 1642 079c 9A60     		str	r2, [r3, #8]
 1643              	.L90:
 377:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 378:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	if(o->posy > 64){
 1644              		.loc 1 378 0
 1645 079e 7B68     		ldr	r3, [r7, #4]
 1646 07a0 1B69     		ldr	r3, [r3, #16]
 1647 07a2 402B     		cmp	r3, #64
 1648 07a4 04DD     		ble	.L91
 379:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		o->diry = -o->diry;
 1649              		.loc 1 379 0
 1650 07a6 7B68     		ldr	r3, [r7, #4]
 1651 07a8 9B68     		ldr	r3, [r3, #8]
 1652 07aa 5A42     		rsbs	r2, r3, #0
 1653 07ac 7B68     		ldr	r3, [r7, #4]
 1654 07ae 9A60     		str	r2, [r3, #8]
 1655              	.L91:
 380:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 381:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	draw_object(o);
 1656              		.loc 1 381 0
 1657 07b0 7B68     		ldr	r3, [r7, #4]
 1658 07b2 1800     		movs	r0, r3
 1659 07b4 FFF7FEFF 		bl	draw_object
 382:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 1660              		.loc 1 382 0
 1661 07b8 C046     		nop
 1662 07ba BD46     		mov	sp, r7
 1663 07bc 02B0     		add	sp, sp, #8
 1664              		@ sp needed
 1665 07be 80BD     		pop	{r7, pc}
 1666              		.cfi_endproc
 1667              	.LFE20:
 1669              		.global	ball_geometry
 1670              		.data
 1671              		.align	2
 1674              	ball_geometry:
 1675 0000 0C000000 		.word	12
 1676 0004 04000000 		.word	4
 1677 0008 04000000 		.word	4
 1678 000c 00       		.byte	0
 1679 000d 01       		.byte	1
 1680 000e 00       		.byte	0
 1681 000f 02       		.byte	2
 1682 0010 01       		.byte	1
 1683 0011 00       		.byte	0
 1684 0012 01       		.byte	1
 1685 0013 01       		.byte	1
 1686 0014 01       		.byte	1
 1687 0015 02       		.byte	2
 1688 0016 01       		.byte	1
 1689 0017 03       		.byte	3
 1690 0018 02       		.byte	2
 1691 0019 00       		.byte	0
 1692 001a 02       		.byte	2
 1693 001b 01       		.byte	1
 1694 001c 02       		.byte	2
 1695 001d 02       		.byte	2
 1696 001e 02       		.byte	2
 1697 001f 03       		.byte	3
 1698 0020 03       		.byte	3
 1699 0021 01       		.byte	1
 1700 0022 03       		.byte	3
 1701 0023 02       		.byte	2
 1702 0024 00000000 		.space	16
 1702      00000000 
 1702      00000000 
 1702      00000000 
 1703              		.align	2
 1706              	ball:
 1707 0034 00000000 		.word	ball_geometry
 1708 0038 00000000 		.word	0
 1709 003c 00000000 		.word	0
 1710 0040 01000000 		.word	1
 1711 0044 01000000 		.word	1
 1712 0048 00000000 		.word	draw_object
 1713 004c 00000000 		.word	clear_object
 1714 0050 00000000 		.word	move_object
 1715 0054 00000000 		.word	set_object_speed
 1716              		.text
 1717              		.align	1
 1718              		.global	init_app
 1719              		.syntax unified
 1720              		.code	16
 1721              		.thumb_func
 1722              		.fpu softvfp
 1724              	init_app:
 1725              	.LFB21:
 383:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 384:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	GEOMETRY ball_geometry =
 385:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 386:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	12,4,4,{{0,1},{0,2},{1,0},{1,1},{1,2},{1,3},{2,0},{2,1},{2,2},{2,3},{3,1},{3,2}}
 387:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** };
 388:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 389:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** static OBJECT ball=
 390:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {&ball_geometry,
 391:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 0,0,
 392:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 1,1,
 393:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** draw_object,
 394:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** clear_object,
 395:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** move_object,
 396:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** set_object_speed};
 397:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 398:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void init_app(void)
 399:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 1726              		.loc 1 399 0
 1727              		.cfi_startproc
 1728              		@ args = 0, pretend = 0, frame = 0
 1729              		@ frame_needed = 1, uses_anonymous_args = 0
 1730 07c0 80B5     		push	{r7, lr}
 1731              		.cfi_def_cfa_offset 8
 1732              		.cfi_offset 7, -8
 1733              		.cfi_offset 14, -4
 1734 07c2 00AF     		add	r7, sp, #0
 1735              		.cfi_def_cfa_register 7
 400:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	*GPIO_MODER = 0x55555555;
 1736              		.loc 1 400 0
 1737 07c4 024B     		ldr	r3, .L93
 1738 07c6 034A     		ldr	r2, .L93+4
 1739 07c8 1A60     		str	r2, [r3]
 401:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 1740              		.loc 1 401 0
 1741 07ca C046     		nop
 1742 07cc BD46     		mov	sp, r7
 1743              		@ sp needed
 1744 07ce 80BD     		pop	{r7, pc}
 1745              	.L94:
 1746              		.align	2
 1747              	.L93:
 1748 07d0 00100240 		.word	1073876992
 1749 07d4 55555555 		.word	1431655765
 1750              		.cfi_endproc
 1751              	.LFE21:
 1753              		.align	1
 1754              		.global	main
 1755              		.syntax unified
 1756              		.code	16
 1757              		.thumb_func
 1758              		.fpu softvfp
 1760              	main:
 1761              	.LFB22:
 402:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 403:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void main(void)
 404:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 1762              		.loc 1 404 0
 1763              		.cfi_startproc
 1764              		@ args = 0, pretend = 0, frame = 8
 1765              		@ frame_needed = 1, uses_anonymous_args = 0
 1766 07d8 80B5     		push	{r7, lr}
 1767              		.cfi_def_cfa_offset 8
 1768              		.cfi_offset 7, -8
 1769              		.cfi_offset 14, -4
 1770 07da 82B0     		sub	sp, sp, #8
 1771              		.cfi_def_cfa_offset 16
 1772 07dc 00AF     		add	r7, sp, #0
 1773              		.cfi_def_cfa_register 7
 405:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	//uint8_t i;
 406:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 407:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	POBJECT p = &ball;
 1774              		.loc 1 407 0
 1775 07de 0A4B     		ldr	r3, .L97
 1776 07e0 7B60     		str	r3, [r7, #4]
 408:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	init_app();
 1777              		.loc 1 408 0
 1778 07e2 FFF7FEFF 		bl	init_app
 409:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_initialize();
 1779              		.loc 1 409 0
 1780 07e6 FFF7FEFF 		bl	graphic_initialize
 410:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	#ifndef SIMULATOR
 411:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		graphic_clear_screen();
 412:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	#endif
 413:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	
 414:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	p->set_speed(p,4,1);
 1781              		.loc 1 414 0
 1782 07ea 7B68     		ldr	r3, [r7, #4]
 1783 07ec 1B6A     		ldr	r3, [r3, #32]
 1784 07ee 7868     		ldr	r0, [r7, #4]
 1785 07f0 0122     		movs	r2, #1
 1786 07f2 0421     		movs	r1, #4
 1787 07f4 9847     		blx	r3
 1788              	.LVL0:
 1789              	.L96:
 415:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	while(1)
 416:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	{
 417:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		p->move(p);
 1790              		.loc 1 417 0 discriminator 1
 1791 07f6 7B68     		ldr	r3, [r7, #4]
 1792 07f8 DB69     		ldr	r3, [r3, #28]
 1793 07fa 7A68     		ldr	r2, [r7, #4]
 1794 07fc 1000     		movs	r0, r2
 1795 07fe 9847     		blx	r3
 1796              	.LVL1:
 418:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		delay_milli(40);
 1797              		.loc 1 418 0 discriminator 1
 1798 0800 2820     		movs	r0, #40
 1799 0802 FFF7FEFF 		bl	delay_milli
 417:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		delay_milli(40);
 1800              		.loc 1 417 0 discriminator 1
 1801 0806 F6E7     		b	.L96
 1802              	.L98:
 1803              		.align	2
 1804              	.L97:
 1805 0808 34000000 		.word	ball
 1806              		.cfi_endproc
 1807              	.LFE22:
 1809              	.Letext0:
 1810              		.file 2 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\machine\\_default_types.h"
 1811              		.file 3 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\_stdint.h"
