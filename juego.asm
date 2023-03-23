    .module juego

pantalla    .equ 0XFF00
teclado     .equ 0XFF02

    .globl juego_principal
    .globl imprime_cadena
    .globl imprime_cadena_juego
    .globl imprime_decimal
    .globl vector_tablero
    .globl palabras
    .globl programapp
    .globl palabra_aleatoria
    .globl pide_letra
    .globl titulo_juego
    .globl palabra_a_comprobar
    .globl comprobar_palabra
    .globl pos_b
    .globl cont
    .globl final_juego
    .globl confirmacion


pos_inicial:	.byte	0
count:		.byte	0		
count_tablero:	.byte	0		
cinco:		.byte   0		
numpal:		.byte   0
pos_b:		.byte   0
cont:   .byte 0
letra: .word 0
intentos: .byte 48
letra_volver: .byte 0


pide: .asciz "\nIntroduzca letra mayuscula (Presione espacio para borrar):"
titulo_juego:   .ascii "\n\n  | JUEGO |\n"
                .ascii "-----------\n"
                .ascii "  | 12345 |\n"
                .asciz "-----------\n"
mensaje_salir: 		.asciz	"Pulsar V para volver al menu, R para reiniciar, otro para continuar\n"
numero_palabra:		.asciz "\nIntroduce un numero (entre 0 y 9):"
mensaje_perdido:    .asciz "\n\33[31mHas perdido!!\33[37m\nLa palabra era: "

palabra_a_comprobar:
        .asciz "_____"

juego_principal:
    lds     #0XF000
    ldb #0
    clra
    lda     letra_volver
    stb     letra_volver
    cmpa    #1
    beq     juego_ppal
    elegir_palabra:
        ldx     #numero_palabra
        jsr     imprime_cadena
        lda     teclado
        cmpa    #'0
        blo     elegir_palabra
        cmpa    #'9
        bhi     elegir_palabra
        sta     numpal

        
    contar_palabras:
        bucle_contador:
            ldb #48
                  
            ldx     #palabras 

            ic_sgte_contador_palabra:
                lda     ,x+
                cmpa    #'\n
                beq     contador_palabra   
                bra     ic_sgte_contador_palabra
            contador_palabra:
                incb
                cmpb    numpal
                beq     cargar_palabra
                bra     ic_sgte_contador_palabra
            cargar_palabra:
                clrb
                cargar:    
                    lda     ,x+
                    pshs    x
                    ldx     #palabra_aleatoria
                    sta     b,x
                    puls    x
                    incb
                    cmpa    #'\n
                    beq     final_bucle
                    bra     cargar
                
            final_bucle:
                bra juego_ppal

juego_ppal:
    lds     #0XF000
    clrb
    clra
    bucle_pide:
        bra     pide_letra

    pide_letra:  
        ldb     pos_b
        cmpb    #25
        beq     has_perdido      
        ldx     #pide
        jsr     imprime_cadena
        lda     teclado
        sta     letra
        cmpa    #' 
        beq     quitar_letra
        ldb cont
        ldx #palabra_a_comprobar
        sta b,x  
        incb
        stb cont
        
        
        lbra     bucle_insertar
        bra     bucle_pide
    has_perdido:
        ldx     #mensaje_perdido
        jsr     imprime_cadena
        ldx     #palabra_aleatoria
        jsr     imprime_cadena
        ldx     #confirmacion
        jsr     imprime_cadena
        lda		teclado
        jsr		final_juego
    pal_cmp:
        jsr comprobar_palabra
        bra limpiar_cont
        bra bucle_pide

    limpiar_cont:
        ldx #palabra_a_comprobar
        ldb cont
        decb 
        lda #'_
        sta b,x
        stb cont
        cmpb #0
        bhi limpiar_cont
        bra pide_letra
    quitar_letra:

        ldb pos_b
        cmpb    #0
        beq     bucle_pide
        cmpb    #5
        beq     bucle_pide
        cmpb    #10
        beq     bucle_pide
        cmpb    #15
        beq     bucle_pide
        cmpb    #20
        beq     bucle_pide
        decb
        lda     #'_
        ldx     #vector_tablero
        sta     b,x
        stb     pos_b
        ldx     #palabra_a_comprobar
        ldb     cont
        decb
        sta     b,x
        stb     cont
        ldb     pos_b
        ldx     #titulo_juego
        jsr     imprime_cadena
        jsr     interfaz_tablero
        lbra     bucle_turno
        lbra     bucle_pide
    fin_bucle:
        lda #1
        sta letra_volver
        jsr programapp

    bucle_insertar:
        ldx     #titulo_juego
        jsr     imprime_cadena

        lda letra

        ldb     pos_b
        ldx #vector_tablero
        sta b,x
        incb
        stb pos_b
       

        jsr     interfaz_tablero

        bucle_turno: 
            lda 	#'\n					
            sta 	pantalla
            ldx 	#mensaje_salir
            jsr 	imprime_cadena		
            lda 	teclado
            cmpa	#'v
            lbeq 	fin_bucle			;Si se introduce V o v se sale al menu
            cmpa 	#'V
            lbeq 	fin_bucle
            cmpa    #'r
            beq     juego_final
            cmpa    #'R
            beq     juego_final

            lda 	#'\n					
            sta 	pantalla
            lbra bucle_pide


juego_final:
    jsr     final_juego
interfaz_tablero:
	pshu	a,x,b	
							;Crea el contorno o interfaz grafica del tablero con los guiones
	ldb	pos_inicial
	ldx	#vector_tablero
	lda	cinco					
	adda	#5
	sta	cinco					;Variable inicializada a 6 representando el limite de columnas de cada fila(nCOL-1)
empieza_tablero:
	lda	count_tablero				;Contador que imprime las 6 filas del tablero original
	cmpa	#5
	beq	mitad_tablero
    adda #'1
    sta pantalla
    lda	#' 
	sta	pantalla
    lda #'|
    sta pantalla
	lda	#' 
	sta	pantalla    
    
bucle_seguir:
	lda 	b,x					;Imprime lo que hay en las posiciones de la fila
	sta	pantalla
	
	incb
	cmpb	cinco					;B hasta 6(1ª iteracion),13(2ª iteracion),...
	beq	seguir_bucle
	bra	bucle_seguir
seguir_bucle:
	lda	#' 
	sta	pantalla	
	lda	#'|
	sta	pantalla
	lda	#'\n
	sta	pantalla
	
	clra
	
	lda	count_tablero
	inca
	sta	count_tablero
	
	clra

	lda	cinco					;Al aumentar la variable cada 5 voy representando todas las columnas
	adda	#5
	sta	cinco

	bra	empieza_tablero				;Al final de cada iteracion deberia representar esto: *_______* hasta llegar a 6 iteraciones
mitad_tablero:
	clr	count					;Liberamos el contenido de la variable count para asegurarnos que no queda nada para el siguient bucle



retorno_tablero:
	lda	#'\n
	sta	pantalla

    ldb cont
    cmpb #5
    lbeq pal_cmp
	

	clr	count
	clr	count_tablero
	clr	cinco	
	pulu	x,a,b
	rts







