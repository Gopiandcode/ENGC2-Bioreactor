#define pH_PROBE P1_4
#define ACIDPUMP P1_5
#define ALKALIPUMP P1_6
#define INPUTTIME 1000

void addFluid(int fluidType);

int startTime;



void setup()
{
  startTime = millis();
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
  // Every loop retrieves the pH value
  pH = analogRead(pH_PROBE);
 
 // critical response code - if the pH is wayyyy out of bounds. If so, the ph is updated.
 if (pH < 100) addFluid(ALKALIPUMP), pH = analogRead(pH_PROBE); 
 if (pH > 700) addFluid(ACIDPUMP), pH = analogRead(pH_PROBE);
 
 
 // Less critical code - checks if pH outside soft ranges.
 if (currentTime - startTime > INPUTTIME) {
   // If the pH is outside the soft range but inside the critical one, add some.
   if(pH < 400 && pH > 100) addFluid(ALKALIPUMP), pH = analogRead(pH_PROBE);
   if(pH > 600 && pH < 700) addFluid(ACIDPUMP), pH = analogRead(pH_PROBE);
  
  // Mainly for debug, prints the value read at the pH sensor
   Serial.println(pH);
   // Resets the start time, if the timing condition is met.
   startTime = millis();
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
