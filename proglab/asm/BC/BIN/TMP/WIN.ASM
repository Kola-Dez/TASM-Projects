.model large,c

.data
    extrn color:byte, PosX:word, PosY:word, key:byte
.code

Public OpenWin
Public CloseWin
Public Point
Public KeyPress
Public ClearScreen

OpenWin proc
    mov ah, 00h
    mov al, 13h
    int 10h
    ret
OpenWin endp

Point proc
    mov cx, PosX
	mov dx, PosY
	mov ah, 0ch
    mov al, color
    mov bh, 0
	int 10h
    ret
Point endp

KeyPress proc
    MOV AH, 08h
    int 21h
    mov key, al
    ret
KeyPress endp

ClearScreen proc 
    push es             ; Сохранение текущего значения ES
    push ax             ; Сохранение AX
    push di             ; Сохранение DI
    push cx             ; Сохранение CX

    mov ax, 0A000h      ; Адрес видеопамяти для графического режима
    mov es, ax          ; Загружаем в сегмент видеопамяти
    xor di, di          ; Начинаем с начала видеопамяти (di = 0)
    mov ax, 0           ; Устанавливаем цвет фона (черный, 0)
    mov cx, (320 * 200) / 2  ; Количество 16-битных слов для очистки
    rep stosw           ; Заполняем видеопамять словами (ускоренная очистка)

    pop cx              ; Восстанавливаем CX
    pop di              ; Восстанавливаем DI
    pop ax              ; Восстанавливаем AX
    pop es              ; Восстанавливаем ES
    ret
ClearScreen endp


CloseWin proc
    mov al, 03h
    mov ah, 0
    int 10h
    ret
CloseWin endp

end