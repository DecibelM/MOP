/*
 * 	startup.c
 *
 */
void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void )
{
__asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	"_exit: B .\n"				/* never return */
	) ;
}

__attribute__((naked)) unsigned int getPsrReg(void)
{
	__asm (
	" MRS R0,APSR\n"
	" BX LR\n"
	);
}

__attribute__((naked)) unsigned int setPsrReg(unsigned int apsr)
{
	__asm (
	" MSR APSR,R0\n"
	" BX LR\n"
	);
}

void main(void)
{
	unsigned int psr;
	psr = getPsrReg();
	setPsrReg(0);
	psr = getPsrReg();
}

