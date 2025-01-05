.model small
.stack 100h
.data
    TBao DB 10,13,'Hay nhap chuoi ky tu (ket thuc bang Enter): $'
    KQ DB 10,13,'Chuoi nguoc:                                $'
    KThuc DB 10,13, 'Bam phim bat ky de thoat chuong trinh $'
.code
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,TBao
    int 21h
    
    xor cx,cx
    input:
        mov ah,1
        int 21h
        
        cmp al,0Dh
        je break
        
        xor ah,ah
        push ax
        inc cx
        
        jmp input
break:
    mov ah,9
    lea dx,KQ
    int 21h
    
    mov ah,2
    output:
        pop dx
        int 21h
        loop output
    
    ;Ket thuc chuong trinh    
    mov ah,9
    lea dx,KThuc
    int 21h
    
    mov ah,7
    int 21h
    
    mov ah,4ch
    int 21h
    
end