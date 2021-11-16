	   MVI E,0F
	   MVI A,09
	   MVI D,00
	   LXI H,0000
	   MVI B,08

LOOP:	   DAD H	// HL = HL + HL
	   RAL	// rotate AC left(<-), leftmost value in C
	   JNC SKIP
	   DAD D

SKIP:	   DCR B
	   JNZ LOOP
	   SHLD 2500
	   HLT
// ans in HL register
