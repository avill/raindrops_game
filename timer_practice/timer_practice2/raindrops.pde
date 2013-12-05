class raindrops {
  PVector loc, vel;
  float d, hue;
  boolean gone;
  raindrops() {
    loc = new PVector(random(width), random(-15, 0));
    vel = new PVector(0, random(1, 5));
    d=10;
    hue = 0;
    gone = true;
  }
  void display() {
    fill(hue, 0, 255);
    ellipse(loc.x, loc.y, d, d);
  }

  void fall() {
    loc.add(vel);
  }
}


