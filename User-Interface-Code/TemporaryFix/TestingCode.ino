int startTime;
float refVal = 100;

void setup() {

	Serial.begin(9600);
	startTime = millis();

}


void loop() {
	// Uncomment and comment as necassary
	// Every loop read serial value, every 1/10 sec, send value
	if(millis() - startTime > 100) {
		Serial.print(refVal);
		Serial.print(" ");
		Serial.print(refVal);
		Serial.print("\n");
	}
	
	if(Serial.available() > 0) refVal = float(Serial.readBytesUntil('\n'));	

	// So *in theory* this code prints ref value every 100 ms, and reads
	// every clock cycle if input, and sets the value it will print out to the input.




}
