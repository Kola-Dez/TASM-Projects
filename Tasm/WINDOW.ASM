; hello.asm
.model small
.stack 100h

.data
hello db 'Hello, World!', '$'

.code
public print_hello

print_hello proc
    mov ah, 09h          ; Функция DOS для вывода строки
    lea dx, hello        ; Загружаем адрес строки в DX
    int 21h              ; Вызов прерывания DOS
    ret                  ; Возврат из процедуры
print_hello endp

end