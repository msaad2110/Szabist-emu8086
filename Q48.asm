;Write a program to take two number as input from user then divide them and display the result after division

print macro p1
    lea dx,p1
    mov ah,9
    int 21h
endm
.model small
.stack 100h
.data
msg1 db 'Enter 1st digit : $'
msg2 db 10,13,'Enter 2nd digit : $'
res db 10,13,'Output : $'
  
.code
main proc
    
    mov ax,@data
    mov ds,ax
    print msg1
    
    mov ah,1
    int 21h
    
    sub al,48
                                           
    mov bl,al
    
    print msg2
    
    mov ah,1
    int 21h
    sub al,48
    mov cl,al
    
    mov ax,bx
    div cl
    
    mov cl,al
    
    print res
    
       
    add cl,48
    mov dl,cl
    mov ah,2
    int 21h    
    
    mov ah,4ch
    int 21h
    main endp
end main