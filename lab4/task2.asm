org 100h
.model small
.stack 100h

.DATA
msg1 DB  0dh, 0ah 'Enter ypur Marks: ', , '$'
msg DB 0dh, 0ah ,'Your Grade is: ' , '$'
Grade DB 'A', 0dh, 0ah, '$'
Grade2 DB 'B', 0dh, 0ah, '$'
Grade3 DB 'C', 0dh, 0ah, '$'
Grade4 DB 'D', 0dh, 0ah, '$'
BUF DB 5, 5 DUP (?)

.CODE

.STARTUP

leap:

LEA DX, msg1
MOV AH, 09H
INT 21h


MOV BL, BUF[2]

CMP BL, 05H
JG 

grade1:
LEA DX, Grade
MOV AH, 09H
INT 21h

grade_2:
LEA DX, Grade2
MOV AH, 09H
INT 21h

grade3:
LEA DX, Grade3
MOV AH, 09H
INT 21h

grade4:
LEA DX, Grade4
MOV AH, 09H
INT 21h

loop leap


end:

ret