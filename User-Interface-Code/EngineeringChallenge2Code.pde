import processing.serial.*;
void setup() {
    
   size(1280, 720);
   serialStart();
}
float[] data;
void draw() {
 data = parseData();
 print(" Temp: " + data[0]); 
 print(" Motor: " + data[2]);
 print(" pH: " + data[4] + "\n");
 
}