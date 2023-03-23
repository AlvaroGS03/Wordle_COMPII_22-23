ASxxxx Assembler V05.00  (Motorola 6809), page 1.
Hexidecimal [16-Bits]



                              1 ; Trabajo Computadores: wordle.asm
                              2         .module wordle
                     FF02     3 teclado     .equ 0XFF02     ; pide de teclado
                     FF00     4 pantalla    .equ 0XFF00     ; muestra en pantalla
                     FF01     5 fin         .equ 0xFF01
                              6 
   0000 0A 0A                 7 titulo: .ascii "\n\n"
   0002 1B 5B 33 32 6D 57     8         .ascii	      "\33[32mWWWWWWWWWWWWWWW  OOOOOOOOOOOO  RRRRRRRRRRRR  DDDDDDDDDDD  LLLLLLLLLL  EEEEEEEEEE\n"
        57 57 57 57 57 57
        57 57 57 57 57 57
        57 57 20 20 4F 4F
        4F 4F 4F 4F 4F 4F
        4F 4F 4F 4F 20 20
        52 52 52 52 52 52
        52 52 52 52 52 52
        20 20 44 44 44 44
        44 44 44 44 44 44
        44 20 20 4C 4C 4C
        4C 4C 4C 4C 4C 4C
        4C 20 20 45 45 45
        45 45 45 45 45 45
        45 0A
   0058 57 20 20 57 57 57     9 	.ascii        "W  WWWWWWWWW  W  OOO      OOO  R        RRR  D        DD  L   LLLLLL  E        E\n" 
        57 57 57 57 57 57
        20 20 57 20 20 4F
        4F 4F 20 20 20 20
        20 20 4F 4F 4F 20
        20 52 20 20 20 20
        20 20 20 20 52 52
        52 20 20 44 20 20
        20 20 20 20 20 20
        44 44 20 20 4C 20
        20 20 4C 4C 4C 4C
        4C 4C 20 20 45 20
        20 20 20 20 20 20
        20 45 0A
   00A9 57 57 20 20 57 57    10         .ascii        "WW  WWW WWW  WW  O    OO    O  R   RRRR   R  D   DD    D  L   LLLLLL  E   EEEEEE\n"
        57 20 57 57 57 20
        20 57 57 20 20 4F
        20 20 20 20 4F 4F
        20 20 20 20 4F 20
        20 52 20 20 20 52
        52 52 52 20 20 20
        52 20 20 44 20 20
        20 44 44 20 20 20
        20 44 20 20 4C 20
        20 20 4C 4C 4C 4C
        4C 4C 20 20 45 20
        20 20 45 45 45 45
        45 45 0A
   00FA 57 57 57 20 20 57    11         .ascii        "WWW  W   W  WWW  O   OOOO   O  R         RR  D   DDD   D  L   LLLLLL  E     EEEE\n"
        20 20 20 57 20 20
        57 57 57 20 20 4F
        20 20 20 4F 4F 4F
        4F 20 20 20 4F 20
ASxxxx Assembler V05.00  (Motorola 6809), page 2.
Hexidecimal [16-Bits]



        20 52 20 20 20 20
        20 20 20 20 20 52
        52 20 20 44 20 20
        20 44 44 44 20 20
        20 44 20 20 4C 20
        20 20 4C 4C 4C 4C
        4C 4C 20 20 45 20
        20 20 20 20 45 45
        45 45 0A
   014B 57 57 57 57 20 20    12         .ascii        "WWWW   W   WWWW  O    OO    O  R   RR   RRR  D   DD    D  L   LLLLLL  E   EEEEEE\n"
        20 57 20 20 20 57
        57 57 57 20 20 4F
        20 20 20 20 4F 4F
        20 20 20 20 4F 20
        20 52 20 20 20 52
        52 20 20 20 52 52
        52 20 20 44 20 20
        20 44 44 20 20 20
        20 44 20 20 4C 20
        20 20 4C 4C 4C 4C
        4C 4C 20 20 45 20
        20 20 45 45 45 45
        45 45 0A
   019C 57 57 57 57 57 20    13         .ascii        "WWWWW WWW WWWWW  OOO      OOO  R   RRR   RR  D        DD  L        L  E        E\n"
        57 57 57 20 57 57
        57 57 57 20 20 4F
        4F 4F 20 20 20 20
        20 20 4F 4F 4F 20
        20 52 20 20 20 52
        52 52 20 20 20 52
        52 20 20 44 20 20
        20 20 20 20 20 20
        44 44 20 20 4C 20
        20 20 20 20 20 20
        20 4C 20 20 45 20
        20 20 20 20 20 20
        20 45 0A
   01ED 57 57 57 57 57 57    14 	.asciz	      "WWWWWWWWWWWWWWW  OOOOOOOOOOOO  RRRRRRRRRRRR  DDDDDDDDDDD  LLLLLLLLLL  EEEEEEEEEE\n\33[37m"  
        57 57 57 57 57 57
        57 57 57 20 20 4F
        4F 4F 4F 4F 4F 4F
        4F 4F 4F 4F 4F 20
        20 52 52 52 52 52
        52 52 52 52 52 52
        52 20 20 44 44 44
        44 44 44 44 44 44
        44 44 20 20 4C 4C
        4C 4C 4C 4C 4C 4C
        4C 4C 20 20 45 45
        45 45 45 45 45 45
        45 45 0A 1B 5B 33
        37 6D 00
                             15 
   0244                      16 propiedad:
   0244 0A 20 20 20 20 20    17         .ascii "\n             ================================================="
ASxxxx Assembler V05.00  (Motorola 6809), page 3.
Hexidecimal [16-Bits]



        20 20 20 20 20 20
        20 20 3D 3D 3D 3D
        3D 3D 3D 3D 3D 3D
        3D 3D 3D 3D 3D 3D
        3D 3D 3D 3D 3D 3D
        3D 3D 3D 3D 3D 3D
        3D 3D 3D 3D 3D 3D
        3D 3D 3D 3D 3D 3D
        3D 3D 3D 3D 3D 3D
        3D 3D 3D
   0283 0A 20 20 20 20 20    18         .ascii "\n             CREADO POR IVAN GARCIA NIETO Y ALVARO GARCIA SAEZ"
        20 20 20 20 20 20
        20 20 43 52 45 41
        44 4F 20 50 4F 52
        20 49 56 41 4E 20
        47 41 52 43 49 41
        20 4E 49 45 54 4F
        20 59 20 41 4C 56
        41 52 4F 20 47 41
        52 43 49 41 20 53
        41 45 5A
   02C2 0A 20 20 20 20 20    19         .asciz "\n             =================================================\n\n"
        20 20 20 20 20 20
        20 20 3D 3D 3D 3D
        3D 3D 3D 3D 3D 3D
        3D 3D 3D 3D 3D 3D
        3D 3D 3D 3D 3D 3D
        3D 3D 3D 3D 3D 3D
        3D 3D 3D 3D 3D 3D
        3D 3D 3D 3D 3D 3D
        3D 3D 3D 3D 3D 3D
        3D 3D 3D 0A 0A 00
                             20 
                             21 
   0304                      22 menu:
   0304 1B 5B 33 34 6D 31    23         .ascii "\33[34m1)\33[37m Ver Diccionario\n"
        29 1B 5B 33 37 6D
        20 56 65 72 20 44
        69 63 63 69 6F 6E
        61 72 69 6F 0A
   0321 1B 5B 33 33 6D 32    24         .ascii "\33[33m2)\33[37m Jugar\n"
        29 1B 5B 33 37 6D
        20 4A 75 67 61 72
        0A
   0334 1B 5B 33 35 6D 33    25         .asciz "\33[35m3)\33[37m Salir\n"
        29 1B 5B 33 37 6D
        20 53 61 6C 69 72
        0A 00
                             26 
   0348 0A 1B 5B 32 4A 00    27 clearScreen:    .asciz  "\n\33[2J"
                             28 
   034E 0A                   29         .byte 10
   034F 00                   30         .byte 0
                             31 
                             32         .globl programapp
ASxxxx Assembler V05.00  (Motorola 6809), page 4.
Hexidecimal [16-Bits]



                             33         .globl programapala
                             34         .globl juego_principal
                             35         .globl imprime_cadena
                             36         .globl vector_tablero
                             37         .globl palabra_aleatoria
                             38         .globl programapp
                             39         .globl cont
                             40 
   0350                      41 palabra_aleatoria:
   0350 5F 5F 5F 5F 5F 5F    42         .asciz "______"
        00
                             43 
                             44 
   0357                      45 vector_tablero:
   0357 5F 5F 5F 5F 5F       46 	.ascii "_____"
   035C 5F 5F 5F 5F 5F       47 	.ascii "_____"
   0361 5F 5F 5F 5F 5F       48 	.ascii "_____"
   0366 5F 5F 5F 5F 5F       49 	.ascii "_____"
   036B 5F 5F 5F 5F 5F       50 	.ascii "_____"
   0370 5F 5F 5F 5F 5F 00    51 	.asciz "_____"
                             52 
   0376                      53 programapp:
   0376 10 CE F0 00   [ 4]   54         lds #0XF000
   037A 5F            [ 2]   55         clrb
   037B F7 05 04      [ 5]   56         stb cont
   037E 8E 03 48      [ 3]   57         ldx #clearScreen
   0381 BD 04 9E      [ 8]   58         jsr imprime_cadena
   0384 8E 00 00      [ 3]   59         ldx #titulo
   0387 BD 04 9E      [ 8]   60         jsr imprime_cadena
   038A 8E 02 44      [ 3]   61         ldx #propiedad
   038D BD 04 9E      [ 8]   62         jsr imprime_cadena
   0390 8E 03 04      [ 3]   63         ldx #menu
   0393 BD 04 9E      [ 8]   64         jsr imprime_cadena
   0396                      65 lee_dato:
   0396 B6 FF 02      [ 5]   66         lda teclado
   0399 81 31         [ 2]   67         cmpa #'1
   039B 25 D9         [ 3]   68         blo programapp
   039D 27 0C         [ 3]   69         beq diccionario
   039F 81 32         [ 2]   70         cmpa #'2
   03A1 27 0B         [ 3]   71         beq jugar
   03A3 81 33         [ 2]   72         cmpa #'3
   03A5 22 CF         [ 3]   73         bhi programapp
   03A7 27 0A         [ 3]   74         beq acabar
   03A9 20 EB         [ 3]   75         bra lee_dato
                             76 
   03AB                      77 diccionario:
   03AB BD 04 82      [ 8]   78         jsr programapala
                             79 
   03AE                      80 jugar:
   03AE BD 06 11      [ 8]   81         jsr juego_principal
   03B1 20 C3         [ 3]   82         bra programapp
                             83 
   03B3                      84 acabar:
   03B3 8E 03 48      [ 3]   85         ldx #clearScreen
   03B6 BD 04 9E      [ 8]   86         jsr imprime_cadena
ASxxxx Assembler V05.00  (Motorola 6809), page 5.
Hexidecimal [16-Bits]



   03B9 4F            [ 2]   87         clra
   03BA B7 FF 01      [ 5]   88         sta     fin
                             89 
                             90         .area FIJA(ABS)
   FFFE                      91         .org 0xFFFE         ; Vector de RESET
   FFFE 03 76                92         .word programapp
ASxxxx Assembler V05.00  (Motorola 6809), page 6.
Hexidecimal [16-Bits]

Symbol Table

    .__.$$$.       =   2710 L   |     .__.ABS.       =   0000 G
    .__.CPU.       =   0000 L   |     .__.H$L.       =   0001 L
  0 acabar             03B3 GR  |   0 clearScreen        0348 GR
    cont               **** GX  |   0 diccionario        03AB GR
    fin            =   FF01 G   |     imprime_cadena     **** GX
    juego_principa     **** GX  |   0 jugar              03AE GR
  0 lee_dato           0396 GR  |   0 menu               0304 GR
  0 palabra_aleato     0350 GR  |     pantalla       =   FF00 G
    programapala       **** GX  |   0 programapp         0376 GR
  0 propiedad          0244 GR  |     teclado        =   FF02 G
  0 titulo             0000 GR  |   0 vector_tablero     0357 GR

ASxxxx Assembler V05.00  (Motorola 6809), page 7.
Hexidecimal [16-Bits]

Area Table

[_CSEG]
   0 _CODE            size  3BD   flags C180
   2 FIJA             size    0   flags  908
[_DSEG]
   1 _DATA            size    0   flags C0C0

