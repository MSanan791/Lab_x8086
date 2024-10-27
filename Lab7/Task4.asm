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

Task_4:
    MOV AH, 0AH             ;first string input
    LEA DX, angrm_1
    INT 21H
    
    MOV AH, 09H
    LEA DX, nextLine
    INT 21H 
    
    MOV AH, 0AH             ;second string input
    LEA DX, angrm_2
    INT 21H
    
    XOR CX, CX
    MOV CL, angrm_1[1]      ;CX = length of string1
    MOV BX, 2
    store1:
        XOR AX, AX
        MOV AL, angrm_1[BX]
        SUB AX, 60H
        MOV BP, AX
        ADD freq_tbl[BP], 1
        INC BX
        LOOP store1
        
    XOR CX, CX
    MOV CL, angrm_2[1]      ;CX = length of string1
    MOV BX, 2
    store2:                           
        XOR AX, AX
        MOV AL, angrm_2[BX]
        SUB AX, 60H
        MOV BP, AX
        SUB freq_tbl[BP], 1
        INC BX
        LOOP store2
        
    MOV CX, 26
    MOV BX, 0
    traverser_ft:
        CMP freq_tbl[BX], 0
        JNE no_angrm
        INC BX
        LOOP traverser_ft
    
    JMP angrm    
    no_angrm:
        MOV AH, 09H
        LEA DX, No_angrm_msg
        INT 21H
        JMP end_4
    
    angrm:
        MOV AH, 09H
        LEA DX, angrm_msg
        INT 21H
        
end_4:

ret