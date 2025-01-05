.model small
.stack 100h
.data
    TBao DB 10,13, 'Hay nhap mot chu thuong (a-z): $'
    KQ DB 10,13,'Chu hoa tuong ung la: $'
    KThuc DB 10,13, 'Bam phim bat ky de thoat chuong trinh $'
    
    Char db ? ,'$'
.code
    mov ax, @data
    mov ds, ax
    
     mov ah, 9
     lea dx, TBao
     int 21h 
        
    call xuly_chuhoa 
    
    call thoatCT

xuly_chuhoa proc
      input:
       
        mov ah, 1
        int 21h
        
        cmp al,0Dh
        je exit
        
        sub al,20h
        mov Char,al
        
        lea dx,KQ
        mov ah,9
        int 21h
        
        lea dx,Char
        mov ah,9
        int 21h
        ;jmp continue   Su dung continue neu muon lap lai 
  ;continue: 
    ;jmp input      
  exit:      
    RET
xuly_chuhoa endp
    thoatCT proc
        mov ah,9
        lea dx,KThuc
        int 21h
        
        mov ah,7
        int 21h
        
        mov ah,4ch
        int 21h
        RET
    thoatCT endp
end
