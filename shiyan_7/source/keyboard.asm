		ORG 0000H
MAIN:	MOV P3 , #0FFH
		CLR P3.0 
		MOV A , P3
		ANL A , #0F0H
		XRL A , #0F0H
		JZ NOKEY1
		LCALL DELAY10MS
		MOV A , P3
		ANL A , #0F0H
		XRL A , #0F0H
		JZ NOKEY1		
		LJMP DIS1

NOKEY1: 
		MOV P3 , #0FFH
		CLR P3.1 
		MOV A , P3
		ANL A , #0F0H
		XRL A , #0F0H
		JZ NOKEY2
		LCALL DELAY10MS
		MOV A , P3
		ANL A , #0F0H
		XRL A , #0F0H
		JZ NOKEY2		
		LJMP DIS2

NOKEY2:
		MOV P3 , #0FFH
		CLR P3.2 
		MOV A , P3
		ANL A , #0F0H
		XRL A , #0F0H
		JZ NOKEY3
		LCALL DELAY10MS
		MOV A , P3
		ANL A , #0F0H
		XRL A , #0F0H
		JZ NOKEY3		
		LJMP DIS3

NOKEY3:
		MOV P3 , #0FFH
		CLR P3.3 
		MOV A , P3
		ANL A , #0F0H
		XRL A , #0F0H
		LCALL DELAY10MS
		MOV A , P3
		ANL A , #0F0H
		XRL A , #0F0H
		JZ MAIN		
		LJMP DIS4
		
DIS1:	JB ACC.4 , NUM0
		JB ACC.5 , NUM4
		JB ACC.6 , NUM8
		JB ACC.7 , NUMC
		LJMP MAIN
DIS2:	JB ACC.4 , NUM1
		JB ACC.5 , NUM5
		JB ACC.6 , NUM9
		JB ACC.7 , NUMD
		LJMP MAIN
DIS3:	JB ACC.4 , NUM2
		JB ACC.5 , NUM6
		JB ACC.6 , NUMA
		JB ACC.7 , NUME
		LJMP MAIN
DIS4:	JB ACC.4 , NUM3
		JB ACC.5 , NUM7
		JB ACC.6 , NUMB
		JB ACC.7 , NUMF
		LJMP MAIN

NUM0:	MOV P1 , #00
		LJMP MAIN
NUM1:	MOV P1 , #01
		LJMP MAIN
NUM2:	MOV P1 , #02
		LJMP MAIN
NUM3:	MOV P1 , #03
		LJMP MAIN
NUM4:	MOV P1 , #04
		LJMP MAIN
NUM5:	MOV P1 , #05
		LJMP MAIN
NUM6:	MOV P1 , #06
		LJMP MAIN
NUM7:	MOV P1 , #07
		LJMP MAIN
NUM8:	MOV P1 , #08
		LJMP MAIN
NUM9:	MOV P1 , #09
		LJMP MAIN
NUMA:	MOV P1 , #10
		LJMP MAIN
NUMB:	MOV P1 , #11
		LJMP MAIN
NUMC:	MOV P1 , #12
		LJMP MAIN
NUMD:	MOV P1 , #13
		LJMP MAIN
NUME:	MOV P1 , #14
		LJMP MAIN
NUMF:	MOV P1 , #15
		LJMP MAIN		
		
		SJMP $
DELAY10MS:
		MOV R5 , #10
		D0:
		MOV R4 , #249
		D1:
		NOP
		NOP
		DJNZ R4 , D1
		DJNZ R5 , D0
		NOP
		NOP
		RET		
		
		END