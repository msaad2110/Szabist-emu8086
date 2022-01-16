.model small
.stack 100h 
.data 
.code  

main proc 
              
mov dl,070 
mov ah, 2
int 21h    

mov dl,073 
mov ah, 2
int 21h  

mov dl,090 
mov ah, 2
int 21h  

mov dl,090 
mov ah, 2
int 21h  

mov dl,065 
mov ah, 2
int 21h   

mov dl,065 
mov ah, 2
int 21h

mov dl,076 
mov ah, 2
int 21h  

mov dl,073 
mov ah, 2
int 21h

mov ah, 4ch
int 21h   

main endp   
end main