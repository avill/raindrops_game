raindrops[] drops = new raindrops[13];
catcher c1;
int score;
int index = 1;
int oldTime= 0;
int threshold = 3000;
PImage img,img2;
void setup() {
  img=loadImage("cliff.png");
  img2=loadImage("win.png");
  size(img.width, img.height);//size is as big as the image "cliff"
  for (int i=0; i<drops.length; i++) {
    drops[i] = new raindrops();
  }
  c1 = new catcher();
}
void draw() {
  background(img);
  textSize(100);
  fill(255);
  text( score, 0, 100);
  c1.display();
  c1.update();
  if (millis() - oldTime > threshold) { 
    if (index< drops.length) {
      index++;
      oldTime = millis();
      //if the difference b/w millis and oldTime is greater than threshold,
      //then one drop falls
    }
  }
  for (int i=0;i<index;i++) {
    drops[i].display();
    drops[i].fall();
    drops[i].lose();
    if (c1.checkDrop(drops[i]) == true) {
      drops[i].goAway();
      score++;
      threshold-=100;
      //if a drop passes through the catcher, then the drop disappears and
      //the score increases and the threshold decreases, speeding up how fast the drops fall
    }
  }
  if(score==2) {
    // if the score equals 13, then the "you win" screen comes up
    image(img2,0,height/7);
    fill(100,250,100);
    text("YOU WIN", width*3/5,height/2);
  }
    
}


