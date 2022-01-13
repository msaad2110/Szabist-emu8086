;Write a program to take
;string input from user and store in an array.

.model small
.stack 100h
.data
arr2 db 20 dup ('A')
arr3 db 30 dup('$')

;indexes 0  1  2  3  4   5
.code
main proc 
    mov ax,@data
    mov ds,ax
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
    mov dx,offset arr3
    mov ah,9
    int 21h
       
    
    mov ah,4ch
    int 21h
    
    
    main endp
end main