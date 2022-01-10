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

newline macro
    mov dl,10
    mov ah,2
    int 21h
    mov dl,13
    mov ah,2
    int 21h
endm



.model small
.stack 100h
.data


heading1 db 09,09,"COAL LAB Project - Simple Calculator ( 2 Digit Input ) $"
input1 db 10,13,"Enter 1st Digit : $"
input2 db 10,13,"Enter 2nd Digit : $"
res db 10,13,"Answer : $"
operand db 10,13,"Select operation ( + - * / ) : $"
invalidmsg db 10,13,"Invalid Operator.. try again! $"   
selectionmsg1 db 10,13,"Press y/Y to Continue OR Press ESC button to exit $"
selectionmsg2 db 10,13,"Select your choice: $"   
endmsg db 10,13,09,09,09,"Thank You $"

.code
main proc 
    
    mov ax,@data
    mov ds,ax 
    
    newline
    print heading1
    newline
    newline
    
RESTART:
    
    print input1
   
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
    
    
    print input2
    
    
    
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
    
    print invalidmsg
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
    
    
    ;;End or restart program 
    newline
    newline
    newline   
    print selectionmsg1         
    print selectionmsg2
    
    mov ah,1
    int 21h
    
    cmp al,089
    je RESTART
    
    
    
    cmp al,121
    je RESTART
    
    
    cmp al,27
    je EXIT 
      
      
EXIT:
    newline
    newline
    print endmsg
       
   
    
    
    
    mov ah,4ch
    int 21h
    main endp
end main