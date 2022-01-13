;Write a program to take input and output using procedures.
.model small
.stack 100h
.code
main proc
    call input
    call output
    mov ah,4ch
    int 21h
    main endp
input proc
    mov ah,1
    int 21h
    ret
    input endp
output proc
    mov dl,al
    mov ah,2
    int 21h
    ret
    output endp
end main