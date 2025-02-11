.model large,c

.data


.code

Public OpenW
Public CloseW

OpenW proc
    mov ah, 00h
    mov al, 13h
    int 10h

	mov cx, 20
	mov dx, 20
	mov ah, 0ch
    mov al, 14
    mov bh, 0
	int 10h

	MOV AH, 08h
    int 21h
OpenW endp

CloseW proc
    mov al, 03h
    mov ah, 0
    int 10h
	ret
CloseW endp

end