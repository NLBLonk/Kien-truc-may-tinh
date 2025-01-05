.model small
.stack 100h 
.data
     Tbao db 10,13,'Nhap so nhi phan (toi da 16 bit): $'
     KQ db 10,13,'So nhi phan da nhap: $'
.code
    mov ax, @data
    mov ds, ax

    mov bx, 0
    mov ah, 9
    lea dx, TBao
    int 21h
    input:
        mov ah, 1
        int 21h

        cmp al, 13
        je end_input
        cmp al, '0'
        jl input
        cmp al, '1'
        jg input
        sub al, '0'
        shl bx, 1
        or bl, al
        jmp input

    end_input:
    mov ah, 9
    lea dx, KQ
    int 21h

    mov cx, 16
    output:
        rol bx, 1
        jnc output_0
        jc output_1
        output_0:
          mov ah, 2
          mov dl, '0'
          int 21h
          jmp output_next
        output_1:
          mov ah, 2
          mov dl, '1'
          int 21h
        output_next:
          loop output
 
    mov ah, 4ch
    int 21h
end