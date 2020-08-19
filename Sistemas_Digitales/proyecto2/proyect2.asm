

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

AUX		EQU 	0X20
AUX2	EQU		0X21
AUX3	EQU		0X22


;**********************************************************************



	ORG     0x000             ; processor reset vector

	nop
  	goto    CONFIG_PTOS              ; go to beginning of program
	ORG		0X004
	
CONFIG_PTOS
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
	  CLRW
	  MOVLW		B'11111001'
      ;MOVF 		PORTA,0
      MOVWF		AUX
      MOVWF		AUX2	
      CLRW//////
	  MOVLW		B'00000000'
	  MOVWF		AUX3
	  CLRW

      SWAPF		AUX3,AUX2
      SWAPF		AUX2,AUX2
      CLRW	
      SWAPF		AUX2,0
	  GOTO main
END                       



