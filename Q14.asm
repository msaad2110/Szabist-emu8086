;Write a program to display “HELLO WORLD” using string variable.
.model small
.stack 100h
.data
str db "HELLO WORLD$"
.code
main proc
    
    mov ax,@data
    mov ds,ax
    mov ah,9
    lea dx,str
    int 21h
    
    mov ah,4ch
    int 21h
    
    main endp
end main