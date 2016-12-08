int startTime;
float refVal = 100;

void setup() {

	Serial.begin(9600);
	startTime = millis();

}


void loop() {
      refVal = constrain(refVal, 2.0, 8.0);
       float currentTime;
       currentTime = millis();
       	// Uncomment and comment as necassary
	// Every loop read serial value, every 1/10 sec, send value
	if(currentTime - startTime > 1000) {
                Serial.print("b");
                Serial.print(" ");
		Serial.print(refVal);
		Serial.print(" ");
		Serial.print(refVal);
                Serial.print(" ");
                Serial.print("e");
		Serial.print("\n");
                startTime = millis();
                do{currentTime = millis();} while(currentTime - startTime < 300);
                if(Serial.available() > 0) refVal = Serial.parseFloat();
                Serial.flush();
	}
	
	

	// So *in theory* this code prints ref value every 100 ms, and reads
	// every clock cycle if input, and sets the value it will print out to the input.
     



}

