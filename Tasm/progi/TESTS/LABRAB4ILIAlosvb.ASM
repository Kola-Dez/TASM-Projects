stack1 segment 
    db 256 dup(?)
stack1 ends

data segment
    ;               arrays for texts
    text db 255, 0, 255 dup('$')      ; text
    saveChars db 255 dup('$')
    ;               input texts
    inputMessageText db 'Input text: $'
    ;               print texts
    invitation db 'Your text: $'
    cr db 13          ; Символ возврата каретки 
    lf db 10          ; Символ перевода строки
    ;               operation variables
    saveCx dw 0
    saveSi dw 0
    lenghtText dw 0
data ends

code segment
start:
    ASSUME SS:stack1, DS:data, CS:code
    mov ax, data
    mov DS, ax

    call setText
    call processingText
    call getText

    call end_code



; 14. Преобразовать текст, 
; заменяя всякий раз слово “ это ” на слово “ то ”.

;                       processing procedures (процедуры обработки)
processingText:
    mov cx, lenghtText
    mov si, 0
processing:
    cmp si, lenghtText
    jg processingEnd   ; if (si > lenghtText)
    mov saveSi, si
    mov saveCx, cx
    jmp scanForWord
next_processing:
    mov si, saveSi
    mov cx, saveCx
    inc si
    loop processing
processingEnd:
    ret


;                          | scan word |
scanForWord:
    mov cx, 3
    mov saveSi, si
startScanWord:
    mov al, [text + si]
    cmp al, 'e'
    jne endScanWord
    add si, 1
    mov al, [text + si]
    cmp al, 't'
    jne endScanWord
    add si, 1
    mov al, [text + si]
    cmp al, 'o'
    jne endScanWord
    jmp replaceText
endScanWord:
    jmp next_processing

replaceText:
    mov cx, 1
    mov si, saveSi

start_replaceText:
    mov [text + si], 't'
    inc si
    mov [text + si], 'o'
    loop start_replaceText
    
    mov si, saveSi
    add si, 2
    mov saveSi, si
    mov ax, lenghtText
    sub ax, saveSi
    mov cx, ax
    mov si, saveSi
start_step:
    mov al, [text + si + 1]
    mov [text + si], al
    inc si
    loop start_step

    jmp next_processing





;                       set
setText:
    lea dx, inputMessageText
    mov ah, 09h
    int 21h
    mov ax, seg text
    mov es, ax
    lea di, text
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
    mov lenghtText, bx
    ret

;                       get
getText:
    call print_enter
    lea dx, invitation
    mov ah, 09h
    int 21h
    lea dx, text
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

;                       end
end_code:
    mov ah, 4Ch
    int 21h

code ends
end start