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

LEA DX, Message             ;Display message
MOV AH, 09H
INT 21H

MOV AH, 01H                 ;Digit 1 input
INT 21H

MOV BL, AL                  ;Digit 1 in BL
  
LEA DX, nextLine            ;Move to next line
MOV AH, 09H
INT 21H  

MOV AH, 01H                 ;Digit 2 input
INT 21H                      

MOV BH, AL                  ;Digit 2 in BH

SUB BH, 30H                 ;conversion from char to int
SUB BL, 30H

CALL LCM
 
JMP End_
PROC HCF
    ;Input numbers in BH and BL
    ;Output in DL
    MOV CH, 1               ;Counter = CH
    CMP BH, BL
    JL Loop_BH
    MOV CL, BL              ;CL contains the upper limit of loop
    
    JMP Cont
    Loop_BH:
    MOV CL, BH
     
    Cont:                   ;Loop to calculate HCF
        CMP CH, CL
        JG Exit
        XOR AX, AX          ;Prepare AX for Division
        MOV AL, BL          ;Divide the 1st number
        DIV CH
        CMP AH, 0
        JG No_Div           ;Skip the loop if remainder > 0
        XOR AX, AX          ;Prepare AX for 2nd Division
        MOV AL, BH
        DIV CH
        CMP AH, 0
        JG No_Div           ;Skip the loop if remainder > 0
        XOR DX, DX
        MOV DL, CH          ;Store the number in DL if both numbers are equally divided
        
        No_Div:
        ADD CH, 1
        JMP Cont
    
    Exit:
    MOV CL, DL
    
    LEA DX, nextLine        ;Move to next line
    MOV AH, 09H
    INT 21H
    
    LEA DX, disp_MSG        ;Prints message
    MOV AH, 09H
    INT 21H
    
    MOV DL, CL 
    ADD DL, 30H
    MOV AH, 02H
    INT 21H   
    
ENDP HCF

JMP End_
PROC LCM
    ;input numbers in BH and BL
    ;output in CH
    CALL HCF                ;Returns HCF in CL
    XOR AX, AX              ;CLearing registers for division
    MOV AL, BL              ;1st number moved in AL for division by HCF
    DIV CL
    MUL BH
    
    MOV AH, 0
    MOV BP, AX              ;LCM temp stored in BP
    
    LEA DX, nextLine        ;Move to next line
    MOV AH, 09H
    INT 21H
    
    LEA DX, displ_MSG       ;Prints message
    MOV AH, 09H
    INT 21H
    
    MOV CX, 4
    PRINT_:                 ;Prints the contents of AX (stores in BP)
    MOV SI, BP
    SHR SI, 12
    XOR BX, BX
    MOV BX, OFFSET hex_table
    MOV DL, [BX+SI]
    MOV AH, 02H
    INT 21H
    SHL BP, 4
    LOOP PRINT_
    
    MOV DL, 'H'
    MOV AH, 02H
    INT 21H
    
    
ENDP LCM 


ret