class Ball {
  private float x, y, d, r, g, b, a; // xy coordinates, diameter, rgb values, alpha value
  private int cx = 500; //canvas size x
  private int cy = 500; // canvas size y

  Ball() { // initiates variables
    x = random(0, cx);
    y = random(0, cy);
    r = random(0, 255);
    g = random(0, 255);
    b = random(0, 255);
    a = 120;
    d = 0;
  }

  void update() { // colors the ball and makes the diameter bigger
    colorize();
    d++;
  }
  
  void colorize() { // makes the ball disappear as it gets bigger
    noStroke();
    a = a - 0.3; // rate of disappearance
    fill(r, g, b, a);
    ellipse(x, y, d, d);
  }
  
  void pcolorize() { // paused look of the balls, no diameter increase
    noStroke();
    fill(r, g, b, a-50); //alpha dropped
    ellipse(x, y, d, d);
  }
}