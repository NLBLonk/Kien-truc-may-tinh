.model small
.stack 100h
.data
    length dw ?      
    width dw ?       
    area dw ?   
    perimeter dw ?   
    TB1 db 'Nhap chieu dai: $'
    TB2 db 10,13,'Nhap chieu rong: $'
    KQ1 db 10,13,'Dien tich cua hinh chu nhat: $'
    KQ2 db 10,13,'Chu vi cua hinh chu nhat: $'
.code
    mov ax, @data     
    mov ds, ax        
    
    ; Nhap chieu dai
    mov ah, 9         
    lea dx, TB1      
    int 21h           
    call input_number 
    mov length, ax    

    ; Nhap chieu rong
    mov ah, 9        
    lea dx, TB2      
    int 21h           
    call input_number 
    mov width, ax     

    ; Tinh dien tich (area = length * width)
    mov ax, length    ; Nap chieu dài vào AX
    mov bx, width     ; Nap chieu rong vào BX
    mul bx            ; Tinh dien tich (AX = AX * BX)
    mov area, ax      ; Luu ket qua vào bien area

    ; Tinh chu vi (perimeter = 2 * (length + width))
    mov ax, length    ; Nap chieu dài vào AX
    add ax, width     ; AX = length + width
    shl ax, 1         ; Nhan doi (chu vi = 2 * (length + width))
    mov perimeter, ax ; Luu ket qua vào bien perimeter

    ; Hien thi ket qua dien tich
    mov ah, 9         
    lea dx, KQ1  
    int 21h          
    mov ax, area      
    call print_number 

    ; Hien thi ket qua chu vi
    mov ah, 9         
    lea dx, KQ2  
    int 21h          
    mov ax, perimeter 
    call print_number 

    mov ah, 4ch       
    int 21h
    
; Hàm nhap so
input_number proc
    xor ax, ax        ; Xoa AX
    mov ah, 1         
    int 21h           
    sub al, 30h       ; Chuyen doi tu ma ASCII sang so
    mov ah, 0         ; Xoa phan cao cua AX
    ret
input_number endp

; Ham in so ra man hinh
print_number proc
    mov bx, 10        ; Chia cho 10 de lay tung chu so
    xor cx, cx        ; Xoa CX (luu cac chu so)

print_loop:
    xor dx, dx        ; Xoa DX
    div bx            ; Chia AX cho 10
    push dx           ; Luu phan du (chu so) vào stack
    inc cx            ; Tang bo dem chu so
    test ax, ax       ; Kiem tra neu AX = 0 thi dung
    jnz print_loop    ; Neu AX khac 0, tiep tuc chia

print_digits:
    pop dx            ; Lay chu so tu stack
    add dl, 30h       ; Chuyen tu so sang ky tu ASCII
    mov ah, 2         
    int 21h           
    loop print_digits 
    ret
print_number endp

end 
