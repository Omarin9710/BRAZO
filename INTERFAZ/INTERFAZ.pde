import processing.serial.*;

import processing.serial.*;

Serial myPort;  // Create object from Serial class

void setup() 
{
  size(200,200); //make our canvas 200 x 200 pixels big
  printArray(Serial.list());
  String portName = Serial.list()[0]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);
}

void draw(){
  background(0);
  fill(255);
  rect(10,10,10,10);
}

void mousePressed(){
   myPort.write('A');         //send a 1
   println(180);   
}
 
void mouseReleased(){
   myPort.write('z');         //send a 1
   println(0);   
}
