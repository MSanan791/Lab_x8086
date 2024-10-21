org 100h
.MODEL SMALL
.STACK 200h

.DATA
msg1 DB "Enter a String of uppercase Letters",0dh, 0ah, "$"
buff DB 32, 30 DUP(?)
buff2 DB 32, 30 DUP(?)

.CODE

MOV AX, @DATA
MOV DS, AX

LEA DX, msg1
mov ah, 09h
int 21h

mov ah, 0ah
mov dx, OFFSET buff
int 21h

mov bl, 0
jmp loop2
loop1:
add bl,1
loop2:
mov bh, bl
add bh, 1

mov cl, buff[bl+2]
mov ch, buff[bh+2]
cmp bl, buff[0]
jz exit
cmp bh, buff[0]
jz assign

cmp cl,ch
jz equal
jb smaller
ja greater



equal:

add bh, 1
jmp loop2
greater:
add bh, 1
jmp loop2
smaller:
mov cl, ch

add bh, 1
jmp loop2

assign:
mov buff[bl+2], cl
jmp loop1


exit:
int 21h
ret





; org 100h
; .MODEL SMALL
; .STACK 200h

; .DATA
; msg1 DB "Enter a String of uppercase Letters",0dh, 0ah, "$"
; buff DB 32, 30 DUP(?)


; .CODE

; MOV AX, @DATA
; MOV DS, AX

; LEA DX, msg1
; mov ah, 09h
; int 21h

; mov ah, 0ah
; mov dx, OFFSET buff
; int 21h



; ret