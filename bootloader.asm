[bits 16]
[org 0x7c00]
jmp basla
saim db "NS - ", 0
bilgi db "Kernel Yuklendi..." , 0

gdt_start :
gdt_null : ; the mandatory null descriptor
dd 0x0 ; 'dd ' means define double word ( i.e. 4 bytes )
dd 0x0
gdt_code : ; the code segment descriptor
; base =0x0 , limit =0 xfffff ,
; 1st flags : ( present )1 ( privilege )00 ( descriptor type )1 -> 1001 b
; type flags : ( code )1 ( conforming )0 ( readable )1 ( accessed )0 -> 1010 b
; 2nd flags : ( granularity )1 (32 - bit default )1 (64 - bit seg )0 ( AVL )0 -> 1100 b
dw 0xffff ; Limit ( bits 0 -15)
dw 0x0 ; Base ( bits 0 -15)
db 0x0 ; Base ( bits 16 -23)
db 10011010b  ; 1st flags , type flags
db 11001111b ; 2nd flags , Limit ( bits 16 -19)
db 0x0 ; Base ( bits 24 -31)
gdt_data : ; the data segment descriptor
; Same as code segment except for the type flags :
; type flags : ( code )0 ( expand down )0 ( writable )1 ( accessed )0 -> 0010 b
dw 0xffff ; Limit ( bits 0 -15)
dw 0x0 ; Base ( bits 0 -15)
db 0x0 ; Base ( bits 16 -23)
db 10010010b ; 1st flags , type flags
db 11001111b ; 2nd flags , Limit ( bits 16 -19)
db 0x0 ; Base ( bits 24 -31)
gdt_end : ; The reason for putting a label at the end of the
; GDT is so we can have the assembler calculate
; the size of the GDT for the GDT decriptor ( below )
; GDT descriptior
gdt_descriptor :
dw gdt_end - gdt_start - 1 ; Size of our GDT , always less one
; of the true size
dd gdt_start ; Start address of our GDT
; Define some handy constants for the GDT segment descriptor offsets , which
; are what segment registers must contain when in protected mode. For example ,
; when we set DS = 0 x10 in PM , the CPU knows that we mean it to use the
; segment described at offset 0 x10 ( i.e. 16 bytes ) in our GDT , which in our
; case is the DATA segment (0 x0 -> NULL ; 0x08 -> CODE ; 0 x10 -> DATA )
CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start


Goster:  
      POP es
          
  POP si   
  PUSH es
    mov     ah, 0x0e ; teletype function.
  loop:
   
       
   mov al , [si]
   
   int     0x10    
    inc si          
    cmp byte [si]  , 0
    je bitir      
  
 jmp loop 
  
   bitir:
   ret
 
   
basla:
 
 mov dx , 0x7c00
 mov ss , dx
  
  mov dx ,  saim  
                                                      
       
 mov ax , 0x8100 
 mov sp , ax 
 
  PUSH dx
  call Goster 
 
mov     ah, 02h ; read function.
mov     al, 10  ; sectors to read.
mov     ch, 0   ; cylinder.
mov     cl, 2   ; sector.
mov     dh, 0   ; head.
 mov dl , 0
; dl not changed! - drive number.

; es:bx points to receiving
;  data buffer:
mov     bx, 800h   
mov     es, bx
mov     bx, 0

; read!
int     13h

  mov dx ,  bilgi
  push dx 
  call Goster
 
  cli
  lgdt [ gdt_descriptor ]
 
 mov eax , cr0 ; To make the switch to protected mode , we set
or eax , 0x1 ; the first bit of CR0 , a control register
mov cr0 , eax
 
 
 ;Perform jump to change CODE segment to 0x8 
jmp CODE_SEG:otuz_program
 
[bits 32]
otuz_program:

; set for segment registers...
 MOV   AX, 0x10 ; 0x10 points at the new data selector
   MOV   DS, AX
   MOV   ES, AX
   MOV   FS, AX
   MOV   GS, AX
   MOV   SS, AX
mov eax , 0x200000
mov esp , eax 

;Jump to loaded program location
jmp 0x8000
 

mov edx , 0xb8000 ; VGA graph memory...
mov ah , 0xf

mov al  ,'S'
mov [edx ] , ax 
inc edx
inc edx

mov al  ,'a'
mov [edx ] , ax 

inc edx
inc edx


mov al  ,'i'
mov [edx ] , ax 

inc edx
inc edx




mov al  ,'m'
mov [edx ] , ax 

inc edx
inc edx




mov al  ,' '
mov [edx ] , ax 


inc edx
inc edx




mov al  ,'S'
mov [edx ] , ax 



inc edx

inc edx



mov al  ,'U'
mov [edx ] , ax 





jmp $
    
   devam:
     
   nop
   jmp devam  
ret

   
