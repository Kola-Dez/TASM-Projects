.model large.c
.data
Extrn aaaS:byte, bbbS:byte, cccS:byte, result:word
.code
Public Lab1S
Lab1S proc far

	mov al,  aaaS
	cbw ; rashirenie do ax
	idiv bbbS
	mov result, ax


ret
Lab1S endp
end