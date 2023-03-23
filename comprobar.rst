ASxxxx Assembler V05.00  (Motorola 6809), page 1.
Hexidecimal [16-Bits]



                              1     .module comprobar
                              2 
                     FF00     3 pantalla    .equ 0XFF00
                     FF02     4 teclado     .equ 0XFF02
                              5 
                              6     .globl pide_letra
                              7     .globl palabra_aleatoria
                              8     .globl count
                              9     .globl count_tablero
                             10     .globl cinco
                             11     .globl imprime_cadena
                             12     .globl pos_inicial
                             13     .globl vector_tablero
                             14     .globl titulo_juego
                             15     .globl palabra_a_comprobar
                             16     .globl comprobar_palabra
                             17     .globl confirmacion
                             18     .globl pos_b
                             19     .globl programapp
                             20     .globl final_juego
                             21 
   07C7 00                   22 pos_l:		.byte   0
   07C8 00                   23 pos_l2:		.byte   0
   07C9 00                   24 l_cmp:		.byte   0
   07CA 00                   25 contador_verde:     .byte 0
                             26 
                             27 	
   07CB 1B 5B 33 37 6D 00    28     blanco: .asciz "\33[37m"
   07D1 1B 5B 33 33 6D 00    29     amarillo: .asciz "\33[33m"
   07D7 1B 5B 33 32 6D 00    30     verde: .asciz "\33[32m"
   07DD 0A 48 61 73 20 67    31     mensaje_ganado: .asciz "\nHas ganado!!\n"
        61 6E 61 64 6F 21
        21 0A 00
   07EC 0A 43 6F 6D 70 72    32     mensaje_comprobacion: .asciz "\nComprobacion de la palabra introducida: "
        6F 62 61 63 69 6F
        6E 20 64 65 20 6C
        61 20 70 61 6C 61
        62 72 61 20 69 6E
        74 72 6F 64 75 63
        69 64 61 3A 20 00
                             33     
                             34 
   0816                      35 comprobar_palabra:
   0816 8E 07 EC      [ 3]   36     ldx     #mensaje_comprobacion
   0819 BD 04 9E      [ 8]   37     jsr     imprime_cadena
   081C 5F            [ 2]   38     clrb
   081D F7 07 CA      [ 5]   39     stb     contador_verde
   0820 8E 06 0B      [ 3]   40     ldx     #palabra_a_comprobar       
   0823 F7 07 C7      [ 5]   41     stb     pos_l
   0826 F7 07 C8      [ 5]   42     stb     pos_l2
   0829 10 8E 03 50   [ 4]   43     ldy     #palabra_aleatoria           
   082D                      44     bucle_x:
   082D 8E 06 0B      [ 3]   45         ldx     #palabra_a_comprobar
   0830 F6 07 C7      [ 5]   46         ldb     pos_l
   0833 A6 85         [ 5]   47         lda     b,x
ASxxxx Assembler V05.00  (Motorola 6809), page 2.
Hexidecimal [16-Bits]



   0835 B7 07 C9      [ 5]   48         sta     l_cmp
   0838 5C            [ 2]   49         incb 
   0839 F7 07 C7      [ 5]   50         stb     pos_l
   083C                      51         bucle_y:
   083C F6 07 C8      [ 5]   52             ldb     pos_l2
   083F A6 A5         [ 5]   53             lda     b,y
   0841 5C            [ 2]   54             incb 
   0842 F7 07 C8      [ 5]   55             stb     pos_l2
   0845 B1 07 C9      [ 5]   56             cmpa    l_cmp
   0848 27 06         [ 3]   57             beq     pertenece
   084A C1 05         [ 2]   58             cmpb    #5
   084C 27 58         [ 3]   59             beq     imprime_letra
   084E 20 EC         [ 3]   60             bra bucle_y
                             61 
   0850                      62     pertenece:
   0850 F1 07 C7      [ 5]   63         cmpb    pos_l
   0853 27 0D         [ 3]   64         beq     imprime_verde
   0855 F1 07 C7      [ 5]   65         cmpb    pos_l
   0858 26 00         [ 3]   66         bne     imprime_amarillo
                             67 
   085A                      68     imprime_amarillo:
   085A 8E 07 D1      [ 3]   69         ldx     #amarillo
   085D BD 04 9E      [ 8]   70         jsr     imprime_cadena
   0860 20 44         [ 3]   71         bra     imprime_letra
   0862                      72     imprime_verde:
   0862 8E 07 D7      [ 3]   73         ldx     #verde
   0865 BD 04 9E      [ 8]   74         jsr     imprime_cadena
   0868 F6 07 CA      [ 5]   75         ldb     contador_verde
   086B 5C            [ 2]   76         incb
   086C F7 07 CA      [ 5]   77         stb     contador_verde
   086F 20 35         [ 3]   78         bra     imprime_letra
   0871                      79     has_ganado:
   0871 8E 07 D7      [ 3]   80         ldx     #verde
   0874 BD 04 9E      [ 8]   81         jsr     imprime_cadena
   0877 8E 07 DD      [ 3]   82         ldx     #mensaje_ganado
   087A BD 04 9E      [ 8]   83         jsr     imprime_cadena
   087D 8E 07 CB      [ 3]   84         ldx     #blanco
   0880 BD 04 9E      [ 8]   85         jsr     imprime_cadena
   0883 8E 04 46      [ 3]   86         ldx     #confirmacion
   0886 BD 04 9E      [ 8]   87         jsr     imprime_cadena
   0889 B6 FF 02      [ 5]   88         lda		teclado
   088C BD 08 8F      [ 8]   89         jsr		final_juego
   088F                      90     final_juego:
   088F F6 05 03      [ 5]   91         ldb     pos_b
   0892 8E 03 57      [ 3]   92         ldx     #vector_tablero
   0895 86 5F         [ 2]   93         lda     #'_
   0897 A7 85         [ 5]   94         sta     b,x
   0899 5A            [ 2]   95         decb
   089A F7 05 03      [ 5]   96         stb     pos_b
   089D C1 00         [ 2]   97         cmpb    #0
   089F 27 02         [ 3]   98         beq     programa_inicio
   08A1 20 EC         [ 3]   99         bra     final_juego
   08A3                     100     programa_inicio:
   08A3 BD 03 76      [ 8]  101         jsr		programapp
   08A6                     102     imprime_letra:
ASxxxx Assembler V05.00  (Motorola 6809), page 3.
Hexidecimal [16-Bits]



   08A6 B6 07 C9      [ 5]  103         lda     l_cmp
   08A9 B7 FF 00      [ 5]  104         sta     pantalla
   08AC 8E 07 CB      [ 3]  105         ldx     #blanco
   08AF BD 04 9E      [ 8]  106         jsr     imprime_cadena
   08B2 F6 07 CA      [ 5]  107         ldb     contador_verde
   08B5 C1 05         [ 2]  108         cmpb    #5
   08B7 27 B8         [ 3]  109         beq     has_ganado
   08B9 5F            [ 2]  110         clrb
   08BA F7 07 C8      [ 5]  111         stb     pos_l2
   08BD F6 07 C7      [ 5]  112         ldb     pos_l
   08C0 C1 05         [ 2]  113         cmpb    #5
   08C2 27 03         [ 3]  114         beq     final_comprobar
                            115 
   08C4 16 FF 66      [ 5]  116         lbra     bucle_x
                            117 
   08C7                     118     final_comprobar:
   08C7 39            [ 5]  119         rts
                            120 
                            121 
                            122 
                            123     
                            124 
ASxxxx Assembler V05.00  (Motorola 6809), page 4.
Hexidecimal [16-Bits]

Symbol Table

    .__.$$$.       =   2710 L   |     .__.ABS.       =   0000 G
    .__.CPU.       =   0000 L   |     .__.H$L.       =   0001 L
  0 amarillo           000A GR  |   0 blanco             0004 GR
  0 bucle_x            0066 GR  |   0 bucle_y            0075 GR
    cinco              **** GX  |   0 comprobar_pala     004F GR
    confirmacion       **** GX  |   0 contador_verde     0003 GR
    count              **** GX  |     count_tablero      **** GX
  0 final_comproba     0100 GR  |   0 final_juego        00C8 GR
  0 has_ganado         00AA GR  |   0 imprime_amaril     0093 GR
    imprime_cadena     **** GX  |   0 imprime_letra      00DF GR
  0 imprime_verde      009B GR  |   0 l_cmp              0002 GR
  0 mensaje_compro     0025 GR  |   0 mensaje_ganado     0016 GR
    palabra_a_comp     **** GX  |     palabra_aleato     **** GX
    pantalla       =   FF00 G   |   0 pertenece          0089 GR
    pide_letra         **** GX  |     pos_b              **** GX
    pos_inicial        **** GX  |   0 pos_l              0000 GR
  0 pos_l2             0001 GR  |   0 programa_inici     00DC GR
    programapp         **** GX  |     teclado        =   FF02 G
    titulo_juego       **** GX  |     vector_tablero     **** GX
  0 verde              0010 GR

ASxxxx Assembler V05.00  (Motorola 6809), page 5.
Hexidecimal [16-Bits]

Area Table

[_CSEG]
   0 _CODE            size  101   flags C180
[_DSEG]
   1 _DATA            size    0   flags C0C0

