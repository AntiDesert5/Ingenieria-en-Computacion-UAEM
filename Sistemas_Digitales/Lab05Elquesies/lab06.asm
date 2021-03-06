
	list		p=16f887	; list directive to define processor
	#include	<p16f887.inc>	; processor specific variable definitions


; '__CONFIG' directive is used to embed configuration data within .asm file.
; The labels following the directive are located in the respective .inc file.
; See respective data sheet for additional information on configuration word.

	__CONFIG    _CONFIG1, _LVP_OFF & _FCMEN_ON & _IESO_OFF & _BOR_OFF & _CPD_OFF & _CP_OFF & _MCLRE_ON & _PWRTE_ON & _WDT_OFF & _INTRC_OSC_NOCLKOUT
	__CONFIG    _CONFIG2, _WRT_OFF & _BOR21V


;***** VARIABLE DEFINITIONS
;w_temp		EQU	0x7D		; variable used for context saving
;status_temp	EQU	0x7E		; variable used for context saving
;pclath_temp	EQU	0x7F		; variable used for context saving

CBLOCK	0x20
	N1
	N2
	N3
	ENDC
J	equ	H'80'	  
K	equ	H'81'
L	equ 	H'82'
CONTADOR equ 0x21
CONTA EQU 0x20 
CONTADOR2 EQU 0X23
;**********************************************************************

ORG     0x000             ; processor reset vector
		nop
  		goto    INICIO    ; go to beginning of program
	
;CODIGO********************************************************
INICIO
	bsf		 STATUS,RP0			;ACCESO AL BANCO 1
	bcf	 	 STATUS,RP1
	movlw		 b'11111111'    ;CONFIGURO PORTA COMO ENTRADAS
	movwf		 TRISA
	clrf		 TRISB			;CONFIGURO PORTB COMO SALIDA
	clrf		 TRISE			;CONFIGURO PORTE COMO SALIDA
	clrf		 TRISD
	bsf		 STATUS,RP1			;ACCESO AL BANCO 3
	clrf		 ANSEL			;CONFIGURACION DE SALIDAS DIGITALES
	clrf		 ANSELH			;CONFIGURACION DE ENTRADAS DIGITALES
	BANKSEL OPTION_REG
    MOVLW b'11000110' ;Configuración del modulo TMR0
    MOVWF OPTION_REG ;Preescaler = 128
	bcf		 STATUS,RP0			;ACCESO AL BANCO 0
	bcf		 STATUS,RP1



Pos0
	btfsc		 PORTA,1		;si es 0 brinca
	goto		 m2_derecha		 
	goto		 m1_derecha
	goto		 main

m2_derecha

	goto		 main
	
m1_derecha	    
	MOVF	CONTADOR,0
	CALL	TABLA1
	MOVWF	PORTB
	MOVF	CONTADOR2,0
	CALL	TABLA1_2
	MOVWF	PORTC
	CALL 	_retardo
	INCF	CONTADOR,1
	INCF	CONTADOR2,1
	goto	main
	

limpiar
	bcf		 PORTD,0
	goto		 main
m1_izquierda
	MOVF	CONTADOR,0
	CALL	TABLA1
	MOVWF	PORTB
	MOVF	CONTADOR2,0
	CALL	TABLA1_2
	MOVWF	PORTC
	CALL 	_retardo
	INCF	CONTADOR,1
	INCF	CONTADOR2,1
	goto main

m2_derecha	

	goto	main
TABLA1:	addwf 	PCL,f
		retlw	b'00110011'				;M
		retlw	b'00110000'				;1 uno
		retlw 	b'00000000'				;- 
		retlw	b'00111110'				;D
		retlw	b'11001111'				;E
		retlw	b'11000011'				;R
		retlw	b'11001111'				;E
		retlw	b'11001111'				;C
		retlw	b'00110011'				;H
		retlw	b'11110011'				;A

		retlw	b'11110011'				;A
		retlw	b'00000000'				;X
		retlw	b'11001111'				;E
		retlw	b'00001111'				;L
		retlw	b'00000000'
		retlw	b'11001111'				;E
		retlw	b'00111110'				;D
		retlw	b'00111111'				;U
		retlw	b'11110011'				;A
		retlw	b'11000011'				;R
		retlw	b'00111110'				;D
		retlw	b'11111111'				;O
		retlw	b'00000000'
		retlw	b'11001100'				;I
		retlw	b'00000011'				;V
		retlw	b'11110011'				;A
		retlw	b'00110011'				;N
		CLRF CONTADOR
		RETURN	
TABLA1_2:	addwf 	PCL,f
		retlw 	b'10100000'				;M
		retlw 	b'00100000'				;1 uno
		retlw 	b'00011000'				;-
		retlw	b'00011000'				;D
		retlw	b'00011000'				;E
		retlw	b'00000000'				;R
		retlw	b'00011000'				;E
		retlw	b'00000000'				;C
		retlw	b'00011000'				;H
		retlw	b'00011000'				;A


		retlw	b'00011000'				;A
		retlw	b'10100101'				;X
		retlw	b'00011000'				;E
		retlw	b'00000000'				;L
		retlw	b'00011000'
		retlw	b'00011000'				;E
		
		retlw	b'00000000'				;U
		retlw	b'00011000'				;A
		retlw	b'00000000'				;R
		retlw	b'00011000'				;D
		retlw	b'00000000'				;O
		retlw	b'00011000'
		retlw	b'01000010'				;I
		retlw	b'00100100'				;V
		retlw	b'00011000'				;A
		retlw	b'10000001'				;N
		CLRF CONTADOR2
		RETURN	

TABLA3:

	return

TABLA4:	

	return


;SUBRUTINA DE RETRASO APROX DE 1 SEGUNDO.SE PUEDE MODIFICAR A (16.4 x L) MILISEGUNDOS

_retardo ;T = 4 * Tosc * Valor de TMR0 * Preescaler
        MOVLW d'100' ;Cargar el valor de CONTA para 0.5 segundo (VALOR A MODIFICAR SI SE QUIERE MAYOR RETARDO)
        MOVWF CONTA
_espera1
        CLRF INTCON ;Deshabilitar interrupciones
        MOVLW d'50' ;Cargar el valor de TMR0 para 122 cuentas
        MOVWF TMR0 
_espera
        btfss INTCON,T0IF ;Esperar desborde del TMR0
        GOTO _espera
        DECFSZ CONTA ;Decrementar el registro CONTA hasta cero
        GOTO _espera1 
        RETURN ;retorno de call

	END

main
	btfss		 PORTA,0		;Brinca si es 1
	goto		 Pos0    
	btfss		 PORTA,1		;brinca si es 1;
	goto		 m1_izquierda
	goto		 m2_izquierda
	
	goto		 main
	END