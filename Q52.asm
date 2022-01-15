;Write a program to take input from user, check and informing user what he/she entered
print macro p1
    lea dx,p1
    mov ah,9
    int 21h
endm
newline macro 
    mov dl,10
    mov ah,2
    int 21h
    mov dl,13
    mov ah,2
    int 21h
endm

.model small
.stack 100h
.data
S0 db "Please enter a character or press Enter to exit: $" 
S db "Upper Case letter$"
S1 db "Lower Case letter$"
S2 db "Number$"
S3 db "Symbol$"
.code
main proc  
    start:
    mov ax,@data
    mov DS, ax 
    print S0
    mov ah,1
    int 21h 
    cmp al,13
    je end
    cmp al,48
    jb symbol ;jb:jump below
    cmp al,57
    jbe numbers  ;jbe jump below equal to or less than equal to  
    cmp al,65
    jb symbol
    cmp al,90
    jbe upper  
    cmp al,97
    jb symbol
    cmp al,122
    jbe lower
lower: 
    newline
    print S1
    newline 
    jmp start
upper:
    newline
    print S 
     newline 
    jmp start
numbers:
    newline
    print S2 
     newline
    jmp start
symbol:
    newline
    print S3 
     newline
   jmp start
  end:  
    mov ah,4ch
    int 21h    
    main endp
end main


