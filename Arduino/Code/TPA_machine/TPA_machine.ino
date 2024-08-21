// Include the AccelStepper library:
#include "AccelStepper.h"

// Define stepper motor connections and motor interface type. 
// Motor interface type must be set to 1 when using a driver
#define dirPin 4
#define stepPin 3
#define motorInterfaceType 1

// Create a new instance of the AccelStepper class:
AccelStepper stepper = AccelStepper(motorInterfaceType, stepPin, dirPin);

void setup() {
  // Set the maximum speed and acceleration:
  stepper.setMaxSpeed(20);
  stepper.setAcceleration(20);
}

void loop() {
  // Set the target position:
  stepper.moveTo(200);
  // Run to target position with set speed and acceleration/deceleration:
  stepper.runToPosition();

  //delay(1000);

  // Move back to zero:
  stepper.moveTo(0);
  stepper.runToPosition();

  //delay(1000);
}
