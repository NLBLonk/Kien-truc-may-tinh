.model small
.stack 100h
.data  
    TB db 10,13, 'Nhap mot ky tu: $'
    KQ db 10,13, 'Nam ky tu ke tiep: $'
    
.code
    mov ax, @data
    mov ds,ax
    
    mov ah,9
    lea dx,TB
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al
    
    mov ah,9
    lea dx,KQ
    int 21h     

;Hien thi 5 ki tu ke tiep 
mov cx, 5 ; Thiet lap vong lap cho 5 ky tu

NEXT_CHAR:

    inc bl ; Tang gia tri cua ky tu
    mov al, bl
    mov ah, 02h
    mov dl, al
    int 21h ; Hien thi ky tu trong AL

; Hien thi dau xuong dong v� dau cach
    mov dl, 0Dh 
    int 21h
    mov DL, 0Ah 
    int 21h

loop NEXT_CHAR ;Lap lai vong 5 lan
exit:
    mov ah,4ch
    int 21h
end


