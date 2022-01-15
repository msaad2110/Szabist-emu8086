;Write a password program which take input from user and display '*' on screen. Then compare the input character with the store character and display "Correct Password" if password correctly enter else print "Incorrect password" on screen
newline macro
    mov dl,10
    mov ah,2
    int 21h
    mov dl,13
    mov ah,2
    int 21h
endm
print macro p1
    mov dl,offset p1
    mov ah,9
    int 21h
endm

.model small
.stack 100h
.data
s db "Enter your password: $"
s1 db "Correct Password$"
s2 db "Incorrect Password$"
pass db "12345$"
pass1 db 30 dup("$")
.code
main proc
    mov ax,@data
    mov ds,ax
  pass_input:
  mov si,0
  print s
  L1:
    mov ah,7
    int 21h
    cmp al,13
    je check_pass
    mov pass1[si],al
    mov dl,42
    mov ah,2
    int 21h
    inc si
    jmp L1
  check_pass: 
    mov cx,5 
    mov si,0
    check:
    mov bh,pass[si]
    mov bl,pass1[si]
    cmp bh,bl 
    jne Wrong
    inc si
    jmp check1 
    
  check1:
  cmp cx,si
  je Correct
  checker:
  loop check
    
  Correct:
  newline 
  print s1
  jmp Exit
  
  Wrong:  
  newline
  print s2 
  jmp Exit
  
 Exit:
 mov ah,4ch
 int 21h
 main endp
end main


