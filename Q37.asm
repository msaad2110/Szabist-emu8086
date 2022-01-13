;Write an assembly program for addition and subtraction. First ask the user for a choice in prompt "press (+) for addition, press (-) for subtraction or (Esc key) to terminate the program". If user press (+) then ask the user to enter first number and second number 
;respectively which he wants to add them. Then after performing addition, displays the result in an appropriate way (like 4+2=6) (same guide lines for subtraction). After displaying the result, ask him again for a choice that he wants to perform addition, subtraction or terminate the program
.model small
.stack 100h
.data
str1 db 10,13,"press (+) for addition, press (-) for subtraction or (Esc key) to terminate the program : $"
str2 db 10,13,"enter first number  : $"
str3 db 10,13,"enter second number  : $"
str4 db 10,13,"Press y to restart or ESC to exit  : $"
.code
main proc
    mov ax,@data
    mov ds,ax
    
restart:   
    lea dx,str1
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    
    cmp al,43
    je addition
    
    cmp al,45
    je subtraction
    
    cmp al,27
    je end
    
addition:
    call input
    
    call newline
    
    mov dl,bl
    add dl,48
    mov ah,2
    int 21h
    
    mov dl,'+'
    mov ah,2
    int 21h
    
    
    mov dl,cl
    add dl,48
    mov ah,2
    int 21h
    
    mov dl,'='
    mov ah,2
    int 21h
    
    
    add bl,cl
    add bl,48
    
    mov dl,bl
    mov ah,2
    int 21h
    
    jmp choose

subtraction:
        
    call input
    
    call newline
    
    mov dl,bl
    add dl,48
    mov ah,2
    int 21h
    
    mov dl,'-'
    mov ah,2
    int 21h
    
    
    mov dl,cl
    add dl,48
    mov ah,2
    int 21h
    
    mov dl,'='
    mov ah,2
    int 21h
    
    
    sub bl,cl
    add bl,48
    
    mov dl,bl
    mov ah,2
    int 21h
    
    jmp choose

choose:    
    lea dx,str4
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    
    cmp al,121
    je restart
    
    cmp al,27
    je end
        
    
 
    
end:   
    mov ah,4ch
    int 21h    
    main endp
input proc
   lea dx,str2
   mov ah,9
   int 21h
   
   mov ah,1
   int 21h
   sub al,48
   mov bl,al
   
   lea dx,str3
   mov ah,9
   int 21h
   
   mov ah,1
   int 21h
   sub al,48
   mov cl,al
   
   ret
   input endp
newline proc
   mov dl,10
   mov ah,2
   int 21h
   
   mov dl,13
   mov ah,2
   int 21h
   
   ret
   newline endp
end main