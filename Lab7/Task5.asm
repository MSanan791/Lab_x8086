org 100h

.DATA 
first_str DB 17, 16 DUP (?)
plndrm_msg DB 0AH,0DH,"It is palindrome",0AH,0DH,"$"
No_plndrm_msg DB 0AH,0DH,"It is not a palindrome",0AH,0DH,"$" 

angrm_1 DB 17, 16 DUP (?)
angrm_2 DB 17, 16 DUP (?) 
freq_tbl 26 DUP(0)
angrm_msg DB 0AH,0DH,"They are anagrams",0AH,0DH,"$"
No_angrm_msg DB 0AH,0DH,"They are not anagrams",0AH,0DH,"$"
nextLine DB 0AH, 0DH, "$"

.CODE


MOV AH, 0AH                 ;First String input
MOV DX, OFFSET first_str
INT 21H

XOR AX, AX 
XOR DX, DX
MOV AL, first_str[1]        ;AX = length
MOV BX, 2
DIV BX

MOV CX, AX                  ;CX = length/2

MOV SI, OFFSET first_str
ADD SI, 2                   ;SI = start of str

MOV DI, SI
XOR DX, DX
MOV DL, first_str[1]
ADD DI, DX
SUB DI, 1                   ;DI = end of str

Check_plndrm:               ;Loop to check palindrome
    MOV DL, [SI]
    CMP DL, [DI]
    JNE No_plndrm
    INC SI
    DEC DI
    LOOP Check_plndrm

JMP Plndrm    
No_plndrm:
    MOV AH, 09H
    LEA DX, No_plndrm_msg
    INT 21H
    JMP End_
    
Plndrm:
    MOV AH, 09H
    LEA DX, plndrm_msg
    INT 21H
    
End_:


ret