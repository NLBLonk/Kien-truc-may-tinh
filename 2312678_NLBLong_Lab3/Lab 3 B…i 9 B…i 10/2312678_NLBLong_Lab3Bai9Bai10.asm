.model small
.stack 100h
.data
    TBao db 10,13, 'Nhap so nhi phan (0 hoac 1) : $'
    KQ db 10,13, 'So nhi phan vua nhap la:     $'
.code
    mov ax, @data
    mov ds, ax

    ; Xoa BX
    mov bx, 0

    ; Nhap so nhi phan
    mov ah, 9
    lea dx, TBao
    int 21h

    input:
        mov ah, 1
        int 21h

        ; Kiem tra Enter
        cmp al, 13
        je end_input

        ; Chuyen doi ky tu th�nh so
        cmp al, '0'
        jl input
        cmp al, '1'
        jg input
        sub al, '0'

        ; Dich trai BX
        shl bx, 1

        ; Dua tri da doi v�o bit LSB cua BX
        or bl, al

        jmp input

    end_input:
    ; Xuat so nhi phan tu BX
    mov ah, 9
    lea dx, KQ
    int 21h

    mov cx, 16
    output:
        ; Quay trai BX de lay bit cuc trai (Vao CF)
        rol bx, 1
        ; Xuat '1' hoac '0'
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