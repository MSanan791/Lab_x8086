org 100h  

.DATA 
msg1 DB "Enter First Word",0AH, 0DH, "$"  
newline DB "", 0AH, 0DH, "$"                                      
msg2 DB "Enter Second Word",0AH, 0DH, "$"
str1 DB  12 ,11 DUP(0)
str2 DB  12 ,11 DUP(0)




.CODE

MOV AX, @DATA
MOV DS, AX  

LEA DX, msg1 
MOV AH, 09H ; show first message
INT 21H

MOV AH, 0AH
MOV DX, OFFSET str1 ;INPUT VALUE
INT 21h

LEA DX, newline ; NEWLINE
MOV AH, 09H
INT 21H
 
LEA DX, msg2 ; SHOW SECOND MESSSAGE
MOV AH, 09H
INT 21H


MOV AH, 0AH
MOV DX, OFFSET str2 ; INPUT SECOND STRING
INT 21h

; APPLYING FIRST CONDITION
;CHECKING FOR equality in length







ret




