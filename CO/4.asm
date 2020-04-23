.model small

.data
n1 db ?
n2 db ?
m1 db 13,10,"Enter first no: $"
m2 db 13,10,"Enter second no: $"
m3 db 13,10,"Average: $"

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
lea dx,m3
mov ah,09h
int 21h
mov ax,0
mov al,n1
add al,n2
mov bl,2
div bl
mov cx,1
cmp ah,0
jne prev
call writesint
mov ah,4ch
int 21h
prev:
and ah,0
mov dl,10
div dl
push ax
cmp al,0
je next
inc cx
jmp prev
next:
pop ax
mov dl,ah
add dl,48
mov ah,02h
int 21h
loop next
mov dl,'.'
int 21h
mov dx,'5'
int 21h
mov dx,10
int 21h
mov ah,4ch
int 21h

endp
end