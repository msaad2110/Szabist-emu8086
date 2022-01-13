;Write a program to reverse the message 
;"Hello world" using stack (push and pop instruction).
.model small
.stack 100h
.data
msg db "Please enter your statement:$"
msg1 db 10,13,"Reverse statement:$"
con dw 0
.code
main proc
    mov ax,@data
    mov ds,ax   
    mov ah,9
    mov dx,offset msg
    int 21h 
    
start:
    mov ah,1
    int 21h
    cmp al,13
    je end1
    mov ah,0
    push ax ;ax=0141h AH=01     AL=041h
    inc con
    jmp start
end1:
    mov ah,9
    mov dx,offset msg1
    int 21h
    mov cx,con
L1:
    pop dx
    mov ah,2
    int 21h
    loop l1    
    mov ah,4ch
    int 21h
    main endp
end main