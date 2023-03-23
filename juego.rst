ASxxxx Assembler V05.00  (Motorola 6809), page 1.
Hexidecimal [16-Bits]



                              1     .module juego
                              2 
                     FF00     3 pantalla    .equ 0XFF00
                     FF02     4 teclado     .equ 0XFF02
                              5 
                              6     .globl juego_principal
                              7     .globl imprime_cadena
                              8     .globl imprime_cadena_juego
                              9     .globl imprime_decimal
                             10     .globl vector_tablero
                             11     .globl palabras
                             12     .globl programapp
                             13     .globl palabra_aleatoria
                             14     .globl pide_letra
                             15     .globl titulo_juego
                             16     .globl palabra_a_comprobar
                             17     .globl comprobar_palabra
                             18     .globl pos_b
                             19     .globl cont
                             20     .globl final_juego
                             21     .globl confirmacion
                             22 
                             23 
   04FE 00                   24 pos_inicial:	.byte	0
   04FF 00                   25 count:		.byte	0		
   0500 00                   26 count_tablero:	.byte	0		
   0501 00                   27 cinco:		.byte   0		
   0502 00                   28 numpal:		.byte   0
   0503 00                   29 pos_b:		.byte   0
   0504 00                   30 cont:   .byte 0
   0505 00 00                31 letra: .word 0
   0507 30                   32 intentos: .byte 48
   0508 00                   33 letra_volver: .byte 0
                             34 
                             35 
   0509 0A 49 6E 74 72 6F    36 pide: .asciz "\nIntroduzca letra mayuscula (Presione espacio para borrar):"
        64 75 7A 63 61 20
        6C 65 74 72 61 20
        6D 61 79 75 73 63
        75 6C 61 20 28 50
        72 65 73 69 6F 6E
        65 20 65 73 70 61
        63 69 6F 20 70 61
        72 61 20 62 6F 72
        72 61 72 29 3A 00
   0545 0A 0A 20 20 7C 20    37 titulo_juego:   .ascii "\n\n  | JUEGO |\n"
        4A 55 45 47 4F 20
        7C 0A
   0553 2D 2D 2D 2D 2D 2D    38                 .ascii "-----------\n"
        2D 2D 2D 2D 2D 0A
   055F 20 20 7C 20 31 32    39                 .ascii "  | 12345 |\n"
        33 34 35 20 7C 0A
   056B 2D 2D 2D 2D 2D 2D    40                 .asciz "-----------\n"
        2D 2D 2D 2D 2D 0A
        00
ASxxxx Assembler V05.00  (Motorola 6809), page 2.
Hexidecimal [16-Bits]



   0578 50 75 6C 73 61 72    41 mensaje_salir: 		.asciz	"Pulsar V para volver al menu, R para reiniciar, otro para continuar\n"
        20 56 20 70 61 72
        61 20 76 6F 6C 76
        65 72 20 61 6C 20
        6D 65 6E 75 2C 20
        52 20 70 61 72 61
        20 72 65 69 6E 69
        63 69 61 72 2C 20
        6F 74 72 6F 20 70
        61 72 61 20 63 6F
        6E 74 69 6E 75 61
        72 0A 00
   05BD 0A 49 6E 74 72 6F    42 numero_palabra:		.asciz "\nIntroduce un numero (entre 0 y 9):"
        64 75 63 65 20 75
        6E 20 6E 75 6D 65
        72 6F 20 28 65 6E
        74 72 65 20 30 20
        79 20 39 29 3A 00
   05E1 0A 1B 5B 33 31 6D    43 mensaje_perdido:    .asciz "\n\33[31mHas perdido!!\33[37m\nLa palabra era: "
        48 61 73 20 70 65
        72 64 69 64 6F 21
        21 1B 5B 33 37 6D
        0A 4C 61 20 70 61
        6C 61 62 72 61 20
        65 72 61 3A 20 00
                             44 
   060B                      45 palabra_a_comprobar:
   060B 5F 5F 5F 5F 5F 00    46         .asciz "_____"
                             47 
   0611                      48 juego_principal:
   0611 10 CE F0 00   [ 4]   49     lds     #0XF000
   0615 C6 00         [ 2]   50     ldb #0
   0617 4F            [ 2]   51     clra
   0618 B6 05 08      [ 5]   52     lda     letra_volver
   061B F7 05 08      [ 5]   53     stb     letra_volver
   061E 81 01         [ 2]   54     cmpa    #1
   0620 27 3E         [ 3]   55     beq     juego_ppal
   0622                      56     elegir_palabra:
   0622 8E 05 BD      [ 3]   57         ldx     #numero_palabra
   0625 BD 04 9E      [ 8]   58         jsr     imprime_cadena
   0628 B6 FF 02      [ 5]   59         lda     teclado
   062B 81 30         [ 2]   60         cmpa    #'0
   062D 25 F3         [ 3]   61         blo     elegir_palabra
   062F 81 39         [ 2]   62         cmpa    #'9
   0631 22 EF         [ 3]   63         bhi     elegir_palabra
   0633 B7 05 02      [ 5]   64         sta     numpal
                             65 
                             66         
   0636                      67     contar_palabras:
   0636                      68         bucle_contador:
   0636 C6 30         [ 2]   69             ldb #48
                             70                   
   0638 8E 03 CF      [ 3]   71             ldx     #palabras 
                             72 
   063B                      73             ic_sgte_contador_palabra:
ASxxxx Assembler V05.00  (Motorola 6809), page 3.
Hexidecimal [16-Bits]



   063B A6 80         [ 6]   74                 lda     ,x+
   063D 81 0A         [ 2]   75                 cmpa    #'\n
   063F 27 02         [ 3]   76                 beq     contador_palabra   
   0641 20 F8         [ 3]   77                 bra     ic_sgte_contador_palabra
   0643                      78             contador_palabra:
   0643 5C            [ 2]   79                 incb
   0644 F1 05 02      [ 5]   80                 cmpb    numpal
   0647 27 02         [ 3]   81                 beq     cargar_palabra
   0649 20 F0         [ 3]   82                 bra     ic_sgte_contador_palabra
   064B                      83             cargar_palabra:
   064B 5F            [ 2]   84                 clrb
   064C                      85                 cargar:    
   064C A6 80         [ 6]   86                     lda     ,x+
   064E 34 10         [ 6]   87                     pshs    x
   0650 8E 03 50      [ 3]   88                     ldx     #palabra_aleatoria
   0653 A7 85         [ 5]   89                     sta     b,x
   0655 35 10         [ 6]   90                     puls    x
   0657 5C            [ 2]   91                     incb
   0658 81 0A         [ 2]   92                     cmpa    #'\n
   065A 27 02         [ 3]   93                     beq     final_bucle
   065C 20 EE         [ 3]   94                     bra     cargar
                             95                 
   065E                      96             final_bucle:
   065E 20 00         [ 3]   97                 bra juego_ppal
                             98 
   0660                      99 juego_ppal:
   0660 10 CE F0 00   [ 4]  100     lds     #0XF000
   0664 5F            [ 2]  101     clrb
   0665 4F            [ 2]  102     clra
   0666                     103     bucle_pide:
   0666 20 00         [ 3]  104         bra     pide_letra
                            105 
   0668                     106     pide_letra:  
   0668 F6 05 03      [ 5]  107         ldb     pos_b
   066B C1 19         [ 2]  108         cmpb    #25
   066D 27 21         [ 3]  109         beq     has_perdido      
   066F 8E 05 09      [ 3]  110         ldx     #pide
   0672 BD 04 9E      [ 8]  111         jsr     imprime_cadena
   0675 B6 FF 02      [ 5]  112         lda     teclado
   0678 B7 05 05      [ 5]  113         sta     letra
   067B 81 20         [ 2]  114         cmpa    #' 
   067D 27 44         [ 3]  115         beq     quitar_letra
   067F F6 05 04      [ 5]  116         ldb cont
   0682 8E 06 0B      [ 3]  117         ldx #palabra_a_comprobar
   0685 A7 85         [ 5]  118         sta b,x  
   0687 5C            [ 2]  119         incb
   0688 F7 05 04      [ 5]  120         stb cont
                            121         
                            122         
   068B 16 00 7D      [ 5]  123         lbra     bucle_insertar
   068E 20 D6         [ 3]  124         bra     bucle_pide
   0690                     125     has_perdido:
   0690 8E 05 E1      [ 3]  126         ldx     #mensaje_perdido
   0693 BD 04 9E      [ 8]  127         jsr     imprime_cadena
   0696 8E 03 50      [ 3]  128         ldx     #palabra_aleatoria
ASxxxx Assembler V05.00  (Motorola 6809), page 4.
Hexidecimal [16-Bits]



   0699 BD 04 9E      [ 8]  129         jsr     imprime_cadena
   069C 8E 04 46      [ 3]  130         ldx     #confirmacion
   069F BD 04 9E      [ 8]  131         jsr     imprime_cadena
   06A2 B6 FF 02      [ 5]  132         lda		teclado
   06A5 BD 08 8F      [ 8]  133         jsr		final_juego
   06A8                     134     pal_cmp:
   06A8 BD 08 16      [ 8]  135         jsr comprobar_palabra
   06AB 20 02         [ 3]  136         bra limpiar_cont
   06AD 20 B7         [ 3]  137         bra bucle_pide
                            138 
   06AF                     139     limpiar_cont:
   06AF 8E 06 0B      [ 3]  140         ldx #palabra_a_comprobar
   06B2 F6 05 04      [ 5]  141         ldb cont
   06B5 5A            [ 2]  142         decb 
   06B6 86 5F         [ 2]  143         lda #'_
   06B8 A7 85         [ 5]  144         sta b,x
   06BA F7 05 04      [ 5]  145         stb cont
   06BD C1 00         [ 2]  146         cmpb #0
   06BF 22 EE         [ 3]  147         bhi limpiar_cont
   06C1 20 A5         [ 3]  148         bra pide_letra
   06C3                     149     quitar_letra:
                            150 
   06C3 F6 05 03      [ 5]  151         ldb pos_b
   06C6 C1 00         [ 2]  152         cmpb    #0
   06C8 27 9C         [ 3]  153         beq     bucle_pide
   06CA C1 05         [ 2]  154         cmpb    #5
   06CC 27 98         [ 3]  155         beq     bucle_pide
   06CE C1 0A         [ 2]  156         cmpb    #10
   06D0 27 94         [ 3]  157         beq     bucle_pide
   06D2 C1 0F         [ 2]  158         cmpb    #15
   06D4 27 90         [ 3]  159         beq     bucle_pide
   06D6 C1 14         [ 2]  160         cmpb    #20
   06D8 27 8C         [ 3]  161         beq     bucle_pide
   06DA 5A            [ 2]  162         decb
   06DB 86 5F         [ 2]  163         lda     #'_
   06DD 8E 03 57      [ 3]  164         ldx     #vector_tablero
   06E0 A7 85         [ 5]  165         sta     b,x
   06E2 F7 05 03      [ 5]  166         stb     pos_b
   06E5 8E 06 0B      [ 3]  167         ldx     #palabra_a_comprobar
   06E8 F6 05 04      [ 5]  168         ldb     cont
   06EB 5A            [ 2]  169         decb
   06EC A7 85         [ 5]  170         sta     b,x
   06EE F7 05 04      [ 5]  171         stb     cont
   06F1 F6 05 03      [ 5]  172         ldb     pos_b
   06F4 8E 05 45      [ 3]  173         ldx     #titulo_juego
   06F7 BD 04 9E      [ 8]  174         jsr     imprime_cadena
   06FA BD 07 50      [ 8]  175         jsr     interfaz_tablero
   06FD 16 00 23      [ 5]  176         lbra     bucle_turno
   0700 16 FF 63      [ 5]  177         lbra     bucle_pide
   0703                     178     fin_bucle:
   0703 86 01         [ 2]  179         lda #1
   0705 B7 05 08      [ 5]  180         sta letra_volver
   0708 BD 03 76      [ 8]  181         jsr programapp
                            182 
   070B                     183     bucle_insertar:
ASxxxx Assembler V05.00  (Motorola 6809), page 5.
Hexidecimal [16-Bits]



   070B 8E 05 45      [ 3]  184         ldx     #titulo_juego
   070E BD 04 9E      [ 8]  185         jsr     imprime_cadena
                            186 
   0711 B6 05 05      [ 5]  187         lda letra
                            188 
   0714 F6 05 03      [ 5]  189         ldb     pos_b
   0717 8E 03 57      [ 3]  190         ldx #vector_tablero
   071A A7 85         [ 5]  191         sta b,x
   071C 5C            [ 2]  192         incb
   071D F7 05 03      [ 5]  193         stb pos_b
                            194        
                            195 
   0720 BD 07 50      [ 8]  196         jsr     interfaz_tablero
                            197 
   0723                     198         bucle_turno: 
   0723 86 0A         [ 2]  199             lda 	#'\n					
   0725 B7 FF 00      [ 5]  200             sta 	pantalla
   0728 8E 05 78      [ 3]  201             ldx 	#mensaje_salir
   072B BD 04 9E      [ 8]  202             jsr 	imprime_cadena		
   072E B6 FF 02      [ 5]  203             lda 	teclado
   0731 81 76         [ 2]  204             cmpa	#'v
   0733 10 27 FF CC   [ 6]  205             lbeq 	fin_bucle			;Si se introduce V o v se sale al menu
   0737 81 56         [ 2]  206             cmpa 	#'V
   0739 10 27 FF C6   [ 6]  207             lbeq 	fin_bucle
   073D 81 72         [ 2]  208             cmpa    #'r
   073F 27 0C         [ 3]  209             beq     juego_final
   0741 81 52         [ 2]  210             cmpa    #'R
   0743 27 08         [ 3]  211             beq     juego_final
                            212 
   0745 86 0A         [ 2]  213             lda 	#'\n					
   0747 B7 FF 00      [ 5]  214             sta 	pantalla
   074A 16 FF 19      [ 5]  215             lbra bucle_pide
                            216 
                            217 
   074D                     218 juego_final:
   074D BD 08 8F      [ 8]  219     jsr     final_juego
   0750                     220 interfaz_tablero:
   0750 36 16         [ 8]  221 	pshu	a,x,b	
                            222 							;Crea el contorno o interfaz grafica del tablero con los guiones
   0752 F6 04 FE      [ 5]  223 	ldb	pos_inicial
   0755 8E 03 57      [ 3]  224 	ldx	#vector_tablero
   0758 B6 05 01      [ 5]  225 	lda	cinco					
   075B 8B 05         [ 2]  226 	adda	#5
   075D B7 05 01      [ 5]  227 	sta	cinco					;Variable inicializada a 6 representando el limite de columnas de cada fila(nCOL-1)
   0760                     228 empieza_tablero:
   0760 B6 05 00      [ 5]  229 	lda	count_tablero				;Contador que imprime las 6 filas del tablero original
   0763 81 05         [ 2]  230 	cmpa	#5
   0765 27 43         [ 3]  231 	beq	mitad_tablero
   0767 8B 31         [ 2]  232     adda #'1
   0769 B7 FF 00      [ 5]  233     sta pantalla
   076C 86 20         [ 2]  234     lda	#' 
   076E B7 FF 00      [ 5]  235 	sta	pantalla
   0771 86 7C         [ 2]  236     lda #'|
   0773 B7 FF 00      [ 5]  237     sta pantalla
   0776 86 20         [ 2]  238 	lda	#' 
ASxxxx Assembler V05.00  (Motorola 6809), page 6.
Hexidecimal [16-Bits]



   0778 B7 FF 00      [ 5]  239 	sta	pantalla    
                            240     
   077B                     241 bucle_seguir:
   077B A6 85         [ 5]  242 	lda 	b,x					;Imprime lo que hay en las posiciones de la fila
   077D B7 FF 00      [ 5]  243 	sta	pantalla
                            244 	
   0780 5C            [ 2]  245 	incb
   0781 F1 05 01      [ 5]  246 	cmpb	cinco					;B hasta 6(1ª iteracion),13(2ª iteracion),...
   0784 27 02         [ 3]  247 	beq	seguir_bucle
   0786 20 F3         [ 3]  248 	bra	bucle_seguir
   0788                     249 seguir_bucle:
   0788 86 20         [ 2]  250 	lda	#' 
   078A B7 FF 00      [ 5]  251 	sta	pantalla	
   078D 86 7C         [ 2]  252 	lda	#'|
   078F B7 FF 00      [ 5]  253 	sta	pantalla
   0792 86 0A         [ 2]  254 	lda	#'\n
   0794 B7 FF 00      [ 5]  255 	sta	pantalla
                            256 	
   0797 4F            [ 2]  257 	clra
                            258 	
   0798 B6 05 00      [ 5]  259 	lda	count_tablero
   079B 4C            [ 2]  260 	inca
   079C B7 05 00      [ 5]  261 	sta	count_tablero
                            262 	
   079F 4F            [ 2]  263 	clra
                            264 
   07A0 B6 05 01      [ 5]  265 	lda	cinco					;Al aumentar la variable cada 5 voy representando todas las columnas
   07A3 8B 05         [ 2]  266 	adda	#5
   07A5 B7 05 01      [ 5]  267 	sta	cinco
                            268 
   07A8 20 B6         [ 3]  269 	bra	empieza_tablero				;Al final de cada iteracion deberia representar esto: *_______* hasta llegar a 6 iteraciones
   07AA                     270 mitad_tablero:
   07AA 7F 04 FF      [ 7]  271 	clr	count					;Liberamos el contenido de la variable count para asegurarnos que no queda nada para el siguient bucle
                            272 
                            273 
                            274 
   07AD                     275 retorno_tablero:
   07AD 86 0A         [ 2]  276 	lda	#'\n
   07AF B7 FF 00      [ 5]  277 	sta	pantalla
                            278 
   07B2 F6 05 04      [ 5]  279     ldb cont
   07B5 C1 05         [ 2]  280     cmpb #5
   07B7 10 27 FE ED   [ 6]  281     lbeq pal_cmp
                            282 	
                            283 
   07BB 7F 04 FF      [ 7]  284 	clr	count
   07BE 7F 05 00      [ 7]  285 	clr	count_tablero
   07C1 7F 05 01      [ 7]  286 	clr	cinco	
   07C4 37 16         [ 8]  287 	pulu	x,a,b
   07C6 39            [ 5]  288 	rts
                            289 
                            290 
                            291 
                            292 
                            293 
ASxxxx Assembler V05.00  (Motorola 6809), page 7.
Hexidecimal [16-Bits]



                            294 
                            295 
ASxxxx Assembler V05.00  (Motorola 6809), page 8.
Hexidecimal [16-Bits]

Symbol Table

    .__.$$$.       =   2710 L   |     .__.ABS.       =   0000 G
    .__.CPU.       =   0000 L   |     .__.H$L.       =   0001 L
  0 bucle_contador     0138 GR  |   0 bucle_insertar     020D GR
  0 bucle_pide         0168 GR  |   0 bucle_seguir       027D GR
  0 bucle_turno        0225 GR  |   0 cargar             014E GR
  0 cargar_palabra     014D GR  |   0 cinco              0003 GR
    comprobar_pala     **** GX  |     confirmacion       **** GX
  0 cont               0006 GR  |   0 contador_palab     0145 GR
  0 contar_palabra     0138 GR  |   0 count              0001 GR
  0 count_tablero      0002 GR  |   0 elegir_palabra     0124 GR
  0 empieza_tabler     0262 GR  |   0 fin_bucle          0205 GR
  0 final_bucle        0160 GR  |     final_juego        **** GX
  0 has_perdido        0192 GR  |   0 ic_sgte_contad     013D GR
    imprime_cadena     **** GX  |     imprime_cadena     **** GX
    imprime_decima     **** GX  |   0 intentos           0009 GR
  0 interfaz_table     0252 GR  |   0 juego_final        024F GR
  0 juego_ppal         0162 GR  |   0 juego_principa     0113 GR
  0 letra              0007 GR  |   0 letra_volver       000A GR
  0 limpiar_cont       01B1 GR  |   0 mensaje_perdid     00E3 GR
  0 mensaje_salir      007A GR  |   0 mitad_tablero      02AC GR
  0 numero_palabra     00BF GR  |   0 numpal             0004 GR
  0 pal_cmp            01AA GR  |   0 palabra_a_comp     010D GR
    palabra_aleato     **** GX  |     palabras           **** GX
    pantalla       =   FF00 G   |   0 pide               000B GR
  0 pide_letra         016A GR  |   0 pos_b              0005 GR
  0 pos_inicial        0000 GR  |     programapp         **** GX
  0 quitar_letra       01C5 GR  |   0 retorno_tabler     02AF GR
  0 seguir_bucle       028A GR  |     teclado        =   FF02 G
  0 titulo_juego       0047 GR  |     vector_tablero     **** GX

ASxxxx Assembler V05.00  (Motorola 6809), page 9.
Hexidecimal [16-Bits]

Area Table

[_CSEG]
   0 _CODE            size  2C9   flags C180
[_DSEG]
   1 _DATA            size    0   flags C0C0

