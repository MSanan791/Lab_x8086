
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
.MODEL SMALL
org 100h 
.STACK 100H
  
.DATA  
BUFFER DB 09, 7 DUP(?)
msg1 DB  'Enter Your first Name',0AH,0DH,'$'



.CODE

LEA DX, msg1   
mov ah,09h
int 21h

MOV AH, 0AH
MOV DX, OFFSET BUFFER
INT 21H
Read from keyboard the word “hello”
  

ret







