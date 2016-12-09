unsigned long long startTime;
unsigned long long currentTime;
float refVal = 30;
int actuator = 0;
void setup() {

	Serial.begin(9600);
	startTime = millis();

}


void loop() {
      refVal = constrain(refVal, 25, 35);
       currentTime = millis();
       	// Uncomment and comment as necassary
	// Every loop read serial value, every 1/10 sec, send value
	if(currentTime - startTime > 100) {
                Serial.print("b");
                Serial.print(" ");
		Serial.print(refVal);
		Serial.print(" ");
		Serial.print(actuator);
		Serial.print("\n");
                startTime = millis();  
	}
	if(refVal < 30) actuator = 1;
        else actuator = 0;
	if(Serial.available() > 0) {refVal = Serial.parseFloat(); Serial.flush();}

	// So *in theory* this code prints ref value every 100 ms, and reads
	// every clock cycle if input, and sets the value it will print out to the input.
     



}

