stack1 segment 
    db 256 dup(?)
stack1 ends

data segment
    input_text db 255, 0, 255 dup('$')
    text1 db 'Your massage: $'
    vowels db 'aeiouAEIOU$'
    cr db 13
    lf db 10
    saveStart dw ?
    lenghtString dw ?

    saveEnd dw ?
    saveCx dw ?
    saveSi dw ?
    saveVowelsCx dw ?
    saveVowelsSi dw ?
    saveStartWord dw ?
    saveEndWord dw ?
    saveWordSimbol db ?
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



; 24. Выписать из заданного текста слова,
; содержащие удвоенную гласную.

inputText:
    lea dx, input_text
    mov ah, 0Ah
    int 21h
    ret


start_check_chars:
    mov cx, 0
    mov cl, [input_text + 1]
    mov lenghtString, cx
    add lenghtString, 1
    mov si, 2
    call printEnter
check_chars:
    cmp si, lenghtString
    jg exit_check_chars ;     if (si == lenghtString)
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


check_words:
    mov bl, [input_text + si]
    mov saveEnd, si
    cmp bl, ' '
    je start_check_vowels ; if (bl == ' ')
    cmp si, lenghtString
    jg start_check_vowels ; if (bl == lenghtString)
end_check_words:
    add si, 1
    loop check_words
    jmp next_simbol


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
check_vowels:
    mov bl, [input_text + si]
    mov saveVowelsCx, cx
    mov saveVowelsSi, si
    jmp start_have_vowels

go_next_vowels:
    mov cx, saveVowelsCx
    mov si, saveVowelsSi
end_check_vowels:
    add si, 1
    loop check_vowels
    jmp next_simbol



start_have_vowels:
    mov cx, 10
    mov si, 0
    mov saveWordSimbol, bl
have_vowels:
    mov bl, [vowels + si]
    cmp saveWordSimbol, bl
    je save_vowels
end_have_vowels:
    add si, 1
    loop have_vowels
    jmp go_next_vowels


save_vowels:
    mov bx, saveVowelsSi
    add bx, 1
    mov al, [input_text + bx]
    cmp saveWordSimbol, al
    je start_print_scan_message
    jmp go_next_vowels



start_print_scan_message:
    mov si, saveStartWord
    mov cx, saveEndWord
print_scan_message:
    lodsb
    call printSimbol
    loop print_scan_message
    call printEnter
    jmp next_simbol

printMassage:
    lea dx, text1
    mov ah, 09h
    int 21h
    lea dx, input_text + 2
    mov ah, 09h
    int 21h
    ret

printEnter:
    mov ah, 02h
    mov dl, cr
    int 21h
    mov dl, lf
    int 21h
    ret

printSimbol:
    mov ah, 02h
    mov dl, al
    int 21h
    ret

end_code:
    mov ah, 4Ch
    int 21h

code ends
end start