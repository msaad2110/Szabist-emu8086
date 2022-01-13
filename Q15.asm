;Write a program to display full name, registration number,
; email address and Institute name.

.model small
.stack 100h
.data 

str1 Db "Name : M Saad$"
str2 Db "Reg ID : 2012126$"
str3 Db "Email : msaad@gmail.com$"
str4 Db "Institute : Szabist$"


.code
main proc  
    
    mov ax, @data
    mov DS, ax
    
    mov dx, offset str1
    mov ah, 9
    int 21h 
    
    mov dl,10
    mov ah,2
    int 21h
    
    mov dl, 13
    mov ah,2
    int 21h
    
     
     
    mov ax, @data
    mov DS, ax
    
    mov dx, offset str2
    mov ah, 9
    int 21h  
    
    mov dl,10
    mov ah,2
    int 21h
    
    mov dl, 13
    mov ah,2
    int 21h  
    
    
    
    mov ax, @data
    mov DS, ax
    
    mov dx, offset str3
    mov ah, 9
    int 21h  
    
    mov dl,10
    mov ah,2
    int 21h
    
    mov dl, 13
    mov ah,2
    int 21h
    
    
    mov ax, @data
    mov DS, ax
    
    mov dx, offset str4
    mov ah, 9
    int 21h  
    
    mov dl,10
    mov ah,2
    int 21h
    
    mov dl, 13
    mov ah,2
    int 21h  
    
    
    
    
    mov ah, 4ch
    int 21h
 
    main endp
end main