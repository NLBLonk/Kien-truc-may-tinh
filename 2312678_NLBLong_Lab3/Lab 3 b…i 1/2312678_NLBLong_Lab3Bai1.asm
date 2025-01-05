.model small
.stack 100h
.data
    tb1 db 10,13, 'Bay gio la sang,chieu hay toi? $'
    kq1 db 10,13, 'Chao buoi sang!$'
    kq2 db 10,13, 'Chao buoi chieu!$'
    kq3 db 10,13, 'Chao buoi toi!$'
.code
    mov ax, @DATA
    mov ds, ax
input:
    mov ah,9
    lea dx,tb1
    int 21h
    
    mov ah,1
    int 21h
    
    cmp al,'S'
    je sang
    cmp al,'s'
    je sang
    
    cmp al,'C'
    je chieu
    cmp al,'c'
    je chieu
    
    cmp al,'T'
    je toi
    cmp al,'t'
    je toi
    
    jmp input
    

sang:
    mov ah,9
    lea dx,kq1
    int 21h
    jmp exit

chieu:
    mov ah,9
    lea dx,kq2
    int 21h
    
toi:
    mov ah,9
    lea dx,kq3
    int 21h

exit:
    mov ah,4ch
    int 21h
end




