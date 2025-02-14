include 'emu8086.inc'
.model small
.stack 100h 
.data
     Hour db 10,13,'Gio: $'
     Minute db 10,13,'Phut: $'  
     Second db 10,13,'Giay: $'
.code
    mov ax, @data
    mov ds, ax
    
    mov ah,2ch
    int 21h
    
    xor bx,bx
    mov bl,dh
    push bx
    xor bx,bx
    mov bl,cl
    push bx
    xor bx,bx
    mov bl,ch
    push bx
    
    ;Xuat Gio
    mov ah,9
    lea dx,Hour
    int 21h 
    pop ax
    call PRINT_NUM
    ;Xuat Phut
    mov ah,9
    lea dx,Minute
    int 21h 
    pop ax
    call PRINT_NUM
    ;Xuat Giay
    mov ah,9
    lea dx,Minute
    int 21h 
    pop ax
    call PRINT_NUM
   
    mov ah, 4ch
    int 21h
  DEFINE_PRINT_NUM
  DEFINE_PRINT_NUM_UNS   
end