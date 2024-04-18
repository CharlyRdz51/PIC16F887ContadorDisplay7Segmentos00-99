/*SSPPSE
Ing. Jose Jesus Ramos Guillen
Aguilar Rodriguez Carlos AdolfO
215860049
Contador de 0-99 DISPLAY 7 segmentos
09 de septiembre del 2016
*/

#define TIME 100
unsigned char cont=0;
unsigned char DISPLAY[]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67};

void main()
{
ANSEL=ANSELH=0;
C1ON_BIT=C2ON_BIT=0;
TRISC=0x00;
PORTC=0x00;
TRISA.F0=0;
TRISA.F1=0;
TRISA.F3=1;
TRISA.F4=1;
PORTA.F0=1;
PORTA.F1=1;

while(1)
{
if(PORTA.F3==0)

{
if(PORTA.F4==0)
{

if(Cont==99)
{cont=0;}
else
{++cont;}


}else{
if(cont==0)
{cont=99;}
else{--cont;}

}
}


PORTC=DISPLAY[cont%10];
PORTA.F0=0;
delay_ms(TIME);
PORTA.F0=1;
PORTC=DISPLAY[cont/10];
PORTA.F1=0;
delay_ms(TIME);
PORTA.F1=1;
}
}