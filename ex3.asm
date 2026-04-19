.model small
.stack 100h
.data   
    msg1 db "Nhap vao mot chuoi: $"
    msg2 db 13, 10, "Chuoi ban nhap vao la: $" 
    buff db 50, ?, 50 DUP(?)
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 09h
    lea dx, msg1
    int 21h    
    
    lea dx, buff
    mov ah, 0AH
    int 21h 
    
    XOR bx, bx
    mov bl, buff[1]
    mov buff[bx+2], '$'
    
    lea dx, msg2
    mov ah, 09h
    int 21h    
    
    lea dx, buff+2
    mov ah, 09h
    int 21h
    
    mov ah, 4CH
    int 21h
    
main endp
end main