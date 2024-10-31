org 100h

.DATA  
    num1 DB 3,2 DUP(?)
    num2 DB 3,2 dup(?)
    msg1 DB , "Enter First Double digit number: ",0AH,0DH, "$"
    msg2 DB , "Second Double digit number: ",0AH,0DH, "$"
    newline DB 0AH,0DH , "$"
    msg3 DB , "Press 1 ADD 2 SUB 3 for MUL and 4 for DIV" ,0AH,0DH, "$" 
    inval DW , "Invalid operation", 0AH, 0DH, "$"
    
    num4 DB 0
    num5 DB 0  
    result DB 0 
    opcode DB 2,1 DUP(?)

.CODE
    ;STARTUP SEQUENCE
    MOV AX, @DATA
    MOV DX, AX
    
    ; DISPLAY MESSAGE
    MOV AH, 09H
    LEA DX, msg1
    INT 21H
    
    ; GETTING VALUE FROM USER
    
    
    MOV AH, 0AH
    LEA DX, num1
   
    INT 21H
 
    ;newline  
    MOV AH, 09H
    LEA DX, newline
    INT 21H
    
    ; DISPLAY MESSAGE
    MOV AH, 09H
    LEA DX, msg2
    INT 21H
      
    ; SECOND DOUBLE DIGIT NUMBER
    MOV AH, 0AH  
    LEA DX, num2
    INT 21H
    
     ;newline  
    MOV AH, 09H
    LEA DX, newline
    INT 21H                     
    
    ;VALUE ALLOCATION SEGMENT
    
convert_from_ascii: 
    MOV BL, 10
    MOV AL, num1+2
    sub al, '0'
    MUL BL
    MOV BL, num1+3
    sub bl, '0'
    add AL,BL 
    mov num4, AL
    
    
    ; converting second number
    
    MOV BL, 10
    MOV AL, num2+2
    sub al, '0'
    MUL BL
    MOV BL, num2+3
    sub bl, '0'
    add AL,BL
    mov num5, AL
    
    
    ; DISPLAY MESSAGE
    MOV AH, 09H
    LEA DX, msg3
    INT 21H
    
    ;newline  
    MOV AH, 09H
    LEA DX, newline
    INT 21H
    
    ; getting opcode
    MOV AH, 0AH
    LEA DX, opcode
    INT 21H
    
    ;newline  
    MOV AH, 09H
    LEA DX, newline
    INT 21H
    
    mov al,opcode+2
    sub al, '0'
    
    ;checking conditions
    cmp al,1
    jz adder
    cmp al,2
    jz suber
    cmp al,3
    jz muler
    cmp al,4
    jz diver
    
    jmp invalid

adder:
    mov AL, num4
    mov bl, num5
    ADD AL,BL                
    
    ; storing result in memory
    MOV result, AL
    
    mov DL, result ; result stored          
           
           
    jmp end
    
suber:  

    mov AL, num4
    mov bl, num5
    SUB AL,BL               
    ; storing result in memory
    MOV result, AL
    mov DL, result ; result stored
    
    
    jmp end
    
muler: 
    mov AL, num4
    mov bl, num5
    
    MUL BL
    
    mov result, AL
    mov DL, result ; result stored
    

    jmp end
    
    
diver:    
    mov AL, num4
    mov bl, num5
    
    DIV BL
    
    mov result, AL
    mov DL, result  ; result stored
    
    
    
    jmp end
    
    
invalid:  

   ;newline  
   MOV AH, 09H
   LEA DX, newline
   INT 21H  
   
   
   mov ah, 09h
   LEA DX, inval
   int 21h
        

end:
     
  
ret  