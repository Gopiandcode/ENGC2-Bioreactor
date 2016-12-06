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





void setup() {
  frameRate(10);
  size(1280, 720);
  printOpenPorts();
  //setupPorts(0, 0, 0);
  singlePort(0);
  setupGraphs();
}

void draw() {
  background(0);
  readpHPort();
  updateGraphs();
  drawGraphs();
}