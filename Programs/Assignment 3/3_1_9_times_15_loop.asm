	   MVI A,00
	   MVI B,09	// 9
	   MVI D,0F	// 15
	   MVI C,00

LOOP:	   ADD D
	   DCR B
	   JNZ LOOP
	   HLT
