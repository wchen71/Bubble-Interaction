class Pulse extends Ball {
  private boolean contract; //tells ball to contract if true
  private float lineard, finald, outerRing, ringConstant; //linear diameter growth, the final diameter, outer ring diameter, ring growth multiplier
  
  Pulse() { // initiates variables
    contract = false;
    lineard = 0;
    ringConstant = 1;
    outerRing = super.a - 50; //alpha for outer ring
  }
  void update() { // colors and shapes the pulse
    if (ringConstant <= 5) { // limits ring constant growth
      ringConstant = ringConstant + 0.003;
    }
    if (lineard <= 300) { // limits diameter growth
      lineard = lineard+0.2;
    }
    colorize();
    finald = lineard + super.d*ringConstant; //final diameter = linear diameter + (pulse * ring constant)

    expand(); //makes pulse expand/contract based off of contract boolean
    contract(); // set's contract range based off of diameter
  }

  void colorize() { // makes the outer ring and pulse
    fill(super.r, super.g, super.b, outerRing); //outer ring
    ellipse(mouseX, mouseY, lineard + super.d*ringConstant, lineard + super.d*ringConstant);
    fill(super.r, super.g, super.b, super.a); //pulse
    ellipse(mouseX, mouseY, lineard + super.d, lineard + super.d);
  }

  void expand() { //expands/contracts based off of constant
    if (contract) {
      super.d = super.d - 0.5; //rate of contraction
    } else 
    super.d = super.d + 2.5; //rate of expansion
  }

  void contract() { //sets pulse diameter range
    if (super.d > 25 ) { // sets range to 25
      contract = true;
    } else if (super.d < 0) 
      contract = false;
  }


  void pcolorize(float x, float y) { //paused look of the pulse, static mouse, continues pulse
    fill(super.r, super.g, super.b, outerRing-50); //dropped alpha
    ellipse(x, y, lineard + super.d*ringConstant, lineard + super.d*ringConstant);
    fill(super.r, super.g, super.b, super.a-50); // dropped alpha
    ellipse(x, y, lineard + super.d, lineard + super.d);
    expand(); 
    contract();
  }
}