
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
.MODEL SMALL
org 100h 
.STACK 100H
  
.DATA  
; BUFFER DB 09, 7 DUP(?)
msg1 DB  'Enter Your first Name',0AH,0DH,'$'
msg2 DB 'Enter Your Last Name', 0AH, 0DH, '$' 
msg3 DB ' ','$' 
msg4 DB '', 0ah, 0dh, '$'
BUFFER DB 09, 7 DUP(?) 
BUFFER_2 DB 09, 7 DUP(?)



.CODE

; LEA DX, msg1   
; mov ah,09h
; int 21h

; MOV AH, 0AH
; MOV DX, OFFSET BUFFER
; INT 21H
; Read from keyboard the word “hello”
 
 LEA DX, msg1   
 mov ah,09h
 int 21h
 
 mov ah, 0ah
 mov dx, offset BUFFER
 int 21h

 LEA DX, msg4   
 mov ah,09h
 int 21h

 LEA DX, msg2   
 mov ah,09h
 int 21h
 

 MOV AH, 0AH
 MOV DX, OFFSET BUFFER_2
 INT 21h
 
 LEA DX, msg4   
 mov ah,09h
 int 21h

 MOV AH, 09H
 mov bh, 00h
 mov bl, BUFFER[1]
 MOV BUFFER[BX+2], '$'
 LEA DX, BUFFER [2]
 INT 21H  
 
  LEA DX, msg3   
 mov ah,09h
 int 21h
         
 MOV AH, 09H
 mov bh, 00h
 mov bl, BUFFER_2[1]
 MOV BUFFER_2[BX+2], '$'
 LEA DX, BUFFER_2 [2]
 INT 21H
         
 

ret







