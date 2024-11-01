; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.data

BUFFER db 10,11 dup (?)
MSG1 db 0ah, 0dh, "Enter 10 numbers: $"
MEAN db 0ah, 0dh, "Mean: $"
MEDIAN db 0ah, 0dh, "Median: $"
MODE db 0ah, 0dh, "Mode: $"
RANGE db 0ah, 0dh, "Range: $" 
nextline db 0ah,0dh, "$"


.code

MOV AX, @DATA
MOV DS, AX

; Printing Prompt
MOV AH, 09H
MOV DX, OFFSET MSG1 
INT 21H
  
MOV CX, 10  

; Input into Buffer                

REPEAT:
MOV AH, 01H  
MOV DX, OFFSET BUFFER
INT 21H             

MOV AH, 09H
MOV DX, OFFSET nextline 
INT 21H

LOOP REPEAT

MOV DX, 0
MOV CX, 10
LEA SI, BUFFER

;INC SI              ; 1st index of array

SUM_LOOP:   
    MOV AL, [SI]          ; Load next number from BUFFER
    CWD                  
    ADD DX, AX            
    INC SI                ; Move to next buffer position
LOOP SUM_LOOP        

MOV AX, DX
MOV CX, 10
DIV CL
 
 ; Display Mean
MOV AH, 09H
MOV DX, OFFSET MEAN
INT 21H


ADD AL, '0'              
MOV DL, AL               
MOV AH, 02H               ; Function to display character in DL
INT 21H

; Newline
MOV AH, 09H
MOV DX, OFFSET nextline
INT 21H

ret