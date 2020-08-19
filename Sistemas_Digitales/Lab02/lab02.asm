;**********************************************************************
;   This file is a basic code template for assembly code generation   *
;   on the PIC16F887. This file contains the basic code               *
;   building blocks to build upon.                                    *
;                                                                     *
;   Refer to the MPASM User's Guide for additional information on     *
;   features of the assembler (Document DS33014).                     *
;                                                                     *
;   Refer to the respective PIC data sheet for additional             *
;   information on the instruction set.                               *
;                                                                     *
;**********************************************************************
;                                                                     *
;    Filename:	    xxx.asm                                           *
;    Date:                                                            *
;    File Version:                                                    *
;                                                                     *
;    Author:                                                          *
;    Company:                                                         *
;                                                                     *
;                                                                     *
;**********************************************************************
;                                                                     *
;    Files Required: P16F887.INC                                      *
;                                                                     *
;**********************************************************************
;                                                                     *
;    Notes:                                                           *
;                                                                     *
;**********************************************************************


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
;AUX		EQU 	0X0C
;AUX2	EQU		0X0D
;AUX3	EQU		0X40
M 	EQU 	b'00000000'	;Y EQU b'000' 
N 	EQU 	b'00000000' ;Y EN BINARIO SOLO TENDRA 3 BITS



;**********************************************************************



	ORG     0x000             ; processor reset vector

	nop
  	goto    CONFIG_PTOS              ; go to beginning of program
	ORG		0X004
	
CONFIG_PTOS
	BSF 	STATUS,RP0 		;ENTRAMOS AL BANCO 1
	MOVLW	0XFF			;CONFIGURACION DE PUERTO 
	MOVWF 	TRISA 			;CONFIGURAMOS EL PUERTO A COMO ENTRADA
	MOVLW 	0X7 			;CONFIGURAMOS EL PUERTO E PARA SOLO TENER 3 BIT
	MOVWF 	TRISE			;PUERTO E ENTRADA
	MOVLW 	0X00			;CONFIGURACION DE PUERTO COMO SALIDA
	MOVWF 	TRISB			;PUERTO E COMO SALIDA
	BSF 	STATUS, RP1		;CAMBIO DE BANCO A 3
	CLRF 	ANSEL			;CONFIGURACION DE PUERTO COMO DIGITAL
	CLRF 	ANSELH
	BCF 	STATUS,RP0		;CAMBIO DE BANCO A 0 
	BCF 	STATUS,RP0


main
	 MOVLW 	b'11110000'		;GUARDAMOS LOS 4 NIBLES ALTOS EN W
	;ANDWF 	PORTA,W			;REALIZAMOS OPERACION LOGICA PARA SOLO OBTENER SOLO LOS NIMBRES ALTOS 
	ANDWF 	b'10110110',W		
	MOVWF 	M				;GUARDAMOS EL NIBLE ALTO EN M
	SWAPF 	M, W			;CAMBIO DE LOS 4 ULTIMOS 
	MOVWF 	M				;MOVEMOS EL RESULTADO A M
	CLRW 					;LIMPIAMOS EL ACUMULADOR
	MOVLW 	b'00001111'		;GUARDAMOS LOS 4 NIBLES BAJOS EN W
	ANDWF 	PORTA, W		;REALIZAMOS OPERACION LOGICA PARA SOLO OBTENER SOLO LOS NIMBRES BAJOS
	ADDWF 	M, W			;REALIZAMOS UNA SUMA ENTRE M Y N
	MOVWF 	N				;MOVEMOS EL RESULTADO A N
	ADDWF 	PORTE, N		;SUMAMOS LO DEL PUERTO E CON LO DE N
	MOVWF 	PORTB 			;MOVEMOS EL RESULTADO A L PUETO B QUE ES SALIDA
	  GOTO main
END                       

