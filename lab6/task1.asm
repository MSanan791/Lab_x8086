org 100h
.MODEL SMALL
.STACK 200h

.DATA
A dw 4
B dw 5
C dw 9
D dw 2
disp dw 0 , "$"
msg4 DB '', 0ah, 0dh, '$'

.CODE

MOV AX, @DATA
MOV DS, AX

mov AX, 5
mov bx, A
imul bx;

sub ax, 7 

int 21h

; part b

mov ax, A
mov bx, B
sub ax,bx
add bx, 10
mul bx;
int 21h

; part c

mov ax, 9
mov bx, A
mul bx
mov bx, ax
mov ax, 6
sub ax, bx

int 21h

; part d

mov bx, B
mov ax, 2
mul bx
add ax, 5

; part e

mov ax, B
sub ax, 4
mov bx, B
mov cx, ax
mov ax, bx
mul 5
mul cx
int 21h

; part f

mov ax, B
mov bx, 2
mul bx
mov dx, ax

mov ax, A
mov bx, B
sub ax, bx
mov bx, 4
mul bx
mov cx, 12
sub cx, ax
add cx, dx 

int 21h

; part g

mov ax, B
mov bx, 2
mul bx
mov dx, ax

mov ax, A
add ax, 4
mov bx, ax
mov ax,10
mov cx, A
sub ax, cx
mul bx
mul dx

; part h

mov ax, A
mul ax
mul ax
mov bx, ax
mov ax, B
mul ax
mul ax
mov cx, 2
mul cx
mov cx, ax
add ax, bx
sub ax, 8

; part i

mov ax, A
mul ax
mul ax
mov dx, ax

mov ax, A
mov bx, 5
mul bx
sub dx,ax
add dx,9

; part j

mov ax, B
add ax, 10
mov bx, 5
mul bx

mov cx, ax

mov ax, 3
mul ax
mov bx, A
mul bx

; part i 

mov ax, C
mul ax
add ax, 3

mov cx, ax

mov bx, B
mov ax, 10
mul bx
mul ax
mul ax
mul ax
mul ax
mul ax

add ax, cx



ret

