raindrops[] drops = new raindrops[15];
catcher c1;
int score;
int index = 1;
int oldTime= 0;
int threshold = 3000;
PImage img, img2;
void setup() {
  img=loadImage("cliff.jpg");
  img2=loadImage("screen.jpe");
  size(img.width, img.height);
  for (int i=0; i<drops.length; i++) {
    drops[i] = new raindrops();
  }
  c1 = new catcher();
}
void draw() {
  background(img2);
  textSize(100);
  fill(255);
  text("CATCH THE DWARF", width/2, height/3);
  fill(0, 255, 0);
  text("START", width/2, height*2/3);
  if (mousePressed && mouseX>width/2 && mouseX<width/2+100 
    && mouseY>height*2/3 && mouseY<height*2/3+75) {
    {
      background(img);
      textSize(50);
      fill(0, 255, 0);
      text(score, 440, 50);
      c1.display();
      c1.update();
      if (millis() - oldTime > threshold) {
        if (index< drops.length) {
          index++;
          oldTime = millis();
        }
      }
      for (int i=0;i<index;i++) {
        drops[i].display();
        drops[i].fall();
        if (c1.checkDrop(drops[i]) == true) {
          drops[i].goAway();
          score++;
          threshold-=100;
        }
      }
    }
  }
}

