; Trabajo Computadores: wordle.asm
        .module wordle
teclado     .equ 0XFF02     ; pide de teclado
pantalla    .equ 0XFF00     ; muestra en pantalla
fin         .equ 0xFF01

titulo: .ascii "\n\n"
        .ascii	      "\33[32mWWWWWWWWWWWWWWW  OOOOOOOOOOOO  RRRRRRRRRRRR  DDDDDDDDDDD  LLLLLLLLLL  EEEEEEEEEE\n"
	.ascii        "W  WWWWWWWWW  W  OOO      OOO  R        RRR  D        DD  L   LLLLLL  E        E\n" 
        .ascii        "WW  WWW WWW  WW  O    OO    O  R   RRRR   R  D   DD    D  L   LLLLLL  E   EEEEEE\n"
        .ascii        "WWW  W   W  WWW  O   OOOO   O  R         RR  D   DDD   D  L   LLLLLL  E     EEEE\n"
        .ascii        "WWWW   W   WWWW  O    OO    O  R   RR   RRR  D   DD    D  L   LLLLLL  E   EEEEEE\n"
        .ascii        "WWWWW WWW WWWWW  OOO      OOO  R   RRR   RR  D        DD  L        L  E        E\n"
	.asciz	      "WWWWWWWWWWWWWWW  OOOOOOOOOOOO  RRRRRRRRRRRR  DDDDDDDDDDD  LLLLLLLLLL  EEEEEEEEEE\n\33[37m"  

propiedad:
        .ascii "\n             ================================================="
        .ascii "\n             CREADO POR IVAN GARCIA NIETO Y ALVARO GARCIA SAEZ"
        .asciz "\n             =================================================\n\n"


menu:
        .ascii "\33[34m1)\33[37m Ver Diccionario\n"
        .ascii "\33[33m2)\33[37m Jugar\n"
        .asciz "\33[35m3)\33[37m Salir\n"

clearScreen:    .asciz  "\n\33[2J"

        .byte 10
        .byte 0

        .globl programapp
        .globl programapala
        .globl juego_principal
        .globl imprime_cadena
        .globl vector_tablero
        .globl palabra_aleatoria
        .globl programapp
        .globl cont

palabra_aleatoria:
        .asciz "______"


vector_tablero:
	.ascii "_____"
	.ascii "_____"
	.ascii "_____"
	.ascii "_____"
	.ascii "_____"
	.asciz "_____"

programapp:
        lds #0XF000
        clrb
        stb cont
        ldx #clearScreen
        jsr imprime_cadena
        ldx #titulo
        jsr imprime_cadena
        ldx #propiedad
        jsr imprime_cadena
        ldx #menu
        jsr imprime_cadena
lee_dato:
        lda teclado
        cmpa #'1
        blo programapp
        beq diccionario
        cmpa #'2
        beq jugar
        cmpa #'3
        bhi programapp
        beq acabar
        bra lee_dato

diccionario:
        jsr programapala

jugar:
        jsr juego_principal
        bra programapp

acabar:
        ldx #clearScreen
        jsr imprime_cadena
        clra
        sta     fin

        .area FIJA(ABS)
        .org 0xFFFE         ; Vector de RESET
        .word programapp