.model small
.stack 100h
.data  
    TB db 10,13, 'Nhap vao 1 ky tu (hoac ESC): $'
    TBKhac db 10,13, 'Ky tu nhap khac chu/so$'
    TBChu db 10,13, 'Ky tu nhap la chu !$'
    TBSo db 10,13, 'Ky tu nhap la so !$'   
    KetThuc db 10,13, 'Nhan phim bat ki de thoat $'
.code
    mov ax, @data
    mov ds,ax
input:    
    mov ah,9
    lea dx,TB
    int 21h
    
    mov ah,1
    int 21h
    
    cmp al,1Bh    ;Phim ESC de thoat chuong trinh
    je exit
    
    cmp al,'0'
    jb khac
    cmp al,'9'
    jbe so
    cmp al,'A'
    jb khac
    cmp al,'Z'
    jbe chu
    cmp al,'a'
    jb khac
    cmp al,'z'
    jb chu     
    
khac:
    mov ah,9
    lea dx,TBKhac
    int 21h
    jmp input
chu:
    mov ah,9
    lea dx,TBChu
    int 21h
    jmp input
so:
    mov ah,9
    lea dx,TBSo
    int 21h
    jmp input
exit:
    mov ah,9
    lea dx,KetThuc
    int 21h
    
    mov ah,7
    int 21h
    
    mov ah,4ch
    int 21h
end
