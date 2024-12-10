import processing.serial.*;
int rtButton;
int ltButton;
int upButton;
int dnButton;
int circXcord=700;
int circYcord=600;
int lf = 10;    // Linefeed in ASCII
String myString = null;
Serial myPort;  // The serial port
int[] inData = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
void setup() {
  size(1400, 1200);
  // List all the available serial ports
  printArray(Serial.list());
  // Open the port you are using at the rate you want:
  myPort = new Serial(this, Serial.list()[2], 9600);
  myPort.clear();
  // Throw out the first reading, in case we started reading
  // in the middle of a string from the sender.
  myString = myPort.readStringUntil(lf);
  myString = null;
}

void draw() {
  myPort.write('a');
  while (myPort.available() > 0) {
    myString = myPort.readStringUntil(lf);
    if (myString != null)

    {
      inData = int(trim(split(myString, ',')));
      background(255-(inData[0]/4), 255-(inData[1]/4), 255-(inData[2]/4));
      fill(inData[0]/4, inData[1]/4, inData[2]/4);
      if(inData[10]==0)
      {
      ellipse(inData[3], inData[4], 700, 600);
      }
      else
      {
        ellipse(circXcord, circYcord, 700, 600);
      }
    }
  }
  textSize(30);
  text("Potentiometer1= ", 500, 35);
  text(inData[0], 720, 35);
  text("Potentiometer2= ", 805, 35);
  text(inData[1], 1020, 35);
  text("Potentiometer3= ", 1120, 35);
  text(inData[2], 1335, 35);
  text("JoyStick Xcord= ", 225, 105);
  text(inData[3], 430, 105);
  text("JoyStick Ycord= ", 225, 70);
  text(inData[4], 430, 70);
  text("JoyStick Press= ", 225, 35);
  text(inData[5], 430, 35);
  text("Button 4= ", 10, 35);
  text(inData[6], 135, 35);
  text("Button 12= ", 10, 70);
  text(inData[7], 145, 70);
  text("Button 7= ", 10, 105);
  text(inData[8], 135, 105);
  text("Button 8= ", 10, 140);
  text(inData[9], 135, 140);
  text("Switch P2= ", 10, 175);
  text(inData[10], 150, 175);
}


//********arduino code********
/*
#include <Arduino.h>
#include <Wire.h>



 char key;
void setup() {
  Serial.begin(9600);
pinMode(9, OUTPUT);
pinMode(10, OUTPUT);
pinMode(11, OUTPUT);
pinMode(12, INPUT_PULLUP);
pinMode(4, INPUT_PULLUP);
pinMode(7, INPUT_PULLUP);
pinMode(8, INPUT_PULLUP);
pinMode(2, INPUT_PULLUP);
 
}

void loop() {
  if (Serial.available()>0)
  {
 key=Serial.read();
 if (key=='a')
 {
Serial.print(analogRead(A0));//first pot
Serial.print(", ");
Serial.print(analogRead(A1));//second pot
Serial.print(", ");
Serial.print(analogRead(A2));//third pot
Serial.print(", ");
Serial.print(analogRead(A3));//joystick X
Serial.print(", ");
Serial.print(analogRead(A4));//joystick Y
Serial.print(", ");
Serial.print(digitalRead(19));// button
Serial.print(", ");
Serial.print(digitalRead(4));//right button
Serial.print(", ");
Serial.print(digitalRead(12));//up button
Serial.print(", ");
Serial.print(digitalRead(7));//right buttobn
Serial.print(", ");
Serial.print(digitalRead(8));//down buttobn
Serial.print(", ");
Serial.println(digitalRead(2));//switch
delay(10);
}


}
}

 
 */
