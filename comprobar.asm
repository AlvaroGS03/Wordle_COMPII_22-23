    .module comprobar

pantalla    .equ 0XFF00
teclado     .equ 0XFF02

    .globl pide_letra
    .globl palabra_aleatoria
    .globl count
    .globl count_tablero
    .globl cinco
    .globl imprime_cadena
    .globl pos_inicial
    .globl vector_tablero
    .globl titulo_juego
    .globl palabra_a_comprobar
    .globl comprobar_palabra
    .globl confirmacion
    .globl pos_b
    .globl programapp
    .globl final_juego

pos_l:		.byte   0
pos_l2:		.byte   0
l_cmp:		.byte   0
contador_verde:     .byte 0

	
    blanco: .asciz "\33[37m"
    amarillo: .asciz "\33[33m"
    verde: .asciz "\33[32m"
    mensaje_ganado: .asciz "\nHas ganado!!\n"
    mensaje_comprobacion: .asciz "\nComprobacion de la palabra introducida: "
    

comprobar_palabra:
    ldx     #mensaje_comprobacion
    jsr     imprime_cadena
    clrb
    stb     contador_verde
    ldx     #palabra_a_comprobar       
    stb     pos_l
    stb     pos_l2
    ldy     #palabra_aleatoria           
    bucle_x:
        ldx     #palabra_a_comprobar
        ldb     pos_l
        lda     b,x
        sta     l_cmp
        incb 
        stb     pos_l
        bucle_y:
            ldb     pos_l2
            lda     b,y
            incb 
            stb     pos_l2
            cmpa    l_cmp
            beq     pertenece
            cmpb    #5
            beq     imprime_letra
            bra bucle_y

    pertenece:
        cmpb    pos_l
        beq     imprime_verde
        cmpb    pos_l
        bne     imprime_amarillo

    imprime_amarillo:
        ldx     #amarillo
        jsr     imprime_cadena
        bra     imprime_letra
    imprime_verde:
        ldx     #verde
        jsr     imprime_cadena
        ldb     contador_verde
        incb
        stb     contador_verde
        bra     imprime_letra
    has_ganado:
        ldx     #verde
        jsr     imprime_cadena
        ldx     #mensaje_ganado
        jsr     imprime_cadena
        ldx     #blanco
        jsr     imprime_cadena
        ldx     #confirmacion
        jsr     imprime_cadena
        lda		teclado
        jsr		final_juego
    final_juego:
        ldb     pos_b
        ldx     #vector_tablero
        lda     #'_
        sta     b,x
        decb
        stb     pos_b
        cmpb    #0
        beq     programa_inicio
        bra     final_juego
    programa_inicio:
        jsr		programapp
    imprime_letra:
        lda     l_cmp
        sta     pantalla
        ldx     #blanco
        jsr     imprime_cadena
        ldb     contador_verde
        cmpb    #5
        beq     has_ganado
        clrb
        stb     pos_l2
        ldb     pos_l
        cmpb    #5
        beq     final_comprobar

        lbra     bucle_x

    final_comprobar:
        rts



    

