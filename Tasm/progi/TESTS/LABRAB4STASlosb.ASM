stack1 segment 
    db 256 dup(?)
stack1 ends

data segment
    input_text db 255, 0, 255 dup('$')
    text1 db 'Your massage: $'
    cr db 13
    lf db 10
    saveStart dw ?
    lenghtString dw ?

    saveEnd dw ?
    saveCx dw ?
    saveSi dw ?
    saveStartWord dw ?
    saveEndWord dw ?
data ends

code segment
start:
    ASSUME SS:stack1, DS:data, CS:code
    mov ax, data
    mov DS, ax

    call printMassage

    call inputText

    call start_check_chars
    call end_code



; 15. В заданном тексте найти все слова, 
; которые начинаются и заканчиваются одним и тем же знаком.

inputText:
    mov ax, seg input_text
    mov es, ax
    lea di, input_text
    cld
    mov bx, 0
startInputText:
    mov ah, 01h
    int 21h
    cmp al, 0Dh
    je endInputText
    inc bx
    stosb
    jmp startInputText
endInputText:
    mov lenghtString, bx
    sub lenghtString, 1
    ret


start_check_chars:
    mov cx, lenghtString
    mov si, 0
    call print_enter
check_chars:
    cmp si, lenghtString
    jg exit_check_chars
    mov saveStart, si
    lodsb
    mov saveCx, cx
    mov saveSi, si 
    jmp check_words
next_simbol:
    mov cx, saveCx
    mov si, saveSi
    inc si
    loop check_chars
exit_check_chars:
    ret

;   проверка на слово
check_words:
    mov bl, [input_text + si]
    mov saveEnd, si
    cmp bl, ' '
    je start_check_vowels
    cmp si, lenghtString
    jg start_check_vowels
end_check_words:
    add si, 1
    loop check_words
    jmp next_simbol


;   проверка начального символа и последнего символа 
start_check_vowels:
    mov ax, 0
    mov si, saveStart ; si
    mov ax, saveEnd
    mov saveSi, ax    ; saveSi
    mov cx, ax
    sub cx, si        ; cx
    mov saveStartWord, si
    mov saveEndWord, cx
    mov bx, 0
    mov ax, 0

    mov al, [input_text + si]
    add si, cx
    sub si, 1
    mov bl, [input_text + si]
    cmp al, bl
    je start_print_message
    jmp next_simbol



;                    output
start_print_message:
    mov si, saveStartWord
    mov cx, saveEndWord
print_scan_message:
    lodsb
    call print_simbol
    loop print_scan_message
    call print_enter
    jmp next_simbol

printMassage:
    lea dx, text1
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