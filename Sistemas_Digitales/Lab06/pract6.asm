	list		p=16f887	; list directive to define processor
	#include	<p16f887.inc>	; processor specific variable definitions


; '__CONFIG' directive is used to embed configuration data within .asm file.
; The labels following the directive are located in the respective .inc file.
; See respective data sheet for additional information on configuration word.

	__CONFIG    _CONFIG1, _LVP_OFF & _FCMEN_ON & _IESO_OFF & _BOR_OFF & _CPD_OFF & _CP_OFF & _MCLRE_ON & _PWRTE_ON & _WDT_OFF & _INTRC_OSC_NOCLKOUT
	__CONFIG    _CONFIG2, _WRT_OFF & _BOR21V
J	equ	H'80'	  
K	equ	H'81'
L	equ 	H'82'
CONTADOR equ 0x21
CONTA EQU 0x20 
CONTADOR2 EQU 0X23


	GOTO PTOS
PTOS
	BSF 	STATUS,RP0 		;ENTRAMOS AL BANCO 1
	MOVLW	0XFF			;CONFIGURACION DE PUERTO 
	MOVWF 	TRISA 			;CONFIGURAMOS EL PUERTO A COMO ENTRADA
	MOVLW 	0X00			;CONFIGURACION DE PUERTO COMO SALIDA
	MOVWF 	TRISB			;PUERTO E COMO SALIDA
	MOVLW 	0X00			;CONFIGURACION DE PUERTO COMO SALIDA
	MOVWF 	TRISC			;PUERTO E COMO SALIDA
	BSF 	STATUS, RP1		;CAMBIO DE BANCO A 3
	CLRF 	ANSEL			;CONFIGURACION DE PUERTO COMO DIGITAL
	CLRF 	ANSELH
	
	BANKSEL OPTION_REG
    MOVLW b'11000110' ;Configuración del modulo TMR0
    MOVWF OPTION_REG ;Preescaler = 128

	BCF 	STATUS,RP0		;CAMBIO DE BANCO A 0 
	BCF 	STATUS,RP0
	CLRF	CONTADOR

	
PRINCIPAL	
	
	MOVF	CONTADOR,0
	CALL	TABLA
	MOVWF	PORTB
	MOVF	CONTADOR2,0
	CALL	TABLA2
	MOVWF	PORTC
	CALL 	_retardo
	INCF	CONTADOR,1
	INCF	CONTADOR2,1
	GOTO 	PRINCIPAL

TABLA:	
		addwf 	PCL,f
		retlw	b'11110011'				;A
		retlw	b'00000000'				;X
		retlw	b'11001111'				;E
		retlw	b'00001111'				;L
		retlw	b'11001111'				;E
		retlw	b'00111110'				;D
		retlw	b'00111111'				;U
		retlw	b'11110011'				;A
		retlw	b'11000011'				;R
		retlw	b'00011000'				;D
		retlw	b'11111111'				;O
		retlw	b'11001100'				;I
		retlw	b'00100100'				;V
		retlw	b'11110011'				;A
		retlw	b'10000001'				;N
		CLRF CONTADOR
		RETURN	
TABLA2:	
		addwf 	PCL,f

		retlw	b'00011000'				;A
		retlw	b'10100101'				;X
		retlw	b'00011000'				;E
		retlw	b'00000000'				;L
		retlw	b'11001111'				;E
		retlw	b'00011000'				;D
		retlw	b'00000000'				;U
		retlw	b'11110011'				;A
		retlw	b'00110001'				;R
		retlw	b'00011000'				;D
		retlw	b'11111111'				;O
		retlw	b'01000010'				;I
		retlw	b'00100100'				;V
		retlw	b'11110011'				;A
		retlw	b'10000001'				;N
		CLRF CONTADOR2
		RETURN	


;SUBRUTINA DE RETRASO APROX DE 1 SEGUNDO.SE PUEDE MODIFICAR A (16.4 x L) MILISEGUNDOS

_retardo ;T = 4 * Tosc * Valor de TMR0 * Preescaler
        MOVLW d'500' ;Cargar el valor de CONTA para 0.5 segundo (VALOR A MODIFICAR SI SE QUIERE MAYOR RETARDO)
        MOVWF CONTA
_espera1
        CLRF INTCON ;Deshabilitar interrupciones
        MOVLW d'500' ;Cargar el valor de TMR0 para 122 cuentas
        MOVWF TMR0 
_espera
        btfss INTCON,T0IF ;Esperar desborde del TMR0
        GOTO _espera
        DECFSZ CONTA ;Decrementar el registro CONTA hasta cero
        GOTO _espera1 
        RETURN ;retorno de call

	END