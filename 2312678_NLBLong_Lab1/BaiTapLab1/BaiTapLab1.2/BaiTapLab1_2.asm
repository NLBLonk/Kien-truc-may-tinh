.model small
.stack 100h
.data
      CR EQU 13    
      LF EQU 10    
      TBao1 db CR,LF,'Hay nhap mot ky tu: $'    
      TBao2 db CR,LF,'Ky tu da nhap    : $'
.code
    main proc    
        ; Dua du lieu vao thanh ghi DS    
          mov ax,@data    
          mov ds,ax    
        ; Hien thi TBao1    
          mov ah,9    
          lea dx,TBao1    
          int 21h   
        ; Nhap vao mot ky tu   
          mov ah,1    
          int 21h    
        ; Dua ky tu vao thanh ghi bl    
          mov bl,al    
        ; Hien thi TBao2    
          mov ah,9    
          lea dx,TBao2    
          int 21h    
        ; Hien thi KyTu    
          mov ah,2    
          mov dl,bl    
          int 21h    
        ; Exit to DOS    
          mov ah,4ch    
          int 21h 
          main endp
end main