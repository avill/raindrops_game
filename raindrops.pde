class raindrops {
  PVector loc, vel;
  int d;
  raindrops() {
    loc = new PVector(random(width), -d);
    vel = new PVector(0, random(1, 5));
    d=10;
  }
  void display() {
    fill(50, 100, 230);
    ellipse(loc.x, loc.y, d, d);
  }

  void fall() {
    loc.add(vel);
    if (loc.y>height) {
      loc.y=0;
    }
    if (loc.x>width) {
      loc.x=0;
    }
  }
  void goAway() {
    loc.set(height*2,0);
    vel.set(0, 0);
  }
}

