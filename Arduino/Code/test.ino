//超音波測距模組HC-SR04
const byte trigPin=5; //超音波測距的 觸發腳
const byte echoPin=6; //超音波測距的 回應腳
float d;
 
void setup() {
  //設定輸出輸入
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT); 

  //開啟串例傳輸
  Serial.begin(9600);
}

void loop() {
  //測距離
  d = sr04() * 0.017; 
  Serial.print(d,1);
  Serial.println("cm");
  delay(200);
}

//超音波測距函式
//送 10μs 脈波給 HC-SR04 觸發腳(trigger pin)，並計算 回應腳(echo)變成高電位的時間
unsigned long sr04() { 
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  return pulseIn(echoPin, HIGH);
}
