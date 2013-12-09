class raindrops {
  PVector loc, vel;
  int w,h;
  PImage img;
  raindrops() {
    loc = new PVector(random(width), -h);
    vel = new PVector(0, random(2, 5));
    w = 50;
    h = 100;
    img = loadImage("dwarf.png");
  }
  void display() {
    image(img,loc.x,loc.y,w,h);

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

