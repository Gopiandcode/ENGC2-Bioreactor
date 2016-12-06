void singlePort(int a) {
 phProbePortNo = a;
 phProbePort = new Serial(this, Serial.list()[phProbePortNo], 9600); 
  
}