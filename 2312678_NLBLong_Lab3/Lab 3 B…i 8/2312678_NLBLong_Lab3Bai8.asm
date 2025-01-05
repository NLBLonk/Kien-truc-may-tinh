.model small											
.stack 100h												
.data												
   TB db 13,10, 'Hay nhap mot chu thuong (a-z) $'
   KQ DB 13,10,'Chuyen sang ki tu hoa la : $'							
   Char DB ?,'$'											
.code												
main proc												
    mov ax,@data											
    mov ds,ax			
    
    mov ah,9
    lea dx,tb
    int 21h			
    					
;Nhap vao 1 ky tu thuong nhung khong hien thi ki tu thuong										
    mov ah,08h      ;Su dung int 21h, chuc nang 08h de nhap ki tu ma khong hien thi		
    int 21h         											
    sub al,20h      ;Doi thanh ki tu hoa								
    mov Char,al     ;gan gia tri vua nhap (luu o AL) vao bien Char					
     							
    lea dx,KQ											
    mov ah,9 											
    int 21h  
    
    lea dx,Char											
    mov ah,9 											
    int 21h
										
;Ket thuc chuong trinh										
   mov ah,4Ch											
   int 21h												
main endp												
end	