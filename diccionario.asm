	.module diccionario

teclado     .equ 0XFF02
pantalla    .equ 0XFF00

	.globl palabras
    .globl imprime_cadena
    .globl imprime_cadena_contador
    .globl programapala
	.globl programapp
	.globl palabras
	.globl confirmacion

numale:		.word 16

titulo_diccionario:
	.asciz	"\n\nDICCIONARIO:\n"

palabras:
	.ascii	"MOSCA\n"
	.ascii	"PULPO\n"
	.ascii	"GANSO\n"
	.ascii	"LLAMA\n"
	.ascii	"HIENA\n"
	.ascii	"LEMUR\n"
	.ascii	"CERDO\n"
	.ascii	"CISNE\n"
	.ascii	"CARPA\n"
	.ascii	"CABRA\n"
	.ascii	"ERIZO\n"
	.ascii	"GALLO\n"
	.ascii	"TIGRE\n"
	.ascii	"CEBRA\n"
	.ascii	"OVEJA\n"
	.ascii	"PERRO\n"
	.ascii	"PANDA\n"
	.ascii	"KOALA\n"
	.asciz  "\nPALABRAS:"

confirmacion: .asciz "\nPresione una tecla para continuar..."
pide_numero: .asciz "Introduce un numero: "

programapala:
    lds     #0XF000
	ldx 	#titulo_diccionario
	jsr 	imprime_cadena
    ldx     #palabras
    jsr     imprime_cadena_contador
	ldx		#confirmacion
	jsr		imprime_cadena
	lda		teclado
	jsr		programapp

