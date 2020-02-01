#include <Servo.h>

Servo base; 

int pos = 0;    // variable to store the servo position
int angle = 0;

int incomingByte = 0; // for incoming serial data

void setup() {
  Serial.begin(9600); // opens serial port, sets data rate to 9600 bps
  base.attach(9);  // attaches the servo on pin 9 to the servo object
}

void loop() {
  // send data only when you receive data:
  if (Serial.available() > 0) {
    // read the incoming byte:
    incomingByte = Serial.read();
    angle = incomingByte*(180.0/200.0);
    base.write(angle);   
    Serial.println("ya");
                 // waits 15ms for the servo to reach the position
                 // tell servo to go to position in variable 'pos  
  }
  delay(100);          
}

