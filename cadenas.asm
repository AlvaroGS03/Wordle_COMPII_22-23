    .module cadenas
pantalla    .equ 0XFF00     ; muestra en pantalla
teclado     .equ 0XFF02     ; pide de teclado
    .globl imprime_cadena
    .globl imprime_cadena_contador
    .globl imprime_cadena_juego
    .globl imprime_decimal


imprime_cadena:
    pshs        a
    ic_sgte:
        lda     ,x+
        beq     ic_retorno
        sta     pantalla
        bra     ic_sgte
    ic_retorno:
        puls    a   ;para devolver registros sin que se vean afectados
        rts

imprime_cadena_contador:
    pshs        a
    clrb        
    ic_sgte_contador:
        lda     ,x+
        beq     ic_retorno_contador
        cmpa    #'\n
        beq     contador    ;salta a la subrutina contador si encuentra un salto de linea
        sta     pantalla
        bra     ic_sgte_contador
    contador:
        incb    ;incrementa el contador
        sta     pantalla
        bra     ic_sgte_contador
    ic_retorno_contador:
        subb    #1
        jsr     imprime_decimal
        puls    a   ;para devolver registros sin que se vean afectados
        rts

imprime_cadena_juego:
    pshs        a
    ic_sgte_juego:
        lda     ,x+
        beq     ic_retorno
        ;cmpa    
        sta     pantalla
        bra     ic_sgte
    ic_retorno_juego:
        puls    a   ;para devolver registros sin que se vean afectados
        rts

imprime_decimal:
    pshs    x,d
    ldx     #0
    id_primera_cifra:
        cmpd        #10
        blo         id_imprime_primera_cifra
        subd        #10
        exg         x,d
        incb
        exg         x,d
        bra         id_primera_cifra
    id_imprime_primera_cifra:
        exg         x,d
        addb        #'0
        stb         pantalla
        exg         x,d
    id_segunda_cifra:
        addb    #'0
        stb     pantalla
        puls    x,d
        rts