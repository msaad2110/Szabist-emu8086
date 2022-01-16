.model small
.stack 100h 
.data 
.code  

main proc 
                                               
mov ah, 1
int 21h
          
mov bl,al                   
           
mov dl,10 ;next line
mov ah,2
int 21h  
mov dl,13
mov ah,2
int 21h   
           
mov ah,1
int 21h

sub al, 48

add bl,al          
          
mov ah, 2
mov dl,bl
int 21h

mov ah, 4ch
int 21h

main endp   
end main