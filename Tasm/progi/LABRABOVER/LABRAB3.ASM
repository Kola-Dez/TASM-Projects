include io.asm

; 24. Заменить местами значения 6-го и 11-го разрядов в 
; каждом слове массива А, длина которого 10 слов.

; test [1024 64 123 4095 0 ...]

stack1 segment
    db 256 dup(?)
stack1 ends

data segment
    A dw 10 dup(?)
    D dw 10 dup(?)
    maskNumb1 dw 0000100000000000b
    maskNumb2 dw 0000000001000000b
    text1 db 'Input array: $'
    text2 db '  ID            Old array                 New array $'
    paddingLeft db " = {$"
    paddingRight db "} $"
    padding db "  $"
    temp dw 0
    id dw 0
    cr db 13          ; Символ возврата каретки 
    lf db 10          ; Символ перевода строки 
data ends

code segment
start:
    ASSUME SS:stack1, DS:data, CS:code

    mov ax, data
    mov DS, ax

    call print_for_terminal_inputArray
    call input_array
    call invert_array

    call print_for_terminal_Array
    call print_array


    mov ah, 4ch
    int 21h



;               input array
input_array:
    mov cx, 10
    mov si, 0
set_number:
    inint bx
    mov [A + si], bx
    add si, 2
    loop set_number
    ret



;               print array
print_array:
    mov cx, 10
    mov si, 0
    mov [id], 0
get_number:
    call print_enter

    call print_for_terminal_padding
    OUTINT [id]
    call print_for_terminal_padding

    mov bx, [A + si]
    OUTINT bx
    mov [temp], cx 
    call print_paddingLeft
    call print_bits_A
    call print_paddingRight
    mov cx, [temp]

    mov bx, [D + si]
    OUTINT bx
    mov [temp], cx 
    call print_paddingLeft
    call print_bits_D
    call print_paddingRight
    mov cx, [temp]

    add si, 2
    add [id], 1
    loop get_number
    ret




;               print bits A
print_bits_A:
    mov ax, [A + si]
    mov cx, 16
    jmp get_bit

;               print bits D
print_bits_D:
    mov ax, [D + si]
    mov cx, 16
    jmp get_bit

;               ptint bits
get_bit:
    shl ax, 1
    jnc bit_is_zero
    OUTINT 1
    jmp output_bit
bit_is_zero:
    OUTINT 0
output_bit:
    loop get_bit
    ret




;               invert index 11 and index 6 for all el mass
invert_array:
    mov cx, 10
    mov si, 0
invert_bits:
    mov ax, [A + si]
    
    mov bx, ax
    shr bx, 11
    and bx, 1

    mov dx, ax
    shr dx, 6
    and dx, 1

    cmp bx, dx
    je invert_exit

    xor ax, maskNumb1
    xor ax, maskNumb2
    
invert_exit:
    mov [D + si], ax
    add si, 2
    loop invert_bits
    ret


;               print texts
print_paddingLeft:
    mov ah, 09h
    lea dx, paddingLeft
    int 21h
    ret

print_paddingRight:
    mov ah, 09h
    lea dx, paddingRight
    int 21h
    ret

print_for_terminal_inputArray:
    call print_enter
    mov ah, 09h
    lea dx, text1
    int 21h
    ret

print_for_terminal_Array:
    call print_enter
    mov ah, 09h
    lea dx, text2
    int 21h
    ret

print_for_terminal_padding:
    mov ah, 09h
    lea dx, padding
    int 21h
    ret

print_enter:
    mov ah, 02h
    mov dl, cr
    int 21h
    mov dl, lf
    int 21h
    ret

code ends
END start
