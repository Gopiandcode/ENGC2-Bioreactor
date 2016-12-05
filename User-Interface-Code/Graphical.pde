int maxIndicies  = 10;

FloatList TemperatureValues = new FloatList();
int maxTempIndex = 0;
void updateTemperature(float Temperature) {
 TemperatureValues.append(Temperature);
 if(maxTempIndex < maxIndicies) {
  TemperatureValues.remove(0); 
 }
 else {
  maxTempIndex++; 
 }
}