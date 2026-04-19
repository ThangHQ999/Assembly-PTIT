.model small
.stack 100h
.data  
.code
main proc      
    mov ax, @data
    mov ds, ax
    
    mov bx, 0
    
NHAP_KY_TU: 
    mov ah, 01h
    int 21h
    
    cmp al, 13
    je NHAP_XONG
    
    sub al, 30h
    mov ah, 0
    
    push ax
    mov ax, bx
    mov cx, 10
    mul cx
    pop bx
    add bx, ax
    jmp NHAP_KY_TU
    
NHAP_XONG:
    mov cx, 16
XUAT_BIT:
    shl bx, 1
    jc IN_MOT
    mov dl, '0'
    jmp IN_RA
IN_MOT:
    mov dl, '1'  
IN_RA:
    mov ah, 02h
    int 21h
    loop XUAT_BIT
    
    mov ah, 4ch
    int 21h
    
main endp
end main