#include <math.h>
float temp_set;
int on = 1;
int off = 0;


void setup()
{
  Serial.begin(9600);
  pinMode(P1_4,INPUT_PULLUP);
  pinMode(P1_6,OUTPUT);
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
 
  if (temp < temp_set - 0.5)
  {
    digitalWrite(P1_6,HIGH); // P1_5 is heater
    Serial.print("The temperature value is ");
    Serial.print(temp);
    Serial.print("\n");
    Serial.print(on) // heater is on
    Serial.print("\r\n");
    
    //delay(5000);
  }
  else if (temp > temp_set +0.5)
  {
    digitalWrite(P1_6,LOW);
    Serial.print("The temperature value is ");
    Serial.print(temp);
    Serial.print("\n");
    Serial.print(off) // heater is on
    Serial.print("\r\n");
    //delay(5000);
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




