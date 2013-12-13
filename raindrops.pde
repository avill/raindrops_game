class raindrops {
  PVector loc, vel;
  int w, h;
  PImage img;

  raindrops() {
    loc = new PVector(random(width), -h);
    vel = new PVector(0, random(3, 5));
    w = 50;
    h = 100;
    img = loadImage("dwarf.png");
  }
  void display() {
    image(img, loc.x, loc.y, w, h);
  }

  void fall() {

    loc.add(vel);
    //add the velocity to the location
  }
  void goAway() {
    loc.set(height*2, 0);
    vel.set(0, 0);
    //sets the location to a point beyond the screen and stops the movement
  }
  boolean lose() { //if the raindrops falls past the bottom of the screen 
    //then the game over image appears
    if (loc.y>height) {
      return true;
    }
    else {
      return false;
    }
  }
}

