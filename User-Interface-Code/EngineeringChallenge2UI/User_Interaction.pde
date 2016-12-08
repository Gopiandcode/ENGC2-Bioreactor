ControlP5 controller;

float targetpH, targetTemp, targetRPM;
boolean sendpH = false, sendTemp = false, sendRPM = false;

void setupUI() {
  controller = new ControlP5(this);

  controller.addToggle("sendpH").setPosition(128, 468).setSize(170, 30);
  controller.addToggle("sendTemp").setPosition(555, 468).setSize(170, 30);
  controller.addToggle("sendRPM").setPosition(981, 468).setSize(170, 30);

  controller.addSlider("targetpH").setRange(3, 7).setValue(5).setPosition(128, 568).setSize(170, 30);
  controller.addSlider("targetRPM").setRange(200, 1200).setValue(500).setPosition(555, 568).setSize(170, 30);
  controller.addSlider("targetTemp").setRange(20, 40).setValue(25).setPosition(981, 568).setSize(170, 30);
}  

void sendTarget() {
  //print("Call1\n");
  if (connectionInitialized) {
    //print("Call2\n");
    if (sendpH && recievedData) {
      //print("Call3\n");
      sendToPort(phProbePort, nf(targetpH,1,2));
    }
    if (sendTemp) {
      sendToPort(temperaturePort, str(targetTemp));
    }
    if (sendRPM) {
      sendToPort(motorPort, str(targetRPM));
    }
  }
}