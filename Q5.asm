.model small
.stack 100h 
.data 
.code  

main proc 

mov ah, 7
int 21h  

mov dl,042
mov ah, 2
int 21h    

mov ah, 7
int 21h  

mov dl,042
mov ah, 2
int 21h  

mov ah, 7
int 21h  

mov dl,042
mov ah, 2
int 21h  

mov ah, 7
int 21h  

mov dl,042
mov ah, 2
int 21h  

mov ah, 4ch
int 21h   

main endp   
end main