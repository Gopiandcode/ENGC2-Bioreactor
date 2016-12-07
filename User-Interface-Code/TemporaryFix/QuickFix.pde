ControlP5 controller;

float pHTarget, tempTarget, RPMTarget;
boolean pHSend = false, tempSend = false, RPMsend = false;

void setupController() {
	controller = new ControlP5(this);
	controller.addToggle("pHSend").setPostion(128, 432).setSize(100,20);
	controller.addToggle("tempSend").setPostion(128, 452).setSize(100,20);
	controller.addToggle("RPMsend").setPostion(128, 502).setSize(100,20);

	controller.addSlider("pHTarget").setPosition(328,432).setSize(100,20).setRange(3,7).setValue(5);
	controller.addSlider("tempTarget").setPosition(328,452).setSize(100,20).setRange(20,35).setValue(25);
	controller.addSlider("RPMTarget").setPosition(328,502).setSize(100,20).setRange(200,600).setValue(200);

}

void userSending() {
	if(pHSend) {
		sendToPort(phProbePort, str(pHTarget);	
	}
	if(tempTarget) {
		sendToPort(temperaturePort, str(tempTarget);	
	}
	if(RPMTarget) {
		sendToPort(motorPort, str(RPMTarget);	
	}

}
