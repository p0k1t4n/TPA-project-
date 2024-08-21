#include <SoftwareSerial.h>

// Software serial pins
#define RX_PIN 8
#define TX_PIN 7
SoftwareSerial mySerial(RX_PIN, TX_PIN); // RX, TX

void setup() {
  // Scale
  Serial.begin(9600);
  Serial.println("Initializing the scale");
  Serial.println("Before setting up the scale:");
  Serial.println("Readings:");
  
  // Initialize software serial
  mySerial.begin(4800);
  mySerial.println("Software Serial port ready ...");
}

void loop() {
  
  Serial.println("This is Main Board "); // Print weight on hardware serial

  mySerial.println("This is Support Board ");
  
  delay(2000); // Small delay to avoid overwhelming the serial output
}
