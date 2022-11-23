int LEDArray[] = {3, 8, 9, 10};
int numOfLEDs = 4;
int pirState = LOW; //We need to assuming no motion detected
int pirPin = 12;
int pirVal = 0;

unsigned long myTime;
const int PulseWire = A0;
int Threshold = 400;
const int ledPin = 13; // the number of the LED pin
int val = 0;  // variable to store the value read
unsigned long start;
unsigned int count = 0;
int mins = 0;

//int ZedPin = 2; //test

void setup() {

  Serial.begin(9600);
  pinMode(pirPin, INPUT);

  int i;
  for (i = 0; i < numOfLEDs; i++) {
    pinMode(LEDArray[i], OUTPUT);
  }

  pinMode(ledPin, OUTPUT);
  start = millis();
  //send_dec2binary4digit(3);
}

void loop() {

  pirVal = digitalRead(pirPin);
  int i;
  if (pirVal == HIGH) {
    Serial.println("Motion detected!"); //Debug used
    //digitalWrite(ZedPin, 1); //Zedboard
    send_dec2binary4digit(1);
    for (i = 0; i < numOfLEDs; i++) {
      digitalWrite(LEDArray[i], 255);
      // Your code here
      delay (500); // This delay is going to enable the light one by one only
      Serial.println("Light On"); //Debug used
    }
    // Your code here
    for (i = 0; i < numOfLEDs; i++) { // This for-loop code is going to turn off the LED light with a delay one by one to set it back as 0
      analogWrite(LEDArray[i], 0);
      delay (500); // The delay is requires same as enable the light one by one also need to turn off one by one
      Serial.println("Light Off"); //Debug used
    }
    if (pirState == HIGH) { //Since the motion has change to high voltage when it detect the motion, after that we need to reset it and ensure the state is low for waiting next motion detection
      Serial.println("Light Out"); //Debug used
      pirState = LOW;
      Serial.println("Motion ended!"); //Debug used
    }
  }
  else {
    send_dec2binary4digit(0);
    //analogWrite(ZedPin, 0); //Zedboard
    for (i = 0; i < numOfLEDs; i++) {
      analogWrite(LEDArray[i], 0);
    }
    if (pirState == HIGH) {
      pirState = LOW;
      Serial.println("Motion ended!"); //Debug used
    }
  }
  if (millis() - start < 60000) { // 1mins
    val = analogRead(PulseWire);  // read the input pin
    Serial.print("Signal Level per second: ");
    Serial.println(val);          // debug value
    delay(1000);
    if (val > Threshold) {
      // turn LED on:
      digitalWrite(ledPin, HIGH);
      count++;
      // Serial.println("Higher than the threshold 550!!");
    } else {
      // turn LED off:
      digitalWrite(ledPin, LOW);
    }
  }
  else {// time window exceeded.
    mins++;
    Serial.print(mins); // prints X min
    Serial.print(" mins has been passed! "); // prints X min
    Serial.print("Signal Level per mins: ");
    Serial.print(val);          // debug value
    Serial.print(", Pulse Rate: ");
    Serial.println(count, DEC);
    start = millis();
    count = 0;
  }
}

void send_dec2binary4digit(unsigned int num) {
  unsigned int shifter = num;
  //  analogWrite(7, (shifter >> 3 & 1));
  //  analogWrite(6, (shifter >> 2 & 1));
  //  analogWrite(5, (shifter >> 1 & 1));
  //  analogWrite(4, (shifter >> 0 & 1));
  //  digitalWrite(7, (shifter >> 3 & 1));
  //  digitalWrite(6, (shifter >> 2 & 1));
  //  digitalWrite(5, (shifter >> 1 & 1));
  //  digitalWrite(4, (shifter >> 0 & 1));
  if ((shifter >> 3 & 1) == 1){
    digitalWrite(7, (shifter >> 3 & 1));
  } else {
    analogWrite(7, (shifter >> 3 & 1));
  }
  if ((shifter >> 2 & 1) == 1){
    digitalWrite(6, (shifter >> 2 & 1));
  } else {
    analogWrite(6, (shifter >> 2 & 1));
  }
  if ((shifter >> 1 & 1) == 1){
    digitalWrite(5, (shifter >> 1 & 1));
  } else {
    analogWrite(5, (shifter >> 1 & 1));
  }
  if ((shifter >> 0 & 1) == 1){
    digitalWrite(4, (shifter >> 0 & 1));
  } else {
    analogWrite(4, (shifter >> 0 & 1));
  }
//    Serial.println((shifter >> 3 & 1));
//    Serial.println((shifter >> 2 & 1));
//    Serial.println((shifter >> 1 & 1));
//    Serial.println((shifter >> 0 & 1));
}
