; Disassembly of file: kernel.o
; Mon Mar 16 01:00:47 2020
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386


global _start: function
global _help: function
global _goto_print: function


SECTION .text   align=4 execute                         ; section number 1, code

.text:  ; Local function

_start:
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        sub     esp, 72                                 ; 0003 _ 83. EC, 48
        mov     dword [ebp-2BH], 1970107769             ; 0006 _ C7. 45, D5, 756D7579
        mov     dword [ebp-27H], 1869881459             ; 000D _ C7. 45, D9, 6F742073
        mov     dword [ebp-23H], 1734435443             ; 0014 _ C7. 45, DD, 67616273
        mov     dword [ebp-1FH], 1646292321             ; 001B _ C7. 45, E1, 62206D61
        mov     dword [ebp-1BH], 1835626085             ; 0022 _ C7. 45, E5, 6D696E65
        mov     dword [ebp-17H], 757935405              ; 0029 _ C7. 45, E9, 2D2D2D2D
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [ebp-13H], 11565                   ; 0030 _ 66: C7. 45, ED, 2D2D
        mov     byte [ebp-11H], 0                       ; 0036 _ C6. 45, EF, 00
        mov     dword [ebp-30H], 1634953550             ; 003A _ C7. 45, D0, 6173694E
        mov     byte [ebp-2CH], 0                       ; 0041 _ C6. 45, D4, 00
        mov     dword [ebp-10H], 753664                 ; 0045 _ C7. 45, F0, 000B8000
        mov     eax, dword [ebp-10H]                    ; 004C _ 8B. 45, F0
        mov     byte [eax], 83                          ; 004F _ C6. 00, 53
        mov     eax, dword [ebp-10H]                    ; 0052 _ 8B. 45, F0
        add     eax, 1                                  ; 0055 _ 83. C0, 01
        mov     byte [eax], 15                          ; 0058 _ C6. 00, 0F
        mov     eax, dword [ebp-10H]                    ; 005B _ 8B. 45, F0
        add     eax, 2                                  ; 005E _ 83. C0, 02
        mov     byte [eax], 97                          ; 0061 _ C6. 00, 61
        mov     eax, dword [ebp-10H]                    ; 0064 _ 8B. 45, F0
        add     eax, 3                                  ; 0067 _ 83. C0, 03
        mov     byte [eax], 15                          ; 006A _ C6. 00, 0F
        mov     eax, dword [ebp-10H]                    ; 006D _ 8B. 45, F0
        add     eax, 4                                  ; 0070 _ 83. C0, 04
        mov     byte [eax], 105                         ; 0073 _ C6. 00, 69
        mov     eax, dword [ebp-10H]                    ; 0076 _ 8B. 45, F0
        add     eax, 5                                  ; 0079 _ 83. C0, 05
        mov     byte [eax], 10                          ; 007C _ C6. 00, 0A
        mov     dword [ebp-0CH], 0                      ; 007F _ C7. 45, F4, 00000000
        jmp     ?_002                                   ; 0086 _ EB, 2D

?_001:  mov     eax, dword [ebp-0CH]                    ; 0088 _ 8B. 45, F4
        add     eax, eax                                ; 008B _ 01. C0
        mov     edx, eax                                ; 008D _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 008F _ 8B. 45, F0
        add     edx, eax                                ; 0092 _ 01. C2
        lea     ecx, [ebp-2BH]                          ; 0094 _ 8D. 4D, D5
        mov     eax, dword [ebp-0CH]                    ; 0097 _ 8B. 45, F4
        add     eax, ecx                                ; 009A _ 01. C8
        movzx   eax, byte [eax]                         ; 009C _ 0F B6. 00
        mov     byte [edx], al                          ; 009F _ 88. 02
        mov     eax, dword [ebp-0CH]                    ; 00A1 _ 8B. 45, F4
        add     eax, eax                                ; 00A4 _ 01. C0
        lea     edx, [eax+1H]                           ; 00A6 _ 8D. 50, 01
        mov     eax, dword [ebp-10H]                    ; 00A9 _ 8B. 45, F0
        add     eax, edx                                ; 00AC _ 01. D0
        mov     byte [eax], 10                          ; 00AE _ C6. 00, 0A
        add     dword [ebp-0CH], 1                      ; 00B1 _ 83. 45, F4, 01
?_002:  cmp     dword [ebp-0CH], 19                     ; 00B5 _ 83. 7D, F4, 13
        jle     ?_001                                   ; 00B9 _ 7E, CD
        mov     eax, dword [ebp-10H]                    ; 00BB _ 8B. 45, F0
        add     eax, 100                                ; 00BE _ 83. C0, 64
        mov     byte [eax], 78                          ; 00C1 _ C6. 00, 4E
        mov     eax, dword [ebp-10H]                    ; 00C4 _ 8B. 45, F0
        add     eax, 101                                ; 00C7 _ 83. C0, 65
        mov     byte [eax], 10                          ; 00CA _ C6. 00, 0A
        mov     eax, dword [ebp-10H]                    ; 00CD _ 8B. 45, F0
        lea     edx, [eax+66H]                          ; 00D0 _ 8D. 50, 66
        movzx   eax, byte [ebp-30H]                     ; 00D3 _ 0F B6. 45, D0
        mov     byte [edx], al                          ; 00D7 _ 88. 02
        mov     eax, dword [ebp-10H]                    ; 00D9 _ 8B. 45, F0
        add     eax, 103                                ; 00DC _ 83. C0, 67
        mov     byte [eax], 10                          ; 00DF _ C6. 00, 0A
        mov     eax, dword [ebp-10H]                    ; 00E2 _ 8B. 45, F0
        lea     edx, [eax+68H]                          ; 00E5 _ 8D. 50, 68
        movzx   eax, byte [ebp-2FH]                     ; 00E8 _ 0F B6. 45, D1
        mov     byte [edx], al                          ; 00EC _ 88. 02
        mov     eax, dword [ebp-10H]                    ; 00EE _ 8B. 45, F0
        add     eax, 105                                ; 00F1 _ 83. C0, 69
        mov     byte [eax], 10                          ; 00F4 _ C6. 00, 0A
        mov     eax, dword [ebp-10H]                    ; 00F7 _ 8B. 45, F0
        lea     edx, [eax+6AH]                          ; 00FA _ 8D. 50, 6A
        movzx   eax, byte [ebp-2EH]                     ; 00FD _ 0F B6. 45, D2
        mov     byte [edx], al                          ; 0101 _ 88. 02
        mov     eax, dword [ebp-10H]                    ; 0103 _ 8B. 45, F0
        add     eax, 107                                ; 0106 _ 83. C0, 6B
        mov     byte [eax], 10                          ; 0109 _ C6. 00, 0A
        mov     eax, dword [ebp-10H]                    ; 010C _ 8B. 45, F0
        lea     edx, [eax+6CH]                          ; 010F _ 8D. 50, 6C
        movzx   eax, byte [ebp-2DH]                     ; 0112 _ 0F B6. 45, D3
        mov     byte [edx], al                          ; 0116 _ 88. 02
        mov     eax, dword [ebp-10H]                    ; 0118 _ 8B. 45, F0
        add     eax, 109                                ; 011B _ 83. C0, 6D
        mov     byte [eax], 10                          ; 011E _ C6. 00, 0A
        mov     eax, dword [ebp-10H]                    ; 0121 _ 8B. 45, F0
        lea     edx, [eax+70H]                          ; 0124 _ 8D. 50, 70
        movzx   eax, byte [ebp-2BH]                     ; 0127 _ 0F B6. 45, D5
        mov     byte [edx], al                          ; 012B _ 88. 02
        mov     eax, dword [ebp-10H]                    ; 012D _ 8B. 45, F0
        add     eax, 113                                ; 0130 _ 83. C0, 71
        mov     byte [eax], 10                          ; 0133 _ C6. 00, 0A
        mov     dword [esp+8H], 18                      ; 0136 _ C7. 44 24, 08, 00000012
        mov     dword [esp+4H], 18                      ; 013E _ C7. 44 24, 04, 00000012
        mov     dword [esp], 83                         ; 0146 _ C7. 04 24, 00000053
        call    _goto_print                             ; 014D _ E8, 00000159
        mov     dword [esp+8H], 18                      ; 0152 _ C7. 44 24, 08, 00000012
        mov     dword [esp+4H], 19                      ; 015A _ C7. 44 24, 04, 00000013
        mov     dword [esp], 97                         ; 0162 _ C7. 04 24, 00000061
        call    _goto_print                             ; 0169 _ E8, 0000013D
        mov     dword [esp+8H], 18                      ; 016E _ C7. 44 24, 08, 00000012
        mov     dword [esp+4H], 20                      ; 0176 _ C7. 44 24, 04, 00000014
        mov     dword [esp], 105                        ; 017E _ C7. 04 24, 00000069
        call    _goto_print                             ; 0185 _ E8, 00000121
        mov     dword [esp+8H], 18                      ; 018A _ C7. 44 24, 08, 00000012
        mov     dword [esp+4H], 21                      ; 0192 _ C7. 44 24, 04, 00000015
        mov     dword [esp], 109                        ; 019A _ C7. 04 24, 0000006D
        call    _goto_print                             ; 01A1 _ E8, 00000105
?_003:  jmp     ?_003                                   ; 01A6 _ EB, FE

_help:  ; Function begin
        push    ebp                                     ; 01A8 _ 55
        mov     ebp, esp                                ; 01A9 _ 89. E5
        sub     esp, 72                                 ; 01AB _ 83. EC, 48
        mov     eax, dword [?_006]                      ; 01AE _ A1, 00000000(d)
        mov     dword [ebp-31H], eax                    ; 01B3 _ 89. 45, CF
        mov     eax, dword [?_007]                      ; 01B6 _ A1, 00000004(d)
        mov     dword [ebp-2DH], eax                    ; 01BB _ 89. 45, D3
        mov     eax, dword [?_008]                      ; 01BE _ A1, 00000008(d)
        mov     dword [ebp-29H], eax                    ; 01C3 _ 89. 45, D7
        mov     eax, dword [?_009]                      ; 01C6 _ A1, 0000000C(d)
        mov     dword [ebp-25H], eax                    ; 01CB _ 89. 45, DB
        mov     eax, dword [?_010]                      ; 01CE _ A1, 00000010(d)
        mov     dword [ebp-21H], eax                    ; 01D3 _ 89. 45, DF
        mov     eax, dword [?_011]                      ; 01D6 _ A1, 00000014(d)
        mov     dword [ebp-1DH], eax                    ; 01DB _ 89. 45, E3
        mov     eax, dword [?_012]                      ; 01DE _ A1, 00000018(d)
        mov     dword [ebp-19H], eax                    ; 01E3 _ 89. 45, E7
        mov     eax, dword [?_013]                      ; 01E6 _ A1, 0000001C(d)
        mov     dword [ebp-15H], eax                    ; 01EB _ 89. 45, EB
        movzx   eax, byte [?_014]                       ; 01EE _ 0F B6. 05, 00000020(d)
        mov     byte [ebp-11H], al                      ; 01F5 _ 88. 45, EF
        lea     eax, [ebp-31H]                          ; 01F8 _ 8D. 45, CF
        mov     dword [ebp-0CH], eax                    ; 01FB _ 89. 45, F4
        mov     dword [ebp-10H], 0                      ; 01FE _ C7. 45, F0, 00000000
        jmp     ?_005                                   ; 0205 _ EB, 28

?_004:  mov     eax, dword [ebp-0CH]                    ; 0207 _ 8B. 45, F4
        movzx   eax, byte [eax]                         ; 020A _ 0F B6. 00
        movsx   eax, al                                 ; 020D _ 0F BE. C0
        mov     dword [esp+8H], 10                      ; 0210 _ C7. 44 24, 08, 0000000A
        mov     edx, dword [ebp-10H]                    ; 0218 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 021B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 021F _ 89. 04 24
        call    _goto_print                             ; 0222 _ E8, 00000084
        add     dword [ebp-10H], 1                      ; 0227 _ 83. 45, F0, 01
        add     dword [ebp-0CH], 1                      ; 022B _ 83. 45, F4, 01
?_005:  mov     eax, dword [ebp-0CH]                    ; 022F _ 8B. 45, F4
        movzx   eax, byte [eax]                         ; 0232 _ 0F B6. 00
        test    al, al                                  ; 0235 _ 84. C0
        jnz     ?_004                                   ; 0237 _ 75, CE
        mov     dword [esp+8H], 15                      ; 0239 _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], 20                      ; 0241 _ C7. 44 24, 04, 00000014
        mov     dword [esp], 78                         ; 0249 _ C7. 04 24, 0000004E
        call    _goto_print                             ; 0250 _ E8, 00000056
        mov     dword [esp+8H], 15                      ; 0255 _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], 21                      ; 025D _ C7. 44 24, 04, 00000015
        mov     dword [esp], 105                        ; 0265 _ C7. 04 24, 00000069
        call    _goto_print                             ; 026C _ E8, 0000003A
        mov     dword [esp+8H], 15                      ; 0271 _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], 22                      ; 0279 _ C7. 44 24, 04, 00000016
        mov     dword [esp], 115                        ; 0281 _ C7. 04 24, 00000073
        call    _goto_print                             ; 0288 _ E8, 0000001E
        mov     dword [esp+8H], 15                      ; 028D _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], 23                      ; 0295 _ C7. 44 24, 04, 00000017
        mov     dword [esp], 97                         ; 029D _ C7. 04 24, 00000061
        call    _goto_print                             ; 02A4 _ E8, 00000002
        leave                                           ; 02A9 _ C9
        ret                                             ; 02AA _ C3
; _help End of function

_goto_print:; Function begin
        push    ebp                                     ; 02AB _ 55
        mov     ebp, esp                                ; 02AC _ 89. E5
        sub     esp, 20                                 ; 02AE _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 02B1 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 02B4 _ 88. 45, EC
        mov     dword [ebp-4H], 753664                  ; 02B7 _ C7. 45, FC, 000B8000
        mov     edx, dword [ebp+10H]                    ; 02BE _ 8B. 55, 10
        mov     eax, edx                                ; 02C1 _ 89. D0
        shl     eax, 2                                  ; 02C3 _ C1. E0, 02
        add     eax, edx                                ; 02C6 _ 01. D0
        shl     eax, 4                                  ; 02C8 _ C1. E0, 04
        mov     edx, eax                                ; 02CB _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 02CD _ 8B. 45, 0C
        add     eax, edx                                ; 02D0 _ 01. D0
        mov     edx, eax                                ; 02D2 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 02D4 _ 8B. 45, FC
        add     edx, eax                                ; 02D7 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 02D9 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 02DD _ 88. 02
        mov     edx, dword [ebp+10H]                    ; 02DF _ 8B. 55, 10
        mov     eax, edx                                ; 02E2 _ 89. D0
        shl     eax, 2                                  ; 02E4 _ C1. E0, 02
        add     eax, edx                                ; 02E7 _ 01. D0
        shl     eax, 4                                  ; 02E9 _ C1. E0, 04
        mov     edx, eax                                ; 02EC _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 02EE _ 8B. 45, 0C
        add     eax, edx                                ; 02F1 _ 01. D0
        lea     edx, [eax+1H]                           ; 02F3 _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 02F6 _ 8B. 45, FC
        add     eax, edx                                ; 02F9 _ 01. D0
        mov     byte [eax], 10                          ; 02FB _ C6. 00, 0A
        leave                                           ; 02FE _ C9
        ret                                             ; 02FF _ C3
; _goto_print End of function


SECTION .data   align=4 noexecute                       ; section number 2, data


SECTION .bss    align=4 noexecute                       ; section number 3, bss


SECTION .rdata  align=4 noexecute                       ; section number 4, const

?_006:                                                  ; dword
        dd 73696854H                                    ; 0000 _ 1936287828 

?_007:  dd 20736920H                                    ; 0004 _ 544434464 

?_008:  dd 65206E61H                                    ; 0008 _ 1696624225 

?_009:  dd 72657078H                                    ; 000C _ 1919250552 

?_010:  dd 6E656D69H                                    ; 0010 _ 1852140905 

?_011:  dd 206C6174H                                    ; 0014 _ 543973748 

?_012:  dd 6E72656BH                                    ; 0018 _ 1852990827 

?_013:  dd 00216C65H                                    ; 001C _ 2190437 

?_014:  db 00H, 00H, 00H, 00H                           ; 0020 _ ....


SECTION .rdata$zzz align=4 noexecute                    ; section number 5, const

        db 47H, 43H, 43H, 3AH, 20H, 28H, 47H, 4EH       ; 0000 _ GCC: (GN
        db 55H, 29H, 20H, 34H, 2EH, 39H, 2EH, 33H       ; 0008 _ U) 4.9.3
        db 00H, 00H, 00H, 00H                           ; 0010 _ ....


