;Write a program to print upper case letter 'Z' to 'A' using loop
.model small
.stack 100h
.code
main proc
    mov cx,26
    mov dl,90
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
          dec dl; 
          loop LABEL
    mov ah,4ch
    int 21h
    main endp
end main