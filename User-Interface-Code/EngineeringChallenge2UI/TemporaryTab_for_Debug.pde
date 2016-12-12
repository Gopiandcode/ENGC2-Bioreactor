void singlePort(int a, int type) {
  if(type == 0) {
  motorPortNo = a;
  motorPort = new Serial(this, Serial.list()[motorPortNo], 9600);
  connectionInitialized = true;
  }
  if(type == 1) {
  temperaturePortNo = a;
  temperaturePort = new Serial(this, Serial.list()[temperaturePortNo], 9600);
  connectionInitialized = true;    
  }
  if(type == 2) {
  phProbePortNo = a;
  phProbePort = new Serial(this, Serial.list()[phProbePortNo], 9600);
  connectionInitialized = true;    
  } 
}

void doublePort(int a, int b) {
  phProbePortNo = a;
  phProbePort = new Serial(this, Serial.list()[phProbePortNo], 9600);
  temperaturePortNo = b;
  temperaturePort = new Serial(this, Serial.list()[temperaturePortNo], 9600);
  connectionInitialized = true;
}