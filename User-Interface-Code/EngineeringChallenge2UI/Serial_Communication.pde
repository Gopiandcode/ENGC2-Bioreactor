Serial phProbePort, temperaturePort, motorPort;
int phProbePortNo, temperaturePortNo, motorPortNo;

float[] pHData = new float[2];
float[] motorData = new float[2];
float[] temperatureData = new float[2];

boolean connectionInitialized = false;
boolean recievedData = false;

// Used to set portnumbers for each port
void setupPorts(int a, int b, int c) {
  phProbePortNo = a;
  temperaturePortNo = b;
  motorPortNo = c;

  print("pH probe port number: " + phProbePortNo + "\n");
  print("Temperature port number: " + temperaturePortNo + "\n");
  print("Motor port number: " + motorPortNo  + "\n");

  phProbePort = new Serial(this, Serial.list()[phProbePortNo], 9600);
  temperaturePort = new Serial(this, Serial.list()[temperaturePortNo], 9600);
  motorPort = new Serial(this, Serial.list()[motorPortNo], 9600);
  connectionInitialized = true;
  return;
}

// Prints a list of all the open ports along with their port numbers
void printOpenPorts() {
  int counter = 0;
  for (String openPort : Serial.list())
    print(openPort+ " : " +counter++ + "\n");
  return;
}

//Reads the pH port and stores recieved data to a float array
void readpHPort() {
  String rawRecievedData;
  String[] processedData;
  if (phProbePort.available() > 112) {
    rawRecievedData = phProbePort.readStringUntil('\n');
    processedData = rawRecievedData.split(" ");




    //DEBUG 
    //print("Recieved:");
    //for (String data : processedData) print(" " + data  + " " + ( data.equals("b") || data.equals("e")));
    //print("END \n");
    //DEBUG 
    if (processedData[0].equals("b")) {
      for (int i = 0; i< min(processedData.length, pHData.length); i++) pHData[i] = float(processedData[i]);
      //DEBUG
      //print("Processed:");
      //for (float value : pHData) print(" " + value  + " ");
      //print("END \n");
    }
    //DEBUG
    recievedData = true;
    phProbePort.clear();
  }
  return;
}

//Reads the Temperature port and stores recieved data to a float array
void readTemperaturePort() {
  String rawRecievedData;
  String[] processedData;
  if (temperaturePort.available() > 20) {
    rawRecievedData = temperaturePort.readStringUntil('\n');
    processedData = rawRecievedData.split(" ");
    
    //DEBUG
    print("Recieved:");
    for (String data : processedData) print(" " + data  + " ");
    print("END \n");
    //DEBUG
    if (processedData[0].equals("b")) {
      for (int i = 1; i< min(temperatureData.length, processedData.length); i++) temperatureData[i] = float(processedData[i]);
      //DEBUG
      print("Processed:");
      for (float value : temperatureData) print(" " + value  + " ");
      print("END \n");
    }
    //DEBUG
    recievedData = true;
    temperaturePort.clear();
  }
  return;
}

//Reads the Motor port and stores recieved data to a float array
void readMotorPort() {
  String rawRecievedData;
  String[] processedData;
  if (motorPort.available() > 10) {
    rawRecievedData = motorPort.readStringUntil('\n');
    processedData = rawRecievedData.split(" ");
    //DEBUG
    //print("Recieved:");
    //for (String data : processedData) print(" " + data  + " ");
    //print("END \n");
    //DEBUG
    if(processedData[0].equals("b")){
      for (int i = 0; i< min(processedData.length, motorData.length); i++) motorData[i] = float(processedData[i]);
    //DEBUG
    //print("Processed:");
    //for (float value : motorData) print(" " + value  + " ");
    //print("END \n");
    }
    //DEBUG
    recievedData = true;
    motorPort.clear();
  }
  return;
}


void sendToPort(Serial outputPort, String Message) {
  print("Sending: " + Message + "\n");
  outputPort.write(Message);
  return;
}