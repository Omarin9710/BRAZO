

import controlP5.*;
import processing.serial.*;

Serial myPort;  // Create object from Serial class

ControlP5 cp5;

int myColor = color(0,0,0);

int Pinza = 100;
int Brazo = 100;
int Base = 100;
Slider abc;


int contador = 0 ;

void setup() {
  size(600,650);
  noStroke();
  cp5 = new ControlP5(this);
  
  String portName = Serial.list()[0]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);
  
  
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
  cp5.getController("Pinza").getValueLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  cp5.getController("Pinza").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  
}

void draw() {
 
  contador = contador +1;
  if(contador == 10){
    contador = 0;
    myPort.write(Base); 
    println(Pinza);   
  }
  
  
  background(Brazo);

  
  fill(myColor);
  rect(0,280,width,70);

  
}

void slider(float theColor) {
  myColor = color(theColor);
  println("a slider event. setting background to "+theColor);
}


void mousePressed()  {
    
 

  }
