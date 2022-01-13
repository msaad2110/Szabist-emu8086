;Write a program to swap two numbers using stack
.model small
.stack 100h
.data
.code

main proc
    
    mov ah,1
    int 21h
    mov ah,0
 
    push ax     
    
    mov ah,1
    int 21h
    mov ah,0
    
    push ax    
      
    mov dl,13  
    mov ah,2
    int 21h
    
    mov dl,10
    mov ah,2
    int 21h
    
    pop dx
    mov ah,2
    int 21h
    pop dx
    mov ah,2
    int 21h
             
    mov ah,4ch
    int 21h
    
    main endp
end main