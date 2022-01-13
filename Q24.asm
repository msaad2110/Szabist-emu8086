;Write a program to print" #***#***#***#***#*** "Using nested loop.
.model small
.stack 100h
.code
main proc
    mov cx,5 
    
    mov dl,35
outer:    mov bx,cx
          mov ah,2
          int 21h
         
    
    mov cx,3
    mov dl,42   
  inner:    mov ah,2
            int 21h
           loop inner
           mov cx,bx
          

          
          mov dl,35
          loop outer
    
    main endp
end main