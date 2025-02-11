; 15. В заданном тексте найти все слова, 
; которые начинаются и заканчиваются одним и тем же знаком.

stack1 segment 
    db 256 dup(?)
stack1 ends

data segment
    input_text db 255, 0, 255 dup('$')
    text1 db 'Your massage: $'
    paddingLeft db '[$'
    paddingRight db '] $'
    cr db 13          ; Символ возврата каретки 
    lf db 10          ; Символ перевода строки
    startChar dw ?
    saveEnd dw ?
    saveCx dw ?
    saveSi dw ?
    lenghtString dw ?
    saveSimbol db ?
data ends

code segment
start:
    ASSUME SS:stack1, DS:data, CS:code
    mov ax, data
    mov DS, ax

    call print_massage

    lea dx, input_text
    mov ah, 0Ah
    int 21h

    call start_check_chars
    call end_code



;                   проверка каждого символа
start_check_chars:
    mov cx, 0
    mov cl, [input_text + 1]
    mov lenghtString, cx
    mov si, 2
    call print_enter
check_chars:

    mov ax, lenghtString
    cmp si, ax
    jg exit_check_chars ; if (si > lenghtString)

    mov bl, [input_text + si]
    mov saveCx, cx ; 
    mov saveSi, si 
    jmp start_check_special
have_simbol:
    mov cx, saveCx
    mov si, saveSi
    
end_check_chars:
    add si, 1
    loop check_chars
exit_check_chars:
    ret



;                   проверка каждого символа на символ
start_check_special:
    mov startChar, si
    add si, 1
    mov saveSimbol, bl
check_special:
    mov bl, [input_text + si]
    mov saveEnd, si
    cmp saveSimbol, bl
    je start_print_message
end_check_special:
    add si, 1
    loop check_special
    jmp have_simbol


;                                  вывод
start_print_message:
    mov ax, 0
    mov si, startChar ; si
    mov ax, saveEnd
    add ax, 1
    mov cx, ax
    sub cx, si        ; cx
    mov ax, saveCx
    mov saveCx, ax    ; saveCx
    mov ax, saveEnd
    mov saveSi, ax    ; saveSi
    call print_paddingLeft
    call print_scan_message
    call print_paddingRight
    jmp have_simbol



print_scan_message:
    mov al, [input_text + si]
    call print_simbol
    add si, 1
    loop print_scan_message
    ret
    
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

print_massage:
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

end_code:
    mov ah, 4Ch
    int 21h

code ends
end start