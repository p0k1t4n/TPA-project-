#include <SoftwareSerial.h>
#include "AccelStepper.h"

#define dirPin 2
#define stepPin 3
#define motorInterfaceType 1
AccelStepper stepper = AccelStepper(motorInterfaceType, stepPin, dirPin);

#define RX_PIN 0
#define TX_PIN 1
SoftwareSerial mySerial(RX_PIN, TX_PIN); // RX, TX

void setup() {
  Serial.begin(9600);  // Initialize hardware serial to communicate with the computer
  mySerial.begin(9600); // Initialize software serial to communicate with the main Arduino
  stepper.setMaxSpeed(20);
  stepper.setAcceleration(20);
}

void loop() {
  if (mySerial.available()) {
    Serial.write(mySerial.read());  // Forward data from software serial to hardware serial
  }
  
  stepper.moveTo(200);
  stepper.runToPosition();
  stepper.moveTo(0);
  stepper.runToPosition();
  delay(3000);
}
