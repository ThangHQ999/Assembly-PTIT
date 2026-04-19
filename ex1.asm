.model small
.stack 100h
.data     
    CRLF db 13, 10, '$'
    vie db "Xin Chao!$"
    eng db "Hello!$"
.code
main proc
     mov ax, @data
     mov ds, ax

     mov ah, 09h
       
     lea dx, eng
     int 21h          
     
     lea dx, CRLF
     int 21h
     
     lea dx, vie
     int 21h    
     
     lea dx, CRLF
     int 21h
     
     mov ah, 4CH
     int 21h
main endp            
end main