include io.asm
stack1 segment 
    db 256 dup(?)
stack1 ends

data segment
    input_text db 255, 0, 255 dup('$')
    text1 db 'Your massage: $'
    cr db 13          ; Символ возврата каретки 
    lf db 10          ; Символ перевода строки
    special db 33, 47, 58, 64, 91, 96, 123, 126
    startChar dw ?
    saveCx dw ?
    saveSi dw ?
    saveSimbol db ?
data ends

; 15. В заданном тексте найти все слова, 
; которые начинаются и заканчиваются одним и тем же знаком.

code segment
start:
    ASSUME SS:stack1, DS:data, CS:code
    mov ax, data
    mov DS, ax
    call main
    call end_code

main:
    lea dx, input_text
    mov ah, 0Ah
    int 21h
    call print_massage
    call start_check_chars
    ret
;                   проверка каждого символа
start_check_chars:
    mov cx, 0
    mov cl, [input_text + 1]
    mov si, 2
    call print_enter
check_chars:
    mov bl, [input_text + si]
    
    mov saveCx, cx
    mov saveSi, si
    call start_check_special
have_simbol:
    mov cx, saveCx
    mov si, saveSi

end_check_chars:
    add si, 1
    loop check_chars
    ret



;                   проверка каждого символа на символ
start_check_special:
    mov cx, 4
    mov si, 0
check_special:

    cmp bl, [special + si + 1]
    jle next_check ; <=

end_check_special:
    add si, 2
    loop check_special
    ret

next_check:
    cmp bl, [special + si]
    jge start_scan_message ; >=
    jmp end_check_special



;                   нашли символ
start_scan_message:
    cmp saveSimbol, bl
    je start_print_scan_message
    mov saveSimbol, bl
    mov ax, saveSi
    mov startChar, ax
    jmp have_simbol

start_print_scan_message:

    mov si, startChar
    OUTINT si
    call print_space
    mov ax, saveSi
    add ax, 1
    mov bx, ax
    OUTINT bx

    mov cx, ax
    sub cx, si

    call print_scan_message
    call print_enter
    jmp have_simbol

print_scan_message:
    mov al, [input_text + si]
    call print_simbol
    call print_space
    add si, 1
    loop print_scan_message
    ret
    


print_massage:
    call print_enter
    lea dx, text1
    mov ah, 09h
    int 21h
    lea dx, input_text + 2
    mov ah, 09h
    int 21h
    ret

print_enter:
    mov ah, 02h
    mov dl, cr
    int 21h
    mov dl, lf
    int 21h
    ret

print_simbol:
    mov ah, 02h
    mov dl, al
    int 21h
    ret

print_space:
    mov ah, 02h
    mov dl, 32
    int 21h
    ret

end_code:
    mov ah, 4Ch
    int 21h

code ends
end start