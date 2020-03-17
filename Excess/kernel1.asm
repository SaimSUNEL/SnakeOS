[bits 32]
[org 0x8000]

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