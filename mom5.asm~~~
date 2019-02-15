@ mom5.asm
start:
@ initiera port D som utport
	LDR	R6,=0x55555555
	LDR	R5,=0x40020C00
	STR	R6,[R5]
@ adressen till port D:s ut-dataregister till R5
	LDR	R5,=0x40020C14
@ adressen till port E:s in-dataregister till R6
	LDR	R6,=0x40021010
main:
	LDR	R2,=0x01
	LDR	R3,=0x00
	LDRSB	R0,[R6,R3]		@las PE0-E7
	LDRSB	R1,[R6, R2]	@las PE8-E15
	ADD	R0,R0,R1
	STRH	R0,[R5]
	B	main
