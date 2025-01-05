.model small
.stack 100h 
.data
     Tbao db 10,13,'Nhap so thap luc phan (toi da 4 ky so): $'
     KQ db 10,13,'So thap luc phan da nhap: $'
.code
    mov ax, @data
    mov ds, ax

    mov ah, 9
    lea dx, TBao
    int 21h 
    xor bx,bx
    mov cl,4
    input:
        mov ah, 1
        int 21h

        cmp al, 13
        je end_input
        cmp al, 39h
        jg letter
        and al,0Fh
        jmp shift
        
        letter:
          sub al,37h
        shift:
          shl bx,cl
          or bl,al
          jmp input

    end_input:
    mov ah, 9
    lea dx, KQ
    int 21h

    mov cx, 4
    outputHex:
        mov dl,bh
        shr dl,4
        cmp dl,9
        jg output_letter
        or dl,30h
        mov ah,2
        int 21h
        jmp exit
        output_letter:
          mov ah, 2
          add dl, 37h
          int 21h
         exit:
          shl bx,4
          loop outputHex
 
    mov ah, 4ch
    int 21h
end