.model small

.data
n1 db 36h
n2 db 42h
m1 db 13,10,"First No: $"
m2 db 13,10,"Second No: $"
m3 db 13,10,"Sum: $"

.code
mov ax,@data
mov ds,ax

main proc
extrn writesint:near
lea dx,m1
mov ah,09h
int 21h
mov ax,0
mov al,n1
call writesint
lea dx,m2
mov ah,09h
int 21h
mov ax,0
mov al,n2
call writesint
lea dx,m3
mov ah,09h
int 21h
mov ax,0
mov al,n1
add al,n2
call writesint
mov ah,4ch
int 21h

endp
end