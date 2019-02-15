@compare.asm

start:	LDR	R0,=0x55555555	@initiera port som utport
	LDR	R1,=0x40020C00
	STR	R0,[R1]
	LDR	R5,=0x40020C14	@adressen till port D:s ut-dataregister
	LDR	R6,=0x40021010	@adressen till port E:s in-dataregister


main:	LDR	R4,=0x1	
	LDRSB	R0,[R6,R3]
	LDRSB	R1,[R6,R4]
	CMP	R0,R1
	BGT	main_1
	MOV	R0,#0
	STRB	R0,[R5]
	B	main_2
main_1:	MOV	R0,#0xFF
main_2:	STRB	R0,[R5]
	B	main
