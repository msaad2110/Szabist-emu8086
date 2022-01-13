;Write a program to make procedures for newline and string display.
;Display your full name, registration number, email and institute name by using nested procedures
.model small
.stack 100h
.data
str1 Db "Name : M Saad$"
str2 Db "Reg ID : 2012126$"
str3 Db "Email : msaad@gmail.com$"
str4 Db "Institute : Szabist$"
.code
main proc
    mov ax,@data
    mov ds,ax
    
    
    lea dx,str1
    call print
    call newline
    lea dx,str2
    call print
    call newline
    lea dx,str3
    call print
    call newline
    lea dx,str4
    call print
    
    
    mov ah, 4ch
    int 21h
    main endp
newline proc
   mov dl,10
   mov ah,2
   int 21h
   
   mov dl,13
   mov ah,2
   int 21h
   
   ret
   newline endp
print proc
    mov ah,9
    int 21h
    ret
    print endp
end main