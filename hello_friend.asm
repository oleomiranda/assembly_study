xor ax, ax
mov ds, ax
mov es, ax
mov ss, ax

mov ah, 0x13
mov al, 0x01
mov bh, 0x00
mov bl, 0x0f
mov cx, 0x10
mov dh, 0
mov dl, 0
mov bp, frase
add bp, 0x7c00
int 0x10

set_show_frase:
    add dh, 1
    cmp dh, 0x09
    int 0x10
    jne set_show_frase

set_freeze:
    jmp $

frase: db 'Hello, friend!',0x0a,0x0d
times 510 - ($-$$) db 0
dw 0xAA55
