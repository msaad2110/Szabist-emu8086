;Write a program that take input as string and counts total number of characters entered without spaces (spacebar) and display the result when user press 'ENTER' key it must show the result not including the 'ENTER' key.
.model small
.stack 100h
.data

str  db "Enter string: $"

.code
main proc
    
      mov ax,@data
      mov ds,ax     
      mov bx,offset str
      mov ah,9
      int 21h
      mov bl,0
      
L1:
      mov ah,1 
      int 21h ;input=AL
      cmp al,13
      je end1 
      cmp al,32
      je L1
      inc bl      
      jmp L1
end1:      
      mov dl,13 
      mov ah,2
      int 21h
      mov dl,10
      mov ah,2
      int 21h
      
      mov dl,bl
      add dl,48
      mov ah,2
      int 21h  
      mov ah, 4ch
      int 21h
       
main endp
end main