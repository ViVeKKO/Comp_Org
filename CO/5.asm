.model small

.data
n1 db ?
m1 db 13,10,"Enter no: $"
m2 db 13,10,"2s complement: $"

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
mov ax,0
mov al,n1
not al
add al,1
call writesint
mov ah,4ch
int 21h

endp
end