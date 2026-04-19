.model small
.stack 100h
.data   
    msg1 db "Nhap vao mot ky tu: $"
    msg2 db 13, 10, "Ky tu ban nhap vao chuyen sang viet hoa la: $" 
    char db ?
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 09h
    lea dx, msg1
    int 21h    
                
    mov ah, 01h
    int 21h
    mov char, al
    
    lea dx, msg2
    mov ah, 09h
    int 21h    
                
    sub char, 32
    mov dl, char
    mov ah, 02h
    int 21h
    
    mov ah, 4CH
    int 21h
    
main endp
end main