
import controlP5.*;             //Libreria de graficos
import processing.serial.*;    //Libreria de comunicación serial

Serial myPort;                //Se crea el objeto para la libreria serial
ControlP5 cp5;               // Se crea el objeto para la libreria grafica

//int myColor = color(0,0,0);


//Variables para el control de cada servo
int Pinza = 100;
int Brazo = 100;
int Base = 100;

//Variable para la comunicación
int contador = 0 ;


void setup() {
  size(600,650);        //Tamaño de pantalla
  noStroke();          //Sin relleno
  
  cp5 = new ControlP5(this);  //Configuracion del onjeto
  
  String portName = Serial.list()[0];           //Seleccion del puerto serial
  myPort = new Serial(this, portName, 9600);   //Apertura a valocidad de 9600b/s
  
  
  //Creación de titulos de la interfaz
   cp5.addTextlabel("TITULO")
              .setText("INTERFAZ PARA BRAZO ROBÓTICO")
              .setPosition(50,25)
              .setColorValue(0xffffff00)
              .setFont(createFont("Georgia",30))
              ;
    
    cp5.addTextlabel("INDICADOR_BASE")
              .setText("CONTROL BASE")
              .setPosition(50,120)
              .setColorValue(0xffffff00)
              .setFont(createFont("Georgia",15))
              ;
              
     cp5.addTextlabel("INDICADOR_BRAZO")
              .setText("CONTROL BRAZO")
              .setPosition(400,120)
              .setColorValue(0xffffff00)
              .setFont(createFont("Georgia",15))
              ;
    
     cp5.addTextlabel("INDICADOR_PINZA")
              .setText("CONTROL PINZA")
              .setPosition(50,520)
              .setColorValue(0xffffff00)
              .setFont(createFont("Georgia",15))
              ;    
    
    
 //Creacion de los deslizadores   
   cp5.addKnob("Base")
               .setRange(0,200)
               .setValue(100)
               .setPosition(70,150)
               .setRadius(150)
               .setColorForeground(color(255))
               .setColorBackground(color(0, 160, 100))
               .setColorActive(color(255,255,0))
               .setDragDirection(Knob.HORIZONTAL)
               ;
               
  cp5.addSlider("Brazo")
               .setPosition(450,150)
               .setSize(75,300)
               .setRange(0,200)
               .setNumberOfTickMarks(5)
               ;
     
     
  cp5.addSlider("Pinza")
               .setPosition(50,550)
               .setSize(500,75)
               .setRange(0,200)
               .setValue(128)
               ;
            
  // reposition the Label for controller 'Pinza'
//  cp5.getController("Pinza").getValueLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
//  cp5.getController("Pinza").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  
}

void draw() {
 
  //En cada actualizacion de dibujado de la interfaz se envia los datos de los deslizadores
  contador = contador +1;
  if(contador == 15){
    contador = 0;
    
    myPort.write(Base+"A");   //Base con el identificador A
    myPort.write(Brazo+"B");  //Brazo con el identificador B
    myPort.write(Pinza+"C");  //Pinza con el identificador C
    
    println("A"+Base);    //Muestra en consola solo para controlar   
    println("B"+Brazo);
    println("C"+Pinza);  
    println("  ");   
  }

  background(10); //Color de fondo (obligatorio refrescarlo aqui)
   
}

//
//void slider(float theColor) {
//  myColor = color(theColor);
//  println("a slider event. setting background to "+theColor);
//}
