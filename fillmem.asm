@
@	fillmem.asm
@
start:	
@ ladda parametrar
	LDR	R0,mptr
	MOV	R1,#30
	MOV	R2,#0xBB
	BL	fillmem
	B	start

fillmem:
@ void	fillmem(char *start, unsigned int size, char fill)
@ {
.L1:
@ while(size)
	CMP	R1,#0
	BEQ	.L2
@ {
@   *start++=fill;
	STRB	R2,[R0]
	ADD	R0,R0,#1
@  size--;
	SUB	R1,R1,#1
	B	.L1
@  }
@ }
.L2:	BX	LR

@ Parameter 1, startadress för minnesarean
	.ALIGN
mptr:	.WORD	0x20008000
