;Write a program to demonstrate the concept of an array.
;Use index operators to access the different values stored in an array.
.model small
.stack 100h
.data
arr1 db 65, 'D', 48, 97, 100, 't', 55
;index  0    1   2   3    4    5   6
.code
main proc
    
    mov ax,@data
    mov ds,ax
    mov bx,offset arr1
    add bx,5
    mov dx,[bx]
    mov ah,2
    int 21h
    
    main endp
end main