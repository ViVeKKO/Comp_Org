.model small

.data
n1 dw 1220h
n2 dw 1242h
m1 db 13,10,"First No: $"
m2 db 13,10,"Second No: $"
m3 db 13,10,"Product(DX,AX): $"

.code
mov ax,@data
mov ds,ax

main proc
extrn writesint:near
lea dx,m1
mov ah,09h
int 21h
mov ax,n1
call writesint
lea dx,m2
mov ah,09h
int 21h
mov ax,n2
call writesint
lea dx,m3
mov ah,09h
int 21h
mov dx,0
mov ax,n1
mul n2
mov bx,ax
mov ax,dx
call writesint
mov ax,bx
call writesint
mov ah,4ch
int 21h

endp
end