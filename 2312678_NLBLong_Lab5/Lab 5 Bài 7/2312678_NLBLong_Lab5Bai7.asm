.model small
.stack 100h
.data
    TB1 db 'Ng�y: $ '
    TB2 db ' Thang: $ '
    TB3 db ' Nam: $ '
    ngay DB ?
    thang DB ?
    nam DW ?
.code
  main proc
    mov ax, @data
    mov ds, ax

    ; Lay thoi gian hien tai
    mov ah, 2Ah
    int 21h

    xor ah,ah
    mov ngay,dl
    mov thang,dh
    mov nam,cx

    ; Xuat ng�y
    mov ah, 9
    lea dx, TB1
    int 21h

    mov al,ngay
    xor ah,ah
    mov bl,10
    div bl

    add ah,30h
    add al,30h
    mov bh,ah

    mov ah,02h
    mov dl,al
    int 21h
    mov ah,02h
    mov dl,bh
    int 21h

    ; Xuat thang
    mov ah, 9
    lea dx, TB2
    int 21h
 
    mov al,thang
    xor ah,ah
    mov bl,10
    div bl

    add ah,30h
    add al,30h
    mov bh,ah

    mov ah,02h
    mov dl,al
    int 21h
    mov ah,02h
    mov dl,bh
    int 21h 

    mov ax,nam
    mov bx,10

    xor cx,cx
    mov cx,4
    
    ; Xuat nam
    mov ah, 9
    lea dx, TB3
    int 21h 
    
    mov ax,nam
    mov bx,10
   
    xor cx,cx
    mov cx,4
          
   _NAM:
    xor dx,dx
    div bx
    push dx
    loop _NAM
   
    xor cx,cx
    mov cx,4  
    
   _XUATNAM:
    pop dx
    add dl,30h
    mov ah,02h
    int 21h
   
    loop _XUATNAM  
    ; Ket thuc chuong trinh
    mov ah, 4ch
    int 21h
 main endp
end