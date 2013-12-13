raindrops[] drops = new raindrops[13];
catcher c1;
boolean start, stop;
int score;
int index = 1;
int oldTime= 0;
int threshold = 3000;
PImage img, img2, img3, img4;
int w, h;
PVector rec;
void setup() {
  img=loadImage("cliff.png");
  img2=loadImage("win.png");
  img3=loadImage("screen.jpg");
  img4=loadImage("fail.png");
  size(img.width, img.height);//size is as big as the image "cliff"
  for (int i=0; i<drops.length; i++) {
    drops[i] = new raindrops();
  }
  c1 = new catcher();
  start = true;
  stop = true;
  w=200;
  h=150;
  rec = new PVector(width/3, height/2);
}
void draw() {
  if (start == true && stop==true) {
    //start screen
    image(img3, 0, 0, img.width, img.height);
    fill(100, 255, 100);
    rect(rec.x, rec.y, w, h);
    fill(0);
    textSize(50);
    noStroke();
    text("START", rec.x+25, rec.y+50);
  }
  if (start==false && start==false) {
    //win screen
    image(img2, 0, 0, img.width, img.height);
    fill(50, 250, 50);
    textSize(50);
    text("YOU WIN", width*2/5, height/2);
    textSize(25);
    fill(0);
    text("press any key to reset", width*2/5, height*2/3);
  }
  if (start == false && stop==true) {
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
      if (drops[i].lose()==true) {
        start=true;
        stop=false;
      }
    }
  }
  if (score==2) {
    // if the score equals 13, then stop=false then the win screen is displayed
    stop=false;
  }
  if (start==true && stop==false) {
    image(img4, 0, 0, width, height);
    fill(255, 0, 0);
    text("GAME OVER", width/4, height/4);
  }
}
void mousePressed() {
  if ( mouseX>rec.x && mouseX<rec.x+w 
    && mouseY>rec.y && mouseY<rec.y+h) {
    start=false;
    //if you click on the start button, start=false and the game starts
  }
}
void keyPressed() {
  start=true;
  stop=true;
  score=0;
  
}

