;Write a program that prompts user "Start typing". 
;Program should implement while loop by taking input character by character as a line from user. 
;Whenever user press Enter key, program will display "You just pressed Enter to terminate the program" and then program should end

.model small
.stack 100h
.data
str db "Start typing: $"
opt db "You just pressed Enter to terminate the program$"
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
    mov ah,1
    int 21h
    cmp al,13
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
    mov dx, offset opt
    mov ah,9
    int 21h
       
    
    mov ah,4ch
    int 21h
    
    
    main endp
end main