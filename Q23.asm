;Write a program to print even numbers between (0-9) using loop
.model small
.stack 100h
.code
main proc
    mov cx,5
    mov dl,48
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
          inc dl
          inc dl 
          loop LABEL
    mov ah,4ch
    int 21h
    main endp
end main