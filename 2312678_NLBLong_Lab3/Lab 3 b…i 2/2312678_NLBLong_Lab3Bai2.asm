.model small
.stack 100h
.data  
    TB db 10,13, 'Nhap vao 1 ky tu: $'
    TBKhac db 10,13, 'Ky tu nhap khac chu/so$'
    TBChu db 10,13, 'Ky tu nhap la chu !$'
    TBSo db 10,13, 'Ky tu nhap la so !$'
.code
    mov ax, @data
    mov ds,ax
    
    mov ah,9
    lea dx,TB
    int 21h
    
    mov ah,1
    int 21h
    
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
    
    jmp khac

khac:
    mov ah,9
    lea dx,TBKhac
    int 21h
    jmp exit
chu:
    mov ah,9
    lea dx,TBChu
    int 21h
    jmp exit
so:
    mov ah,9
    lea dx,TBSo
    int 21h
exit:
    mov ah,4ch
    int 21h
end
