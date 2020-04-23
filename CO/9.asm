.model small

.data
arrayl db ?
arrays db ?
m1 db 13,10,"Enter array size: $"
m2 db 13,10,"Enter elements: $"
m3 db 13,10,"Largest no: $"

.code
mov ax,@data
mov ds,ax

main proc
extrn readsint:near,writesint:near
lea dx,m1
mov ah,09h
int 21h
call readsint
mov arrays,al
lea dx,m2
mov ah,09h
int 21h
and cx,0
mov cl,arrays
lea di,arrayl
prev:call readsint
mov arrayl[di],al
inc di
loop prev
lea si,arrayl
mov cl,arrays
mov bl,0
next:cmp bl,arrayl[si]
jge great
mov bl,arrayl[si]
great:inc si
loop next
lea dx,m3
mov ah,09h
int 21h
and ax,0
mov al,bl
call writesint
mov ah,4ch
int 21h

endp
end