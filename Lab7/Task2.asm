org 100h  

.DATA 
msg1 DB "Enter First Word",0AH, 0DH, "$"  
newline DB "", 0AH, 0DH, "$"                                      
msg2 DB "Enter Second Word",0AH, 0DH, "$"
msg3 DB "STRING 1 DOES NOT PRECEDE STRING 2", 0ah, 0dh, "$" 
msg4 DB "STRING 1 DOES PRECEED STRING 2", 0ah, 0dh, "$"

str1 DB  12, 11 DUP(0)  ; Buffer for first string
str2 DB  12, 11 DUP(0)  ; Buffer for second string

.CODE

MOV AX, @DATA
MOV DS, AX  

; Display first message
LEA DX, msg1 
MOV AH, 09H 
INT 21H

; Read first string
MOV AH, 0AH
MOV DX, OFFSET str1
INT 21h

; New line
LEA DX, newline
MOV AH, 09H
INT 21H
 
; Display second message
LEA DX, msg2
MOV AH, 09H
INT 21H

; Read second string
MOV AH, 0AH
MOV DX, OFFSET str2
INT 21h

; New line
LEA DX, newline
MOV AH, 09H
INT 21H
                                       
; Check if strings have the same length
MOV AL, str1[1]  ; Length of str1
MOV BL, str2[1]  ; Length of str2
CMP AL, BL
JZ EQUAL         ; Jump if lengths are equal

; If lengths are not equal
MOV AH, 09H
LEA DX, msg3
INT 21H
JMP END

EQUAL: 
MOV CX, 0
MOV CL, str1[1]  ; Set CX to the length of the strings
MOV SI, OFFSET str1
ADD SI, 2        ; Point to the first character of str1
MOV DI, OFFSET str2
ADD DI, 2        ; Point to the first character of str2
        
iter:        
    MOV AL, [SI]  ; Load character from str1
    MOV BL, [DI]  ; Load character from str2

    INC SI
    INC DI

    CMP AL, BL
    JB preceed     ; If str1 < str2, jump to preceed

    CMP AL, BL
    JA normal      ; If str1 > str2, jump to normal

    LOOP iter      ; Continue looping if CX != 0

normal:
    LEA DX, msg3   ; Load msg3 if str1 does not precede str2
    MOV AH, 09H
    INT 21H      
    JMP END

preceed:
    LEA DX, msg4   ; Load msg4 if str1 precedes str2
    MOV AH, 09H
    INT 21H

END:
    ret
