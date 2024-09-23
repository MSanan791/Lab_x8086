#make_COM#

; COM file is loaded at CS:0100h
ORG 100h

.MODEL SMALL
.STACK 100H
.DATA
;NAME DB 'SHEHRYAR KASHIF',0DH, 0AH, '$'
;DEG DB 'DE 44', 0DH,0AH, '$'
;DEP DB 'DCSE', 0DH,0AH, '$'

;.CODE
;LEA DX, NAME
;MOV AH, 09H
;INT 21H
;LEA DX, DEG
;INT 21H
;LEA DX, DEP
;INT 21H

.DATA
Name1 DB 'Muhammad Sanan Khan',0DH, 0AH, '$'
Deg DB 'DE-44', 0DH, 0AH, '$'
Dept DB 'DC&SE',0DH, 0AH, '$'
.CODE              

LEA DX, Name1 
MOV AH, 09H   
INT 21H

LEA DX, Deg 
MOV AH, 09H   
INT 21H


LEA DX, Dept 
MOV AH, 09H
INT 21H


   
END