
START:	   LXI H,2500	// start of array
	   MVI D,00	// d acts a bool, if any swap happend, d = 1
	   MVI C,05
	   DCR C	// c-- as we will only go through first 4

CHECK:	   MOV A,M
	   INX H
	   CMP M	// compare a[i] with a[i+1]
// if a[i] - a[i+1] > 0 -> Cy = 0, Z = 0 (we swap)
// if a[i] - a[i+1] = 0 -> Cy = 0, Z = 1 (we don't swap)
// if a[i] - a[i+1] < 0 -> Cy = 1, Z = 0 (we don't swap)
	   JC NEXTBYTE
	   JZ NEXTBYTE
// here swap occurs
	   MOV B,M	// a[i] = A, a[i+1] = B
	   MOV M,A	// a[i+1] = A
	   DCX H
	   MOV M,B	// a[i] = B
	   INX H
	   MVI D,01	// set flag that swap occured

NEXTBYTE:	   DCR C
	   JNZ CHECK
	   MOV A,D
	   CPI 01	// comapare immediate A and 01
// if A - 01 > 0 -> Cy = 0, Z = 0 -> A(D) is zero, no swap taken place, exit
// if A - 01 = 0 -> Cy = 0, Z = 1 -> A or D is 1, swap taken place redo
	   JZ START
	   HLT
