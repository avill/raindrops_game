raindrops[] drops = new raindrops[15];
catcher c1;
void setup() {
  size(500,500);
  for(int i=0; i<drops.length; i++) {
    drops[i] = new raindrops();
  }
  c1 = new catcher();
}
void draw() {
  background(0);
  for(int i=0;i<drops.length;i++) {
    drops[i].display();
    drops[i].fall();
    drops[i].checkCatcher(c1);
  }
    c1.display();
}
