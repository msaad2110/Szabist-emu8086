;Write a program that checks whether the entered number is even or odd using div.
print macro p1
    lea dx,p1
    mov ah,9
    int 21h
endm
.model small
.stack 100h
.data
msg1 db 'Enter number : $'
evenmsg db 10,13,'Number is even $' 
oddmsg db 10,13,'Number is odd $'
  
.code
main proc
    
    mov ax,@data
    mov ds,ax
    print msg1
    
    mov ah,1
    int 21h
    
    sub al,48                                       
    mov bl,al
    
    mov cl,2
    mov ax,bx
    div cl
    
    cmp ah,1
    je odd
    cmp ah,0
    je even
even:
    print evenmsg
    jmp end
    
odd:
    print oddmsg
       
end:    
    mov ah,4ch
    int 21h
    main endp
end main