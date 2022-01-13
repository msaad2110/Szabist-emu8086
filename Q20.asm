; Write a program to print upper case letter 'A' to 'Z' using loop.

.model small
.stack 100h
.code
main proc
    mov cx,26
    mov dl,65
LABEL:    mov ah,2
          mov bh,dl
          int 21h
          
          mov dl,10
          mov ah,2
          int 21h
          
          mov dl, 13
          mov ah,2
          int 21h
          
          mov dl,bh
          inc dl; 
          loop LABEL
    mov ah,4ch
    int 21h
    main endp
end main