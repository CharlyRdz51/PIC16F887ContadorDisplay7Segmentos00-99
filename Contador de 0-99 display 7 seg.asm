
_main:

;Contador de 0-99 display 7 seg.c,5 :: 		void main()
;Contador de 0-99 display 7 seg.c,7 :: 		ANSEL=ANSELH=0;
	CLRF       ANSELH+0
	CLRF       ANSEL+0
;Contador de 0-99 display 7 seg.c,8 :: 		C1ON_BIT=C2ON_BIT=0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
	BTFSC      C2ON_bit+0, BitPos(C2ON_bit+0)
	GOTO       L__main12
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
	GOTO       L__main13
L__main12:
	BSF        C1ON_bit+0, BitPos(C1ON_bit+0)
L__main13:
;Contador de 0-99 display 7 seg.c,9 :: 		TRISC=0x00;
	CLRF       TRISC+0
;Contador de 0-99 display 7 seg.c,10 :: 		PORTC=0x00;
	CLRF       PORTC+0
;Contador de 0-99 display 7 seg.c,11 :: 		TRISA.F0=0;
	BCF        TRISA+0, 0
;Contador de 0-99 display 7 seg.c,12 :: 		TRISA.F1=0;
	BCF        TRISA+0, 1
;Contador de 0-99 display 7 seg.c,13 :: 		TRISA.F3=1;
	BSF        TRISA+0, 3
;Contador de 0-99 display 7 seg.c,14 :: 		TRISA.F4=1;
	BSF        TRISA+0, 4
;Contador de 0-99 display 7 seg.c,15 :: 		PORTA.F0=1;
	BSF        PORTA+0, 0
;Contador de 0-99 display 7 seg.c,16 :: 		PORTA.F1=1;
	BSF        PORTA+0, 1
;Contador de 0-99 display 7 seg.c,18 :: 		while(1)
L_main0:
;Contador de 0-99 display 7 seg.c,20 :: 		if(PORTA.F3==0)
	BTFSC      PORTA+0, 3
	GOTO       L_main2
;Contador de 0-99 display 7 seg.c,22 :: 		if(PORTA.F4==0)
	BTFSC      PORTA+0, 4
	GOTO       L_main3
;Contador de 0-99 display 7 seg.c,24 :: 		if(Cont==99)
	MOVF       _cont+0, 0
	XORLW      99
	BTFSS      STATUS+0, 2
	GOTO       L_main4
;Contador de 0-99 display 7 seg.c,25 :: 		{cont=0;}
	CLRF       _cont+0
	GOTO       L_main5
L_main4:
;Contador de 0-99 display 7 seg.c,27 :: 		{++cont;}
	INCF       _cont+0, 1
L_main5:
;Contador de 0-99 display 7 seg.c,28 :: 		}else{
	GOTO       L_main6
L_main3:
;Contador de 0-99 display 7 seg.c,29 :: 		if(cont==0)
	MOVF       _cont+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main7
;Contador de 0-99 display 7 seg.c,30 :: 		{cont=99;}
	MOVLW      99
	MOVWF      _cont+0
	GOTO       L_main8
L_main7:
;Contador de 0-99 display 7 seg.c,31 :: 		else{--cont;}
	DECF       _cont+0, 1
L_main8:
;Contador de 0-99 display 7 seg.c,32 :: 		}
L_main6:
;Contador de 0-99 display 7 seg.c,33 :: 		}
L_main2:
;Contador de 0-99 display 7 seg.c,36 :: 		PORTC=DISPLAY[cont%10];
	MOVLW      10
	MOVWF      R4+0
	MOVF       _cont+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      _DISPLAY+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;Contador de 0-99 display 7 seg.c,37 :: 		PORTA.F0=0;
	BCF        PORTA+0, 0
;Contador de 0-99 display 7 seg.c,38 :: 		delay_ms (TIME);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
	NOP
;Contador de 0-99 display 7 seg.c,39 :: 		PORTA.F0=1;
	BSF        PORTA+0, 0
;Contador de 0-99 display 7 seg.c,40 :: 		PORTC=DISPLAY[cont/10];
	MOVLW      10
	MOVWF      R4+0
	MOVF       _cont+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      _DISPLAY+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;Contador de 0-99 display 7 seg.c,41 :: 		PORTA.F1=0;
	BCF        PORTA+0, 1
;Contador de 0-99 display 7 seg.c,42 :: 		delay_ms(TIME);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
	DECFSZ     R11+0, 1
	GOTO       L_main10
	NOP
;Contador de 0-99 display 7 seg.c,43 :: 		PORTA.F1=1;
	BSF        PORTA+0, 1
;Contador de 0-99 display 7 seg.c,44 :: 		}
	GOTO       L_main0
;Contador de 0-99 display 7 seg.c,45 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
