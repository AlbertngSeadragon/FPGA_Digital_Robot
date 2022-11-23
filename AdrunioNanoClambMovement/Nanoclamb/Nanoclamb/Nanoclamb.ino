#include <Servo.h>

Servo myservo;

// constants
const int iServoPin = 9;              // servo pin number
const int iMaxServoVal = 110;         // Clam open value -- this value should be adjusted to fit individual clam
const int iMinServoVal = 14;        // Clam close value -- this value should be adjusted to fit individual clam
const int iServoStep = 10;            // controls clam extension speed - increase to speed up

const int button = 12; // D12
int buttonState = 0;

char c;
int iServoVal;

Servo myservo1; // create servo object to control a servo
int rightIRsensor = A4;
int leftIRsensor = A5;
int rightvalue;
int leftvalue;
int dead_band = 20;
int pos = 90;

void setup()
{
  Serial.begin(9600);
  myservo.attach(iServoPin);        // attaches the pin to the servo object
  iServoVal =  iMinServoVal;    // intialize to min value
  // initialize the pushbutton pin as an input:
  pinMode(button, INPUT);
  delay(10000);             // 10 second delay to give you time to plug in the battery, stow it, and get clear
  
  myservo1.attach(3); // attaches the servo on pin 11 to the servo object
  myservo1.write(pos);
}

void loop()
{
//  buttonState = digitalRead(button);
//  if (buttonState == LOW) {
//    // turn LED on:
//    iServoVal = iMinServoVal;
//  } else {
//    // turn LED off:
//    iServoVal = iMaxServoVal;
//  }
//
//  myservo.write(iServoVal);
//
//  // delay to not overload the ADC
//  delay(500);

  simonlastwork();
}

void simonlastwork() {
  // put your main code here, to run repeatedly:
  rightvalue = analogRead(rightIRsensor); //A4
  leftvalue = analogRead(leftIRsensor); //A5


  Serial.print("Left value :");
  Serial.println(leftvalue);
  Serial.print("Right value :");
  Serial.println(rightvalue);
  if (rightvalue > leftvalue) {
    if ((rightvalue - leftvalue) > dead_band) {
      pos++;
      if (180 < pos) {
        pos = 180;
      }
      if (0 > pos) {
        pos = 0;
      }
      if ((180 >= pos) and (pos >= 0)) {
        myservo1.write(pos);
      }
    }
  }
  else if (leftvalue > rightvalue) {
    if ((leftvalue - rightvalue) > dead_band) {
      pos--;
      if (180 < pos) {
        pos = 180;
      }
      if (0 > pos) {
        pos = 0;
      }
      if ((180 >= pos) and (pos >= 0)) {
        myservo1.write(pos);
      }
    }
  }
  delay(20);
}
