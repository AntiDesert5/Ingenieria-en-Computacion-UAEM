
	list		p=16f887	
	#include	<p16f887.inc>	



; '__CONFIG' directive is used to embed configuration data within .asm file.
; The labels following the directive are located in the respective .inc file.
; See respective data sheet for additional information on configuration word.

	__CONFIG    _CONFIG1, _LVP_OFF & _FCMEN_ON & _IESO_OFF & _BOR_OFF & _CPD_OFF & _CP_OFF & _MCLRE_ON & _PWRTE_ON & _WDT_OFF & _INTRC_OSC_NOCLKOUT
	__CONFIG    _CONFIG2, _WRT_OFF & _BOR21V



;***** VARIABLE DEFINITIONS
Val1 equ 0x30
Val2 equ 0x31 

	ORG     0             
  	GOTO   MAIN              
	ORG	5


MAIN;configuraciOn de puertos B y D como salida
	CLRF	PORTB
	CLRF	PORTD
	BSF	STATUS,RP0
	BCF	STATUS,RP1
	CLRF	TRISD
	CLRF	TRISB
	BCF	STATUS,RP0
	
INICIO
	CALL	Conf1	;configuramos el lcd
	CALL	MENSAJE1		;escribimos en la parte de MENSAJE1
	CALL	Conf2	;configuramos la linea de MENSAJE2
	CALL	MENSAJE2		;escribimos en la linea de MENSAJE2
	GOTO	INICIO		;repetimos
	
MENSAJE1 ;mensaje lcd MENSAJE1
	MOVLW	'*'
	MOVWF	PORTB
	CALL	Envia
        MOVLW	'*'
	MOVWF	PORTB
	CALL	Envia
        MOVLW	'*'
	MOVWF	PORTB
	CALL	Envia
        MOVLW	'E'
	MOVWF	PORTB
	CALL	Envia
	MOVLW	'd'
	MOVWF	PORTB
	CALL	Envia
	MOVLW	'u'
	MOVWF	PORTB
	CALL	Envia
	MOVLW	'a'
	MOVWF	PORTB
	CALL	Envia
	MOVLW	'r'
	MOVWF	PORTB
	CALL	Envia
	MOVLW	'd'
	MOVWF	PORTB
	CALL	Envia
	MOVLW	'o'
	MOVWF	PORTB
	CALL	Envia
	MOVLW	'*'
	MOVWF	PORTB
	CALL	Envia
        MOVLW	'*'
	MOVWF	PORTB
	CALL	Envia
        MOVLW	'*'
	MOVWF	PORTB
	CALL	Envia
	RETURN
	
MENSAJE2 ;
	MOVLW	'*'
	MOVWF	PORTB
	CALL	Envia
        MOVLW	'*'
	MOVWF	PORTB
	CALL	Envia
        MOVLW	'*'
	MOVWF	PORTB
	CALL	Envia
        MOVLW 'I'
	MOVWF PORTB
	CALL Envia
	MOVLW 'v'
	MOVWF PORTB
	CALL Envia
	MOVLW 'a'
	MOVWF PORTB
	CALL Envia
	MOVLW 'n'
	MOVWF PORTB
	CALL Envia
	MOVLW '*'
	MOVWF PORTB
	CALL Envia
        MOVLW	'*'
	MOVWF	PORTB
	CALL	Envia
        MOVLW	'*'
	MOVWF	PORTB
	CALL	Envia
	MOVLW 'A'
	MOVWF PORTB
	CALL Envia
	MOVLW 'x'
	MOVWF PORTB
	CALL Envia
	MOVLW 'e'
	MOVWF PORTB
	CALL Envia
	MOVLW 'l'
	MOVWF PORTB
	CALL Envia
        MOVLW	'*'
	MOVWF	PORTB
	CALL	Envia
        MOVLW	'*'
	MOVWF	PORTB
	CALL	Envia
	RETURN
	
	
Conf1
	BCF	PORTD,0      ; RS=0 MODO INSTRUCCION
	MOVLW	0x01         ; El comando 0x01 limpia la pantalla en el LCD
	MOVWF	PORTB
	CALL	LCD_Comando  ; Se da de alta el comando
	MOVLW	0x0C	     ; Selecciona la primera l?nea
	MOVWF	PORTB
	CALL	LCD_Comando  ; Se da de alta el comando
	MOVLW	0x3C	     ; Se configura el cursor
	MOVWF	PORTB
	CALL	LCD_Comando  ; Se da de alta el comando
	BSF	PORTD, 0     ; Rs=1 MODO DATO
	RETURN

LCD_Comando
	BSF PORTD,1     ; Pone la ENABLE en 1
	CALL DELAY      ; Tiempo de espera
	CALL DELAY
	BCF PORTD, 1    ; ENABLE=0    
	CALL DELAY
	RETURN     

Envia;ENVIAMOS UN DATO
	BSF PORTD,0	    ; RS=1 MODO DATO
	CALL LCD_Comando    ; Se da de alta el comando
	RETURN
	
Conf2;CONFIGURACION DE LA LINEA 2 DEL LCD
	BCF	PORTD, 0    ; RS=0 MODO INSTRUCCION
	MOVLW	0xc0        ; Selecciona linea 2 pantalla en el LCD
	MOVWF	PORTB
	CALL	LCD_Comando    ; Se da de alta el comando
	RETURN
    ; Subrutina de retardo
DELAY           
	MOVLW .255
	MOVWF Val2 
	
Lazo
	MOVLW .255
	MOVWF Val1
Lazo2
	DECFSZ Val1,1
	GOTO Lazo2
	DECFSZ Val2,1
	GOTO Lazo
	RETURN
	

    END