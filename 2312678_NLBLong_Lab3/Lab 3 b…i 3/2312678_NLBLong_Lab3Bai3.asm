.model small
.stack 100h
.data
    TB db 10,13, 'TAT CA CHU HOA: $'
.code
    mov ax,@data
    mov ds,ax
input:
     mov ah,9
     lea dx,TB
     int 21h
     
     mov cx,26
     mov dl,'A'
     
print:
     mov ah,2
     int 21h
     inc dl
     loop print
        
     mov ah,4ch
     int 21h
end   


