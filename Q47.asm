;Write a program to take two number as input from user then multiply them and display the result after multiplication.

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
    mul bl
    aam
       
    mov bl,al
    add bl,48   
    add ah,48
    mov ch,ah
    
    print res
    mov dl,ch
    mov ah,2
    int 21h
             
          
    mov dl,bl
    mov ah,2
    int 21h        
    
    mov ah,4ch
    int 21h
    main endp
end main