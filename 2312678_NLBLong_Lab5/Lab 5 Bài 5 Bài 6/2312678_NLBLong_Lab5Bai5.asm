.model small
.stack 100h
.data       
        TB1 db 13,10,'Nhap so thap phan: $'
        TB2 db 13,10,'So thap phan vua nhap: $'
.code       
        mov ax, @data
        mov ds, ax
                                  
        call INPUT                      
        call OUTPUT  
         
        mov ah, 4ch
        int 21h
     
    INPUT proc         
        @begin:
            xor cx,cx
            lea dx,TB1
            mov ah,9
            int 21h
            
            mov ah, 1
            int 21h
           
            cmp al, '-'
            je @minus
            cmp al, '+'
            je @plus
            
            jmp @tieptuc
             
            @minus:
                mov cx, 1
            @plus:
                int 21h
            @tieptuc:
                ;So sanh neu nho hon so 0
                cmp al, '0'
                jnge @notdigit
                ;So sanh neu lon hon so 9
                cmp al, '9'
                jnle @notdigit
                ;Doi ky so thanh tri
                and ax, 0fh   
                push ax
                ;Tinh tong=10*tong+tri         
                mov ax, 10
                mul bx          
                mov bx, ax          
                pop ax
                add bx, ax   
                  
                mov ah, 1
                int 21h 
                ;So sanh voi enter, neu khong phai thi tiep tuc lap
                cmp al, 13      
                jne @tieptuc     
                 
                mov ax, bx
                ;Kiem tra cx co gia tri (1 neu am)       
                or cx, cx        
                je @return
                neg ax           
                 
                @return:                
                    ret
                @notdigit:
                    jmp @begin               
    INPUT endp 
     
    OUTPUT proc
        ;ax luc nay dang giu gia tri (neu la am) nen gui vao stack
        push ax
        lea dx,TB2
        mov ah,9
        int 21h
        ;lay lai gia tri cho ax
        pop ax       
        ;so sanh tong voi so 0 
        cmp ax, 0 
        jge doira_thapphan
        ;neu nho hon 0
        push ax
        mov dl, '-'
        mov ah, 2
        int 21h
        pop ax
        neg ax 
        ;lap chia cho 10 
        doira_thapphan:
            xor cx, cx 
            mov bx, 10 
            chia:
                xor dx, dx 
                div bx
                ;so du cho vao ngan xep     
                push dx
                inc cx
                ;lap cho den khi thuong bang 0
                cmp ax, 0  
                jne chia   
                mov ah, 2
            doi:
                ;doi so thap phan -> ky so
                pop dx
                or dl, 30h
                int 21h
                loop doi
        ret       
   OUTPUT endp
end
