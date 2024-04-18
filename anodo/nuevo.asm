
_main:

;nuevo.c,10 :: 		void main()
;nuevo.c,12 :: 		ANSEL=ANSELH=0;
	CLRF       ANSELH+0
	CLRF       ANSEL+0
;nuevo.c,13 :: 		C1ON_BIT=C2ON_BIT=0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
	BTFSC      C2ON_bit+0, BitPos(C2ON_bit+0)
	GOTO       L__main18
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
	GOTO       L__main19
L__main18:
	BSF        C1ON_bit+0, BitPos(C1ON_bit+0)
L__main19:
;nuevo.c,14 :: 		TRISC=0x00;
	CLRF       TRISC+0
;nuevo.c,15 :: 		PORTC=0x00;
	CLRF       PORTC+0
;nuevo.c,16 :: 		TRISA.F0=0;
	BCF        TRISA+0, 0
;nuevo.c,17 :: 		TRISA.F1=0;
	BCF        TRISA+0, 1
;nuevo.c,18 :: 		TRISA.F3=1;
	BSF        TRISA+0, 3
;nuevo.c,19 :: 		TRISA.F4=1;
	BSF        TRISA+0, 4
;nuevo.c,20 :: 		PORTA.F0=1;
	BSF        PORTA+0, 0
;nuevo.c,21 :: 		PORTA.F1=1;
	BSF        PORTA+0, 1
;nuevo.c,23 :: 		while(1) {
L_main0:
;nuevo.c,25 :: 		if(PORTA.RA4==0&PORTA.RA4==1)
	BTFSC      PORTA+0, 4
	GOTO       L__main20
	BSF        112, 0
	GOTO       L__main21
L__main20:
	BCF        112, 0
L__main21:
	BTFSC      PORTA+0, 4
	GOTO       L__main22
	BCF        3, 0
	GOTO       L__main23
L__main22:
	BSF        3, 0
L__main23:
	BTFSS      112, 0
	GOTO       L__main24
	BTFSS      3, 0
	GOTO       L__main24
	BSF        112, 0
	GOTO       L__main25
L__main24:
	BCF        112, 0
L__main25:
	BTFSS      112, 0
	GOTO       L_main2
;nuevo.c,27 :: 		memoria1=1;
	MOVLW      1
	MOVWF      _memoria1+0
;nuevo.c,28 :: 		}
L_main2:
;nuevo.c,30 :: 		conteo_up();
	CALL       _conteo_up+0
;nuevo.c,31 :: 		memoria1=0;
	CLRF       _memoria1+0
;nuevo.c,35 :: 		if(PORTA.RA4==0&PORTA.RA4==1)
	BTFSC      PORTA+0, 4
	GOTO       L__main26
	BSF        112, 0
	GOTO       L__main27
L__main26:
	BCF        112, 0
L__main27:
	BTFSC      PORTA+0, 4
	GOTO       L__main28
	BCF        3, 0
	GOTO       L__main29
L__main28:
	BSF        3, 0
L__main29:
	BTFSS      112, 0
	GOTO       L__main30
	BTFSS      3, 0
	GOTO       L__main30
	BSF        112, 0
	GOTO       L__main31
L__main30:
	BCF        112, 0
L__main31:
	BTFSS      112, 0
	GOTO       L_main3
;nuevo.c,37 :: 		memoria2=1;
	MOVLW      1
	MOVWF      _memoria2+0
;nuevo.c,38 :: 		}
L_main3:
;nuevo.c,40 :: 		conteo_down();
	CALL       _conteo_down+0
;nuevo.c,41 :: 		memoria2=0;
	CLRF       _memoria2+0
;nuevo.c,43 :: 		if(PORTA.RA4==0)
	BTFSC      PORTA+0, 4
	GOTO       L_main4
;nuevo.c,45 :: 		conteo_up();
	CALL       _conteo_up+0
;nuevo.c,46 :: 		}
L_main4:
;nuevo.c,47 :: 		if(PORTA.RA4==1)
	BTFSS      PORTA+0, 4
	GOTO       L_main5
;nuevo.c,49 :: 		conteo_down();
	CALL       _conteo_down+0
;nuevo.c,50 :: 		}
L_main5:
;nuevo.c,52 :: 		multiplexado(25);
	MOVLW      25
	MOVWF      FARG_multiplexado_veces+0
	CALL       _multiplexado+0
;nuevo.c,53 :: 		}
	GOTO       L_main0
;nuevo.c,54 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_conteo_up:

;nuevo.c,56 :: 		void conteo_up()
;nuevo.c,58 :: 		if(unidades==9&decenas==9)
	MOVF       _unidades+0, 0
	XORLW      9
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       _decenas+0, 0
	XORLW      9
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_conteo_up6
;nuevo.c,60 :: 		unidades=0;
	CLRF       _unidades+0
;nuevo.c,61 :: 		decenas=0;
	CLRF       _decenas+0
;nuevo.c,63 :: 		}
	GOTO       L_conteo_up7
L_conteo_up6:
;nuevo.c,66 :: 		unidades++;
	INCF       _unidades+0, 1
;nuevo.c,67 :: 		if(unidades==10)
	MOVF       _unidades+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_conteo_up8
;nuevo.c,69 :: 		unidades=0;
	CLRF       _unidades+0
;nuevo.c,70 :: 		decenas++;
	INCF       _decenas+0, 1
;nuevo.c,71 :: 		if(decenas==10)
	MOVF       _decenas+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_conteo_up9
;nuevo.c,73 :: 		decenas=0;
	CLRF       _decenas+0
;nuevo.c,74 :: 		}
L_conteo_up9:
;nuevo.c,75 :: 		}
L_conteo_up8:
;nuevo.c,76 :: 		}
L_conteo_up7:
;nuevo.c,77 :: 		}
L_end_conteo_up:
	RETURN
; end of _conteo_up

_conteo_down:

;nuevo.c,79 :: 		void conteo_down()
;nuevo.c,81 :: 		if(unidades==0&decenas==0)
	MOVF       _unidades+0, 0
	XORLW      0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       _decenas+0, 0
	XORLW      0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_conteo_down10
;nuevo.c,83 :: 		unidades=9;
	MOVLW      9
	MOVWF      _unidades+0
;nuevo.c,84 :: 		decenas=9;
	MOVLW      9
	MOVWF      _decenas+0
;nuevo.c,86 :: 		}
	GOTO       L_conteo_down11
L_conteo_down10:
;nuevo.c,89 :: 		unidades--;
	DECF       _unidades+0, 1
;nuevo.c,90 :: 		if(unidades==99)
	MOVF       _unidades+0, 0
	XORLW      99
	BTFSS      STATUS+0, 2
	GOTO       L_conteo_down12
;nuevo.c,92 :: 		unidades=9;
	MOVLW      9
	MOVWF      _unidades+0
;nuevo.c,93 :: 		decenas--;
	DECF       _decenas+0, 1
;nuevo.c,94 :: 		}
L_conteo_down12:
;nuevo.c,95 :: 		}
L_conteo_down11:
;nuevo.c,96 :: 		}
L_end_conteo_down:
	RETURN
; end of _conteo_down

_multiplexado:

;nuevo.c,98 :: 		void multiplexado(unsigned char veces)
;nuevo.c,101 :: 		PORTA.RA0=0;
	BCF        PORTA+0, 0
;nuevo.c,102 :: 		PORTA.RA1=0;
	BCF        PORTA+0, 1
;nuevo.c,104 :: 		while(veces)
L_multiplexado13:
	MOVF       FARG_multiplexado_veces+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_multiplexado14
;nuevo.c,106 :: 		PORTA=TABLA[unidades];
	MOVF       _unidades+0, 0
	ADDLW      _TABLA+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTA+0
;nuevo.c,107 :: 		PORTA.RA1=1;
	BSF        PORTA+0, 1
;nuevo.c,108 :: 		delay_ms(3);
	MOVLW      4
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_multiplexado15:
	DECFSZ     R13+0, 1
	GOTO       L_multiplexado15
	DECFSZ     R12+0, 1
	GOTO       L_multiplexado15
	NOP
;nuevo.c,109 :: 		PORTA.RA1=0;
	BCF        PORTA+0, 1
;nuevo.c,111 :: 		PORTA=TABLA[decenas];
	MOVF       _decenas+0, 0
	ADDLW      _TABLA+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTA+0
;nuevo.c,112 :: 		PORTA.RA0=1;
	BSF        PORTA+0, 0
;nuevo.c,113 :: 		delay_ms(3);
	MOVLW      4
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_multiplexado16:
	DECFSZ     R13+0, 1
	GOTO       L_multiplexado16
	DECFSZ     R12+0, 1
	GOTO       L_multiplexado16
	NOP
;nuevo.c,114 :: 		PORTa.RA0=0;
	BCF        PORTA+0, 0
;nuevo.c,116 :: 		veces--;
	DECF       FARG_multiplexado_veces+0, 1
;nuevo.c,117 :: 		}
	GOTO       L_multiplexado13
L_multiplexado14:
;nuevo.c,118 :: 		}
L_end_multiplexado:
	RETURN
; end of _multiplexado
