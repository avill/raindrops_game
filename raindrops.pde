class raindrop {
  PVector loc, vel;
  float d;
 raindrop() {
    loc = new PVector(random(width),0);
    vel = new PVector(0,random(2,15));
    d=25;
  }
  void display() {
    fill(200,220,245);
    ellipse(loc.x,loc.y,d,d);
  }
  
  void fall() {
    loc.add(vel);
    if(loc.y>height) {
      loc.y=0;
    }
    if(loc.x>width) {
      loc.x=0;
    }
  }
}
