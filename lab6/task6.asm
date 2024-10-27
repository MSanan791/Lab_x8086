org 100h
.DATA
Message DB "Enter the two numbers: ", 0DH, 0AH, "$" 
nextLine DB 0DH, 0AH, "$"
disp_Msg DB "The HCF of 2 numbers is: ", "$"
displ_Msg DB "The LCM of 2 nnumbers is: ", "$"
hex_table DB "0123456789ABCDEF","$" 

num_1 DB 3, 4 DUP(0)
num_2 DB 3, 4 DUP(0)
zero_err DB 0AH, 0DH, "Cannot divide by 0", 0Ah, 0DH, "$" 
neg_err DB 0AH, 0DH, "Cannot take negative exponents, since floating point not supported", 0AH, 0DH, "$"

.CODE

Task_6:
LEA DX, Message             ;Display message
MOV AH, 09H
INT 21H 

MOV AH, 0AH                 ;Number 1 input
MOV DX, OFFSET num_1
INT 21H 
 
LEA DX, nextLine            ;Move to next line
MOV AH, 09H
INT 21H 

MOV AH, 0AH                 ;Number 2 input
MOV DX, OFFSET num_2
INT 21H 
    
CMP num_1[2], '-'
JE neg_number
CMP num_1[1], 1
JG two_digit
MOV BH, num_1[2]
SUB BH, 30H                 ;BH = num_1

JMP sec_no
neg_number:
    MOV BH, num_1[3]
    SUB BH, 30H
    NOT BH
    ADD BH, 1               ;BH = num_1 (2's complement)
 
JMP sec_no
two_digit:
    MOV AL, num_1[2]
    SUB AL, 30H
    MOV BL, 10
    MUL BL
	MOV BL, num_1[3]
	SUB BL, 30H
	ADD AL, BL
	MOV BH, AL              ;BH = num_1 (2 digits) 
	
sec_no:	
CMP num_2[1], 1
JG two_digit2
MOV BL, num_2[2]
SUB BL, 30H                 ;BL = num_2 (1 digit)

JMP exp
two_digit2:
    CMP num_2[2], '-'
    JE neg_number2
    MOV AL, num_2[2]
    SUB AL, 30H
    MOV BL, 10
    MUL BL
    MOV BL, num_2[3]
    ADD BL, AL              ;BL = num_2 (2 digits)

JMP exp
neg_number2:
    MOV BL, num_2[3]
    SUB BL, 30H             ;BL = num_2
    
exp:
    CMP BL, 0               ;Zero exponent case
    JE zero_exp
    MOV CL, BH
    MOV CH, 0H
    MOV SI, CX              ;SI = 1st number
    MOV CL, BL
    MOV CH, 0H              ;CX = BL
    SUB CX, 1
    MOV AL, BH
    MOV AH, 0H
    calc:
        MUL SI
        LOOP calc           ;AH:AL contains the answer of exponention 
                    
    CMP num_2[2], '-'       ;negative exponent case
    JNE end_exp
    LEA DX, neg_err         ;Display message
    MOV AH, 09H
    INT 21H
    
    JMP end_exp
    zero_exp:
        MOV AX, 1           ;Ans(AX) = 1 in case of 0 exp
        
end_exp:
    ;Calculating modulo (num1 % num2)
    MOV CX, AX              ;CX contains answer of exponention 
    XOR AX, AX
    CMP BL, 0
    JE zero_mod             ;div by zero case
    MOV AL, BH
    DIV BL                  ;AH contains modulo
    CMP num_2[2], '-'
    JNE end_mod
    NOT AH
    ADD AH, 1               ;AH contains modulo (2 comp)
    
    JMP end_mod
    zero_mod:
        LEA DX, zero_err    ;Display message
        MOV AH, 09H
        INT 21H
    
    end_mod:
    
    

ret