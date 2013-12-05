raindrops[] drops = new raindrops[15];
catcher c1;
int score;
int index = 1;
int oldTime= 0;
int threshold = 3000;
void setup() {
  size(500,500);
  for(int i=0; i<drops.length; i++) {
    drops[i] = new raindrops();
  }
  c1 = new catcher();
}
void draw() {
  background(0);
  textSize(50);
  fill(0,255,0);
  text(score,440,50);
  for(int i=0;i<drops.length;i++) {
    drops[i].display();
    drops[i].fall();
    if(c1.checkDrop(drops[i]) == true) {
      drops[i].goAway();
      score++;
      threshold-=50;
    }
  }
    c1.display();
    c1.update();
    if (millis() - oldTime > threshold) {
      if(index< drops.length) {
        index++;
        oldTime = millis();
      }
    }
}
