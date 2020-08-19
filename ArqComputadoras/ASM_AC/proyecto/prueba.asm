section .data
     msg db "Hola mundo", 0x0a ;Mensaje
     len equ $ - msg              ;Tama�o del mensaje
section .text
     global _start                  ;Necesitamos exportar '_start' a ld, para que lo reconozca
                                         ;como el punto de entrada del programa.
_start:
     ;Escribimos el saludo a stdout.
     mov eax, 4                    ;N�mero de la llamada al sistema (sys_write).
     mov ebx, 1                    ;Primer argumento: file handle (stdout).
     mov ecx, msg                ;Segundo argumento: puntero a la cadena a escribir.
     mov edx, len                  ;Tercer argumento: tama�o de la cadena.
     int 0x80                         ;Llama al Kernel.
      mov eax, 1                    ;N�mero de la llamada al sistema (sys_exit).
     xor ebx, ebx                  ;Argumento de la llamada: c�digo de salida (0: ejecuci�n exitosa).
     int 0x80                        ;Llama al Kernel.


