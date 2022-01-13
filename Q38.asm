;Write an assembly code to take multiple characters as input from the user with prompt and program should tell how many vowels and consonants were there in the input. Use the enter key to display the both number of counts with a prompt. After displaying the result, ask him again for a choice that he wants to run again or terminate the program. Use "Y" to run again and Use "Esc key" to terminate the program.


.model small
.stack 100h
.data
str1 Db 10,13,"Enter String : $"
str2 Db 10,13,"Vowels : $"
str3 Db 10,13,"Consonant : $"
str4 Db 10,13,"Use Y to run again and Use Esc key to terminate the program : $"
.code
main proc
    
    mov ax,@data
    mov ds,ax

restart:    
    mov dx, offset str1
    mov ah, 9
    int 21h
    
    mov bl,0
    mov cl,0
    
input:
    mov ah,1
    int 21h
    
    cmp al,97
    je vowels
    
    cmp al,101
    je vowels
    
    cmp al,105
    je vowels
    
    cmp al,111
    je vowels
    
    cmp al,117
    je vowels
    
    cmp al,13
    je end
    
    jmp consonants

vowels:
    inc bl
    jmp input

consonants:
    inc cl
    jmp input
    
    
end:
    mov dx, offset str2
    mov ah, 9
    int 21h
    
    mov dl,bl
    add dl,48
    mov ah,2
    int 21h
    
    mov dx, offset str3
    mov ah, 9
    int 21h
    
    mov dl,cl
    add dl,48
    mov ah,2
    int 21h
    
    mov dx, offset str4
    mov ah, 9
    int 21h
    
    mov ah,1
    int 21h
    
    cmp al,89
    je restart
    
    cmp al,27
    je final
    
final:       
    
    mov ah, 4ch
    int 21h 
    
    main endp
end main