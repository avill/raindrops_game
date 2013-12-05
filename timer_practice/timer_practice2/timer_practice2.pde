raindrops[] drops = new raindrops[15];
int index = 0;
int oldTime = 0;
int currentTime = 0;
int timeChange = 0;
void setup() {
  size(500, 500);
  for (int i=0; i<drops.length; i++) {
    drops[i] = new raindrops();
  }
}
void draw() {
  background(0);
  currentTime = millis();
  timeChange = currentTime - oldTime;
  if (timeChange>=1000) {
    for (int i=0;i<=index;i++) {
      drops[i].display();
      drops[i].fall();
    }
  }
}

