.model small
.stack 100h
.data
    TB1 db 'Nhap so thu nhat (0-9): $'
    TB2 db 10,13, 'Nhap so thu hai (0-9): $'
    KQTong  db 10,13, 'Tong cua hai so: $'
    KQHieu db 10,13, 'Hieu cua hai so: $'
    KQTich db 10,13, 'Tich cua hai so: $'
    KQThuong db 10,13, 'Thuong cua hai so: $'
    num1 dw ?
    num2 dw ?
    result dw ?
.code
    mov ax, @data
    mov ds, ax

    ; Nhap so thu nhat
    lea dx, TB1
    mov ah, 09h
    int 21h
    call getNumber
    mov num1, ax

    ; Nhap so thu hai
    lea dx, TB2
    mov ah, 09h
    int 21h
    call getNumber
    mov num2, ax

    ; Tinh tong
    mov ax, num1
    add ax, num2
    mov result, ax
    lea dx, KQTong
    mov ah, 09h
    int 21h
    call printKQ

    ; Tinh hieu
    mov ax, num1
    sub ax, num2
    mov result, ax
    lea dx, KQHieu
    mov ah, 09h
    int 21h
    call printKQ

    ; Tinh tich
    mov ax, num1
    mul num2
    mov result, ax
    lea dx, KQTich
    mov ah, 09h
    int 21h
    call printKQ

    ; Tinh thuong
    mov ax, num1
    xor dx, dx     ; Xoa thanh ghi DX de tranh loi khi chia
    div num2
    mov result, ax
    lea dx, KQThuong
    mov ah, 09h
    int 21h
    call printKQ

    mov ah, 4Ch
    int 21h

; Ham nhap so
getNumber proc
    mov ah, 01h  
    int 21h
    sub al, '0'  ; Chuyen ki tu so th�nh gia tri so
    mov ah, 0
    ret
getNumber endp

; Ham in ket qua
printKQ proc
    mov ax, result
    call printNum
    ret
printKQ endp

; H�m in so
printNum proc
    mov cx, 0     ; Dat lai bo dem
    mov bx, 10    ; Co so 10 de chuyen doi so
convertLoop:
    xor dx, dx    ; Xoa DX
    div bx        ; Chia AX cho 10
    push dx       ; Luu phan du (chu so)
    inc cx        ; Tang bo dem
    test ax, ax   ; Kiem tra neu AX = 0
    jnz convertLoop

printLoop:
    pop dx        
    add dl, '0'   ; Chuyen thanh ky tu
    mov ah, 02h   ; In ki tu ra man hinh
    int 21h
    loop printLoop
    ret
printNum endp

end
