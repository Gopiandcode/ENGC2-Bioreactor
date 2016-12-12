import org.gicentre.utils.spatial.*;
import org.gicentre.utils.network.*;
import org.gicentre.utils.network.traer.physics.*;
import org.gicentre.utils.geom.*;
import org.gicentre.utils.move.*;
import org.gicentre.utils.stat.*;
import org.gicentre.utils.gui.*;
import org.gicentre.utils.colour.*;
import org.gicentre.utils.text.*;
import org.gicentre.utils.*;
import org.gicentre.utils.network.traer.animation.*;
import org.gicentre.utils.io.*;
import controlP5.*;
import processing.serial.*;


int startTime;

void setup() {
  frameRate(30);
  size(1280, 720);
  printOpenPorts();
  //setupPorts(0, 0, 0);
  setupGraphs();
  startTime = millis();
  singlePort(0, 0);                    // 0 for motor, 1 for temperature, 2 for pH
  //doublePort(1,0);
  setupUI();
}

void draw() {
  background(0);
  //readpHPort();
  //readTemperaturePort();
  readMotorPort();
  updateGraphs();
  drawGraphs(); startTime = millis();
  sendTarget();
  recievedData = false;
  
}