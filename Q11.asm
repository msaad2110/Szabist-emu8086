.model small
.stack 100h
.data

msg db ? 

 
.code

main proc
    
   mov ah,1
   int 21h
   mov dl,al
   
   mov ah,1
   int 21h
   mov bl,al
   
   mov ah,1
   int 21h
   mov cl,al
   
   add dl,bl
   sub dl,48
   mov ch,dl
   add ch,cl
   sub ch,48
   
   mov msg,ch
   
   mov dl,10
   mov ah,2
   int 21h
   
   mov dl,13 
   mov ah,2
   int 21h
   
   mov ah,2 
   mov dl,msg
   int 21h
    
   exit:
   mov ah,4ch
   int 21h
   
   
   main endp
end main
