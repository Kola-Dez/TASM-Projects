include IO.ASM
;   14.Даны массивы А, В, С состоящие из 6 элементов каждый.
;   Построить байт, каждый бит которого равен 1, если из трех 
;   одноименных компонент массивов можно построить треугольник, и нуль в противном случае.

stack1 segment 
    db 256 dup(?)
stack1 ends

data segment
    A db 0, 0, 0, 0, 0, 0
    B db 0, 0, 0, 0, 0, 0
    C db 0, 0, 0, 0, 0, 0
    message1 db 'Your array A: $'
    message2 db 'Your array B: $'
    message3 db 'Your array C: $'
    text1 db 'Your result: $'
    cr db 13
    lf db 10
    result db 0
    saveCx dw ?
data ends

code segment
start:
    ASSUME SS:stack1, DS:data, CS:code
    mov ax, data
    mov DS, ax

    call print_scan_message1
    call start_input_array_A
    
    call print_scan_message2
    call start_input_array_B
    
    call print_scan_message3
    call start_input_array_C

    call start_check_arrays
    
    call print_text
    call print_bits

    call print_enter
    mov bx, 0
    mov bl, result
    outint bx

    call end_code


start_input_array_A:
    mov cx, 6
    mov si, 0
input_array_A:
    mov bx, 0
    inint bx
    mov [A + si], bl
end_input_array_A:
    inc si
    loop input_array_A
    ret

start_input_array_B:
    mov cx, 6
    mov si, 0
input_array_B:
    mov bx, 0
    inint bx
    mov [B + si], bl
end_input_array_B:
    inc si
    loop input_array_B
    ret

start_input_array_C:
    mov cx, 6
    mov si, 0
input_array_C:
    mov bx, 0
    inint bx
    mov [C + si], bl
end_input_array_C:
    inc si
    loop input_array_C
    ret


start_check_arrays:
    mov si, 0
    mov cx, 6
    mov result, 0

check_arrays:
    call print_enter
    outint si
    mov al, [A + si]
    mov bl, [B + si]
    mov bh, [C + si]

    mov saveCx, cx

    mov dl, al
    add dl, bl
    cmp dl, bh
    jg have_tringle

    
next_iteration:
    mov cx, saveCx
    inc si
    loop check_arrays
    ret

have_tringle:
    mov dx, 1
    sub cx, 1
    mov ax, cx
    mov cl, al
    shl dl, cl
    or [result], dl

    call print_enter
    call print_bits

    jmp next_iteration



;                       prints
print_bits:
    mov bx, 0
    mov bh, result
    mov cx, 8
get_bit:
    shl bh, 1
    jnc bit_is_zero
    jmp print_simbol_1
bit_is_zero:
    jmp print_simbol_0
output_bit:
    loop get_bit
    ret

print_simbol_1:
    mov ah, 02h
    mov dl, '1'
    int 21h
    jmp output_bit

print_simbol_0:
    mov ah, 02h
    mov dl, '0'
    int 21h
    jmp output_bit

print_text:
    mov ah, 09h
    lea dx, text1
    int 21h
    ret

print_scan_message1:
    mov ah, 09h
    lea dx, message1
    int 21h
    ret

print_scan_message2:
    mov ah, 09h
    lea dx, message2
    int 21h
    ret

print_scan_message3:
    mov ah, 09h
    lea dx, message3
    int 21h
    ret

print_enter:
    mov ah, 02h
    mov dl, cr
    int 21h
    mov dl, lf
    int 21h
    ret

end_code:
    mov ah, 4Ch
    int 21h

code ends
end start
