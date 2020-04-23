.model small

.data
no dw ?
m1 db 13,10,"Enter a number: $"
m2 db 13,10,"Enter the power: $"
m3 db 13,10,"Answer: $"

.code
mov ax,@data
mov ds,ax

main proc
extrn readsint:near,writesint:near
lea dx,m1
mov ah,09h
int 21h
call readsint
mov no,ax
lea dx,m2
mov ah,09h
int 21h
call readsint
mov cx,0
mov cl,al
sub cl,1
mov ax,no
jcxz next
prev:mul no
loop prev
next:mov bx,ax
lea dx,m3
mov ah,09h
int 21h
mov ax,bx
call writesint
mov ah,4ch
int 21h

endp
end