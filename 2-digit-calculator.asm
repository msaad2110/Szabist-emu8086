print macro p2
    mov ah,9
    lea dx,p2
    int 21h
endm
    
char macro p1
    mov dl,p1
    mov ah,2
    int 21h
endm

seprate macro
    aam
    mov bl,ah
    mov cl,al
    add bl,48
    add cl,48
endm



.model small
.stack 100h
.data

digit1 db "Enter 1st Digit : $"
digit2 db 10,13,"Enter 2nd Digit : $"
res db 10,13,"Answer : $"
operand db 10,13,"Select operation ( + - * / ) : $"
invalid db 10,13,"Invalid Operator.. try again! $"
.code
main proc 
    
    mov ax,@data
    mov ds,ax
    
    print digit1
    
   
    ; For first number input (storing this in bl)
    mov ah,1
    int 21h 
    sub al,48
    mov bl,10
    mul bl
    mov bl,al
    mov ah,1
    int 21h
    sub al,48 
    add bl,al 
    ; END here
    
    
    print digit2
    
    
    
    ; For second number input (storing this in cl)
    mov ah,1
    int 21h 
    sub al,48
    mov cl,10
    mul cl
    mov cl,al
    mov ah,1
    int 21h
    sub al,48
    add cl,al 
    ; END here
    
    
CHOOSE:    
    print operand
    mov ah,1
    int 21h 
    
    cmp al,43
    je ADDITION
    
    cmp al,45
    je SUBTRACTION 
    
    cmp al,42
    je MULTIPLICATION 
    
    cmp al,47
    je DIVISION
    
    print invalid
    jmp CHOOSE
    
    
    ; Performing Addition 
ADDITION:
        add bl,cl
        mov al,bl
        jmp RESULT
    ; End Here
    
    
    ; Performing Subtraction 
SUBTRACTION:
        sub bl,cl
        mov al,bl
        jmp RESULT
    ; End Here
    
    ; Performing Multiplication 
MULTIPLICATION:
        mov al,bl
        mul cl 
        jmp RESULT
    ; End Here
    
        ; Performing Divison 
DIVISION:
        mov ax,bx
        div cl
        jmp RESULT
    ; End Here
    


    ;;Printing Values after calculating result    
RESULT:   
    seprate 
    print res 
    char bl
    char cl
       
   
    
    
    
    mov ah,4ch
    int 21h
    main endp
end main