#include <math.h>
float temp_set;

void setup()
{
  Serial.begin(9600);
  pinMode(P1_4,INPUT_PULLUP);
  pinMode(P1_5,OUTPUT);
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
 
  Serial.print("The analog value is ");
  Serial.print(analogRead(P1_4));
  Serial.print("\r\n");
  Serial.print("The temperature value is ");
  Serial.print(temp);
  Serial.print("\r\n");
  if (temp < 30.00)
  {
    digitalWrite(P1_5,HIGH); // P1_5 is heater
    //delay(5000);
  }
  else if (temp > 31.00)
  {
    digitalWrite(P1_5,0);
    //delay(5000);
  }
  delay(500);
 }
 
// convert ADC values to Celcius

float Thermistor(int RawADC) 
{
 float Temp;
 Temp = logf(10000.0*((1024.0/RawADC-1))); 
 Temp = 1 / (0.001129148 + (0.000234125 + (0.0000000876741 * Temp * Temp ))* Temp );
 Temp = Temp - 273.15;            // Convert Kelvin to Celcius */
 return Temp;
 
 /*
 Temp = (1023 / RawADC)  - 1;
 Temp = 10000.0 / Temp;
 float steinhart;
 steinhart = Temp / 10000;     // (R/Ro)
 steinhart = log(steinhart);                  // ln(R/Ro)
 steinhart /= 3950;                   // 1/B * ln(R/Ro)
 steinhart += 1.0 / (25 + 273.15); // + (1/To)
 steinhart = 1.0 / steinhart;                 // Invert
 steinhart -= 273.15;                         // convert to C
  */
}




