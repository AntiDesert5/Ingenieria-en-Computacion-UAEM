
	list		p=16f887	; list directive to define processor
	#include	<p16f887.inc>	; processor specific variable definitions


; '__CONFIG' directive is used to embed configuration data within .asm file.
; The labels following the directive are located in the respective .inc file.
; See respective data sheet for additional information on configuration word.

	__CONFIG    _CONFIG1, _LVP_OFF & _FCMEN_ON & _IESO_OFF & _BOR_OFF & _CPD_OFF & _CP_OFF & _MCLRE_ON & _PWRTE_ON & _WDT_OFF & _INTRC_OSC_NOCLKOUT
	__CONFIG    _CONFIG2, _WRT_OFF & _BOR21V



;***** VARIABLE DEFINITIONS
w_temp		EQU	0x7D		; variable used for context saving
status_temp	EQU	0x7E		; variable used for context saving
pclath_temp	EQU	0x7F		; variable used for context saving
AUX		EQU 	0X0C
AUX2	EQU		0X0D
AUX3	EQU		0X40

;**********************************************************************

	ORG     0x000             ; processor reset vector
	nop
	goto	CONFIG_PTOS		;Configuracion de puertos
CONFIG_PTOS:
	bsf		STATUS,RP0			;Cambio al BANk_1
	movlw	0xFF				;Configurar 
	movwf	TRISA				;puerto A como entrada
	movlw	0x00				;Configurar el
	movwf	TRISB				;puerto B como salida
	bsf 	STATUS,RP1			;Cambiar al bank_3
	clrf	ANSEL				;configurar el PORT A como digital
	clrf	ANSELH				;configurar el PORT B como digital
	bcf		STATUS,RP0			;cambio al BANK_0
	bcf		STATUS,RP1

main
	andlw 	b'00000111' 	; Se queda con los tres bits bajos de entrada.
	movwf 	GuardaOffset 	; Guarda el offset del salto.
	movlw 	LOW (tabla+1) ; Obtiene los 8 bits bajos de la dirección de memoria
				; de programa donde está situada la tabla real.
	addwf 	GuardaOffset,F ; Y halla el valor del salto absoluto dentro de la tabla.
	movlw 	HIGH (tabla+1) ; Cinco bits alto de la dirección de memoria de
				; programa donde está situada la tabla real.
	btfsc 	STATUS,C 	; ¿Ha desbordado la página de 256 bytes?
	addlw 	1 		; Sí, entonces añade una unidad al PCH.
	movwf 	PCLATH 		; Prepara el PCLATH.
	movf 	GuardaOffset,W 	; El offset se cargará en el PCL.
	call 	tabla 	; Obtiene la configuración de salida.
	movwf 	PORTB 		; Se visualiza por el puerto de salida.   
    goto 		main

GuardaOffset
		ENDC
tabla:	movwf 	PCL 
		retlw	b'01110111'		;A
		retlw	b'00111101'		;D
		retlw	b'01001111'		;E
		retlw	b'00110000'		;I
		retlw	b'00001110'		;L
		retlw	b'00010111'		;N
		retlw	b'01111110'		;O
		retlw	b'00000101'		;Y
		retlw	b'00111110'		;U
		retlw	b'00011100'		;V
		retlw	b'00110111'		;X
	END                     
