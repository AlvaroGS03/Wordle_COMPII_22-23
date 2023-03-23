ASxxxx Assembler V05.00  (Motorola 6809), page 1.
Hexidecimal [16-Bits]



                              1 	.module diccionario
                              2 
                     FF02     3 teclado     .equ 0XFF02
                     FF00     4 pantalla    .equ 0XFF00
                              5 
                              6 	.globl palabras
                              7     .globl imprime_cadena
                              8     .globl imprime_cadena_contador
                              9     .globl programapala
                             10 	.globl programapp
                             11 	.globl palabras
                             12 	.globl confirmacion
                             13 
   03BD 00 10                14 numale:		.word 16
                             15 
   03BF                      16 titulo_diccionario:
   03BF 0A 0A 44 49 43 43    17 	.asciz	"\n\nDICCIONARIO:\n"
        49 4F 4E 41 52 49
        4F 3A 0A 00
                             18 
   03CF                      19 palabras:
   03CF 4D 4F 53 43 41 0A    20 	.ascii	"MOSCA\n"
   03D5 50 55 4C 50 4F 0A    21 	.ascii	"PULPO\n"
   03DB 47 41 4E 53 4F 0A    22 	.ascii	"GANSO\n"
   03E1 4C 4C 41 4D 41 0A    23 	.ascii	"LLAMA\n"
   03E7 48 49 45 4E 41 0A    24 	.ascii	"HIENA\n"
   03ED 4C 45 4D 55 52 0A    25 	.ascii	"LEMUR\n"
   03F3 43 45 52 44 4F 0A    26 	.ascii	"CERDO\n"
   03F9 43 49 53 4E 45 0A    27 	.ascii	"CISNE\n"
   03FF 43 41 52 50 41 0A    28 	.ascii	"CARPA\n"
   0405 43 41 42 52 41 0A    29 	.ascii	"CABRA\n"
   040B 45 52 49 5A 4F 0A    30 	.ascii	"ERIZO\n"
   0411 47 41 4C 4C 4F 0A    31 	.ascii	"GALLO\n"
   0417 54 49 47 52 45 0A    32 	.ascii	"TIGRE\n"
   041D 43 45 42 52 41 0A    33 	.ascii	"CEBRA\n"
   0423 4F 56 45 4A 41 0A    34 	.ascii	"OVEJA\n"
   0429 50 45 52 52 4F 0A    35 	.ascii	"PERRO\n"
   042F 50 41 4E 44 41 0A    36 	.ascii	"PANDA\n"
   0435 4B 4F 41 4C 41 0A    37 	.ascii	"KOALA\n"
   043B 0A 50 41 4C 41 42    38 	.asciz  "\nPALABRAS:"
        52 41 53 3A 00
                             39 
   0446 0A 50 72 65 73 69    40 confirmacion: .asciz "\nPresione una tecla para continuar..."
        6F 6E 65 20 75 6E
        61 20 74 65 63 6C
        61 20 70 61 72 61
        20 63 6F 6E 74 69
        6E 75 61 72 2E 2E
        2E 00
   046C 49 6E 74 72 6F 64    41 pide_numero: .asciz "Introduce un numero: "
        75 63 65 20 75 6E
        20 6E 75 6D 65 72
        6F 3A 20 00
                             42 
   0482                      43 programapala:
ASxxxx Assembler V05.00  (Motorola 6809), page 2.
Hexidecimal [16-Bits]



   0482 10 CE F0 00   [ 4]   44     lds     #0XF000
   0486 8E 03 BF      [ 3]   45 	ldx 	#titulo_diccionario
   0489 BD 04 9E      [ 8]   46 	jsr 	imprime_cadena
   048C 8E 03 CF      [ 3]   47     ldx     #palabras
   048F BD 04 AC      [ 8]   48     jsr     imprime_cadena_contador
   0492 8E 04 46      [ 3]   49 	ldx		#confirmacion
   0495 BD 04 9E      [ 8]   50 	jsr		imprime_cadena
   0498 B6 FF 02      [ 5]   51 	lda		teclado
   049B BD 03 76      [ 8]   52 	jsr		programapp
                             53 
ASxxxx Assembler V05.00  (Motorola 6809), page 3.
Hexidecimal [16-Bits]

Symbol Table

    .__.$$$.       =   2710 L   |     .__.ABS.       =   0000 G
    .__.CPU.       =   0000 L   |     .__.H$L.       =   0001 L
  0 confirmacion       0089 GR  |     imprime_cadena     **** GX
    imprime_cadena     **** GX  |   0 numale             0000 GR
  0 palabras           0012 GR  |     pantalla       =   FF00 G
  0 pide_numero        00AF GR  |   0 programapala       00C5 GR
    programapp         **** GX  |     teclado        =   FF02 G
  0 titulo_diccion     0002 GR

ASxxxx Assembler V05.00  (Motorola 6809), page 4.
Hexidecimal [16-Bits]

Area Table

[_CSEG]
   0 _CODE            size   E1   flags C180
[_DSEG]
   1 _DATA            size    0   flags C0C0

