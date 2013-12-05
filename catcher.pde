class catcher {
  PVector loc;
  float d;
  catcher() {
    loc = new PVector(mouseX, height*5/6);
    d = 50;
  }
  void display() {
    fill(255);
    ellipse(loc.x, loc.y, d, d);
  }   
  void update() {
    loc.set(mouseX, height*5/6);
  }
  boolean checkDrop(raindrops r) {
    if (loc.dist(r.loc) < d/2 + r.d/2) {
      return true;
    }
    else {
      return false;
    }
  }
}

