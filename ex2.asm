.model small
.stack 100h
.data   
    msg1 db 'Nhap mot ky tu: $'
    msg2 db 0DH, 0AH, 'Ky tu ban vua nhap la: $'
    CHAR db ? 
.code
main proc
    mov ax, @data
    mov ds, ax
    
    lea dx, msg1
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h
    mov CHAR, al
    
    lea dx, msg2
    mov ah, 09h
    int 21h
    
    mov dl, CHAR
    mov ah, 02h
    int 21h
    
    mov ah, 4CH
    int 21h
main endp
end main