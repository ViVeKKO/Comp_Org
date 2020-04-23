.model small

.data
n1 db ?
n2 db ?
m1 db 13,10,"Enter first no: $"
m2 db 13,10,"Enter second no: $"
m3 db 13,10,"Sign Flag: 0",10,'$'
m4 db 13,10,"Sign Flag: 1",10,'$'

.code
mov ax,@data
mov ds,ax

main proc
extrn readsint:near,writesint:near
lea dx,m1
mov ah,09h
int 21h
call readsint
mov n1,al
lea dx,m2
mov ah,09h
int 21h
call readsint
mov n2,al
mov ax,0
mov al,n1
add al,n2
js next
lea dx,m3
mov ah,09h
int 21h
mov ah,4ch
int 21h
next:
lea dx,m4
mov ah,09h
int 21h
mov ah,4ch
int 21h

endp
end