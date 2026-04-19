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
    je XONG_NHAP
    
    sub al, 30h
    mov ah, 0
    
    push ax
    mov ax, bx
    mov cx, 10
    mul cx
    pop bx
    add bx, ax
    jmp NHAP_KY_TU
    
XONG_NHAP:
    mov cx, 4
LAP_HEX:
    rol bx, 4
    mov al, bl
    and al, 0FH
    
    cmp al, 9
    jbe CHU_SO
    add al, 7 
    
CHU_SO:
    add al, '0'
    
    mov dl, al
    mov ah, 02h
    int 21h
    loop LAP_HEX            
           
    mov ah, 4ch
    int 21h
    
main endp
end main