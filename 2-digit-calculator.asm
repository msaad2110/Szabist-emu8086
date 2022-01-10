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

digit1 db 10,13,"Enter 1st Digit : $"
digit2 db 10,13,"Enter 2nd Digit : $"
res db 10,13,"Answer : $"
operand db 10,13,"Select operation ( + - * / ) : $"
invalid db 10,13,"Invalid Operator.. try again! $"   
msg1 db "Press Y to Continue OR Press any button to exit $"
msg2 db 10,13,"Select your choice: $"   
msg3 db 10,13,"Thank You $"

.code
main proc 
    
    mov ax,@data
    mov ds,ax
CHOOSE:     
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
        jmp while
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
    
    
     while: 
      mov dl,10
      int 21h
      mov dl,13
      int 21h
                
      print msg1         
      
      print msg2
      
      mov ah,1
      int 21h
      
      cmp al,089
      je CHOOSE
      
      

      cmp al,121
      je CHOOSE
     
      
      
      cmp al,27
      je exit_prog 
      
      
      exit_prog:
     print msg3
       
   
    
    
    
    mov ah,4ch
    int 21h
    main endp
end main