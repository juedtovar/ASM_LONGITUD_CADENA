;***********************LECTURA DE CADENA DESDE TECLADO*****************
; El segundo byte contiene la longitud de la cadena leída, pero ésto se
;   conoce hasta después de capturada. Por tal razón se inicializa a
; CERO.
; 
; Este programa muestra la longitud de la cadena leída.
.model small
.stack 
.data 
    nombre      db 150,0, 151 dup('$') ; Reservar un espacio más por el ENTER
    msj         db 'Introduce tu nombre:$'
    longitud    db 0,0,0,'$'
    msjT        db 'La longitud de la cadena es: $'
.code
 inicio: MOV AX,@DATA
         MOV DS,AX
         MOV ES,AX ; Manejo de color
         
                mov ah,2    ; cursor
                mov dh,10
                mov dl,25
                mov bh,0
                int 10h
                    
                        mov ah,9        ;Imprimir sin color
                        lea dx,msj
                        int 21h
                
                mov ah,2    ;cursor
                mov dh,13
                mov dl,0
                mov bh,0
                int 10h
                        
                        MOV AH,0AH      ;LECTURA DE CADENA DESDE TECLADO
                        LEA DX,nombre
                        int 21h
                        ;*******SEGUNDO BYTE LONGITUD DE LA CADENA
                        mov ax,0
                        mov al,nombre[1]
                        aam   ; DÍVIDE EN DECENAS Y UNIDADES 
                            ADD AL,30H ; CONVERSIÓN ASCII
                            mov longitud[2],AL  ; UNIDADES
                        mov AL,AH
                        aam ; DÍVIDE EN DECENAS Y UNIDADES
                            ADD AX,3030H
                        mov longitud[0],AH  ; CENTENAS
                        mov longitud[1],AL  ; DECENAS
                        
                        
                mov ah,2    ;cursor
                mov dh,16
                mov dl,21
                mov bh,0
                int 10h   
                        
                        mov ah,9        ;Imprimir sin color
                        lea dx,msjT
                        int 21h 
                mov ah,2    ;cursor
                mov dh,16
                mov dl,49
                mov bh,0
                int 10h  
                        mov ah,9        ;Imprimir sin color
                        lea dx,longitud
                        int 21h
                        
Salir:
               mov ax,4c00h
               int 21h
end
   