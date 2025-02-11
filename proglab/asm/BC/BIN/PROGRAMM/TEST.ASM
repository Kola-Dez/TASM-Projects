.model Large,c
.data
	hellom db "hello12$"
.code
Public test12
test12 proc
	mov ah, 08h
	lea bx, hellom
	int 21h
	ret
test12 endp
end