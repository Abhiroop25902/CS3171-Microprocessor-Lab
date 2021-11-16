// prereq, save 3 bytes starting from loc 8500 and 9000
	   MVI C,03
	   LXI H,8500
	   LXI D,9000
	   CALL ADDB
	   HLT
// add Z bytes, first number starts from X, other number starts from Y
// Z->C
// X->HL
// Y->DE
// destroys -> B

ADDB:	   SHLD 1500	// save HL data to 1500 addr to be read later
	   MVI B,00	// set B as 0, will act as counter afterward

LOOP:	   LDAX D	// A -> Mem[DE]
	   ADC M	// A -> A+ Mem[HL] + carry
	   PUSH PSW	// push AF data to SP, first A, then F
	   INR B
	   INX H
	   INX D
	   DCR C
	   JNZ LOOP	// jump to Loop till C!=0
// now addition done and saved to Stack, need to check if carry exist
	   JNC SKIP
// these will execute only when there is a carry
	   MVI A,01
	   PUSH PSW
	   INR B

SKIP:	   LHLD 1500	// read saved LH data to go to start of X

L1:	   POP PSW	// pop SP to AF, first F then A
	   MOV M,A
	   INX H
	   DCR B
	   JNZ L1
	   RET
