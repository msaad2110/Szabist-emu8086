; Write a Program to print character '*' 20 times on screen vertically. Using loop instruction to achieve the solution.
; After printing, a prompt will appear "Program has ended".

.model small
.stack 100h
.data 
msg Db "Program has ended$"
.code
main proc
    mov ax, @data
    mov DS, ax
    
    mov cx,20
LABEL:
    mov dl,'*'    
    mov ah,2
    int 21h
    
    mov dl,10
    mov ah,2
    int 21h
    
    mov dl, 13
    mov ah,2
    int 21h
     
    loop LABEL
    
    
    
    
    mov dx, offset msg
    mov ah, 9
    int 21h 
    
    mov ah,4ch
    int 21h
    main endp
end main