class catcher {
  PVector loc;
  float d;
  catcher() {
    loc = new PVector(mouseX, height*5/6);
    d = 50;  
  }
  void display() {
    fill(255);
    ellipse(mouseX,loc.y,d,d);
  }   
}
