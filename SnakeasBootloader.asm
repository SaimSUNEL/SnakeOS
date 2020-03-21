
org 0x07ch
; org 100h
jmp start
start:   
; set data segment:
xor     ax, ax
mov     ds, ax
  
mov ah , 6
mov yilanuzunluk , ah ; length of the snake   

         
mov     ax, 07c0h
mov     ss, ax ; set stack segment...
mov     sp, 03feh ; top of the stack.

; set default video mode 80x25:
mov     ah, 00h
mov     al, 03h
int     10h

mov     ah, 1     ; set text-mode cursor type...
mov     ch, 2bh
mov     cl, 0bh
int     10h 

mov     ah, 0x0e ; teletype function.
mov     al, 'B'
        
        int     0x10
mov     al, 'a'   
int     0x10   

mov     al, 's'
int     0x10

mov     al, 'l'   
int     0x10

mov     al, 'a'
int     0x10

mov     al, 't'
int     0x10

mov     al, '.'
int     0x10

mov     al, '.'   
int     0x10

mov     al, '.'       
int     0x10

mov     al, ' '

     
     
mov     ah, 00h   ; wait a key press...
int     16h      


mov al , 10
mov depo_hafizax,al  ; initial snake head location
mov depo_hafizay,10

mov si, 0h

fill:
mov x_array[si], 10 ; fill snake array with the same coordinates..
mov y_array[si], 10
inc si 
mov ah, 0h
mov al, yilanuzunluk

cmp ax, si
je finish_fill
jmp fill
finish_fill: 



mov yon,3   ; initial snake direction... right   
jmp oyun_dongusu

oyun_dongusu:

mov     ah, 01h ; get the state of the keyboard
int     16h

;int 16h ah= 01 Returns:
;ZF set if no keystroke available
;ZF clear if keystroke available
;AH = BIOS scan code
;AL = ASCII character

jz      tusa_basilmadi ; if no keystroke, jump

mov     ah, 00h ; if key is pressed then read key value
int     16h

cmp al,'a' ; if key is 'a'
je sola
 
cmp al,'d' ; if key is 'd'
je saga
              
cmp al,'w' ; if key is 'w'
je yukari 

cmp al,'s' ; if key is 's'
je asagi        


jmp tusa_basilmadi ; user might have pressed a key except those four....
      

; set direction accordingly and jump
sola:
mov yon,1
jmp tusa_basilmadi

saga:
mov yon,3
 
jmp tusa_basilmadi
yukari:
mov yon,2 
 
jmp tusa_basilmadi

asagi:
 
mov yon,4 

jmp tusa_basilmadi


tusa_basilmadi:
sf: 

mov cl , yon ; store direction info in stack
;push cx

; depending on the direction make jump..
cmp   yon,3
je   saga_artir
cmp    yon,4h
je    asagi_artir
cmp    yon,1
je sola_eksilt
;cmp   yon,35
;je   devam
cmp yon,2
je yukari_eksilt
jmp devam 



sola_eksilt: ; if snake goes left

cmp depo_hafizax, 0
je nodecrease       ; if x = 0 then x = 79 else x--
dec  depo_hafizax ; decrease the x coordinate 
jmp decrease
nodecrease:
mov depo_hafizax, 79

decrease:
jmp devam

yukari_eksilt:   ; if snake goes up
cmp depo_hafizay, 0   ; if y = 0  then y = 24 else y--
je sifir


dec depo_hafizay ; decrease the y coordinate..:
jmp notsifir     ;
sifir:
mov depo_hafizay, 24

notsifir:

jmp devam   

   
asagi_artir: ; if snake goes down 

inc depo_hafizay; increase the y coordinate
cmp depo_hafizay, 25 ; if y = 25 then y = 0    else y++
je yirmibes
jmp notyirmibes
yirmibes:
mov depo_hafizay, 0
notyirmibes:
jmp devam     
     
     


saga_artir:     ; if snake goes right 

inc depo_hafizax ; increase the x coordinate....
cmp depo_hafizax, 81 ; if x = 81 then x =0 else x++
je seksenbir

jmp devam

seksenbir:
mov depo_hafizax, 0


devam:
;pop cx ; read stored direction info from stack                 

mov dl , depo_hafizay ; 
mov dh , depo_hafizax ; dl=y, dh =x coordinates...
;push dx 
 
mov x_array[ 0 ]    , dh ; set head location in array...
           
mov    y_array [ 0 ]    , dl


call konumlandir ; prints function showing whole snake on screen... 
 ; call yazdir
      
call array_kaydir ; shift snake points in array     
  
      

mov ah,02h  ;//alt program numarsý
mov bh,00h 
   
mov dh, last_y ; row number
mov dl, last_x;column number
int 10h   ; locate cursor 


 mov     al, ' '  ; print space to delete last tail point of snake...
        mov     ah, 0x0e ; teletype function.
        int     0x10



call bekle ; wait for a while...  



;pop dx
jmp oyun_dongusu

hlt 




yazdir:
      
; print * to current cursor location...      
 mov     al, '*'
        mov     ah, 0x0e ; teletype function.
        int     0x10

  
ret
     
konumlandir:
 
mov si , 0h ; si = 0    

show:
          
            
                    ; set cursor position
            
 ;   
mov ah,02h  ;
mov bh,00h 
   
mov dh, y_array[ si ]  ; row number
mov dl, x_array[ si ]; column number



mov ch, 0
mov cl, yilanuzunluk 
inc cl

 
cmp cx, si ; for each point of snake...
je finish 
inc si
int 10h   ; locate cursor 


call yazdir ; print * to current cursor location

jmp show


finish:


ret   





bekle:

push cx 

push ax

mov cx , 0xffff  ; wait simply decreasing numbers...

kucuk_loop:

mov ax ,0x2ff ; ax = 1

don:   

dec ax   ; ax = ax -1 

cmp ax , 1  ; if 

jz fin

jmp don


fin:
loop kucuk_loop ; decrease cx, if not zero jmp kucuk_loop   
pop ax

pop cx

ret 


array_kaydir: ; shifts locations in the snake array...


mov ah, 0                ; store the snake tail location in last_x and last_y
mov al, yilanuzunluk

mov si, ax   

mov cl, x_array[si]

mov last_x, cl
mov cl, y_array[si]
 
mov last_y, cl

mov al , yilanuzunluk ; set ax = snake length
mov ah, 0

mov si , ax  ; si = ax
;sub si , 1h  ; si = si-1

mov cx , si  ; cx = si

dev:
mov si , cx  ; si = cx

mov al , x_array[ si - 1  ] ; x[si] = x[si-1]
mov x_array[ si  ] , al

mov al , y_array[ si - 1 ] ; y[si] = y[si-1]
mov y_array[ si ] , al

loop dev; decrease cx by one if not zero keep jumping to label

          
  
 

; mov    al , byte ptr   x_array[ si ]

;push ax        
;inc si
;mov  byte ptr x_array[ si  ]  , al 

;dec si

;mov    al ,   byte ptr y_array[ si ]
;inc si

;mov   byte ptr y_array[ si  ]  , al 
 
 
;cmp si , 0h
;jz gfgf 
 

;dec si 



;jmp kaydir



;loop kaydir

gfgf:
ret    


; snake length variable 
yilanuzunluk db 6h
; snake x coordinate array   
x_array db  0h,0h,0h,0h,0h,0,0,0,0,0,0,0,0,0,'#'
; snake y coordinate array
y_array db  0h,0h,0h,0h,0h,0,0,0,0,0,0,0,0,0,0,'#' 
   
   
; snake head x location   
depo_hafizax db  1 
; snake head y location
depo_hafizay  db 1   
last_x db 1
last_y db 1  

; snake direction
yon db 1 