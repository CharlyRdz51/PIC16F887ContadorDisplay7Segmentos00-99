#line 1 "C:/Users/master/Desktop/SSPPSE/practica3/anodo/nuevo.c"
unsigned char unidades=0;
unsigned char decenas=0;
unsigned char TABLA[]={0xC0,0xF9,0xA4,0xB0,0x99,0x92,0x82,0xF8,0x80,0x98};
unsigned char memoria1,memoria2,memoria3,memoria4,memoria5,memoria6,memoria7,memoria8;

void conteo_up();
void conteo_down();
void multiplexado(unsigned char veces);

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

while(1) {

 if(PORTA.RA4==0&PORTA.RA4==1)
 {
 memoria1=1;
 }
 {
 conteo_up();
 memoria1=0;
 }


 if(PORTA.RA4==0&PORTA.RA4==1)
 {
 memoria2=1;
 }
 {
 conteo_down();
 memoria2=0;
 }
 if(PORTA.RA4==0)
{
 conteo_up();
 }
 if(PORTA.RA4==1)
 {
 conteo_down();
 }

multiplexado(25);
 }
}

 void conteo_up()
{
 if(unidades==9&decenas==9)
 {
 unidades=0;
 decenas=0;

 }
 else
 {
 unidades++;
 if(unidades==10)
 {
 unidades=0;
 decenas++;
 if(decenas==10)
 {
 decenas=0;
 }
 }
 }
}

void conteo_down()
{
 if(unidades==0&decenas==0)
 {
 unidades=9;
 decenas=9;

 }
 else
 {
 unidades--;
 if(unidades==99)
 {
 unidades=9;
 decenas--;
 }
 }
}

void multiplexado(unsigned char veces)
{

 PORTA.RA0=0;
 PORTA.RA1=0;

 while(veces)
 {
 PORTA=TABLA[unidades];
 PORTA.RA1=1;
 delay_ms(3);
 PORTA.RA1=0;

 PORTA=TABLA[decenas];
 PORTA.RA0=1;
 delay_ms(3);
 PORTa.RA0=0;

 veces--;
 }
}
