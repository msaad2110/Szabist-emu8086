;Write a program which takes string input from the user, converts that string into upper case using logic instruction and displays the result in a newline with appropriate prompts.  
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
str1 db "Enter your statement: $"
str2 db "Statement in Upper Case : $"
arr dw 20 dup('$')
.code 
main proc
    mov ax,@data
    mov ds,ax
    print str1
    lea bx,arr
    L1:
    mov ah,1
    int 21h
    cmp al,13
    je L2
    and al,11011111b
    mov [bx],al
    inc bx
    jmp L1
    L2:
    newline 
    print str2
    print arr 
    mov ah,4ch
    int 21h
    main endp
end main



