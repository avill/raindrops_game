class catcher {
  PVector loc;
  float d;
  PImage img;
  catcher() {
    loc = new PVector(mouseX, height*5/6);
    d = 100;
    img =  loadImage("eagle.png");
  }
  void display() {
    image(img,loc.x, loc.y, d, d);
  }   
  void update() {
    loc.set(mouseX, height*5/6);
  }
  boolean checkDrop(raindrops r) {
    if (loc.dist(r.loc) < d/2 + r.w/2) {
      //if the distance between the drop and the catcher is less than the catcher's width,
      //return a true value
      return true;
    }
    else {
      return false;
      //otherwise, return a false value
    }
  }
}

