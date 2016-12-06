XYChart pHChart;
XYChart motorChart;
XYChart temperatureChart;

FloatList pHGraphingData = new FloatList();
FloatList motorGraphingData = new FloatList();
FloatList temperatureGraphingData = new FloatList();

void updateGraphs() {
 pHGraphingData.append(pHData[0]);
 if(pHGraphingData.size() > 30) pHGraphingData.remove(0);
 motorGraphingData.append(pHData[1]);
 if(motorGraphingData.size() > 30) motorGraphingData.remove(0);
 temperatureGraphingData.append(pHData[2]);
 if(temperatureGraphingData.size() > 30) temperatureGraphingData.remove(0);
 
 
 float[] temppH = new float[pHGraphingData.size()];
 for(int i = 0; i < pHGraphingData.size(); i++) temppH[i] = i;
 
 float[] tempMotor = new float[motorGraphingData.size()];
 for(int i = 0; i < motorGraphingData.size(); i++) tempMotor[i] = i;
 
 float[] tempTemp = new float[temperatureGraphingData.size()];
 for(int i = 0; i < temperatureGraphingData.size(); i++) tempTemp[i] = i;
 
 
 pHChart.showXAxis(true);
 pHChart.showYAxis(true);
 motorChart.showXAxis(true);
 motorChart.showYAxis(true);
 temperatureChart.showXAxis(true);
 temperatureChart.showYAxis(true);
 
  pHChart.setPointSize(5);
 pHChart.setLineWidth(2);
 
 motorChart.setPointSize(5);
 motorChart.setLineWidth(2);
 
 temperatureChart.setPointSize(5);
 temperatureChart.setLineWidth(2);
 
 pHChart.setData(temppH, pHGraphingData.array());
 temperatureChart.setData(tempTemp, temperatureGraphingData.array());
 motorChart.setData(tempMotor, motorGraphingData.array());
}

void drawGraphs() {
  pHChart.draw(85,72,256, 216);
  text("pH Data", 170, 299);
  motorChart.draw(512,72,256, 216);
  text("motor Data", 597, 299);
  temperatureChart.draw(939,72,256, 216);
  text("temperature Data", 1023, 299);
  return;
}

void setupGraphs() {
  pHChart = new XYChart(this);
  motorChart = new XYChart(this);
  temperatureChart = new XYChart(this);
  return;
}