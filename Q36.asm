;Write a program that take characters as string  
;input from user in upper case  and convert that
; string into lower case and display the result when user press 'ENTER' key it must show the result.
.model small
.stack 100h
.data
str1 db "Please enter your statement in upper case : $"
arr1 db 50 dup('$')
str2 db 10,13,"Statement in lower case : $"
.code
main proc
    mov ax,@data
    mov ds,ax
    
    
    ;mov dx,offset str1
    lea dx,str1
    mov ah,9
    int 21h
    
    lea bx,arr1
L1:
    mov ah,1
    int 21h
    cmp al,13
    je L2
    cmp al,32
    je R1    
    add al,32
R1:
          
    mov [bx],al
    inc bx
    jmp L1
L2:

    
    
    lea dx,str2
    mov ah,9
    int 21h
    
    lea dx,arr1
    mov ah,9
    int 21h
    
    
    mov ah,4ch
    int 21h    
    main endp
end main