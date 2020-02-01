//Incluye librerias utiles
#include <Servo.h>

//Creación de los 3 objetos (servos) a utilizar
Servo base; 
Servo brazo; 
Servo pinza; 

int pos = 0;        // Variable de posición (angulo mapeado)
int valor = 0;      // Variable de posición (angulo sin mapear)

void setup() {
  Serial.begin(9600);     // Abrir puerto serial a esa velocidad
  base.attach(9);         // Adjunta el objeto base al pin 
  brazo.attach(10);       // Adjunta el objeto brazo al pin
  pinza.attach(11);       // Adjunta el objeto pinza al pin
}


void loop() {

  if (Serial.available()) {           //Si se recibe algo serial
    char caracter = Serial.read();    //Lo lee (guardado en formato caracteres)

    switch(caracter){                 
      case '0'...'9':                 //Si es un valor de digito (0 a 9 en formato caracter, no int)
        valor = valor * 10 + caracter - '0';    //Acumula y ajusta en formato int
        break;
      case 'A':                       //Si esta direccionado al movimiento de la base
        pos = valor*(180.0/200.0);    //Se mapea los grados
        base.write(pos);              //Se manda al servo la posicion   
        valor = 0;                    //Se reinicia la variable de posicion
        break;  
      case 'B':                        //Si esta direccionado al movimiento del brazo igual que el anterior
        pos = valor*(180.0/200.0);
        brazo.write(pos); 
        valor = 0;
        break;  
      case 'C':                       //Si esta direccionado al movimiento de la pinza igual que el anterior
        pos = valor*(180.0/200.0);
        pinza.write(pos); 
        valor = 0;
        break;  
      }
  }        
}

