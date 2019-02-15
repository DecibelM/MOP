

init:	
	@ initiera port D som utport
	LDR	R6,=0x55555555
	LDR	R5,=0x40020C00
	STR	R6,[R5]
	@ adressen till port D:s ut-dataregister till R5
	LDR	R5,=0x40020C14
	@ adressen till port E:s in-dataregister till R6
	LDR	R6,=0x40021010

	LDR	R4,=SegCodes

main:	LDR	R0,[R6]
	CMP	R0,#16
	BCC	yes
	B	no

yes:	LDRB	R0,[R4,R0]
	STR	R0,[R5]
	B	main
no:	LDR	R0,=0x0
	STR	R0,[R5]
	B	main

SegCodes:	.BYTE	0x3F,0x05,0x5B,0x4F
		.BYTE	0x66,0x6D,0x7D,0x07
		.BYTE	0x7F,0x67,0x77,0x7C
		.BYTE	0x39,0x5D,0x79,0x71


