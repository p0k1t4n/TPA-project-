#define Trig 2
#define Echo 3

long ProTime, Dist;

long Trigger(){
  digitalWrite(Trig,LOW);
  digitalWrite(Trig,HIGH);
  delayMicroseconds(10);
  digitalWrite(Trig,LOW);

  return pulseIn(Echo, HIGH);
}
void setup() {
  pinMode(Trig,OUTPUT);
  pinMode(Echo,INPUT);
  Serial.begin(9600);
}

void loop() {
  ProTime = Trigger();
  Dist = ProTime / 59;
  String message = "Distance:";
  message += Dist;
  message += "cm";
  Serial.println(message);
  delay(1000);
}
