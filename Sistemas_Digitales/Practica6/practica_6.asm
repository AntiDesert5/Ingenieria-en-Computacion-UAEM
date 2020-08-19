

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
count		EQU	0x20
cont		EQU	0x21
aux		EQU	0X22

;**********************************************************************

ORG     0x000             ; processor reset vector
		nop
  		goto    INICIO    ; go to beginning of program
	
;CODIGO********************************************************
INICIO
	bsf		 STATUS,RP0		;ACCESO AL BANCO 1
	bcf	 	 STATUS,RP1
	movlw		 b'11000000'		;CONFIGURO PORTA COMO ENTRADAS
	movwf		 TRISA	
	clrf		 TRISD			;CONFIGURO PORTD COMO SALIDA
	bsf		 STATUS,RP1		;ACCESO AL BANCO 3
	clrf		 ANSEL			;CONFIGURACION DE SALIDAS DIGITALES
	clrf		 ANSELH			;CONFIGURACION DE ENTRADAS DIGITALES
	bcf		 STATUS,RP0		;ACCESO AL BANCO 0
	bcf		 STATUS,RP1
	
	BANKSEL OPTION_REG
	MOVLW b'11000110' ;Configuraci?n del modulo TMR0
	MOVWF OPTION_REG ;Preescaler = 128
	
	BCF STATUS, RP1
	CLRF TRISB
	CLRF TRISC
	BCF STATUS, RP0
	CLRF PORTB
	CLRF PORTC
	CLRF aux
	CLRF count
	
RA0_0
	btfsc		 PORTA,1		;si es 0 brinca
	goto		 M1_GIzq		 
	goto		 M1_GDer
	goto		 main

M1_GIzq
	movlw		b'00000001'
	movwf		PORTD		
	
	MOVF	count,0
	CALL	tablaB
	MOVWF	PORTC
	
	MOVF	aux,0
	CALL	tablaD
	MOVWF	PORTB
	
	
	CALL 	_retardo
	INCF	count,1
	INCF	aux,1
	
	goto		main
	
M1_GDer	
	
	movlw		b'00000010'
	movwf		PORTD		
	
	MOVF	count,0
	CALL	tablaB
	MOVWF	PORTC
	
	MOVF	aux,0
	CALL	tablaD
	MOVWF	PORTB
	
	
	CALL 	_retardo
	INCF	count,1
	INCF	aux,1
	
	goto		main
	
M2_GIzq	
	
	movlw		b'00000100'
	movwf		PORTD		
	
	MOVF	count,0
	CALL	tablaB
	MOVWF	PORTC
	
	MOVF	aux,0
	CALL	tablaD
	MOVWF	PORTB
	
	
	CALL 	_retardo
	INCF	count,1
	INCF	aux,1
	
	goto		main

M2_GDer	
	
	movlw		b'00001000'
	movwf		PORTD		
	
	MOVF	count,0
	CALL	tablaB
	MOVWF	PORTC
	
	MOVF	aux,0
	CALL	tablaD
	MOVWF	PORTB
	
	
	CALL 	_retardo
	INCF	count,1
	INCF	aux,1
	
	goto		main

main
	btfss		 PORTA,0		;Brinca si es 1
	goto		 RA0_0    
	btfss		 PORTA,1		;brinca si es 1;
	goto		 M2_GDer		;v a la XOR
	goto		 M2_GIzq
	
	
	goto		 main
	
tablaB
	addwf PCL,F;
	
	retlw b'00000000';abcdefg0

	retlw b'11110011';A
	retlw b'00000000';X
	retlw b'11001111';E
	retlw b'00001111';L

	retlw b'11001111';E
	retlw b'01111000';D
	retlw b'00111111';U
	retlw b'11110011';A
	retlw b'11100011';R
	retlw b'01111000';D
	retlw b'11111111';O

	retlw b'11001100';I
	retlw b'00000000';V
	retlw b'11110011';A
	retlw b'00110011';N
	call limpiar
	
tablaD
	addwf PCL,F;
	retlw b'00000000';abcdefg0

	retlw b'00010001';A
	retlw b'10101010';X
	retlw b'00010001';E
	retlw b'00000000';L
	
	retlw b'00010001';E
	retlw b'01000100';D
	retlw b'00000000';U
	retlw b'00010001';A
	retlw b'00011001';R
	retlw b'01000100';D
	retlw b'00000000';O


	retlw b'01000100';I
	retlw b'10100000';V
	retlw b'00010001';A
	retlw b'10001000';N
	call limpiaraux
	
limpiar
	clrf	count
	movlw	d'0'
	MOVF	count,0
	return
	
limpiaraux
	clrf	aux
	movlw	d'0'
	MOVF	aux,0
	return
	
_retardo ;T = 4 * Tosc * Valor de TMR0 * Preescaler
        MOVLW d'70' ;Cargar el valor de CONTA para 0.5 segundo (VALOR A MODIFICAR SI SE QUIERE MAYOR RETARDO)
        MOVWF cont
_espera1
        CLRF INTCON ;Deshabilitar interrupciones
        MOVLW d'100' ;Cargar el valor de TMR0 para 122 cuentas
        MOVWF TMR0 
_espera
        btfss INTCON,T0IF ;Esperar desborde del TMR0
        GOTO _espera
        DECFSZ cont ;Decrementar el registro CONTA hasta cero
        GOTO _espera1
        RETURN ;retorno de call
	
	
	END
