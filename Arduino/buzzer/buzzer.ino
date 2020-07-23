#include <ArduinoMonitor.h>

#define buzzerPort 11
#define inPort A1

void setup() {
  Serial.begin(9600);
  pinMode(buzzerPort, OUTPUT);
}

void loop0() {
  digitalWrite(buzzerPort, HIGH);
  delay(400);
  digitalWrite(buzzerPort, LOW);
  delay(400);
}

void loop1() {
  int x = analogRead(inPort);
  digitalWrite(buzzerPort, HIGH);
  delay(x);
  digitalWrite(buzzerPort, LOW);
  delay(x);
}

int buzzerState = 0;
void loop2_good_kalman_example() {
  int x = analogRead(inPort);
  MONITOR(x);
  MONITOR_ENDL();
  uint32_t now = micros();
  uint32_t waitUntil = now + x *5;
  digitalWrite(buzzerPort, buzzerState);
  buzzerState = !buzzerState;
  while (micros() < waitUntil)
    ;
}
void loop2() {
  int x = analogRead(inPort);
  MONITOR(x);
  MONITOR_ENDL();
  uint32_t now = micros();
  uint32_t waitUntil = now + x *5;
  digitalWrite(buzzerPort, buzzerState);
  buzzerState = !buzzerState;
  while (micros() < waitUntil)
    ;
}

void loop() { loop0(); }
