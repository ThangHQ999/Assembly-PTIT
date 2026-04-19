.model small
.stack 100h
.data      
    CRLF db 13, 10, '$'
    buffer db 50, ?, 50 dup(?)
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 0AH
    lea dx, buffer
    int 21h      
    
    lea dx, CRLF
    mov ah, 09h
    int 21h   
    
    xor cx, cx
    mov cl, buffer[1] 
    
    lea si, buffer + 2 
     
LAP_IN_HOA:    
    mov al, [si]       
    cmp al, 'a'
    jb TIEP_TUC_HOA  
    cmp al, 'z'
    ja TIEP_TUC_HOA
    
    sub al, 32         
    
TIEP_TUC_HOA:
    mov dl, al
    mov ah, 02h
    int 21h  
    
    inc si
    loop LAP_IN_HOA
    
    lea dx, CRLF
    mov ah, 09h
    int 21h      
    
    xor cx, cx
    mov cl, buffer[1] 
    lea si, buffer + 2 
    
LAP_IN_THUONG:    
    mov al, [si]       
    cmp al, 'A'
    jb TIEP_TUC_THUONG  
    cmp al, 'Z'
    ja TIEP_TUC_THUONG
    
    add al, 32

TIEP_TUC_THUONG:
    mov dl, al
    mov ah, 02h
    int 21h  
    
    inc si
    loop LAP_IN_THUONG
    
        
    mov ah, 4ch    
    int 21h
    
main endp
end main