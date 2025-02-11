; pochemy ya cherni pomagite pojalusta
stack1 segment 
    db 256 dup(?)
stack1 ends

data segment
    ;               arrays for texts
    text db 255, 0, 255 dup('$')      ; text
    thisWord db 255, 0, 255 dup('$')  ; this
    thatWord db 255, 0, 255 dup('$')  ; that
    saveChars db 255 dup('$')
    ;               input texts
    inputMessageText db 'Input text: $'
    inputMessageThis db 'Input this word: $'
    inputMessageThat db 'Input that word: $'
    ;               print texts
    invitation db 'Your text: $'
    cr db 13          ; Символ возврата каретки 
    lf db 10          ; Символ перевода строки
    ;               operation variables
    saveCx dw 0
    saveSi dw 0
    saveStart dw 0
    saveEnd dw 0
    lenghtText dw 0
    lenghtSaveChars dw 0
    saveStartWord dw 0
    saveEndWord dw 0
    tmp db 0
    step dw 0
data ends

code segment
start:
    ASSUME SS:stack1, DS:data, CS:code
    mov ax, data
    mov DS, ax

    call inputElements ; inputs
    call processingText
    call getText

    call end_code



; 14. Преобразовать текст, 
; заменяя всякий раз слово “ это ” на слово “ то ”.

;                       processing procedures (процедуры обработки)
processingText:
    mov cx, 0
    mov cl, [text + 1]
    mov lenghtText, cx
    add lenghtText, 1
    mov si, offset text + 2
    cld ; Устанавливаем флаг DF = 0 (для увеличения SI)
processing:
    cmp si, lenghtText
    jg processingEnd   ; if (si > lenghtText)
    mov saveStart, si
    lodsb
    call saveIterators
    jmp scanForWord
next_processing:
    call pushIterators
    loop processing
processingEnd:
    ret


;                          | scan word |
scanForWord:
    mov al, [text + si]
    mov saveEnd, si
    cmp al, ' '
    je haveWord ; if (bl == ' ')
    cmp si, lenghtText
    jg haveWord ; if (bl > lenghtText)
    add si, 1
    loop scanForWord
endScanWord:
    jmp next_processing

;                          | if have word |
haveWord:
    mov bx, 0
    mov si, saveStart      ; si
    mov al, [text + si]
    cmp al, ' '
    jne no_start_space
    add si, 1              ; si
no_start_space:
    mov bx, saveEnd
    mov saveSi, bx         ; saveSi
    mov cx, bx
    sub cx, si             ; cx = (saveEnd - si) — длина слова
    call setSaveWord
    mov ax, 0
    mov bx, 2
checkForReplace:
    mov al, [text + si]
    mov tmp, al
    mov al, [thisWord + bx]
    cmp tmp, al
    jne next_processing
    inc si
    inc bx
    loop checkForReplace
endCheckReplace:
    jmp operationReplase

;                      | operationReplase |
operationReplase:
    call pushSiCxWord
    mov bx, 0
    mov bl, [thatWord + 1]
    cmp cx, bx
    jl that_more_this  ; if ( cx < bx )
    call startReplaceText
    mov cx, saveEndWord
    mov bx, 0
    mov bl, [thatWord + 1]
    cmp cx, bx
    je endReplaceText ; if ( cx == bx )
    jg this_more_that ; if ( cx > bx )
endReplaceText:
    jmp next_processing

;    строим остаточное вырезанное предложение из text | that_more_this < |
that_more_this:
    mov ax, cx
    mov bx, 0
    mov bl, [thatWord + 1]
    sub bx, ax
    mov step, bx ; step
    mov ax, si
    add ax, cx
    mov si, ax ; si
    mov bx, lenghtText
    sub bx, ax
    add bx, 1
    mov cx, bx ; cx
    mov lenghtSaveChars, cx
    mov bx, 0
start_that_more_this:
    mov al, [text + si]
    mov [saveChars + bx], al
    inc si
    inc bx
    loop start_that_more_this
end_that_more_this:
    mov ax, lenghtText
    add ax, step
    mov lenghtText, ax
    call pushSiCxWord
    mov bx, 0
    mov bl, [thatWord + 1]
    mov cx, bx  ; cx
    call startReplaceText
    jmp start_add_save_text
    

start_add_save_text:
    call pushSiCxWord
    mov ax, si
    add ax, cx
    add ax, step
    mov si, ax ; si
    mov cx, lenghtSaveChars ; cx
    mov ax, 0
    mov bx, 0
add_save_text:
    mov al, [saveChars + bx]
    mov [text + si], al
    inc si
    inc bx
    loop add_save_text
end_add_save_text:
    jmp next_processing


; cx - bx = step |si + linghtThat = si| lenghtText - si = cx |  >
this_more_that: 
    call pushSiCxWord
    mov ax, 0
    mov ax, cx
    sub ax, bx
    mov step, ax ; step
    mov dx, si
    add dx, ax
    mov si, dx ; si
    mov ax, lenghtText
    sub ax, si ; lenghtText - si
    mov cx, ax ; cx
    add cx, 1
start_this_more_that:
    mov bx, si
    add si, step
    mov al, [text + si]
    sub si, step
    mov [text + si], al
    mov si, bx
    inc si
    loop start_this_more_that
end_this_more_that:
    jmp next_processing


;                          | replaceText |
startReplaceText:
    mov bx, 2
replaceText:
    mov al, [thatWord + bx]
    mov [text + si], al
    inc si
    inc bx
    loop replaceText
    ret

;                       Iterators
saveIterators:
    mov saveCx, cx
    mov saveSi, si
    ret
pushIterators:
    mov cx, saveCx
    mov si, saveSi
    ret

setSaveWord:
    mov saveStartWord, si  
    mov saveEndWord, cx
    ret
pushSiCxWord:
    mov si, saveStartWord
    mov cx, saveEndWord
    ret

;                       input
inputElements:
    call setText
    call setThisWord
    call setThatWord
    call print_enter
    ret

;                       set
setText:
    call print_enter
    lea dx, inputMessageText
    mov ah, 09h
    int 21h
    lea dx, text
    mov ah, 0Ah
    int 21h
    ret

setThisWord:
    call print_enter
    lea dx, inputMessageThis
    mov ah, 09h
    int 21h
    lea dx, thisWord
    mov ah, 0Ah
    int 21h
    ret

setThatWord:
    call print_enter
    lea dx, inputMessageThat
    mov ah, 09h
    int 21h
    lea dx, thatWord
    mov ah, 0Ah
    int 21h
    ret

;                       get
getText:
    call print_enter
    lea dx, invitation
    mov ah, 09h
    int 21h
    lea dx, text + 2
    mov ah, 09h
    int 21h
    ret

;                       print
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

;                       end
end_code:
    mov ah, 4Ch
    int 21h

code ends
end start

; hello im niger