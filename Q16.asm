; Write a program to take times
; input from user using loop instruction.
.model small
.stack 100h
.data
arr3 db 30 dup('$')
.code
main proc 
    mov ax,@data
    mov ds,ax
    mov cx,5
    mov bx, offset arr3
L1:
    mov ah,1
    int 21h
    mov [bx],al
    inc bx
    loop L1 
       
    
    mov ah,4ch
    int 21h
    
    
    main endp
end main