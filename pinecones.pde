class pinecones {
  PVector loc, vel;
  int d;
  PImage img;

  pinecones() {
    loc = new PVector(random(width), random(0,-50));
    vel = new PVector(0, random(5, 7));
    d = 25;
    img = loadImage("pinecone.png");
  }
  void display() {
    image(img, loc.x, loc.y, d,d);
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
}

