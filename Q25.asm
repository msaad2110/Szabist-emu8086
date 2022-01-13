;Write a program to print using nested loop.
;*
;**
;***
;****
;*****

.model small
.stack 100h
.data
steric dw 1
.code
main proc
    mov ax,@data
    mov DS,AX
    mov cx,5
outer:
    mov bx,cx
    mov cx,steric
inner:
    mov dl,42
    mov ah,2
    int 21h
    
    
    
    loop inner
    
    
    inc steric
    mov dl,10
    mov ah,2
    int 21h
    mov dl,13
    mov ah,2
    int 21h
    mov cx,bx
    loop outer
    
    mov ah,4ch
    int 21h
    
    main endp
end main