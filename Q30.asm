
;Write a program which takes characters as a string input from user, print asterisk (*) 
;instead of character on a screen and stores characters in array variable as a string. 
;Before taking the input, a prompt will appear on a screen for asking the password
.model small
.stack 100h
.data
str db "Enter your password : $"
arr3 db 30 dup('$')

.code
main proc 
    mov ax,@data
    mov ds,ax
    mov dx, offset str
    mov ah,9
    int 21h
     
    mov bx, offset arr3
L1:
    
    mov ah,7
    int 21h
    cmp al,13
    mov dl, '*'
    mov ah,2
    int 21h
    je end1
    mov [bx],al
    inc bx
    jmp L1 
end1: 

    mov dl,13
    mov ah,2
    int 21h
    mov dl,10
    mov ah,2
    int 21h 
    
       
    
    mov ah,4ch
    int 21h
    
    
    main endp
end main