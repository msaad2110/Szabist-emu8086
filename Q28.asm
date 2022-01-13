;Write a program to print an array using loop

.model small
.stack 100h
.data
arr1 db 'D',48,52,98,100,55
;indexes 0  1  2  3  4   5
.code
main proc
    mov ax,@data
    mov ds,ax
    mov cx,6
    mov bx,offset arr1
Label:
    mov dl, [bx]
    mov ah,2
    int 21h 
    inc bx
    loop label
    
    
    
    mov ah,4ch
    int 21h
    
    
    main endp
end main