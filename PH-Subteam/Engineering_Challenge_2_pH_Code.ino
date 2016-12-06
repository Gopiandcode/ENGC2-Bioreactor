#define pH_PROBE P1_4
#define ACIDPUMP P1_5
#define ALKALIPUMP P1_6
#define INPUTTIME 1000
#define SERIALSENDTIME 100

void addFluid(int fluidType);
void setRanges(int targetValue);
int phToAnalog(float pH);
float analogToPH(int analog);
void readSerial(void);



int startTime;
int serialStartTime;
int hardHigh = 700, hardLow = 100, softHigh = 600, softLow = 400;


void setup()
{
  startTime = millis();
  serialStartTime = millis();
  Serial.begin(9600);
  pinMode(ACIDPUMP, OUTPUT);
  pinMode(ALKALIPUMP, OUTPUT);
  pinMode(pH_PROBE, INPUT);
}

void loop()
{
  static int pH;
  static int currentTime;
  
  // Updates time every time loop is called - static variable initializations 
  // are only done once, so the previous statement can not be concatenated with
  // this one.
  currentTime = millis();
  // Every loop retrieves the pH value and reads serial if possible
  pH = analogRead(pH_PROBE);
  readSerial();
  
 // critical response code - if the pH is wayyyy out of bounds. If so, the ph is updated.
 if (pH < hardLow) addFluid(ALKALIPUMP), pH = analogRead(pH_PROBE); 
 if (pH > hardHigh) addFluid(ACIDPUMP), pH = analogRead(pH_PROBE);
 
 
 // Less critical code - checks if pH outside soft ranges.
 if (currentTime - startTime > INPUTTIME) {
   // If the pH is outside the soft range but inside the critical one, add some.
   if(pH < softLow && pH > hardLow) addFluid(ALKALIPUMP), pH = analogRead(pH_PROBE);
   if(pH > softHigh && pH < hardHigh) addFluid(ACIDPUMP), pH = analogRead(pH_PROBE);
  
  // Mainly for debug, prints the value read at the pH sensor
   
   // Resets the start time, if the timing condition is met.
   startTime = millis();
 }
 //Finally, send data every 100 ms, so that there is time for processing to send data
 if(currentTime - serialStartTime > SERIALSENDTIME) {
   Serial.println(analogToPH(pH));
   serialStartTime = millis();
 }
}

// Function to add required fluid to mixture 
void addFluid(int fluidType) {
  int start = millis();
  int current;
  
  // Sets the digital pin to 1, causing the Pump to output fluid
  digitalWrite(fluidType, HIGH);
  
  // Timer to repeat until the required time has passed
  do { current = millis(); } while (current-start < INPUTTIME);
  
  //Once a specified time has passed, the digital pin is set back to 0
  digitalWrite(fluidType, LOW);
  
}

//Given a target analog value to reach, the system resets the ranges
void setRanges(int targetValue) {
  hardHigh = targetValue + 200;
  hardLow = targetValue - 400;
  softHigh = targetValue + 100;
  softLow = targetValue - 100;
}

int phToAnalog(float pH);
float analogToPH(int analog);
void readSerial(void);
