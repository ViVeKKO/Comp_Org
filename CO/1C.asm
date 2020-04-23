.model small

.data
n1 dd 12345678h
n2 dd 42831697h
m1 db 13,10,"First No(L): $"
m2 db 13,10,"Second No(L): $"
m3 db 13,10,"Sum(L): $"
m4 db 13,10,"First No(H): $"
m5 db 13,10,"Second No(H): $"
m6 db 13,10,"Sum(H): $"

.code
mov ax,@data
mov ds,ax

main proc
extrn writesint:near
lea dx,m1
mov ah,09h
int 21h
mov ax,word ptr n1
call writesint
lea dx,m2
mov ah,09h
int 21h
mov ax,word ptr n2
call writesint
lea dx,m3
mov ah,09h
int 21h
mov ax,word ptr n1
add ax,word ptr n2
call writesint
lea dx,m4
mov ah,09h
int 21h
mov ax,word ptr n1+2
call writesint
lea dx,m5
mov ah,09h
int 21h
mov ax,word ptr n2+2
call writesint
lea dx,m6
mov ah,09h
int 21h
mov ax,word ptr n1+2
adc ax,word ptr n2+2
call writesint
mov ah,4ch
int 21h

endp
end