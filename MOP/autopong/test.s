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
 790              		@ args = 0, pretend = 0, frame = 0
 791              		@ frame_needed = 1, uses_anonymous_args = 0
 792 0356 80B5     		push	{r7, lr}
 793              		.cfi_def_cfa_offset 8
 794              		.cfi_offset 7, -8
 795              		.cfi_offset 14, -4
 796 0358 00AF     		add	r7, sp, #0
 797              		.cfi_def_cfa_register 7
 237:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	#ifndef SIMULATOR
 238:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	*STK_CTRL = 0;
 239:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	*STK_LOAD = 0x29; //0x2A - 1
 240:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	*STK_VAL = 0x0;
 241:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	*STK_CTRL = 5;
 242:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	unsigned int ctrl = *STK_CTRL & 0x10000;
 243:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	while((*STK_CTRL & 0x10000) == 0);
 244:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	*STK_CTRL= 0;
 245:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	#endif
 246:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	
 247:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 798              		.loc 1 247 0
 799 035a C046     		nop
 800 035c BD46     		mov	sp, r7
 801              		@ sp needed
 802 035e 80BD     		pop	{r7, pc}
 803              		.cfi_endproc
 804              	.LFE12:
 806              		.align	1
 807              		.global	delay_500ns
 808              		.syntax unified
 809              		.code	16
 810              		.thumb_func
 811              		.fpu softvfp
 813              	delay_500ns:
 814              	.LFB13:
 248:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 249:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void delay_500ns(void)
 250:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 815              		.loc 1 250 0
 816              		.cfi_startproc
 817              		@ args = 0, pretend = 0, frame = 0
 818              		@ frame_needed = 1, uses_anonymous_args = 0
 819 0360 80B5     		push	{r7, lr}
 820              		.cfi_def_cfa_offset 8
 821              		.cfi_offset 7, -8
 822              		.cfi_offset 14, -4
 823 0362 00AF     		add	r7, sp, #0
 824              		.cfi_def_cfa_register 7
 251:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	#ifndef SIMULATOR
 252:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	delay_250ns();
 253:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	delay_250ns();
 254:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	#endif
 255:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 825              		.loc 1 255 0
 826 0364 C046     		nop
 827 0366 BD46     		mov	sp, r7
 828              		@ sp needed
 829 0368 80BD     		pop	{r7, pc}
 830              		.cfi_endproc
 831              	.LFE13:
 833              		.align	1
 834              		.global	graphic_initialize
 835              		.syntax unified
 836              		.code	16
 837              		.thumb_func
 838              		.fpu softvfp
 840              	graphic_initialize:
 841              	.LFB14:
 256:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 257:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void graphic_initialize(void)
 258:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 842              		.loc 1 258 0
 843              		.cfi_startproc
 844              		@ args = 0, pretend = 0, frame = 0
 845              		@ frame_needed = 1, uses_anonymous_args = 0
 846 036a 80B5     		push	{r7, lr}
 847              		.cfi_def_cfa_offset 8
 848              		.cfi_offset 7, -8
 849              		.cfi_offset 14, -4
 850 036c 00AF     		add	r7, sp, #0
 851              		.cfi_def_cfa_register 7
 259:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_ctrl_bit_set(B_E);
 852              		.loc 1 259 0
 853 036e 4020     		movs	r0, #64
 854 0370 FFF7FEFF 		bl	graphic_ctrl_bit_set
 260:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	delay_micro(10);
 855              		.loc 1 260 0
 856 0374 0A20     		movs	r0, #10
 857 0376 FFF7FEFF 		bl	delay_micro
 261:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_ctrl_bit_clear(B_CS1|B_CS2|B_RST|B_E);
 858              		.loc 1 261 0
 859 037a 7820     		movs	r0, #120
 860 037c FFF7FEFF 		bl	graphic_ctrl_bit_clear
 262:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	delay_milli(30);
 861              		.loc 1 262 0
 862 0380 1E20     		movs	r0, #30
 863 0382 FFF7FEFF 		bl	delay_milli
 263:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_ctrl_bit_set(B_RST);
 864              		.loc 1 263 0
 865 0386 2020     		movs	r0, #32
 866 0388 FFF7FEFF 		bl	graphic_ctrl_bit_set
 264:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	delay_milli(100);
 867              		.loc 1 264 0
 868 038c 6420     		movs	r0, #100
 869 038e FFF7FEFF 		bl	delay_milli
 265:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_write_command(LCD_OFF, B_CS1|B_CS2);
 870              		.loc 1 265 0
 871 0392 1821     		movs	r1, #24
 872 0394 3E20     		movs	r0, #62
 873 0396 FFF7FEFF 		bl	graphic_write_command
 266:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_write_command(LCD_ON, B_CS1|B_CS2);
 874              		.loc 1 266 0
 875 039a 1821     		movs	r1, #24
 876 039c 3F20     		movs	r0, #63
 877 039e FFF7FEFF 		bl	graphic_write_command
 267:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_write_command(LCD_DISP_START, B_CS1|B_CS2);
 878              		.loc 1 267 0
 879 03a2 1821     		movs	r1, #24
 880 03a4 C020     		movs	r0, #192
 881 03a6 FFF7FEFF 		bl	graphic_write_command
 268:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_write_command(LCD_SET_ADD, B_CS1|B_CS2);
 882              		.loc 1 268 0
 883 03aa 1821     		movs	r1, #24
 884 03ac 4020     		movs	r0, #64
 885 03ae FFF7FEFF 		bl	graphic_write_command
 269:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_write_command(LCD_SET_PAGE, B_CS1|B_CS2);
 886              		.loc 1 269 0
 887 03b2 1821     		movs	r1, #24
 888 03b4 B820     		movs	r0, #184
 889 03b6 FFF7FEFF 		bl	graphic_write_command
 270:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	select_controller(0);
 890              		.loc 1 270 0
 891 03ba 0020     		movs	r0, #0
 892 03bc FFF7FEFF 		bl	select_controller
 271:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 893              		.loc 1 271 0
 894 03c0 C046     		nop
 895 03c2 BD46     		mov	sp, r7
 896              		@ sp needed
 897 03c4 80BD     		pop	{r7, pc}
 898              		.cfi_endproc
 899              	.LFE14:
 901              		.align	1
 902              		.global	graphic_clear_screen
 903              		.syntax unified
 904              		.code	16
 905              		.thumb_func
 906              		.fpu softvfp
 908              	graphic_clear_screen:
 909              	.LFB15:
 272:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 273:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void graphic_clear_screen(void)
 274:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 910              		.loc 1 274 0
 911              		.cfi_startproc
 912              		@ args = 0, pretend = 0, frame = 8
 913              		@ frame_needed = 1, uses_anonymous_args = 0
 914 03c6 80B5     		push	{r7, lr}
 915              		.cfi_def_cfa_offset 8
 916              		.cfi_offset 7, -8
 917              		.cfi_offset 14, -4
 918 03c8 82B0     		sub	sp, sp, #8
 919              		.cfi_def_cfa_offset 16
 920 03ca 00AF     		add	r7, sp, #0
 921              		.cfi_def_cfa_register 7
 922              	.LBB2:
 275:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	for(unsigned int page = 0; page < 8; page++)
 923              		.loc 1 275 0
 924 03cc 0023     		movs	r3, #0
 925 03ce 7B60     		str	r3, [r7, #4]
 926 03d0 1DE0     		b	.L49
 927              	.L52:
 276:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	{
 277:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		graphic_write_command(LCD_SET_PAGE|page,B_CS1|B_CS2);
 928              		.loc 1 277 0
 929 03d2 7B68     		ldr	r3, [r7, #4]
 930 03d4 DBB2     		uxtb	r3, r3
 931 03d6 4822     		movs	r2, #72
 932 03d8 5242     		rsbs	r2, r2, #0
 933 03da 1343     		orrs	r3, r2
 934 03dc DBB2     		uxtb	r3, r3
 935 03de 1821     		movs	r1, #24
 936 03e0 1800     		movs	r0, r3
 937 03e2 FFF7FEFF 		bl	graphic_write_command
 278:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		graphic_write_command(LCD_SET_ADD|0,B_CS1|B_CS2);
 938              		.loc 1 278 0
 939 03e6 1821     		movs	r1, #24
 940 03e8 4020     		movs	r0, #64
 941 03ea FFF7FEFF 		bl	graphic_write_command
 942              	.LBB3:
 279:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		for(unsigned int add = 0; add<64;add++)
 943              		.loc 1 279 0
 944 03ee 0023     		movs	r3, #0
 945 03f0 3B60     		str	r3, [r7]
 946 03f2 06E0     		b	.L50
 947              	.L51:
 280:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		{
 281:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 			graphic_write_data(0, B_CS1|B_CS2);
 948              		.loc 1 281 0 discriminator 3
 949 03f4 1821     		movs	r1, #24
 950 03f6 0020     		movs	r0, #0
 951 03f8 FFF7FEFF 		bl	graphic_write_data
 279:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		for(unsigned int add = 0; add<64;add++)
 952              		.loc 1 279 0 discriminator 3
 953 03fc 3B68     		ldr	r3, [r7]
 954 03fe 0133     		adds	r3, r3, #1
 955 0400 3B60     		str	r3, [r7]
 956              	.L50:
 279:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		for(unsigned int add = 0; add<64;add++)
 957              		.loc 1 279 0 is_stmt 0 discriminator 1
 958 0402 3B68     		ldr	r3, [r7]
 959 0404 3F2B     		cmp	r3, #63
 960 0406 F5D9     		bls	.L51
 961              	.LBE3:
 275:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	{
 962              		.loc 1 275 0 is_stmt 1 discriminator 2
 963 0408 7B68     		ldr	r3, [r7, #4]
 964 040a 0133     		adds	r3, r3, #1
 965 040c 7B60     		str	r3, [r7, #4]
 966              	.L49:
 275:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	{
 967              		.loc 1 275 0 is_stmt 0 discriminator 1
 968 040e 7B68     		ldr	r3, [r7, #4]
 969 0410 072B     		cmp	r3, #7
 970 0412 DED9     		bls	.L52
 971              	.LBE2:
 282:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		}
 283:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 284:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 972              		.loc 1 284 0 is_stmt 1
 973 0414 C046     		nop
 974 0416 BD46     		mov	sp, r7
 975 0418 02B0     		add	sp, sp, #8
 976              		@ sp needed
 977 041a 80BD     		pop	{r7, pc}
 978              		.cfi_endproc
 979              	.LFE15:
 981              		.align	1
 982              		.global	pixel
 983              		.syntax unified
 984              		.code	16
 985              		.thumb_func
 986              		.fpu softvfp
 988              	pixel:
 989              	.LFB16:
 285:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 286:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void pixel(int x, int y, int set)
 287:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 990              		.loc 1 287 0
 991              		.cfi_startproc
 992              		@ args = 0, pretend = 0, frame = 32
 993              		@ frame_needed = 1, uses_anonymous_args = 0
 994 041c B0B5     		push	{r4, r5, r7, lr}
 995              		.cfi_def_cfa_offset 16
 996              		.cfi_offset 4, -16
 997              		.cfi_offset 5, -12
 998              		.cfi_offset 7, -8
 999              		.cfi_offset 14, -4
 1000 041e 88B0     		sub	sp, sp, #32
 1001              		.cfi_def_cfa_offset 48
 1002 0420 00AF     		add	r7, sp, #0
 1003              		.cfi_def_cfa_register 7
 1004 0422 F860     		str	r0, [r7, #12]
 1005 0424 B960     		str	r1, [r7, #8]
 1006 0426 7A60     		str	r2, [r7, #4]
 288:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	uint8_t mask, c, controller;
 289:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	int index;
 290:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	
 291:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	if((x < 1) || (y < 1) || (x > 128) || (y > 64)) return;
 1007              		.loc 1 291 0
 1008 0428 FB68     		ldr	r3, [r7, #12]
 1009 042a 002B     		cmp	r3, #0
 1010 042c 00DC     		bgt	.LCB797
 1011 042e B6E0     		b	.L74	@long jump
 1012              	.LCB797:
 1013              		.loc 1 291 0 is_stmt 0 discriminator 1
 1014 0430 BB68     		ldr	r3, [r7, #8]
 1015 0432 002B     		cmp	r3, #0
 1016 0434 00DC     		bgt	.LCB800
 1017 0436 B2E0     		b	.L74	@long jump
 1018              	.LCB800:
 1019              		.loc 1 291 0 discriminator 2
 1020 0438 FB68     		ldr	r3, [r7, #12]
 1021 043a 802B     		cmp	r3, #128
 1022 043c 00DD     		ble	.LCB803
 1023 043e AEE0     		b	.L74	@long jump
 1024              	.LCB803:
 1025              		.loc 1 291 0 discriminator 3
 1026 0440 BB68     		ldr	r3, [r7, #8]
 1027 0442 402B     		cmp	r3, #64
 1028 0444 00DD     		ble	.LCB806
 1029 0446 AAE0     		b	.L74	@long jump
 1030              	.LCB806:
 292:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	
 293:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	index = (y-1)/8;
 1031              		.loc 1 293 0 is_stmt 1
 1032 0448 BB68     		ldr	r3, [r7, #8]
 1033 044a 013B     		subs	r3, r3, #1
 1034 044c 002B     		cmp	r3, #0
 1035 044e 00DA     		bge	.L57
 1036 0450 0733     		adds	r3, r3, #7
 1037              	.L57:
 1038 0452 DB10     		asrs	r3, r3, #3
 1039 0454 BB61     		str	r3, [r7, #24]
 294:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	
 295:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	switch((y-1)%8){
 1040              		.loc 1 295 0
 1041 0456 BB68     		ldr	r3, [r7, #8]
 1042 0458 013B     		subs	r3, r3, #1
 1043 045a 534A     		ldr	r2, .L75
 1044 045c 1340     		ands	r3, r2
 1045 045e 04D5     		bpl	.L58
 1046 0460 013B     		subs	r3, r3, #1
 1047 0462 0822     		movs	r2, #8
 1048 0464 5242     		rsbs	r2, r2, #0
 1049 0466 1343     		orrs	r3, r2
 1050 0468 0133     		adds	r3, r3, #1
 1051              	.L58:
 1052 046a 072B     		cmp	r3, #7
 1053 046c 2CD8     		bhi	.L59
 1054 046e 9A00     		lsls	r2, r3, #2
 1055 0470 4E4B     		ldr	r3, .L75+4
 1056 0472 D318     		adds	r3, r2, r3
 1057 0474 1B68     		ldr	r3, [r3]
 1058 0476 9F46     		mov	pc, r3
 1059              		.section	.rodata
 1060              		.align	2
 1061              	.L61:
 1062 0000 78040000 		.word	.L60
 1063 0004 82040000 		.word	.L62
 1064 0008 8C040000 		.word	.L63
 1065 000c 96040000 		.word	.L64
 1066 0010 A0040000 		.word	.L65
 1067 0014 AA040000 		.word	.L66
 1068 0018 B4040000 		.word	.L67
 1069 001c BE040000 		.word	.L68
 1070              		.text
 1071              	.L60:
 296:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		case 0: mask = 1; break;
 1072              		.loc 1 296 0
 1073 0478 1F23     		movs	r3, #31
 1074 047a FB18     		adds	r3, r7, r3
 1075 047c 0122     		movs	r2, #1
 1076 047e 1A70     		strb	r2, [r3]
 1077 0480 22E0     		b	.L59
 1078              	.L62:
 297:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		case 1: mask = 2; break;
 1079              		.loc 1 297 0
 1080 0482 1F23     		movs	r3, #31
 1081 0484 FB18     		adds	r3, r7, r3
 1082 0486 0222     		movs	r2, #2
 1083 0488 1A70     		strb	r2, [r3]
 1084 048a 1DE0     		b	.L59
 1085              	.L63:
 298:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		case 2: mask = 4; break;
 1086              		.loc 1 298 0
 1087 048c 1F23     		movs	r3, #31
 1088 048e FB18     		adds	r3, r7, r3
 1089 0490 0422     		movs	r2, #4
 1090 0492 1A70     		strb	r2, [r3]
 1091 0494 18E0     		b	.L59
 1092              	.L64:
 299:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		case 3: mask = 8; break;
 1093              		.loc 1 299 0
 1094 0496 1F23     		movs	r3, #31
 1095 0498 FB18     		adds	r3, r7, r3
 1096 049a 0822     		movs	r2, #8
 1097 049c 1A70     		strb	r2, [r3]
 1098 049e 13E0     		b	.L59
 1099              	.L65:
 300:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		case 4: mask = 0x10; break;
 1100              		.loc 1 300 0
 1101 04a0 1F23     		movs	r3, #31
 1102 04a2 FB18     		adds	r3, r7, r3
 1103 04a4 1022     		movs	r2, #16
 1104 04a6 1A70     		strb	r2, [r3]
 1105 04a8 0EE0     		b	.L59
 1106              	.L66:
 301:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		case 5: mask = 0x20; break;
 1107              		.loc 1 301 0
 1108 04aa 1F23     		movs	r3, #31
 1109 04ac FB18     		adds	r3, r7, r3
 1110 04ae 2022     		movs	r2, #32
 1111 04b0 1A70     		strb	r2, [r3]
 1112 04b2 09E0     		b	.L59
 1113              	.L67:
 302:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		case 6: mask = 0x40; break;
 1114              		.loc 1 302 0
 1115 04b4 1F23     		movs	r3, #31
 1116 04b6 FB18     		adds	r3, r7, r3
 1117 04b8 4022     		movs	r2, #64
 1118 04ba 1A70     		strb	r2, [r3]
 1119 04bc 04E0     		b	.L59
 1120              	.L68:
 303:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		case 7: mask = 0x80; break;
 1121              		.loc 1 303 0
 1122 04be 1F23     		movs	r3, #31
 1123 04c0 FB18     		adds	r3, r7, r3
 1124 04c2 8022     		movs	r2, #128
 1125 04c4 1A70     		strb	r2, [r3]
 1126 04c6 C046     		nop
 1127              	.L59:
 304:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 305:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	
 306:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	if(set == 0){
 1128              		.loc 1 306 0
 1129 04c8 7B68     		ldr	r3, [r7, #4]
 1130 04ca 002B     		cmp	r3, #0
 1131 04cc 05D1     		bne	.L69
 307:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		mask = ~mask;
 1132              		.loc 1 307 0
 1133 04ce 1F22     		movs	r2, #31
 1134 04d0 BB18     		adds	r3, r7, r2
 1135 04d2 BA18     		adds	r2, r7, r2
 1136 04d4 1278     		ldrb	r2, [r2]
 1137 04d6 D243     		mvns	r2, r2
 1138 04d8 1A70     		strb	r2, [r3]
 1139              	.L69:
 308:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 309:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	if(x>64){
 1140              		.loc 1 309 0
 1141 04da FB68     		ldr	r3, [r7, #12]
 1142 04dc 402B     		cmp	r3, #64
 1143 04de 07DD     		ble	.L70
 310:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		controller = B_CS2;
 1144              		.loc 1 310 0
 1145 04e0 1E23     		movs	r3, #30
 1146 04e2 FB18     		adds	r3, r7, r3
 1147 04e4 1022     		movs	r2, #16
 1148 04e6 1A70     		strb	r2, [r3]
 311:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		x = x - 65;
 1149              		.loc 1 311 0
 1150 04e8 FB68     		ldr	r3, [r7, #12]
 1151 04ea 413B     		subs	r3, r3, #65
 1152 04ec FB60     		str	r3, [r7, #12]
 1153 04ee 06E0     		b	.L71
 1154              	.L70:
 312:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}else{
 313:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		controller = B_CS1;
 1155              		.loc 1 313 0
 1156 04f0 1E23     		movs	r3, #30
 1157 04f2 FB18     		adds	r3, r7, r3
 1158 04f4 0822     		movs	r2, #8
 1159 04f6 1A70     		strb	r2, [r3]
 314:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		x = x-1;
 1160              		.loc 1 314 0
 1161 04f8 FB68     		ldr	r3, [r7, #12]
 1162 04fa 013B     		subs	r3, r3, #1
 1163 04fc FB60     		str	r3, [r7, #12]
 1164              	.L71:
 315:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 316:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	
 317:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_write_command(LCD_SET_ADD | x,controller);
 1165              		.loc 1 317 0
 1166 04fe FB68     		ldr	r3, [r7, #12]
 1167 0500 5BB2     		sxtb	r3, r3
 1168 0502 4022     		movs	r2, #64
 1169 0504 1343     		orrs	r3, r2
 1170 0506 5BB2     		sxtb	r3, r3
 1171 0508 DAB2     		uxtb	r2, r3
 1172 050a 1E25     		movs	r5, #30
 1173 050c 7B19     		adds	r3, r7, r5
 1174 050e 1B78     		ldrb	r3, [r3]
 1175 0510 1900     		movs	r1, r3
 1176 0512 1000     		movs	r0, r2
 1177 0514 FFF7FEFF 		bl	graphic_write_command
 318:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_write_command(LCD_SET_PAGE| index, controller);
 1178              		.loc 1 318 0
 1179 0518 BB69     		ldr	r3, [r7, #24]
 1180 051a 5BB2     		sxtb	r3, r3
 1181 051c 4822     		movs	r2, #72
 1182 051e 5242     		rsbs	r2, r2, #0
 1183 0520 1343     		orrs	r3, r2
 1184 0522 5BB2     		sxtb	r3, r3
 1185 0524 DAB2     		uxtb	r2, r3
 1186 0526 7B19     		adds	r3, r7, r5
 1187 0528 1B78     		ldrb	r3, [r3]
 1188 052a 1900     		movs	r1, r3
 1189 052c 1000     		movs	r0, r2
 1190 052e FFF7FEFF 		bl	graphic_write_command
 319:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	c = graphic_read_data(controller);
 1191              		.loc 1 319 0
 1192 0532 1723     		movs	r3, #23
 1193 0534 FC18     		adds	r4, r7, r3
 1194 0536 7B19     		adds	r3, r7, r5
 1195 0538 1B78     		ldrb	r3, [r3]
 1196 053a 1800     		movs	r0, r3
 1197 053c FFF7FEFF 		bl	graphic_read_data
 1198 0540 0300     		movs	r3, r0
 1199 0542 2370     		strb	r3, [r4]
 320:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_write_command(LCD_SET_ADD| x, controller);
 1200              		.loc 1 320 0
 1201 0544 FB68     		ldr	r3, [r7, #12]
 1202 0546 5BB2     		sxtb	r3, r3
 1203 0548 4022     		movs	r2, #64
 1204 054a 1343     		orrs	r3, r2
 1205 054c 5BB2     		sxtb	r3, r3
 1206 054e DAB2     		uxtb	r2, r3
 1207 0550 7B19     		adds	r3, r7, r5
 1208 0552 1B78     		ldrb	r3, [r3]
 1209 0554 1900     		movs	r1, r3
 1210 0556 1000     		movs	r0, r2
 1211 0558 FFF7FEFF 		bl	graphic_write_command
 321:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	
 322:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	if(set){
 1212              		.loc 1 322 0
 1213 055c 7B68     		ldr	r3, [r7, #4]
 1214 055e 002B     		cmp	r3, #0
 1215 0560 09D0     		beq	.L72
 323:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		mask = mask | c;
 1216              		.loc 1 323 0
 1217 0562 1F22     		movs	r2, #31
 1218 0564 BB18     		adds	r3, r7, r2
 1219 0566 B918     		adds	r1, r7, r2
 1220 0568 1722     		movs	r2, #23
 1221 056a BA18     		adds	r2, r7, r2
 1222 056c 0978     		ldrb	r1, [r1]
 1223 056e 1278     		ldrb	r2, [r2]
 1224 0570 0A43     		orrs	r2, r1
 1225 0572 1A70     		strb	r2, [r3]
 1226 0574 08E0     		b	.L73
 1227              	.L72:
 324:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}else{
 325:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		mask = mask & c;
 1228              		.loc 1 325 0
 1229 0576 1F22     		movs	r2, #31
 1230 0578 BB18     		adds	r3, r7, r2
 1231 057a BA18     		adds	r2, r7, r2
 1232 057c 1721     		movs	r1, #23
 1233 057e 7918     		adds	r1, r7, r1
 1234 0580 1278     		ldrb	r2, [r2]
 1235 0582 0978     		ldrb	r1, [r1]
 1236 0584 0A40     		ands	r2, r1
 1237 0586 1A70     		strb	r2, [r3]
 1238              	.L73:
 326:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 327:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_write_data(mask, controller);
 1239              		.loc 1 327 0
 1240 0588 1E23     		movs	r3, #30
 1241 058a FB18     		adds	r3, r7, r3
 1242 058c 1A78     		ldrb	r2, [r3]
 1243 058e 1F23     		movs	r3, #31
 1244 0590 FB18     		adds	r3, r7, r3
 1245 0592 1B78     		ldrb	r3, [r3]
 1246 0594 1100     		movs	r1, r2
 1247 0596 1800     		movs	r0, r3
 1248 0598 FFF7FEFF 		bl	graphic_write_data
 1249 059c 00E0     		b	.L53
 1250              	.L74:
 291:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	
 1251              		.loc 1 291 0
 1252 059e C046     		nop
 1253              	.L53:
 328:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 1254              		.loc 1 328 0
 1255 05a0 BD46     		mov	sp, r7
 1256 05a2 08B0     		add	sp, sp, #32
 1257              		@ sp needed
 1258 05a4 B0BD     		pop	{r4, r5, r7, pc}
 1259              	.L76:
 1260 05a6 C046     		.align	2
 1261              	.L75:
 1262 05a8 07000080 		.word	-2147483641
 1263 05ac 00000000 		.word	.L61
 1264              		.cfi_endproc
 1265              	.LFE16:
 1267              		.align	1
 1268              		.global	draw_object
 1269              		.syntax unified
 1270              		.code	16
 1271              		.thumb_func
 1272              		.fpu softvfp
 1274              	draw_object:
 1275              	.LFB17:
 329:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 330:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void draw_object(POBJECT obj)
 331:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 1276              		.loc 1 331 0
 1277              		.cfi_startproc
 1278              		@ args = 0, pretend = 0, frame = 16
 1279              		@ frame_needed = 1, uses_anonymous_args = 0
 1280 05b0 B0B5     		push	{r4, r5, r7, lr}
 1281              		.cfi_def_cfa_offset 16
 1282              		.cfi_offset 4, -16
 1283              		.cfi_offset 5, -12
 1284              		.cfi_offset 7, -8
 1285              		.cfi_offset 14, -4
 1286 05b2 84B0     		sub	sp, sp, #16
 1287              		.cfi_def_cfa_offset 32
 1288 05b4 00AF     		add	r7, sp, #0
 1289              		.cfi_def_cfa_register 7
 1290 05b6 7860     		str	r0, [r7, #4]
 332:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	uint8_t p;
 333:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	uint8_t n = obj->geo->numpoints;
 1291              		.loc 1 333 0
 1292 05b8 7B68     		ldr	r3, [r7, #4]
 1293 05ba 1B68     		ldr	r3, [r3]
 1294 05bc 1A68     		ldr	r2, [r3]
 1295 05be 0E23     		movs	r3, #14
 1296 05c0 FB18     		adds	r3, r7, r3
 1297 05c2 1A70     		strb	r2, [r3]
 334:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	uint8_t x_coord;
 335:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	uint8_t y_coord;
 336:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	
 337:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	POINT s;
 338:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	for(p = 0; p<n; p++){
 1298              		.loc 1 338 0
 1299 05c4 0F23     		movs	r3, #15
 1300 05c6 FB18     		adds	r3, r7, r3
 1301 05c8 0022     		movs	r2, #0
 1302 05ca 1A70     		strb	r2, [r3]
 1303 05cc 2DE0     		b	.L78
 1304              	.L79:
 339:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		//s = obj -> geo -> px[p];
 340:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		x_coord  = obj->posx + obj->geo->px[p].x;
 1305              		.loc 1 340 0 discriminator 3
 1306 05ce 7B68     		ldr	r3, [r7, #4]
 1307 05d0 DB68     		ldr	r3, [r3, #12]
 1308 05d2 D9B2     		uxtb	r1, r3
 1309 05d4 7B68     		ldr	r3, [r7, #4]
 1310 05d6 1A68     		ldr	r2, [r3]
 1311 05d8 0F24     		movs	r4, #15
 1312 05da 3B19     		adds	r3, r7, r4
 1313 05dc 1B78     		ldrb	r3, [r3]
 1314 05de 0433     		adds	r3, r3, #4
 1315 05e0 5B00     		lsls	r3, r3, #1
 1316 05e2 D318     		adds	r3, r2, r3
 1317 05e4 0433     		adds	r3, r3, #4
 1318 05e6 1A78     		ldrb	r2, [r3]
 1319 05e8 0D20     		movs	r0, #13
 1320 05ea 3B18     		adds	r3, r7, r0
 1321 05ec 8A18     		adds	r2, r1, r2
 1322 05ee 1A70     		strb	r2, [r3]
 341:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		y_coord = obj->posy + obj->geo->px[p].y;
 1323              		.loc 1 341 0 discriminator 3
 1324 05f0 7B68     		ldr	r3, [r7, #4]
 1325 05f2 1B69     		ldr	r3, [r3, #16]
 1326 05f4 D9B2     		uxtb	r1, r3
 1327 05f6 7B68     		ldr	r3, [r7, #4]
 1328 05f8 1A68     		ldr	r2, [r3]
 1329 05fa 3B19     		adds	r3, r7, r4
 1330 05fc 1B78     		ldrb	r3, [r3]
 1331 05fe 0433     		adds	r3, r3, #4
 1332 0600 5B00     		lsls	r3, r3, #1
 1333 0602 D318     		adds	r3, r2, r3
 1334 0604 0533     		adds	r3, r3, #5
 1335 0606 1A78     		ldrb	r2, [r3]
 1336 0608 0C25     		movs	r5, #12
 1337 060a 7B19     		adds	r3, r7, r5
 1338 060c 8A18     		adds	r2, r1, r2
 1339 060e 1A70     		strb	r2, [r3]
 342:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		//point = obj->geo->px;
 343:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		//pixel(s.x, s.y,1);
 344:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		pixel(x_coord,y_coord,1);
 1340              		.loc 1 344 0 discriminator 3
 1341 0610 3B18     		adds	r3, r7, r0
 1342 0612 1878     		ldrb	r0, [r3]
 1343 0614 7B19     		adds	r3, r7, r5
 1344 0616 1B78     		ldrb	r3, [r3]
 1345 0618 0122     		movs	r2, #1
 1346 061a 1900     		movs	r1, r3
 1347 061c FFF7FEFF 		bl	pixel
 338:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		//s = obj -> geo -> px[p];
 1348              		.loc 1 338 0 discriminator 3
 1349 0620 3B19     		adds	r3, r7, r4
 1350 0622 1A78     		ldrb	r2, [r3]
 1351 0624 3B19     		adds	r3, r7, r4
 1352 0626 0132     		adds	r2, r2, #1
 1353 0628 1A70     		strb	r2, [r3]
 1354              	.L78:
 338:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		//s = obj -> geo -> px[p];
 1355              		.loc 1 338 0 is_stmt 0 discriminator 1
 1356 062a 0F23     		movs	r3, #15
 1357 062c FA18     		adds	r2, r7, r3
 1358 062e 0E23     		movs	r3, #14
 1359 0630 FB18     		adds	r3, r7, r3
 1360 0632 1278     		ldrb	r2, [r2]
 1361 0634 1B78     		ldrb	r3, [r3]
 1362 0636 9A42     		cmp	r2, r3
 1363 0638 C9D3     		bcc	.L79
 345:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 346:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 1364              		.loc 1 346 0 is_stmt 1
 1365 063a C046     		nop
 1366 063c BD46     		mov	sp, r7
 1367 063e 04B0     		add	sp, sp, #16
 1368              		@ sp needed
 1369 0640 B0BD     		pop	{r4, r5, r7, pc}
 1370              		.cfi_endproc
 1371              	.LFE17:
 1373              		.align	1
 1374              		.global	clear_object
 1375              		.syntax unified
 1376              		.code	16
 1377              		.thumb_func
 1378              		.fpu softvfp
 1380              	clear_object:
 1381              	.LFB18:
 347:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 348:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void clear_object(POBJECT obj)
 349:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 1382              		.loc 1 349 0
 1383              		.cfi_startproc
 1384              		@ args = 0, pretend = 0, frame = 16
 1385              		@ frame_needed = 1, uses_anonymous_args = 0
 1386 0642 B0B5     		push	{r4, r5, r7, lr}
 1387              		.cfi_def_cfa_offset 16
 1388              		.cfi_offset 4, -16
 1389              		.cfi_offset 5, -12
 1390              		.cfi_offset 7, -8
 1391              		.cfi_offset 14, -4
 1392 0644 84B0     		sub	sp, sp, #16
 1393              		.cfi_def_cfa_offset 32
 1394 0646 00AF     		add	r7, sp, #0
 1395              		.cfi_def_cfa_register 7
 1396 0648 7860     		str	r0, [r7, #4]
 350:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	uint8_t p;
 351:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	uint8_t n = obj->geo->numpoints;
 1397              		.loc 1 351 0
 1398 064a 7B68     		ldr	r3, [r7, #4]
 1399 064c 1B68     		ldr	r3, [r3]
 1400 064e 1A68     		ldr	r2, [r3]
 1401 0650 0E23     		movs	r3, #14
 1402 0652 FB18     		adds	r3, r7, r3
 1403 0654 1A70     		strb	r2, [r3]
 352:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	uint8_t x_coord;
 353:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	uint8_t y_coord;
 354:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	for(p = 0; p<n; p++){
 1404              		.loc 1 354 0
 1405 0656 0F23     		movs	r3, #15
 1406 0658 FB18     		adds	r3, r7, r3
 1407 065a 0022     		movs	r2, #0
 1408 065c 1A70     		strb	r2, [r3]
 1409 065e 2DE0     		b	.L81
 1410              	.L82:
 355:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		x_coord  = obj->posx + obj->geo->px[p].x;
 1411              		.loc 1 355 0 discriminator 3
 1412 0660 7B68     		ldr	r3, [r7, #4]
 1413 0662 DB68     		ldr	r3, [r3, #12]
 1414 0664 D9B2     		uxtb	r1, r3
 1415 0666 7B68     		ldr	r3, [r7, #4]
 1416 0668 1A68     		ldr	r2, [r3]
 1417 066a 0F24     		movs	r4, #15
 1418 066c 3B19     		adds	r3, r7, r4
 1419 066e 1B78     		ldrb	r3, [r3]
 1420 0670 0433     		adds	r3, r3, #4
 1421 0672 5B00     		lsls	r3, r3, #1
 1422 0674 D318     		adds	r3, r2, r3
 1423 0676 0433     		adds	r3, r3, #4
 1424 0678 1A78     		ldrb	r2, [r3]
 1425 067a 0D20     		movs	r0, #13
 1426 067c 3B18     		adds	r3, r7, r0
 1427 067e 8A18     		adds	r2, r1, r2
 1428 0680 1A70     		strb	r2, [r3]
 356:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		y_coord = obj->posy + obj->geo->px[p].y;
 1429              		.loc 1 356 0 discriminator 3
 1430 0682 7B68     		ldr	r3, [r7, #4]
 1431 0684 1B69     		ldr	r3, [r3, #16]
 1432 0686 D9B2     		uxtb	r1, r3
 1433 0688 7B68     		ldr	r3, [r7, #4]
 1434 068a 1A68     		ldr	r2, [r3]
 1435 068c 3B19     		adds	r3, r7, r4
 1436 068e 1B78     		ldrb	r3, [r3]
 1437 0690 0433     		adds	r3, r3, #4
 1438 0692 5B00     		lsls	r3, r3, #1
 1439 0694 D318     		adds	r3, r2, r3
 1440 0696 0533     		adds	r3, r3, #5
 1441 0698 1A78     		ldrb	r2, [r3]
 1442 069a 0C25     		movs	r5, #12
 1443 069c 7B19     		adds	r3, r7, r5
 1444 069e 8A18     		adds	r2, r1, r2
 1445 06a0 1A70     		strb	r2, [r3]
 357:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		pixel(x_coord,y_coord,0);
 1446              		.loc 1 357 0 discriminator 3
 1447 06a2 3B18     		adds	r3, r7, r0
 1448 06a4 1878     		ldrb	r0, [r3]
 1449 06a6 7B19     		adds	r3, r7, r5
 1450 06a8 1B78     		ldrb	r3, [r3]
 1451 06aa 0022     		movs	r2, #0
 1452 06ac 1900     		movs	r1, r3
 1453 06ae FFF7FEFF 		bl	pixel
 354:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		x_coord  = obj->posx + obj->geo->px[p].x;
 1454              		.loc 1 354 0 discriminator 3
 1455 06b2 3B19     		adds	r3, r7, r4
 1456 06b4 1A78     		ldrb	r2, [r3]
 1457 06b6 3B19     		adds	r3, r7, r4
 1458 06b8 0132     		adds	r2, r2, #1
 1459 06ba 1A70     		strb	r2, [r3]
 1460              	.L81:
 354:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		x_coord  = obj->posx + obj->geo->px[p].x;
 1461              		.loc 1 354 0 is_stmt 0 discriminator 1
 1462 06bc 0F23     		movs	r3, #15
 1463 06be FA18     		adds	r2, r7, r3
 1464 06c0 0E23     		movs	r3, #14
 1465 06c2 FB18     		adds	r3, r7, r3
 1466 06c4 1278     		ldrb	r2, [r2]
 1467 06c6 1B78     		ldrb	r3, [r3]
 1468 06c8 9A42     		cmp	r2, r3
 1469 06ca C9D3     		bcc	.L82
 358:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 359:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 1470              		.loc 1 359 0 is_stmt 1
 1471 06cc C046     		nop
 1472 06ce BD46     		mov	sp, r7
 1473 06d0 04B0     		add	sp, sp, #16
 1474              		@ sp needed
 1475 06d2 B0BD     		pop	{r4, r5, r7, pc}
 1476              		.cfi_endproc
 1477              	.LFE18:
 1479              		.align	1
 1480              		.global	set_object_speed
 1481              		.syntax unified
 1482              		.code	16
 1483              		.thumb_func
 1484              		.fpu softvfp
 1486              	set_object_speed:
 1487              	.LFB19:
 360:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 361:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void set_object_speed(POBJECT o, int speedx, int speedy){
 1488              		.loc 1 361 0
 1489              		.cfi_startproc
 1490              		@ args = 0, pretend = 0, frame = 16
 1491              		@ frame_needed = 1, uses_anonymous_args = 0
 1492 06d4 80B5     		push	{r7, lr}
 1493              		.cfi_def_cfa_offset 8
 1494              		.cfi_offset 7, -8
 1495              		.cfi_offset 14, -4
 1496 06d6 84B0     		sub	sp, sp, #16
 1497              		.cfi_def_cfa_offset 24
 1498 06d8 00AF     		add	r7, sp, #0
 1499              		.cfi_def_cfa_register 7
 1500 06da F860     		str	r0, [r7, #12]
 1501 06dc B960     		str	r1, [r7, #8]
 1502 06de 7A60     		str	r2, [r7, #4]
 362:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	o->dirx = speedx;
 1503              		.loc 1 362 0
 1504 06e0 FB68     		ldr	r3, [r7, #12]
 1505 06e2 BA68     		ldr	r2, [r7, #8]
 1506 06e4 5A60     		str	r2, [r3, #4]
 363:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	o->diry = speedy;
 1507              		.loc 1 363 0
 1508 06e6 FB68     		ldr	r3, [r7, #12]
 1509 06e8 7A68     		ldr	r2, [r7, #4]
 1510 06ea 9A60     		str	r2, [r3, #8]
 364:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 1511              		.loc 1 364 0
 1512 06ec C046     		nop
 1513 06ee BD46     		mov	sp, r7
 1514 06f0 04B0     		add	sp, sp, #16
 1515              		@ sp needed
 1516 06f2 80BD     		pop	{r7, pc}
 1517              		.cfi_endproc
 1518              	.LFE19:
 1520              		.align	1
 1521              		.global	move_object
 1522              		.syntax unified
 1523              		.code	16
 1524              		.thumb_func
 1525              		.fpu softvfp
 1527              	move_object:
 1528              	.LFB20:
 365:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 366:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void move_object(POBJECT o){
 1529              		.loc 1 366 0
 1530              		.cfi_startproc
 1531              		@ args = 0, pretend = 0, frame = 8
 1532              		@ frame_needed = 1, uses_anonymous_args = 0
 1533 06f4 80B5     		push	{r7, lr}
 1534              		.cfi_def_cfa_offset 8
 1535              		.cfi_offset 7, -8
 1536              		.cfi_offset 14, -4
 1537 06f6 82B0     		sub	sp, sp, #8
 1538              		.cfi_def_cfa_offset 16
 1539 06f8 00AF     		add	r7, sp, #0
 1540              		.cfi_def_cfa_register 7
 1541 06fa 7860     		str	r0, [r7, #4]
 367:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	clear_object(o);
 1542              		.loc 1 367 0
 1543 06fc 7B68     		ldr	r3, [r7, #4]
 1544 06fe 1800     		movs	r0, r3
 1545 0700 FFF7FEFF 		bl	clear_object
 368:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	o->posx += o->dirx;
 1546              		.loc 1 368 0
 1547 0704 7B68     		ldr	r3, [r7, #4]
 1548 0706 DA68     		ldr	r2, [r3, #12]
 1549 0708 7B68     		ldr	r3, [r7, #4]
 1550 070a 5B68     		ldr	r3, [r3, #4]
 1551 070c D218     		adds	r2, r2, r3
 1552 070e 7B68     		ldr	r3, [r7, #4]
 1553 0710 DA60     		str	r2, [r3, #12]
 369:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	o->posy += o->diry;
 1554              		.loc 1 369 0
 1555 0712 7B68     		ldr	r3, [r7, #4]
 1556 0714 1A69     		ldr	r2, [r3, #16]
 1557 0716 7B68     		ldr	r3, [r7, #4]
 1558 0718 9B68     		ldr	r3, [r3, #8]
 1559 071a D218     		adds	r2, r2, r3
 1560 071c 7B68     		ldr	r3, [r7, #4]
 1561 071e 1A61     		str	r2, [r3, #16]
 370:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	
 371:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	if(o->posx < 1){
 1562              		.loc 1 371 0
 1563 0720 7B68     		ldr	r3, [r7, #4]
 1564 0722 DB68     		ldr	r3, [r3, #12]
 1565 0724 002B     		cmp	r3, #0
 1566 0726 04DC     		bgt	.L85
 372:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		o->dirx = -o->dirx;
 1567              		.loc 1 372 0
 1568 0728 7B68     		ldr	r3, [r7, #4]
 1569 072a 5B68     		ldr	r3, [r3, #4]
 1570 072c 5A42     		rsbs	r2, r3, #0
 1571 072e 7B68     		ldr	r3, [r7, #4]
 1572 0730 5A60     		str	r2, [r3, #4]
 1573              	.L85:
 373:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 374:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	if(o->posx > 128 - o->geo->sizex){
 1574              		.loc 1 374 0
 1575 0732 7B68     		ldr	r3, [r7, #4]
 1576 0734 DA68     		ldr	r2, [r3, #12]
 1577 0736 7B68     		ldr	r3, [r7, #4]
 1578 0738 1B68     		ldr	r3, [r3]
 1579 073a 5B68     		ldr	r3, [r3, #4]
 1580 073c 8021     		movs	r1, #128
 1581 073e CB1A     		subs	r3, r1, r3
 1582 0740 9A42     		cmp	r2, r3
 1583 0742 04DD     		ble	.L86
 375:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		o->dirx = -o->dirx;
 1584              		.loc 1 375 0
 1585 0744 7B68     		ldr	r3, [r7, #4]
 1586 0746 5B68     		ldr	r3, [r3, #4]
 1587 0748 5A42     		rsbs	r2, r3, #0
 1588 074a 7B68     		ldr	r3, [r7, #4]
 1589 074c 5A60     		str	r2, [r3, #4]
 1590              	.L86:
 376:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 377:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	if(o->posy < 1){
 1591              		.loc 1 377 0
 1592 074e 7B68     		ldr	r3, [r7, #4]
 1593 0750 1B69     		ldr	r3, [r3, #16]
 1594 0752 002B     		cmp	r3, #0
 1595 0754 04DC     		bgt	.L87
 378:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		o->diry = -o->diry;
 1596              		.loc 1 378 0
 1597 0756 7B68     		ldr	r3, [r7, #4]
 1598 0758 9B68     		ldr	r3, [r3, #8]
 1599 075a 5A42     		rsbs	r2, r3, #0
 1600 075c 7B68     		ldr	r3, [r7, #4]
 1601 075e 9A60     		str	r2, [r3, #8]
 1602              	.L87:
 379:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 380:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	if(o->posy > 64 - o->geo->sizey){
 1603              		.loc 1 380 0
 1604 0760 7B68     		ldr	r3, [r7, #4]
 1605 0762 1A69     		ldr	r2, [r3, #16]
 1606 0764 7B68     		ldr	r3, [r7, #4]
 1607 0766 1B68     		ldr	r3, [r3]
 1608 0768 9B68     		ldr	r3, [r3, #8]
 1609 076a 4021     		movs	r1, #64
 1610 076c CB1A     		subs	r3, r1, r3
 1611 076e 9A42     		cmp	r2, r3
 1612 0770 04DD     		ble	.L88
 381:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		o->diry = -o->diry;
 1613              		.loc 1 381 0
 1614 0772 7B68     		ldr	r3, [r7, #4]
 1615 0774 9B68     		ldr	r3, [r3, #8]
 1616 0776 5A42     		rsbs	r2, r3, #0
 1617 0778 7B68     		ldr	r3, [r7, #4]
 1618 077a 9A60     		str	r2, [r3, #8]
 1619              	.L88:
 382:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	}
 383:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	draw_object(o);
 1620              		.loc 1 383 0
 1621 077c 7B68     		ldr	r3, [r7, #4]
 1622 077e 1800     		movs	r0, r3
 1623 0780 FFF7FEFF 		bl	draw_object
 384:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 1624              		.loc 1 384 0
 1625 0784 C046     		nop
 1626 0786 BD46     		mov	sp, r7
 1627 0788 02B0     		add	sp, sp, #8
 1628              		@ sp needed
 1629 078a 80BD     		pop	{r7, pc}
 1630              		.cfi_endproc
 1631              	.LFE20:
 1633              		.global	ball_geometry
 1634              		.data
 1635              		.align	2
 1638              	ball_geometry:
 1639 0000 0C000000 		.word	12
 1640 0004 04000000 		.word	4
 1641 0008 04000000 		.word	4
 1642 000c 00       		.byte	0
 1643 000d 01       		.byte	1
 1644 000e 00       		.byte	0
 1645 000f 02       		.byte	2
 1646 0010 01       		.byte	1
 1647 0011 00       		.byte	0
 1648 0012 01       		.byte	1
 1649 0013 01       		.byte	1
 1650 0014 01       		.byte	1
 1651 0015 02       		.byte	2
 1652 0016 01       		.byte	1
 1653 0017 03       		.byte	3
 1654 0018 02       		.byte	2
 1655 0019 00       		.byte	0
 1656 001a 02       		.byte	2
 1657 001b 01       		.byte	1
 1658 001c 02       		.byte	2
 1659 001d 02       		.byte	2
 1660 001e 02       		.byte	2
 1661 001f 03       		.byte	3
 1662 0020 03       		.byte	3
 1663 0021 01       		.byte	1
 1664 0022 03       		.byte	3
 1665 0023 02       		.byte	2
 1666 0024 00000000 		.space	16
 1666      00000000 
 1666      00000000 
 1666      00000000 
 1667              		.align	2
 1670              	ball:
 1671 0034 00000000 		.word	ball_geometry
 1672 0038 00000000 		.word	0
 1673 003c 00000000 		.word	0
 1674 0040 01000000 		.word	1
 1675 0044 01000000 		.word	1
 1676 0048 00000000 		.word	draw_object
 1677 004c 00000000 		.word	clear_object
 1678 0050 00000000 		.word	move_object
 1679 0054 00000000 		.word	set_object_speed
 1680              		.text
 1681              		.align	1
 1682              		.global	init_app
 1683              		.syntax unified
 1684              		.code	16
 1685              		.thumb_func
 1686              		.fpu softvfp
 1688              	init_app:
 1689              	.LFB21:
 385:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 386:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	GEOMETRY ball_geometry =
 387:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 388:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	12,4,4,{{0,1},{0,2},{1,0},{1,1},{1,2},{1,3},{2,0},{2,1},{2,2},{2,3},{3,1},{3,2}}
 389:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** };
 390:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 391:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** static OBJECT ball=
 392:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {&ball_geometry,
 393:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 0,0,
 394:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 1,1,
 395:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** draw_object,
 396:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** clear_object,
 397:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** move_object,
 398:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** set_object_speed};
 399:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 400:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void init_app(void)
 401:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 1690              		.loc 1 401 0
 1691              		.cfi_startproc
 1692              		@ args = 0, pretend = 0, frame = 0
 1693              		@ frame_needed = 1, uses_anonymous_args = 0
 1694 078c 80B5     		push	{r7, lr}
 1695              		.cfi_def_cfa_offset 8
 1696              		.cfi_offset 7, -8
 1697              		.cfi_offset 14, -4
 1698 078e 00AF     		add	r7, sp, #0
 1699              		.cfi_def_cfa_register 7
 402:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	*GPIO_MODER = 0x55555555;
 1700              		.loc 1 402 0
 1701 0790 024B     		ldr	r3, .L90
 1702 0792 034A     		ldr	r2, .L90+4
 1703 0794 1A60     		str	r2, [r3]
 403:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** }
 1704              		.loc 1 403 0
 1705 0796 C046     		nop
 1706 0798 BD46     		mov	sp, r7
 1707              		@ sp needed
 1708 079a 80BD     		pop	{r7, pc}
 1709              	.L91:
 1710              		.align	2
 1711              	.L90:
 1712 079c 00100240 		.word	1073876992
 1713 07a0 55555555 		.word	1431655765
 1714              		.cfi_endproc
 1715              	.LFE21:
 1717              		.align	1
 1718              		.global	main
 1719              		.syntax unified
 1720              		.code	16
 1721              		.thumb_func
 1722              		.fpu softvfp
 1724              	main:
 1725              	.LFB22:
 404:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 405:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** void main(void)
 406:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** {
 1726              		.loc 1 406 0
 1727              		.cfi_startproc
 1728              		@ args = 0, pretend = 0, frame = 8
 1729              		@ frame_needed = 1, uses_anonymous_args = 0
 1730 07a4 80B5     		push	{r7, lr}
 1731              		.cfi_def_cfa_offset 8
 1732              		.cfi_offset 7, -8
 1733              		.cfi_offset 14, -4
 1734 07a6 82B0     		sub	sp, sp, #8
 1735              		.cfi_def_cfa_offset 16
 1736 07a8 00AF     		add	r7, sp, #0
 1737              		.cfi_def_cfa_register 7
 407:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	//uint8_t i;
 408:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 
 409:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	POBJECT p = &ball;
 1738              		.loc 1 409 0
 1739 07aa 0A4B     		ldr	r3, .L94
 1740 07ac 7B60     		str	r3, [r7, #4]
 410:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	init_app();
 1741              		.loc 1 410 0
 1742 07ae FFF7FEFF 		bl	init_app
 411:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	graphic_initialize();
 1743              		.loc 1 411 0
 1744 07b2 FFF7FEFF 		bl	graphic_initialize
 412:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	#ifndef SIMULATOR
 413:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		graphic_clear_screen();
 414:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	#endif
 415:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	
 416:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	p->set_speed(p,4,1);
 1745              		.loc 1 416 0
 1746 07b6 7B68     		ldr	r3, [r7, #4]
 1747 07b8 1B6A     		ldr	r3, [r3, #32]
 1748 07ba 7868     		ldr	r0, [r7, #4]
 1749 07bc 0122     		movs	r2, #1
 1750 07be 0421     		movs	r1, #4
 1751 07c0 9847     		blx	r3
 1752              	.LVL0:
 1753              	.L93:
 417:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	while(1)
 418:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 	{
 419:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		p->move(p);
 1754              		.loc 1 419 0 discriminator 1
 1755 07c2 7B68     		ldr	r3, [r7, #4]
 1756 07c4 DB69     		ldr	r3, [r3, #28]
 1757 07c6 7A68     		ldr	r2, [r7, #4]
 1758 07c8 1000     		movs	r0, r2
 1759 07ca 9847     		blx	r3
 1760              	.LVL1:
 420:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		delay_milli(40);
 1761              		.loc 1 420 0 discriminator 1
 1762 07cc 2820     		movs	r0, #40
 1763 07ce FFF7FEFF 		bl	delay_milli
 419:C:/Users/Maria/Documents/IT/MOP/MOP/autopong\startup.c **** 		delay_milli(40);
 1764              		.loc 1 419 0 discriminator 1
 1765 07d2 F6E7     		b	.L93
 1766              	.L95:
 1767              		.align	2
 1768              	.L94:
 1769 07d4 34000000 		.word	ball
 1770              		.cfi_endproc
 1771              	.LFE22:
 1773              	.Letext0:
 1774              		.file 2 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\machine\\_default_types.h"
 1775              		.file 3 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\_stdint.h"
