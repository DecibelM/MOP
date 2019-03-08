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
  25              		.file 1 "C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling/startup.c"
   1:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** /*
   2:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c ****  * 	startup.c
   3:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c ****  *
   4:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c ****  */
   5:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   6:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 
   7:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** void startup ( void )
   8:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** {
  26              		.loc 1 8 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
   9:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** __asm volatile(
  31              		.loc 1 9 0
  32              		.syntax divided
  33              	@ 9 "C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  10:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  11:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	" MOV SP,R0\n"
  12:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	" BL main\n"				/* call main */
  13:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	"_exit: B .\n"				/* never return */
  14:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	) ;
  15:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** }
  40              		.loc 1 15 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.comm	inbuf,1,1
  48              		.comm	outbuf,1,1
  49              		.bss
  50              		.align	2
  51              	TxBuffer:
  52 0000 00000000 		.space	67
  52      00000000 
  52      00000000 
  52      00000000 
  52      00000000 
  54 0043 00       		.align	2
  55              	RxBuffer:
  56 0044 00000000 		.space	67
  56      00000000 
  56      00000000 
  56      00000000 
  56      00000000 
  58              		.text
  59              		.align	1
  60              		.global	bufferInit
  61              		.syntax unified
  62              		.code	16
  63              		.thumb_func
  64              		.fpu softvfp
  66              	bufferInit:
  67              	.LFB1:
  16:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 
  17:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** #include <USART.h>
  18:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** #define USART1 ((USART*) 0x40011000)
  19:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 
  20:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** #define USART1_IRQVEC 0x2001C0D4
  21:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** #define NVIC_USART1_IRQ_BPOS (1<<5)
  22:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** #define NVIC_USART1_ISER 0xE000E104
  23:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 
  24:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** #define BIT_UE (1<<13)		//USART enable
  25:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** #define BIT_TE (1<<3)		//Transmitter enable
  26:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** #define BIT_RE (1<<2)		//Reciever enable
  27:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** #define BIT_RXNE (1<<5)		//Recieve data register not empty
  28:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** #define BIT_TXE (1<<7)		//Transmit data register empty
  29:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 
  30:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** #define BIT_EN (1<<13)		//USART enable
  31:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** #define BIT_RXNEIE (1<<5)	//Recieve interrupt enable
  32:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 
  33:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** #define TXEIE (1<<7)//TXE interrupt enable
  34:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** #define TCIE (1<<6)	//TC interrupt enable
  35:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** #define TC (1<<6)	//Transmission complete
  36:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** #define TXE (1<<7) 	//Transmit data register empty
  37:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 
  38:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** char inbuf;
  39:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** char outbuf;
  40:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** static FIFO TxBuffer, RxBuffer;
  41:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 
  42:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** void bufferInit(FIFO buffer)
  43:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** {
  68              		.loc 1 43 0
  69              		.cfi_startproc
  70              		@ args = 68, pretend = 16, frame = 0
  71              		@ frame_needed = 1, uses_anonymous_args = 0
  72 0000 84B0     		sub	sp, sp, #16
  73              		.cfi_def_cfa_offset 16
  74 0002 B0B5     		push	{r4, r5, r7, lr}
  75              		.cfi_def_cfa_offset 32
  76              		.cfi_offset 4, -32
  77              		.cfi_offset 5, -28
  78              		.cfi_offset 7, -24
  79              		.cfi_offset 14, -20
  80 0004 00AF     		add	r7, sp, #0
  81              		.cfi_def_cfa_register 7
  82 0006 0C25     		movs	r5, #12
  83 0008 3C1D     		adds	r4, r7, #4
  84 000a 6419     		adds	r4, r4, r5
  85 000c 2060     		str	r0, [r4]
  86 000e 6160     		str	r1, [r4, #4]
  87 0010 A260     		str	r2, [r4, #8]
  88 0012 E360     		str	r3, [r4, #12]
  44:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	buffer.count = 0;
  89              		.loc 1 44 0
  90 0014 2900     		movs	r1, r5
  91 0016 3B1D     		adds	r3, r7, #4
  92 0018 5B18     		adds	r3, r3, r1
  93 001a 0022     		movs	r2, #0
  94 001c 9A70     		strb	r2, [r3, #2]
  45:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	buffer.in = 0;
  95              		.loc 1 45 0
  96 001e 3B1D     		adds	r3, r7, #4
  97 0020 5B18     		adds	r3, r3, r1
  98 0022 0022     		movs	r2, #0
  99 0024 1A70     		strb	r2, [r3]
  46:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	buffer.out = 0;
 100              		.loc 1 46 0
 101 0026 3B1D     		adds	r3, r7, #4
 102 0028 5B18     		adds	r3, r3, r1
 103 002a 0022     		movs	r2, #0
 104 002c 5A70     		strb	r2, [r3, #1]
  47:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** }
 105              		.loc 1 47 0
 106 002e C046     		nop
 107 0030 BD46     		mov	sp, r7
 108              		@ sp needed
 109 0032 B0BC     		pop	{r4, r5, r7}
 110 0034 08BC     		pop	{r3}
 111 0036 04B0     		add	sp, sp, #16
 112 0038 1847     		bx	r3
 113              		.cfi_endproc
 114              	.LFE1:
 116              		.align	1
 117              		.global	bufferPut
 118              		.syntax unified
 119              		.code	16
 120              		.thumb_func
 121              		.fpu softvfp
 123              	bufferPut:
 124              	.LFB2:
  48:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 
  49:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** int bufferPut(FIFO buffer, char c)
  50:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** {
 125              		.loc 1 50 0
 126              		.cfi_startproc
 127              		@ args = 72, pretend = 16, frame = 0
 128              		@ frame_needed = 1, uses_anonymous_args = 0
 129 003a 84B0     		sub	sp, sp, #16
 130              		.cfi_def_cfa_offset 16
 131 003c B0B5     		push	{r4, r5, r7, lr}
 132              		.cfi_def_cfa_offset 32
 133              		.cfi_offset 4, -32
 134              		.cfi_offset 5, -28
 135              		.cfi_offset 7, -24
 136              		.cfi_offset 14, -20
 137 003e C646     		mov	lr, r8
 138 0040 00B5     		push	{lr}
 139              		.cfi_def_cfa_offset 36
 140              		.cfi_offset 8, -36
 141 0042 00AF     		add	r7, sp, #0
 142              		.cfi_def_cfa_register 7
 143 0044 0C25     		movs	r5, #12
 144 0046 0824     		movs	r4, #8
 145 0048 3C19     		adds	r4, r7, r4
 146 004a 6419     		adds	r4, r4, r5
 147 004c 2060     		str	r0, [r4]
 148 004e 6160     		str	r1, [r4, #4]
 149 0050 A260     		str	r2, [r4, #8]
 150 0052 E360     		str	r3, [r4, #12]
  51:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	if(buffer.count == USARTBUFFSIZE)
 151              		.loc 1 51 0
 152 0054 0823     		movs	r3, #8
 153 0056 FB18     		adds	r3, r7, r3
 154 0058 5B19     		adds	r3, r3, r5
 155 005a 9B78     		ldrb	r3, [r3, #2]
 156 005c 402B     		cmp	r3, #64
 157 005e 01D1     		bne	.L4
  52:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	{
  53:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 		return 0;
 158              		.loc 1 53 0
 159 0060 0023     		movs	r3, #0
 160 0062 34E0     		b	.L5
 161              	.L4:
  54:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	}else{
  55:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 		buffer.buff[buffer.in] = c;
 162              		.loc 1 55 0
 163 0064 0C21     		movs	r1, #12
 164 0066 0823     		movs	r3, #8
 165 0068 FB18     		adds	r3, r7, r3
 166 006a 5B18     		adds	r3, r3, r1
 167 006c 1B78     		ldrb	r3, [r3]
 168 006e 0822     		movs	r2, #8
 169 0070 BA18     		adds	r2, r7, r2
 170 0072 5218     		adds	r2, r2, r1
 171 0074 D318     		adds	r3, r2, r3
 172 0076 4422     		movs	r2, #68
 173 0078 0C20     		movs	r0, #12
 174 007a 8446     		mov	ip, r0
 175 007c 0820     		movs	r0, #8
 176 007e 3818     		adds	r0, r7, r0
 177 0080 8046     		mov	r8, r0
 178 0082 C444     		add	ip, ip, r8
 179 0084 6244     		add	r2, r2, ip
 180 0086 1278     		ldrb	r2, [r2]
 181 0088 DA70     		strb	r2, [r3, #3]
  56:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 		buffer.in++;
 182              		.loc 1 56 0
 183 008a 0823     		movs	r3, #8
 184 008c FB18     		adds	r3, r7, r3
 185 008e 5B18     		adds	r3, r3, r1
 186 0090 1B78     		ldrb	r3, [r3]
 187 0092 0133     		adds	r3, r3, #1
 188 0094 DAB2     		uxtb	r2, r3
 189 0096 0823     		movs	r3, #8
 190 0098 FB18     		adds	r3, r7, r3
 191 009a 5B18     		adds	r3, r3, r1
 192 009c 1A70     		strb	r2, [r3]
  57:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 		buffer.count++;
 193              		.loc 1 57 0
 194 009e 0823     		movs	r3, #8
 195 00a0 FB18     		adds	r3, r7, r3
 196 00a2 5B18     		adds	r3, r3, r1
 197 00a4 9B78     		ldrb	r3, [r3, #2]
 198 00a6 0133     		adds	r3, r3, #1
 199 00a8 DAB2     		uxtb	r2, r3
 200 00aa 0823     		movs	r3, #8
 201 00ac FB18     		adds	r3, r7, r3
 202 00ae 5B18     		adds	r3, r3, r1
 203 00b0 9A70     		strb	r2, [r3, #2]
  58:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 		if(buffer.in == USARTBUFFSIZE)
 204              		.loc 1 58 0
 205 00b2 0823     		movs	r3, #8
 206 00b4 FB18     		adds	r3, r7, r3
 207 00b6 5B18     		adds	r3, r3, r1
 208 00b8 1B78     		ldrb	r3, [r3]
 209 00ba 402B     		cmp	r3, #64
 210 00bc 06D1     		bne	.L6
  59:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 		{
  60:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 			buffer.in = 0;
 211              		.loc 1 60 0
 212 00be 0C23     		movs	r3, #12
 213 00c0 0822     		movs	r2, #8
 214 00c2 BA18     		adds	r2, r7, r2
 215 00c4 9446     		mov	ip, r2
 216 00c6 6344     		add	r3, r3, ip
 217 00c8 0022     		movs	r2, #0
 218 00ca 1A70     		strb	r2, [r3]
 219              	.L6:
  61:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 		}
  62:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 		return 1;
 220              		.loc 1 62 0
 221 00cc 0123     		movs	r3, #1
 222              	.L5:
  63:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	}
  64:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** }
 223              		.loc 1 64 0
 224 00ce 1800     		movs	r0, r3
 225 00d0 BD46     		mov	sp, r7
 226              		@ sp needed
 227 00d2 04BC     		pop	{r2}
 228 00d4 9046     		mov	r8, r2
 229 00d6 B0BC     		pop	{r4, r5, r7}
 230 00d8 08BC     		pop	{r3}
 231 00da 04B0     		add	sp, sp, #16
 232 00dc 1847     		bx	r3
 233              		.cfi_endproc
 234              	.LFE2:
 236              		.align	1
 237              		.global	bufferGet
 238              		.syntax unified
 239              		.code	16
 240              		.thumb_func
 241              		.fpu softvfp
 243              	bufferGet:
 244              	.LFB3:
  65:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 
  66:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** int bufferGet(FIFO buffer, char* pc)
  67:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** {
 245              		.loc 1 67 0
 246              		.cfi_startproc
 247              		@ args = 72, pretend = 16, frame = 0
 248              		@ frame_needed = 1, uses_anonymous_args = 0
 249 00de 84B0     		sub	sp, sp, #16
 250              		.cfi_def_cfa_offset 16
 251 00e0 B0B5     		push	{r4, r5, r7, lr}
 252              		.cfi_def_cfa_offset 32
 253              		.cfi_offset 4, -32
 254              		.cfi_offset 5, -28
 255              		.cfi_offset 7, -24
 256              		.cfi_offset 14, -20
 257 00e2 00AF     		add	r7, sp, #0
 258              		.cfi_def_cfa_register 7
 259 00e4 0C25     		movs	r5, #12
 260 00e6 3C1D     		adds	r4, r7, #4
 261 00e8 6419     		adds	r4, r4, r5
 262 00ea 2060     		str	r0, [r4]
 263 00ec 6160     		str	r1, [r4, #4]
 264 00ee A260     		str	r2, [r4, #8]
 265 00f0 E360     		str	r3, [r4, #12]
  68:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	if(buffer.count == 0)
 266              		.loc 1 68 0
 267 00f2 3B1D     		adds	r3, r7, #4
 268 00f4 5B19     		adds	r3, r3, r5
 269 00f6 9B78     		ldrb	r3, [r3, #2]
 270 00f8 002B     		cmp	r3, #0
 271 00fa 01D1     		bne	.L8
  69:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	{
  70:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 		return 0;
 272              		.loc 1 70 0
 273 00fc 0023     		movs	r3, #0
 274 00fe 1DE0     		b	.L9
 275              	.L8:
  71:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	}else{
  72:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 		*pc = buffer.buff[buffer.out];
 276              		.loc 1 72 0
 277 0100 0C21     		movs	r1, #12
 278 0102 3B1D     		adds	r3, r7, #4
 279 0104 5B18     		adds	r3, r3, r1
 280 0106 5B78     		ldrb	r3, [r3, #1]
 281 0108 3A1D     		adds	r2, r7, #4
 282 010a 5218     		adds	r2, r2, r1
 283 010c D318     		adds	r3, r2, r3
 284 010e DA78     		ldrb	r2, [r3, #3]
 285 0110 7B6D     		ldr	r3, [r7, #84]
 286 0112 1A70     		strb	r2, [r3]
  73:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 		buffer.count--;
 287              		.loc 1 73 0
 288 0114 3B1D     		adds	r3, r7, #4
 289 0116 5B18     		adds	r3, r3, r1
 290 0118 9B78     		ldrb	r3, [r3, #2]
 291 011a 013B     		subs	r3, r3, #1
 292 011c DAB2     		uxtb	r2, r3
 293 011e 3B1D     		adds	r3, r7, #4
 294 0120 5B18     		adds	r3, r3, r1
 295 0122 9A70     		strb	r2, [r3, #2]
  74:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 		if(buffer.out == USARTBUFFSIZE)
 296              		.loc 1 74 0
 297 0124 3B1D     		adds	r3, r7, #4
 298 0126 5B18     		adds	r3, r3, r1
 299 0128 5B78     		ldrb	r3, [r3, #1]
 300 012a 402B     		cmp	r3, #64
 301 012c 05D1     		bne	.L10
  75:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 		{
  76:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 			buffer.out = 0;
 302              		.loc 1 76 0
 303 012e 0C23     		movs	r3, #12
 304 0130 3A1D     		adds	r2, r7, #4
 305 0132 9446     		mov	ip, r2
 306 0134 6344     		add	r3, r3, ip
 307 0136 0022     		movs	r2, #0
 308 0138 5A70     		strb	r2, [r3, #1]
 309              	.L10:
  77:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 		}
  78:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 		return 1;
 310              		.loc 1 78 0
 311 013a 0123     		movs	r3, #1
 312              	.L9:
  79:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	}
  80:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** }
 313              		.loc 1 80 0
 314 013c 1800     		movs	r0, r3
 315 013e BD46     		mov	sp, r7
 316              		@ sp needed
 317 0140 B0BC     		pop	{r4, r5, r7}
 318 0142 08BC     		pop	{r3}
 319 0144 04B0     		add	sp, sp, #16
 320 0146 1847     		bx	r3
 321              		.cfi_endproc
 322              	.LFE3:
 324              		.comm	c,1,1
 325              		.comm	pc,4,4
 326              		.align	1
 327              		.global	usart_tstchar
 328              		.syntax unified
 329              		.code	16
 330              		.thumb_func
 331              		.fpu softvfp
 333              	usart_tstchar:
 334              	.LFB4:
  81:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 
  82:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** char c;
  83:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** char* pc;
  84:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 
  85:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** char usart_tstchar(void)
  86:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** {
 335              		.loc 1 86 0
 336              		.cfi_startproc
 337              		@ args = 0, pretend = 0, frame = 8
 338              		@ frame_needed = 1, uses_anonymous_args = 0
 339 0148 90B5     		push	{r4, r7, lr}
 340              		.cfi_def_cfa_offset 12
 341              		.cfi_offset 4, -12
 342              		.cfi_offset 7, -8
 343              		.cfi_offset 14, -4
 344 014a 91B0     		sub	sp, sp, #68
 345              		.cfi_def_cfa_offset 80
 346 014c 0EAF     		add	r7, sp, #56
 347              		.cfi_def_cfa 7, 24
  87:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	char c;
  88:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	char* pc;
  89:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	bufferGet(RxBuffer, pc);
 348              		.loc 1 89 0
 349 014e 0B4C     		ldr	r4, .L13
 350 0150 7B68     		ldr	r3, [r7, #4]
 351 0152 0D93     		str	r3, [sp, #52]
 352 0154 6B46     		mov	r3, sp
 353 0156 1800     		movs	r0, r3
 354 0158 2300     		movs	r3, r4
 355 015a 1033     		adds	r3, r3, #16
 356 015c 3322     		movs	r2, #51
 357 015e 1900     		movs	r1, r3
 358 0160 FFF7FEFF 		bl	memcpy
 359 0164 2068     		ldr	r0, [r4]
 360 0166 6168     		ldr	r1, [r4, #4]
 361 0168 A268     		ldr	r2, [r4, #8]
 362 016a E368     		ldr	r3, [r4, #12]
 363 016c FFF7FEFF 		bl	bufferGet
  90:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	return c;
 364              		.loc 1 90 0
 365 0170 FB1C     		adds	r3, r7, #3
 366 0172 1B78     		ldrb	r3, [r3]
  91:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** }
 367              		.loc 1 91 0
 368 0174 1800     		movs	r0, r3
 369 0176 BD46     		mov	sp, r7
 370 0178 03B0     		add	sp, sp, #12
 371              		@ sp needed
 372 017a 90BD     		pop	{r4, r7, pc}
 373              	.L14:
 374              		.align	2
 375              	.L13:
 376 017c 44000000 		.word	RxBuffer
 377              		.cfi_endproc
 378              	.LFE4:
 380              		.align	1
 381              		.global	usart_outchar
 382              		.syntax unified
 383              		.code	16
 384              		.thumb_func
 385              		.fpu softvfp
 387              	usart_outchar:
 388              	.LFB5:
  92:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 
  93:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** void usart_outchar(char c)
  94:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** {
 389              		.loc 1 94 0
 390              		.cfi_startproc
 391              		@ args = 0, pretend = 0, frame = 8
 392              		@ frame_needed = 1, uses_anonymous_args = 0
 393 0180 90B5     		push	{r4, r7, lr}
 394              		.cfi_def_cfa_offset 12
 395              		.cfi_offset 4, -12
 396              		.cfi_offset 7, -8
 397              		.cfi_offset 14, -4
 398 0182 91B0     		sub	sp, sp, #68
 399              		.cfi_def_cfa_offset 80
 400 0184 0EAF     		add	r7, sp, #56
 401              		.cfi_def_cfa 7, 24
 402 0186 0200     		movs	r2, r0
 403 0188 FB1D     		adds	r3, r7, #7
 404 018a 1A70     		strb	r2, [r3]
  95:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	bufferPut(RxBuffer, c);
 405              		.loc 1 95 0
 406 018c 0E4C     		ldr	r4, .L16
 407 018e FB1D     		adds	r3, r7, #7
 408 0190 1B78     		ldrb	r3, [r3]
 409 0192 0D93     		str	r3, [sp, #52]
 410 0194 6B46     		mov	r3, sp
 411 0196 1800     		movs	r0, r3
 412 0198 2300     		movs	r3, r4
 413 019a 1033     		adds	r3, r3, #16
 414 019c 3322     		movs	r2, #51
 415 019e 1900     		movs	r1, r3
 416 01a0 FFF7FEFF 		bl	memcpy
 417 01a4 2068     		ldr	r0, [r4]
 418 01a6 6168     		ldr	r1, [r4, #4]
 419 01a8 A268     		ldr	r2, [r4, #8]
 420 01aa E368     		ldr	r3, [r4, #12]
 421 01ac FFF7FEFF 		bl	bufferPut
  96:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	USART1->cr1 |= TXEIE;
 422              		.loc 1 96 0
 423 01b0 064B     		ldr	r3, .L16+4
 424 01b2 9B89     		ldrh	r3, [r3, #12]
 425 01b4 9BB2     		uxth	r3, r3
 426 01b6 054A     		ldr	r2, .L16+4
 427 01b8 8021     		movs	r1, #128
 428 01ba 0B43     		orrs	r3, r1
 429 01bc 9BB2     		uxth	r3, r3
 430 01be 9381     		strh	r3, [r2, #12]
  97:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** }
 431              		.loc 1 97 0
 432 01c0 C046     		nop
 433 01c2 BD46     		mov	sp, r7
 434 01c4 03B0     		add	sp, sp, #12
 435              		@ sp needed
 436 01c6 90BD     		pop	{r4, r7, pc}
 437              	.L17:
 438              		.align	2
 439              	.L16:
 440 01c8 44000000 		.word	RxBuffer
 441 01cc 00100140 		.word	1073811456
 442              		.cfi_endproc
 443              	.LFE5:
 445              		.align	1
 446              		.global	usart_irq_routine
 447              		.syntax unified
 448              		.code	16
 449              		.thumb_func
 450              		.fpu softvfp
 452              	usart_irq_routine:
 453              	.LFB6:
  98:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 
  99:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** void usart_irq_routine(void)
 100:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** {
 454              		.loc 1 100 0
 455              		.cfi_startproc
 456              		@ args = 0, pretend = 0, frame = 0
 457              		@ frame_needed = 1, uses_anonymous_args = 0
 458 01d0 90B5     		push	{r4, r7, lr}
 459              		.cfi_def_cfa_offset 12
 460              		.cfi_offset 4, -12
 461              		.cfi_offset 7, -8
 462              		.cfi_offset 14, -4
 463 01d2 8FB0     		sub	sp, sp, #60
 464              		.cfi_def_cfa_offset 72
 465 01d4 0EAF     		add	r7, sp, #56
 466              		.cfi_def_cfa 7, 16
 101:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	if(USART1->sr & BIT_RXNE)
 467              		.loc 1 101 0
 468 01d6 244B     		ldr	r3, .L22
 469 01d8 1B88     		ldrh	r3, [r3]
 470 01da 9BB2     		uxth	r3, r3
 471 01dc 1A00     		movs	r2, r3
 472 01de 2023     		movs	r3, #32
 473 01e0 1340     		ands	r3, r2
 474 01e2 13D0     		beq	.L19
 102:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	{
 103:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 		bufferPut(RxBuffer, (char) USART1->dr);
 475              		.loc 1 103 0
 476 01e4 204B     		ldr	r3, .L22
 477 01e6 9B88     		ldrh	r3, [r3, #4]
 478 01e8 9BB2     		uxth	r3, r3
 479 01ea DBB2     		uxtb	r3, r3
 480 01ec 1F4C     		ldr	r4, .L22+4
 481 01ee 0D93     		str	r3, [sp, #52]
 482 01f0 6B46     		mov	r3, sp
 483 01f2 1800     		movs	r0, r3
 484 01f4 2300     		movs	r3, r4
 485 01f6 1033     		adds	r3, r3, #16
 486 01f8 3322     		movs	r2, #51
 487 01fa 1900     		movs	r1, r3
 488 01fc FFF7FEFF 		bl	memcpy
 489 0200 2068     		ldr	r0, [r4]
 490 0202 6168     		ldr	r1, [r4, #4]
 491 0204 A268     		ldr	r2, [r4, #8]
 492 0206 E368     		ldr	r3, [r4, #12]
 493 0208 FFF7FEFF 		bl	bufferPut
 494              	.L19:
 104:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 		//inbuf = (char) USART1->dr;
 105:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	}
 106:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	
 107:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	if(((USART1->cr1 & TXEIE) !=0) && ((USART1->sr & TXE) != 0))
 495              		.loc 1 107 0
 496 020c 164B     		ldr	r3, .L22
 497 020e 9B89     		ldrh	r3, [r3, #12]
 498 0210 9BB2     		uxth	r3, r3
 499 0212 1A00     		movs	r2, r3
 500 0214 8023     		movs	r3, #128
 501 0216 1340     		ands	r3, r2
 502 0218 21D0     		beq	.L21
 503              		.loc 1 107 0 is_stmt 0 discriminator 1
 504 021a 134B     		ldr	r3, .L22
 505 021c 1B88     		ldrh	r3, [r3]
 506 021e 9BB2     		uxth	r3, r3
 507 0220 1A00     		movs	r2, r3
 508 0222 8023     		movs	r3, #128
 509 0224 1340     		ands	r3, r2
 510 0226 1AD0     		beq	.L21
 108:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	{
 109:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 		bufferGet(RxBuffer, (unsigned short) USART1->dr);
 511              		.loc 1 109 0 is_stmt 1
 512 0228 0F4B     		ldr	r3, .L22
 513 022a 9B88     		ldrh	r3, [r3, #4]
 514 022c 9BB2     		uxth	r3, r3
 515 022e 0F4C     		ldr	r4, .L22+4
 516 0230 0D93     		str	r3, [sp, #52]
 517 0232 6B46     		mov	r3, sp
 518 0234 1800     		movs	r0, r3
 519 0236 2300     		movs	r3, r4
 520 0238 1033     		adds	r3, r3, #16
 521 023a 3322     		movs	r2, #51
 522 023c 1900     		movs	r1, r3
 523 023e FFF7FEFF 		bl	memcpy
 524 0242 2068     		ldr	r0, [r4]
 525 0244 6168     		ldr	r1, [r4, #4]
 526 0246 A268     		ldr	r2, [r4, #8]
 527 0248 E368     		ldr	r3, [r4, #12]
 528 024a FFF7FEFF 		bl	bufferGet
 110:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 		//USART1->dr = (unsigned short) outbuf;
 111:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 		USART1->cr1 &= ~TXEIE;
 529              		.loc 1 111 0
 530 024e 064B     		ldr	r3, .L22
 531 0250 9B89     		ldrh	r3, [r3, #12]
 532 0252 9BB2     		uxth	r3, r3
 533 0254 044A     		ldr	r2, .L22
 534 0256 8021     		movs	r1, #128
 535 0258 8B43     		bics	r3, r1
 536 025a 9BB2     		uxth	r3, r3
 537 025c 9381     		strh	r3, [r2, #12]
 538              	.L21:
 112:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	}
 113:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** }
 539              		.loc 1 113 0
 540 025e C046     		nop
 541 0260 BD46     		mov	sp, r7
 542 0262 01B0     		add	sp, sp, #4
 543              		@ sp needed
 544 0264 90BD     		pop	{r4, r7, pc}
 545              	.L23:
 546 0266 C046     		.align	2
 547              	.L22:
 548 0268 00100140 		.word	1073811456
 549 026c 44000000 		.word	RxBuffer
 550              		.cfi_endproc
 551              	.LFE6:
 553              		.align	1
 554              		.global	usart_init
 555              		.syntax unified
 556              		.code	16
 557              		.thumb_func
 558              		.fpu softvfp
 560              	usart_init:
 561              	.LFB7:
 114:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 
 115:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** void usart_init(void)
 116:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** {
 562              		.loc 1 116 0
 563              		.cfi_startproc
 564              		@ args = 0, pretend = 0, frame = 0
 565              		@ frame_needed = 1, uses_anonymous_args = 0
 566 0270 80B5     		push	{r7, lr}
 567              		.cfi_def_cfa_offset 8
 568              		.cfi_offset 7, -8
 569              		.cfi_offset 14, -4
 570 0272 00AF     		add	r7, sp, #0
 571              		.cfi_def_cfa_register 7
 117:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	inbuf = 0;
 572              		.loc 1 117 0
 573 0274 0D4B     		ldr	r3, .L25
 574 0276 0022     		movs	r2, #0
 575 0278 1A70     		strb	r2, [r3]
 118:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	*((void (**) (void)) USART1_IRQVEC) = usart_irq_routine;
 576              		.loc 1 118 0
 577 027a 0D4B     		ldr	r3, .L25+4
 578 027c 0D4A     		ldr	r2, .L25+8
 579 027e 1A60     		str	r2, [r3]
 119:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	*((unsigned int *) NVIC_USART1_ISER) |= NVIC_USART1_IRQ_BPOS;
 580              		.loc 1 119 0
 581 0280 0D4B     		ldr	r3, .L25+12
 582 0282 1A68     		ldr	r2, [r3]
 583 0284 0C4B     		ldr	r3, .L25+12
 584 0286 2021     		movs	r1, #32
 585 0288 0A43     		orrs	r2, r1
 586 028a 1A60     		str	r2, [r3]
 120:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	USART1->brr = 0x2D9;
 587              		.loc 1 120 0
 588 028c 0B4B     		ldr	r3, .L25+16
 589 028e 0C4A     		ldr	r2, .L25+20
 590 0290 1A81     		strh	r2, [r3, #8]
 121:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	USART1->cr3 = 0;
 591              		.loc 1 121 0
 592 0292 0A4B     		ldr	r3, .L25+16
 593 0294 0022     		movs	r2, #0
 594 0296 9A82     		strh	r2, [r3, #20]
 122:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	USART1->cr2 = 0;
 595              		.loc 1 122 0
 596 0298 084B     		ldr	r3, .L25+16
 597 029a 0022     		movs	r2, #0
 598 029c 1A82     		strh	r2, [r3, #16]
 123:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	USART1->cr1 = BIT_EN | BIT_RXNEIE | BIT_TE | BIT_RE; 
 599              		.loc 1 123 0
 600 029e 074B     		ldr	r3, .L25+16
 601 02a0 084A     		ldr	r2, .L25+24
 602 02a2 9A81     		strh	r2, [r3, #12]
 124:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** }
 603              		.loc 1 124 0
 604 02a4 C046     		nop
 605 02a6 BD46     		mov	sp, r7
 606              		@ sp needed
 607 02a8 80BD     		pop	{r7, pc}
 608              	.L26:
 609 02aa C046     		.align	2
 610              	.L25:
 611 02ac 00000000 		.word	inbuf
 612 02b0 D4C00120 		.word	536985812
 613 02b4 00000000 		.word	usart_irq_routine
 614 02b8 04E100E0 		.word	-536813308
 615 02bc 00100140 		.word	1073811456
 616 02c0 D9020000 		.word	729
 617 02c4 2C200000 		.word	8236
 618              		.cfi_endproc
 619              	.LFE7:
 621              		.align	1
 622              		.global	putstring
 623              		.syntax unified
 624              		.code	16
 625              		.thumb_func
 626              		.fpu softvfp
 628              	putstring:
 629              	.LFB8:
 125:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 
 126:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** void putstring(char *s)
 127:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** {
 630              		.loc 1 127 0
 631              		.cfi_startproc
 632              		@ args = 0, pretend = 0, frame = 8
 633              		@ frame_needed = 1, uses_anonymous_args = 0
 634 02c8 80B5     		push	{r7, lr}
 635              		.cfi_def_cfa_offset 8
 636              		.cfi_offset 7, -8
 637              		.cfi_offset 14, -4
 638 02ca 82B0     		sub	sp, sp, #8
 639              		.cfi_def_cfa_offset 16
 640 02cc 00AF     		add	r7, sp, #0
 641              		.cfi_def_cfa_register 7
 642 02ce 7860     		str	r0, [r7, #4]
 128:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	while(*s)
 643              		.loc 1 128 0
 644 02d0 06E0     		b	.L28
 645              	.L29:
 129:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	{
 130:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 		usart_outchar(*s++);
 646              		.loc 1 130 0
 647 02d2 7B68     		ldr	r3, [r7, #4]
 648 02d4 5A1C     		adds	r2, r3, #1
 649 02d6 7A60     		str	r2, [r7, #4]
 650 02d8 1B78     		ldrb	r3, [r3]
 651 02da 1800     		movs	r0, r3
 652 02dc FFF7FEFF 		bl	usart_outchar
 653              	.L28:
 128:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	while(*s)
 654              		.loc 1 128 0
 655 02e0 7B68     		ldr	r3, [r7, #4]
 656 02e2 1B78     		ldrb	r3, [r3]
 657 02e4 002B     		cmp	r3, #0
 658 02e6 F4D1     		bne	.L29
 131:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	}
 132:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** }
 659              		.loc 1 132 0
 660 02e8 C046     		nop
 661 02ea BD46     		mov	sp, r7
 662 02ec 02B0     		add	sp, sp, #8
 663              		@ sp needed
 664 02ee 80BD     		pop	{r7, pc}
 665              		.cfi_endproc
 666              	.LFE8:
 668              		.section	.rodata
 669              		.align	2
 670              	.LC5:
 671 0000 55534152 		.ascii	"USART program\000"
 671      54207072 
 671      6F677261 
 671      6D00
 672              		.text
 673              		.align	1
 674              		.global	main
 675              		.syntax unified
 676              		.code	16
 677              		.thumb_func
 678              		.fpu softvfp
 680              	main:
 681              	.LFB9:
 133:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 
 134:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** void main(void)
 135:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** {
 682              		.loc 1 135 0
 683              		.cfi_startproc
 684              		@ args = 0, pretend = 0, frame = 8
 685              		@ frame_needed = 1, uses_anonymous_args = 0
 686 02f0 90B5     		push	{r4, r7, lr}
 687              		.cfi_def_cfa_offset 12
 688              		.cfi_offset 4, -12
 689              		.cfi_offset 7, -8
 690              		.cfi_offset 14, -4
 691 02f2 83B0     		sub	sp, sp, #12
 692              		.cfi_def_cfa_offset 24
 693 02f4 00AF     		add	r7, sp, #0
 694              		.cfi_def_cfa_register 7
 136:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	char c;
 137:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	usart_init();
 695              		.loc 1 137 0
 696 02f6 FFF7FEFF 		bl	usart_init
 138:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	putstring("USART program");
 697              		.loc 1 138 0
 698 02fa 094B     		ldr	r3, .L33
 699 02fc 1800     		movs	r0, r3
 700 02fe FFF7FEFF 		bl	putstring
 701              	.L32:
 139:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	while(1)
 140:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 	{
 141:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 		c = usart_tstchar();
 702              		.loc 1 141 0
 703 0302 FC1D     		adds	r4, r7, #7
 704 0304 FFF7FEFF 		bl	usart_tstchar
 705 0308 0300     		movs	r3, r0
 706 030a 2370     		strb	r3, [r4]
 142:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 		if (c)
 707              		.loc 1 142 0
 708 030c FB1D     		adds	r3, r7, #7
 709 030e 1B78     		ldrb	r3, [r3]
 710 0310 002B     		cmp	r3, #0
 711 0312 F6D0     		beq	.L32
 143:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 		{
 144:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 			usart_outchar(c);
 712              		.loc 1 144 0
 713 0314 FB1D     		adds	r3, r7, #7
 714 0316 1B78     		ldrb	r3, [r3]
 715 0318 1800     		movs	r0, r3
 716 031a FFF7FEFF 		bl	usart_outchar
 141:C:/Users/Maria/Documents/IT/MOP/MOP/usart_polling\startup.c **** 		if (c)
 717              		.loc 1 141 0
 718 031e F0E7     		b	.L32
 719              	.L34:
 720              		.align	2
 721              	.L33:
 722 0320 00000000 		.word	.LC5
 723              		.cfi_endproc
 724              	.LFE9:
 726              	.Letext0:
 727              		.file 2 "./USART.h"
