.model small
.stack 100h
.data
     TB db 10,13,'Nhap mot ki tu: $'
     KQTruoc db 10,13,'Nam ki tu dung truoc: $'
     KQSau db 10,13, 'Nam ki tu dung sau: $' 
     Char db ?
.code
     mov ax,@data
     mov ds,ax
       
     mov ah,9        
     lea dx,TB
     int 21h   
       
     mov ah,1
     int 21h
     mov Char,al 
     
     mov ah,9
     lea dx,KQTruoc
     int 21h     
     
;Hien thi 5 ky tu dung truoc                
     mov dl,Char
     sub dl,5
     mov cx,5
     mov ah,2
prev_char:
     int  21h
     inc dl               
     loop prev_char       
    
     mov ah,9
     lea dx,KQSau
     int 21h
   
;Hien thi 5 ky tu dung truoc                
     mov dl,Char
     inc dl
     mov cx,5
     mov ah,2           
next_char:
    int  21h
    inc dl         
    loop next_char       
exit:
     mov ah,4ch
     int 21h                     
end