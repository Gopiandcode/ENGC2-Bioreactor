#include <math.h>
float temp_set = 30;
int on = 1;
int off = 0;
int output;

int sending_time;


void setup()
{
  Serial.begin(9600);
  pinMode(P1_4,INPUT_PULLUP);
  pinMode(P1_6,OUTPUT);
  sending_time = millis();
input:
  Serial.println("Enter ideal temperature value between 25-35");
  while(Serial.available() == 0) {}
  temp_set = Serial.parseFloat();
  if (temp_set > 35 || temp_set < 25)
  {
    Serial.print("Value for temperature out of range.\n");
    goto input;
  }
  
}

void loop()
{
  float temp= Thermistor(analogRead(P1_4)); // P1_4 is thermistor
  unsigned long mil = millis();
  if (temp < temp_set - 0.5)
  {
    digitalWrite(P1_6,HIGH); // P1_5 is heater
    Serial.println(on);
    output = on;
   //delay(5000);
  }
  else if (temp > temp_set +0.5)
  {
    digitalWrite(P1_6,LOW);
    Serial.println(off);
    output = off;
   
    //delay(5000);
  }
  
  if (mil - sending_time >= 100)
  {
    Serial.print ("b ");
    Serial.print (temp);
    Serial.print (" ");
    Serial.print (output);
    Serial.print (" ");
    Serial.print ("\n");
    sending_time = millis();
  }
  delay(500);
 }
 
// convert ADC values to Celcius

float Thermistor(int RawADC) 
{
  float Temp;
  RawADC = 1024-RawADC;
  Temp = logf(10000.0/((1024.0/RawADC-1))); 
  Temp = 1.0 / (0.001129148 + (0.000234125 + (0.0000000876741 * Temp * Temp ))* Temp );
  Temp = Temp - 273.15;            // Convert Kelvin to Celcius */
  return Temp;
}




