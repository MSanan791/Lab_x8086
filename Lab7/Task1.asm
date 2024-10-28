org 100h

.DATA

arr DB 5,6,7,8,3
arr_b 6, 5 DUP(?)

.CODE

MOV AX, @DATA
MOV DS, AX

MOV AH, 02H
LEA BX, arr
ADD BX, 2
MOV BYTE PTR [BX] , '0'

MOV DX, [BX]
INT 21H 


ret