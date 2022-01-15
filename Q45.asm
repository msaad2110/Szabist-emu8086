;Write a program which takes string input from the user and converts that string into lower case, upper case 
;and toggle case using logic instructions only then display the results with proper prompt.
print macro p1
    lea dx, p1
    mov ah,9
    int 21h 
endm 

newline macro
    
    mov ah,2
    mov dl,10
    int 21h
    mov ah,2
    mov dl,13
    int 21h 
endm
    
.model small
.stack 100h
.data
msg db 'Please enter your statement : $'
Upper db 'Your statement in Upper case : $'
lower db 'Your statement in lower case : $'
Toggle db 'Your statement in toggle case : $'
counter dw 0 
arr1 db 50 dup ('$')
.code
main proc 
    
    mov ax, @data
    mov ds, ax
    print msg
    lea bx, arr1  ; == mov bx, offset 

L1:  
    mov ah,1
    int 21h
    cmp al, 13
    je L2
   ; xor al, 00100000b  ;61
    
    mov [bx], al
    inc bx  
    inc counter
    jmp L1
L2:   
    newline
    print Upper 
    lea bx, arr1
    mov cx, counter
      
   
L3:
 
    mov dh, [bx]
    and dh, 01011111b
    mov dl, dh
    mov ah,2
    int 21h 
    inc bx
    loop L3 
    
    
    newline
    print lower 
    lea bx, arr1
    mov cx, counter
      
      
L4: 
 
    mov dh,[bx]
    or dh, 00100000b
    mov dl, dh
    mov ah,2
    int 21h 
    inc bx
    loop L4 
    
      
    newline
    print toggle 
    lea bx, arr1
    mov cx, counter
      
   
L5: 
    mov dh,[bx]
    xor dh, 00100000b
    mov dl, dh
    mov ah,2
    int 21h 
    inc bx
    loop L5
    
      
    newline 
    lea bx, arr1
    mov cx, counter
      
    
   main endp
end main