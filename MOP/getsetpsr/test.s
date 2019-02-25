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
  25              		.file 1 "C:/Users/Maria/Documents/IT/MOP/MOP/getsetpsr/startup.c"
   1:C:/Users/Maria/Documents/IT/MOP/MOP/getsetpsr\startup.c **** /*
   2:C:/Users/Maria/Documents/IT/MOP/MOP/getsetpsr\startup.c ****  * 	startup.c
   3:C:/Users/Maria/Documents/IT/MOP/MOP/getsetpsr\startup.c ****  *
   4:C:/Users/Maria/Documents/IT/MOP/MOP/getsetpsr\startup.c ****  */
   5:C:/Users/Maria/Documents/IT/MOP/MOP/getsetpsr\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   6:C:/Users/Maria/Documents/IT/MOP/MOP/getsetpsr\startup.c **** 
   7:C:/Users/Maria/Documents/IT/MOP/MOP/getsetpsr\startup.c **** void startup ( void )
   8:C:/Users/Maria/Documents/IT/MOP/MOP/getsetpsr\startup.c **** {
  26              		.loc 1 8 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
   9:C:/Users/Maria/Documents/IT/MOP/MOP/getsetpsr\startup.c **** __asm volatile(
  31              		.loc 1 9 0
  32              		.syntax divided
  33              	@ 9 "C:/Users/Maria/Documents/IT/MOP/MOP/getsetpsr/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  10:C:/Users/Maria/Documents/IT/MOP/MOP/getsetpsr\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  11:C:/Users/Maria/Documents/IT/MOP/MOP/getsetpsr\startup.c **** 	" MOV SP,R0\n"
  12:C:/Users/Maria/Documents/IT/MOP/MOP/getsetpsr\startup.c **** 	" BL main\n"				/* call main */
  13:C:/Users/Maria/Documents/IT/MOP/MOP/getsetpsr\startup.c **** 	"_exit: B .\n"				/* never return */
  14:C:/Users/Maria/Documents/IT/MOP/MOP/getsetpsr\startup.c **** 	) ;
  15:C:/Users/Maria/Documents/IT/MOP/MOP/getsetpsr\startup.c **** }
  40              		.loc 1 15 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.text
  48              		.align	1
  49              		.global	getPsrReg
  50              		.syntax unified
  51              		.code	16
  52              		.thumb_func
  53              		.fpu softvfp
  55              	getPsrReg:
  56              	.LFB1:
  16:C:/Users/Maria/Documents/IT/MOP/MOP/getsetpsr\startup.c **** 
  17:C:/Users/Maria/Documents/IT/MOP/MOP/getsetpsr\startup.c **** __attribute__((naked)) unsigned int getPsrReg(void)
  18:C:/Users/Maria/Documents/IT/MOP/MOP/getsetpsr\startup.c **** {
  57              		.loc 1 18 0
  58              		.cfi_startproc
  59              		@ Naked Function: prologue and epilogue provided by programmer.
  60              		@ args = 0, pretend = 0, frame = 0
  61              		@ frame_needed = 1, uses_anonymous_args = 0
  19:C:/Users/Maria/Documents/IT/MOP/MOP/getsetpsr\startup.c **** 	__asm (
  62              		.loc 1 19 0
  63              		.syntax divided
  64              	@ 19 "C:/Users/Maria/Documents/IT/MOP/MOP/getsetpsr/startup.c" 1
  65 0000 EFF30080 		 MRS R0,APSR
  66 0004 7047     	 BX LR
  67              	
  68              	@ 0 "" 2
  20:C:/Users/Maria/Documents/IT/MOP/MOP/getsetpsr\startup.c **** 	" MRS R0,APSR\n"
  21:C:/Users/Maria/Documents/IT/MOP/MOP/getsetpsr\startup.c **** 	" BX LR\n"
  22:C:/Users/Maria/Documents/IT/MOP/MOP/getsetpsr\startup.c **** 	);
  23:C:/Users/Maria/Documents/IT/MOP/MOP/getsetpsr\startup.c **** }
  69              		.loc 1 23 0
  70              		.thumb
  71              		.syntax unified
  72 0006 C046     		nop
  73 0008 1800     		movs	r0, r3
  74              		.cfi_endproc
  75              	.LFE1:
  77              		.align	1
  78              		.global	setPsrReg
  79              		.syntax unified
  80              		.code	16
  81              		.thumb_func
  82              		.fpu softvfp
  84              	setPsrReg:
  85              	.LFB2:
  24:C:/Users/Maria/Documents/IT/MOP/MOP/getsetpsr\startup.c **** 
  25:C:/Users/Maria/Documents/IT/MOP/MOP/getsetpsr\startup.c **** __attribute__((naked)) unsigned int setPsrReg(unsigned int apsr)
  26:C:/Users/Maria/Documents/IT/MOP/MOP/getsetpsr\startup.c **** {
  86              		.loc 1 26 0
  87              		.cfi_startproc
  88              		@ Naked Function: prologue and epilogue provided by programmer.
  89              		@ args = 0, pretend = 0, frame = 0
  90              		@ frame_needed = 1, uses_anonymous_args = 0
  27:C:/Users/Maria/Documents/IT/MOP/MOP/getsetpsr\startup.c **** 	__asm (
  91              		.loc 1 27 0
  92              		.syntax divided
  93              	@ 27 "C:/Users/Maria/Documents/IT/MOP/MOP/getsetpsr/startup.c" 1
  94 000a 80F30088 		 MSR APSR,R0
  95 000e 7047     	 BX LR
  96              	
  97              	@ 0 "" 2
  28:C:/Users/Maria/Documents/IT/MOP/MOP/getsetpsr\startup.c **** 	" MSR APSR,R0\n"
  29:C:/Users/Maria/Documents/IT/MOP/MOP/getsetpsr\startup.c **** 	" BX LR\n"
  30:C:/Users/Maria/Documents/IT/MOP/MOP/getsetpsr\startup.c **** 	);
  31:C:/Users/Maria/Documents/IT/MOP/MOP/getsetpsr\startup.c **** }
  98              		.loc 1 31 0
  99              		.thumb
 100              		.syntax unified
 101 0010 C046     		nop
 102 0012 1800     		movs	r0, r3
 103              		.cfi_endproc
 104              	.LFE2:
 106              		.align	1
 107              		.global	main
 108              		.syntax unified
 109              		.code	16
 110              		.thumb_func
 111              		.fpu softvfp
 113              	main:
 114              	.LFB3:
  32:C:/Users/Maria/Documents/IT/MOP/MOP/getsetpsr\startup.c **** 
  33:C:/Users/Maria/Documents/IT/MOP/MOP/getsetpsr\startup.c **** void main(void)
  34:C:/Users/Maria/Documents/IT/MOP/MOP/getsetpsr\startup.c **** {
 115              		.loc 1 34 0
 116              		.cfi_startproc
 117              		@ args = 0, pretend = 0, frame = 8
 118              		@ frame_needed = 1, uses_anonymous_args = 0
 119 0014 80B5     		push	{r7, lr}
 120              		.cfi_def_cfa_offset 8
 121              		.cfi_offset 7, -8
 122              		.cfi_offset 14, -4
 123 0016 82B0     		sub	sp, sp, #8
 124              		.cfi_def_cfa_offset 16
 125 0018 00AF     		add	r7, sp, #0
 126              		.cfi_def_cfa_register 7
  35:C:/Users/Maria/Documents/IT/MOP/MOP/getsetpsr\startup.c **** 	unsigned int psr;
  36:C:/Users/Maria/Documents/IT/MOP/MOP/getsetpsr\startup.c **** 	psr = getPsrReg();
 127              		.loc 1 36 0
 128 001a FFF7FEFF 		bl	getPsrReg
 129 001e 0300     		movs	r3, r0
 130 0020 7B60     		str	r3, [r7, #4]
  37:C:/Users/Maria/Documents/IT/MOP/MOP/getsetpsr\startup.c **** 	setPsrReg(0);
 131              		.loc 1 37 0
 132 0022 0020     		movs	r0, #0
 133 0024 FFF7FEFF 		bl	setPsrReg
  38:C:/Users/Maria/Documents/IT/MOP/MOP/getsetpsr\startup.c **** 	psr = getPsrReg();
 134              		.loc 1 38 0
 135 0028 FFF7FEFF 		bl	getPsrReg
 136 002c 0300     		movs	r3, r0
 137 002e 7B60     		str	r3, [r7, #4]
  39:C:/Users/Maria/Documents/IT/MOP/MOP/getsetpsr\startup.c **** }
 138              		.loc 1 39 0
 139 0030 C046     		nop
 140 0032 BD46     		mov	sp, r7
 141 0034 02B0     		add	sp, sp, #8
 142              		@ sp needed
 143 0036 80BD     		pop	{r7, pc}
 144              		.cfi_endproc
 145              	.LFE3:
 147              	.Letext0:
