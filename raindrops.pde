class raindrops {
  PVector loc, vel;
  int w, h;
  PImage img, img2;
  raindrops() {
    loc = new PVector(random(width), -h);
    vel = new PVector(0, random(3, 5));
    w = 50;
    h = 100;
    img = loadImage("dwarf.png");
    img2=loadImage("fail.png");
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
  void lose() { //if the raindrops falls past the bottom of the screen 
  //then the game over image appears
    if (loc.y>height) {
      image(img2, width/5, height/3);
      fill(255, 0, 0);
      text("GAME OVER", width/4, height/3);
    }
  }//i could not figure out a way to get the dwarves to stop falling when you lose
}

