		ORG 0000H
		LJMP MAIN
		ORG 0100H
MAIN:	MOV R0 , #9              ;倒计时秒数
		MOV R1 , #10             ;循环次数
		;MOV R2 , #00			  ;按键次数
		MOV DPTR , #TABLE
NEXT:	MOV A , R0
		MOV B , #10
		DIV AB
		MOVC A,@A+DPTR
		MOV P0 , A
		MOV A , B
		MOVC A,@A+DPTR
		MOV P2 , A
		LCALL DELAY1S
		MOV A , R2
		DEC R0
		DJNZ R1 , NEXT
		SJMP $
		
DELAY1S:   ;误差 0us
		MOV R7,#167
		DL0:
		MOV R6,#171
		DL1:
		MOV R5,#16
		DJNZ R5,$
		DJNZ R6,DL1
		DJNZ R7,DL0
		NOP
		RET
TABLE:  DB 3FH,06H,5BH,4FH,66H,6DH,7DH,07H
        DB 7FH,6FH,77H,7CH,39H,5EH,79H,71H
		END