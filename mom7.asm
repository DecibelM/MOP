@ mom7.asm
start:
@ initiera port D som utport
	LDR	R6,=0x55555555
	LDR	R5,=0x40020C00
	STR	R6,[R5]
	LDR	R5,=0x40021000
	STR	R6,[R5]
@ adressen till port D:s ut-dataregister till R5
	LDR	R5,=0x40020C14
@ adressen till port E:s in-dataregister till R6
	LDR	R6,=0x40021014

main:
	LSR	R2,R0,#16
	STRH	R2,[R5]
	STRH	R0,[R6]

	LSL	R0,R1
	
	LSR	R2,R0,#16
	STRH	R2,[R5]
	STRH	R0,[R6]
	
	B 	main