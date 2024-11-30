ORG 0
BITS 16

start:
    cli ; clear interrupts
    mov ax, 0x7C0 ; x 16 = 0x7C00
    mov ds, ax ; setup data segment
    mov es, ax
    mov ax, 0x00 ; set stack to be 0
    mov ss, ax
    mov sp, 0x7C00
    sti ; enable interrupts
    mov si, message
    call print
    jmp $

print:
    MOV bx, 0
.loop:
    lodsb
    cmp al, 0
    je .done
    call print_char
    jmp .loop


.done:
    ret

print_char:
    mov ah, 0Eh
    int 0x10
    ret


message: db 'Hello World!' , 0
times 510- ($ - $$) DB 0
dw 0xAA55

