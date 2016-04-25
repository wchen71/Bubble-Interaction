//Wilson Chen
//ARTG2260 Programming Basics
//Assignment 2: Interactive Toy
//Februrary 24, 2016

//import processing.sound.*;
//SinOsc osc;

Ball[] balls = new Ball[50]; //array for the small balls
Pulse ball2 = new Pulse(); //the pulse
boolean pause = true; //pauses the canvas
float mx, my; // static mouse variables
//boolean play = true;

void setup() {
  size(500, 500); // canvas 500 by 500
  background(255);
  fill(180, 50);
  rect(0, 0, 500, 500); // overlays gray area
  ball2.pcolorize(mx, my);
  for (int i = 0; i < balls.length; i++) { //fills the array with balls
    balls[i] = new Ball();
  }
  //osc = new SinOsc(this); // new sound
}
void draw() {
  if (pause) { // paused look of the canvas
    background(255);
    fill(180, 50);
    rect(0, 0, 500, 500); // overlays gray area
    fill(0, 125);
    textSize(25);
    text("Press 'UP' to pause and unpause.", 60, 225);
    text("Click to refresh pulse.", 120, 250);
    text("Type to refresh balls.", 120, 275);
    for (int i = 0; i < balls.length; i++) {//updates each ball 
      balls[i].pcolorize();
    }
    ball2.pcolorize(mx, my);
  } else { // unpaused
    background(255);
    replace(); // replaces balls depending on circumstances
    for (int i = 0; i < balls.length; i++) {//updates each ball 
      balls[i].update();
    }
    ball2.update(); // updates the pulse
    refresh(); //refreshes all small balls
    //float freq = map(ball2.finald-ball2.lineard, 100, 0, 50, 100); // limits to lower sounds, maps it to pulse
    //osc.freq(freq);
  }
}
void mousePressed() { // refreshes the pulse if mouse is pressed
  if (!pause) {
    ball2 = new Pulse();
  }
}

void keyReleased() { // pauses canvas, records last mouse position , plays sounds
  if (key == CODED) {
    if (keyCode == UP) {
      pause = !pause; // pause or unpause
      mx = mouseX;
      my = mouseY;
      //if (play) {
      //  osc.play();
      //  play = false;
      //}
    }
  }
}

void replace() { //replaces balls based off of collisions and disappearance
  for (int i = 0; i < balls.length; i++) {
    if (balls[i].a == 0 || collision(balls[i].d/2, ball2.finald/2, balls[i].x, mouseX, balls[i].y, mouseY)) {
      balls[i] = new Ball();
    }
  }
}

void refresh() { //refreshes pulse if key is pressed
  if (keyPressed) {
    if (keyCode != UP) {
      for (int i = 0; i < balls.length; i++) {
        balls[i] = new Ball();
      }
    }
  }
}



//checks if two circles collide
boolean collision(float d1, float d2, float x1, float x2, float y1, float y2) {
  return dist(x1, y1, x2, y2) <= (d1 + d2);
}