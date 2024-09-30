org 100h
.MODEL SMALL
.STACK 100H


.DATA
msg1 DB  'Enter Your Age',0AH,0DH,'$'
msg2 DB 'Enter Your Place of Birth', 0AH, 0DH, '$' 
msg3 DB ' ','$' 
msg4 DB '', 0ah, 0dh, '$'
msg5 DB '-', '$' 
msg6 DB 'Number of Alphabets:', '$'
BUFFER DB 09, 7 DUP(?) 
BUFFER_2 DB 09, 7 DUP(?)
BUFFER_3 DB 03, 7 DUP(?)




.CODE
    ;Printing first messaage from .DATA section e.g Enter your age
    LEA DX, msg1   
    mov ah,09h
    int 21h
    
    ;loading values to the buffer using 0ah function call
    mov ah, 0ah
    mov dx, offset BUFFER
    int 21h
    
    ;to start new line and go back to the first indent using msg 4 0AH,0DH
    LEA DX, msg4   
    mov ah,09h
    int 21h

    ;Printing message "Enter Place of Birth"
    LEA DX, msg2   
    mov ah,09h
    int 21h

    ;Loading value of place of birth to offset Buffer_2
    mov ah, 0ah
    mov dx, offset BUFFER_2
    int 21h
    
    ;printingg new line and going back to first indent
    LEA DX, msg4   
    mov ah,09h
    int 21h
    

    ; instead of using buffer address and print all the values of the buffer
    ; i took each element of the buffer and printed it manually thus creating more lines of code
    
    ;Start of Age
    mov bl,BUFFER[2]
    mov dl,bl
    mov ah, 02h
    int 21h
    mov bl,BUFFER[3]
    mov dl,bl
    mov ah, 02h
    int 21h
    ;End of Age
    
    LEA DX, msg5  ; adding a hyphen in-between 
    mov ah,09h
    int 21h
    
    ; Start of Place Buffer
    mov bl,BUFFER_2[2]
    mov dl,bl
    mov ah, 02h
    int 21h
    mov bl,BUFFER_2[3]
    mov dl,bl
    mov ah, 02h
    int 21h
    mov bl,BUFFER_2[4]
    mov dl,bl
    mov ah, 02h
    int 21h
    mov bl,BUFFER_2[5]
    mov dl,bl
    mov ah, 02h
    int 21h
    mov bl,BUFFER_2[6]
    mov dl,bl
    mov ah, 02h
    int 21h
    mov bl,BUFFER_2[7]
    mov dl,bl
    mov ah, 02h
    int 21h
    mov bl,BUFFER_2[8]
    mov dl,bl
    mov ah, 02h
    int 21h
    ; ending of  Place Buffer
    
    LEA DX, msg4   ; new line
    mov ah,09h
    int 21h

    LEA DX, msg6   ;" Number of Alphabets" message display
    mov ah,09h
    int 21h
    


    mov bl,BUFFER_2[1] ; Buffer [1 ] contains the array/buffer current elements
    add bl, '0' ; adding ascii of Zero to the decimal value to print represent the ascii value of the number of elements
    mov dl,bl
    mov ah, 02h
    int 21h

END
