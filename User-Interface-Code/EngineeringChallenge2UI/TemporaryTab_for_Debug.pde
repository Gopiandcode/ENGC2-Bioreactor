void singlePort(int a) {
  phProbePortNo = a;
  phProbePort = new Serial(this, Serial.list()[phProbePortNo], 9600);
  connectionInitialized = true;
}

void doublePort(int a, int b) {
  phProbePortNo = a;
  phProbePort = new Serial(this, Serial.list()[phProbePortNo], 9600);
  temperaturePortNo = b;
  temperaturePort = new Serial(this, Serial.list()[temperaturePortNo], 9600);
  connectionInitialized = true;
}