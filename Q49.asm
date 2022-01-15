;Write a program which ask user to enter a digit (from 1 to 9 only) and then print the table of that number.
   
print macro p2
    mov ah,9
    lea dx,p2
    int 21h
endm
    
char macro p1
    mov dl,p1
    mov ah,2
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
num db ? 
msg1 db 'please enter a number to generate table : $'
msg2 db 'Press ENTER to run again or Press ECS to terminate the program:$'
count db 1
.code
main proc
    mov ax,@data
    mov ds,ax
    jmp start
start1:
    mov count,1
start:
    
    newline
    print msg1
    mov ah,7
    int 21h ; AL
    cmp al,'1'
    je L3
        cmp al,'2'
    je L3
        cmp al,'3'
    je L3
        cmp al,'4'
    je L3
        cmp al,'5'
    je L3
        cmp al,'6'
    je L3
        cmp al,'7'
    je L3
        cmp al,'8'
    je L3
        cmp al,'9'
    je L3 
    jmp start
L3:    
    sub al,48 
    mov num,al
    mov cx,10
    
L1: 
    newline 
    mov dh,num
    add dh,48
    char dh
    char '*'
    mov ah,0
    mov al,count
    aam
    mov bl,al
    add bl,48
    add ah,48
    char ah
    char bl
    char '=' 
    mov al,num
    mov bl,count
    mul bl ; AX= AL*BL
    aam    ; Ah=higher digit    AL=lower digit
    mov bh,al
    add bh,48
    add ah,48
    char ah
    char bh 
    inc count 
    loop L1
L4:    
    newline
    print msg2
    mov ah,1
    int 21h
    cmp al,13
    je start1
    cmp al,27
    je end1
    jmp L4
end1:
    mov ah,4ch
    int 21h 
    
    main endp
end main