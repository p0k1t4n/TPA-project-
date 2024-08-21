#include <SoftwareSerial.h>

#define RX_PIN 0
#define TX_PIN 1
SoftwareSerial mySerial(RX_PIN, TX_PIN); // RX, TX

void setup() {
  Serial.begin(9600);  // Initialize hardware serial to communicate with the computer
  mySerial.begin(4800); // Initialize software serial to communicate with the main Arduino
}

void loop() {
  if (mySerial.available()) {
    Serial.write(mySerial.read());  // Forward data from software serial to hardware serial
  }
}
