.model small
.stack 100h
.data       
    TBao DB 10,13,'Nhap mot ky tu (hoac ESC): $'  
    KQ1 DB 10,13,'Ky tu da nhap la chu $' 
    KQ2 DB 10,13,'Ky tu da nhap la so $' 
    KQ3 DB 10,13,'Ky tu da nhap la chu/so $' 
    KThuc DB 10,13,'Bam phim bat ky de thoat chuong trinh $'
    
    kytu db ?
.code
    mov ax,@data
    mov ds,ax
          
    mov ah,9
    lea dx,TBao
    int 21h      
          
    call xuly
    
    call thoatCT    
    
    xuly proc
       input:
          mov ah,1
          int 21h
          
          cmp al,0Dh
          je exit
          
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
          jbe chu
          
          chu:
            mov ah,9
            lea dx,KQ1
            int 21h    
            jmp continue
          so:
            mov ah,9
            lea dx,KQ2
            int 21h     
            jmp continue
          khac:
            mov ah,9
            lea dx,KQ3
            int 21h     
            jmp continue
   continue:
        jmp input  
   exit:
        RET
    xuly endp   
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
            