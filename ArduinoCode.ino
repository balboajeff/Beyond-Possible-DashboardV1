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
