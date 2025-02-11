data segment
    buffer db 4, 0, 4 dup(0)
    mantisa db 10, 0, 10 dup(0)
    scale dw 10
data ends
;include FLOATLAB.ASM
;     znak   stepen        value
;  00000000 00000000 00000000 00000000
    ; 7.25   7   0.25
    ; (-1)^S * 1.M * 2^E
    ; (-1)^0 * 1.code segment

float MACRO name, value
    LOCAL exit, next
        ;---formingParam----;
        name db 11, 0, value
        mov cx, 0
        mov cl, [name + 0]
        mov si, 2
    next:
        mov al, [name + si]
        cmp al, '$'
        je exit
        inc si
        call printSimbol
        loop next
    exit:
        call printEnter
        sub si, 1
        mov bx, si
        mov al, [name + 2]
        call printSimbol
        mov al, [name + bx]
        call printSimbol
ENDM



printFloat MACRO name
LOCAL next, exit
        call printEnter
        mov cx, 0
        mov cl, [name + 0]
        mov si, 2
    next:
        mov al, [name + si]
        inc si
        cmp al, '$'
        je exit
        call printSimbol
        loop next
    exit:
    call printEnter
    mov bx, 0
    mov bl, [buffer + 1]
    OUTINT bx
    call printEnter
    mov bl, [buffer + 2]
    OUTINT bx
    call printEnter
    mov bl, [buffer + 3]
    mov bh, [buffer + 4]
    OUTINT bx
ENDM

code ends








    call printEnter
    ; znak
    mov isNoPosible, 1
    mov ax, 0
    mov al, -1
    mov bl, isNoPosible
    mul bl
    mov [buffer + 1], al







    ;               print bits 
    mov bx, 0
    mov bl, [buffer + 0]
    sub bx, 1
    mov si, 1
print_bits:
    mov al, [buffer + si]
    mov cx, 8
    call get_bit
    cmp bx, 0
    jle next
    inc si
    dec bx
    jmp print_bits
;               ptint bits
get_bit:
    shl al, 1
    jnc bit_is_zero
    OUTINT 1
    jmp output_bit
bit_is_zero:
    OUTINT 0
output_bit:
    loop get_bit
    mov al, ' '
    call printSimbol
    ret
    
next:

    
    
    ;call printEnter
    ;float tmp, '-7.25$'
    ;printFloat tmp


    ;call printEnter
    ;float tmp1, '45.00001$'
    ;printFloat tmp1








------------------

    fld num1

    fsqrt

    frndint

    fistp word ptr temp
    mov ax, temp
    OUTINT ax



-----------
