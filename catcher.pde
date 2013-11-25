void catcher {
  PVector loc;
  float d;
  catcher(float y;) {
    loc = new PVector(mouseX, y);
    d = 20;
  }
  void display() {
    fill(255);
    ellipse(loc.x,loc.y,d,d);
  }
}
