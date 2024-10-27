org 100h
.DATA
Message DB "Enter the two numbers: ", 0DH, 0AH, "$" 
nextLine DB 0DH, 0AH, "$"
disp_Msg DB "The HCF of 2 numbers is: ", "$"
displ_Msg DB "The LCM of 2 nnumbers is: ", "$"
hex_table DB "0123456789ABCDEF","$" 

num_1 DB 3, 4 DUP(0)
num_2 DB 3, 4 DUP(0)
zero_err DB 0AH, 0DH, "Cannot divide by 0", 0Ah, 0DH, "$" 
neg_err DB 0AH, 0DH, "Cannot take negative exponents, since floating point not supported", 0AH, 0DH, "$"

.CODE

Task_4:
;Assuming that A=4, B=5, C=4
MOV BL, 4                   ;BL = A
MOV BH, 5                   ;BH = B
MOV CL, 4                   ;CL = C

MOV AL, BL                  
MOV DL, 3
MUL DL                      ;AH:AL = Ax3
XOR DX, DX
MOV CH, 1
ADD CH, BH                  ;CH = B+1
DIV CH
CMP AL,5
JG Set_CF                   ;first condition

XOR AX, AX
MOV AL, CL
MOV CH, 2
DIV CH
MOV DL, AL                  ;DL = C/2
MOV AL, BL                  ;AL = A
DIV BH                      ;AL = A/B
ADD DL, AL
CMP DL, 4
JLE Set_PF                  ;Second condition

CMP BH,0
JE Set_Z

ADD AX, 1
CLC

JMP End_4
Set_CF:
STC

JMP End_4
Set_PF:
XOR AX, AX
 
JMP End_4
Set_Z:
XOR AX, AX

End_4

ret