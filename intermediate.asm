[bits 32]

; Set segment registers
; 0x10 defines a table for each segment
; their settings are define there...

global _portu_oku
global _porta_yaz
 mov dx , 0x10
  mov ax, 0x10
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
	
mov eax, 0x40000
mov esi, eax;

mov eax, 0x60000
mov ebp, eax;

mov eax , 0x20000;
mov esp , eax; 



; Call C function...
extern _start
call _start


_porta_yaz:
mov edx , [ esp + 4 ] ; cx port adresi olacak cl kullanılabilir ama bir byte 
mov eax , [ esp + 8 ]
out dx , al
ret



_portu_oku:
mov eax , 0x0
mov edx , [ esp +4 ] ; cx port adresi olacak cl kullanılabilir ama bir byte 

in  al  , dx

ret


