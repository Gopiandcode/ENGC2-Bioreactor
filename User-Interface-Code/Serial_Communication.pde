Serial Port;
boolean connectionInitialized = false; //Keeps a record of the status of the connection

// To be called before recieving communications from the microcontroller
void serialStart() {
 int finalPortIndex = Serial.list().length-1;
 String finalPortName;
 String input;
 
 while (finalPortIndex < 0) {
  println("No Ports in use, please connect microcontroller");
  finalPortIndex = Serial.list().length-1;
  delay(3000);
 }
 
 println("Available Ports: " + Serial.list());
 finalPortName = Serial.list()[finalPortIndex];
 println("Connecting to port - " + finalPortName);
 Port = new Serial(this, finalPortName, 9600);
 connectionInitialized = true;
}

void serialStop() {
 println("Stopping communication with device on port");
 Port.stop();
 connectionInitialized = false;
}

//Returns an array with
//         0   -  Temperature
//         1   -  Heating Element - pwm value
//         2   -  Motor Speed
//         3   -  Motor           - pwm value
//         4   -  pH level
//         5   -  pump            - 1 acid -1 alkali
//         
float[] parseData() {
  float[] output = new float[6];
  String input;
  if (connectionInitialized) {
    while(Port.available() > 0) {
      input = Port.readStringUntil('\n');
      print("Input: " + input + " \n");
      String[] inputList = input.split(" ");
      for(int i = 0; i < 6; i++ ) {
        output[i] = float(inputList[i]);
      }
    }
  }
  return output;
}