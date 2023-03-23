ASxxxx Assembler V05.00  (Motorola 6809), page 1.
Hexidecimal [16-Bits]



                              1     .module cadenas
                     FF00     2 pantalla    .equ 0XFF00     ; muestra en pantalla
                     FF02     3 teclado     .equ 0XFF02     ; pide de teclado
                              4     .globl imprime_cadena
                              5     .globl imprime_cadena_contador
                              6     .globl imprime_cadena_juego
                              7     .globl imprime_decimal
                              8 
                              9 
   049E                      10 imprime_cadena:
   049E 34 02         [ 6]   11     pshs        a
   04A0                      12     ic_sgte:
   04A0 A6 80         [ 6]   13         lda     ,x+
   04A2 27 05         [ 3]   14         beq     ic_retorno
   04A4 B7 FF 00      [ 5]   15         sta     pantalla
   04A7 20 F7         [ 3]   16         bra     ic_sgte
   04A9                      17     ic_retorno:
   04A9 35 02         [ 6]   18         puls    a   ;para devolver registros sin que se vean afectados
   04AB 39            [ 5]   19         rts
                             20 
   04AC                      21 imprime_cadena_contador:
   04AC 34 02         [ 6]   22     pshs        a
   04AE 5F            [ 2]   23     clrb        
   04AF                      24     ic_sgte_contador:
   04AF A6 80         [ 6]   25         lda     ,x+
   04B1 27 0F         [ 3]   26         beq     ic_retorno_contador
   04B3 81 0A         [ 2]   27         cmpa    #'\n
   04B5 27 05         [ 3]   28         beq     contador    ;salta a la subrutina contador si encuentra un salto de linea
   04B7 B7 FF 00      [ 5]   29         sta     pantalla
   04BA 20 F3         [ 3]   30         bra     ic_sgte_contador
   04BC                      31     contador:
   04BC 5C            [ 2]   32         incb    ;incrementa el contador
   04BD B7 FF 00      [ 5]   33         sta     pantalla
   04C0 20 ED         [ 3]   34         bra     ic_sgte_contador
   04C2                      35     ic_retorno_contador:
   04C2 C0 01         [ 2]   36         subb    #1
   04C4 BD 04 D8      [ 8]   37         jsr     imprime_decimal
   04C7 35 02         [ 6]   38         puls    a   ;para devolver registros sin que se vean afectados
   04C9 39            [ 5]   39         rts
                             40 
   04CA                      41 imprime_cadena_juego:
   04CA 34 02         [ 6]   42     pshs        a
   04CC                      43     ic_sgte_juego:
   04CC A6 80         [ 6]   44         lda     ,x+
   04CE 27 D9         [ 3]   45         beq     ic_retorno
                             46         ;cmpa    
   04D0 B7 FF 00      [ 5]   47         sta     pantalla
   04D3 20 CB         [ 3]   48         bra     ic_sgte
   04D5                      49     ic_retorno_juego:
   04D5 35 02         [ 6]   50         puls    a   ;para devolver registros sin que se vean afectados
   04D7 39            [ 5]   51         rts
                             52 
   04D8                      53 imprime_decimal:
   04D8 34 16         [ 8]   54     pshs    x,d
   04DA 8E 00 00      [ 3]   55     ldx     #0
ASxxxx Assembler V05.00  (Motorola 6809), page 2.
Hexidecimal [16-Bits]



   04DD                      56     id_primera_cifra:
   04DD 10 83 00 0A   [ 5]   57         cmpd        #10
   04E1 25 0A         [ 3]   58         blo         id_imprime_primera_cifra
   04E3 83 00 0A      [ 4]   59         subd        #10
   04E6 1E 10         [ 8]   60         exg         x,d
   04E8 5C            [ 2]   61         incb
   04E9 1E 10         [ 8]   62         exg         x,d
   04EB 20 F0         [ 3]   63         bra         id_primera_cifra
   04ED                      64     id_imprime_primera_cifra:
   04ED 1E 10         [ 8]   65         exg         x,d
   04EF CB 30         [ 2]   66         addb        #'0
   04F1 F7 FF 00      [ 5]   67         stb         pantalla
   04F4 1E 10         [ 8]   68         exg         x,d
   04F6                      69     id_segunda_cifra:
   04F6 CB 30         [ 2]   70         addb    #'0
   04F8 F7 FF 00      [ 5]   71         stb     pantalla
   04FB 35 16         [ 8]   72         puls    x,d
   04FD 39            [ 5]   73         rts
ASxxxx Assembler V05.00  (Motorola 6809), page 3.
Hexidecimal [16-Bits]

Symbol Table

    .__.$$$.       =   2710 L   |     .__.ABS.       =   0000 G
    .__.CPU.       =   0000 L   |     .__.H$L.       =   0001 L
  0 contador           001E GR  |   0 ic_retorno         000B GR
  0 ic_retorno_con     0024 GR  |   0 ic_retorno_jue     0037 GR
  0 ic_sgte            0002 GR  |   0 ic_sgte_contad     0011 GR
  0 ic_sgte_juego      002E GR  |   0 id_imprime_pri     004F GR
  0 id_primera_cif     003F GR  |   0 id_segunda_cif     0058 GR
  0 imprime_cadena     0000 GR  |   0 imprime_cadena     000E GR
  0 imprime_cadena     002C GR  |   0 imprime_decima     003A GR
    pantalla       =   FF00 G   |     teclado        =   FF02 G

ASxxxx Assembler V05.00  (Motorola 6809), page 4.
Hexidecimal [16-Bits]

Area Table

[_CSEG]
   0 _CODE            size   60   flags C180
[_DSEG]
   1 _DATA            size    0   flags C0C0

