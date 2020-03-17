

 org 0000h
 
  jmp kernel_start
  
  saim db "Kernel has been loaded successfully...",0
  
  
  
  kernel_start:
     xor bx , bx 
   mov ax , 0x1000
     mov ds , ax
   mov ss , ax 
   mov sp  , ax 
         
         mov     ah, 0x0e ; teletype function.
 
 
        
         
        mov al , 'S'
   
   int     0x10 
   
   
   mov al , 'a'
   
   int     0x10    
   
   
   mov al , 'i'
   
   int     0x10 
   
   mov al , 'm'
   
   int     0x10    
       
         
         
         
         
    
    
  mov ax , saim   
    PUSH ax 
     call Goster
    
      
     
   
      
  
  
  
  
  jmp $
 
 
 
 
 
  
  
  
  
  
  
  
  
  
  
  
  Goster:  


      POP es
          
  POP si   
  PUSH es
  
  mov     ah, 0x0e ; teletype function.
 
 loop:
 
 

 
    
     
       
   mov al , byte [si]

   
   
   
   int     0x10    
    
    inc si          
    cmp byte [si]  , 0
    je bitir      
    
       
  
 
 jmp loop 
  
   bitir:
 
 
      
    
 
  ret
 
   

 
     
   
     

  
  
  
  
  
  
  
  




; add your code here

HLT           


