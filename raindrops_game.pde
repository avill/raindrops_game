int dw=13;
raindrops[] drops = new raindrops[dw];
pinecones[] cones = new pinecones[120];
catcher c1;
boolean start, stop, instructions;
int score, lives;
int index = 1;
int oldTime= 0;
int threshold = 3000;
PImage img, img2, img3, img4, img5;
int w, h;
PVector rec1, rec2;
void setup() {
  img=loadImage("cliff.png");
  img2=loadImage("win.png");
  img3=loadImage("screen.jpg");
  img4=loadImage("fail.png");
  img5=loadImage("instruct.jpg");
  size(img.width, img.height);//size is as big as the image "cliff"
  for (int i=0; i<drops.length; i++) {
    drops[i] = new raindrops();
  }
  for (int k=0; k<cones.length; k++) {
    cones[k] = new pinecones();
  }
  c1 = new catcher();
  start = true;
  stop = true;
  instructions = true;
  w=150;
  h=100;
  rec1 = new PVector(width*7/16, height/2);
  score=0;
  lives=5;
}
void draw() {
  if (start == true && stop==true && instructions == true) {
    //start screen
    image(img3, 0, 0, img.width, img.height);
    fill(100, 255, 100);
    rect(rec1.x, rec1.y, w, h);
    fill(0);
    textSize(25);
    noStroke();
    text("START", rec1.x+30, rec1.y+55);
    textSize(50);
    fill(255);
    text("CATCH THE DWARVES", width/3, height/3);
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
    fill(200,50,50);
    text(lives,width-100,100);
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
      if(i==dw) {
        i=0;
      }

      if (c1.checkDrop(drops[i]) == true) {
        drops[i].goAway();
        score++;
        threshold-=100;
        //if a drop passes through the catcher, then the drop disappears and
        //the score increases and the threshold decreases, speeding up how fast the drops fall
      }
      if (drops[i].loc.y>height) {
        //if a drop falls past the bottom of the screen then you go to lose screen
        start=true;
        stop=false;
        drops[i].goAway();
      
      }
    }
    for (int k=0; k<index*4; k++) {
      cones[k].display();
      cones[k].fall();

      if (c1.checkCone(cones[k]) == true) {
        cones[k].goAway();
        lives--;
      }
    }
    if (score==dw) {
      // if the score equals 13, then stop=false then the win screen is displayed
      stop=false;
    }
    if (lives==0) {
      stop=!stop;
      start=!start;
    }
  }
  if (start==true && stop==false) {
    //game over screen
    image(img4, 0, 0, width, height);
    fill(255, 0, 0);
    textSize(50);
    text("GAME OVER", width/7, height/4);
    textSize(25);
    text("press any key to restart", width*3/5, height*4/5);
  }
}
void mousePressed() {
  if ( mouseX>rec1.x && mouseX<rec1.x+w 
    && mouseY>rec1.y && mouseY<rec1.y+h) {
    start=false;
    //if you click on the start button, start=false and the game starts
  }
}
void keyPressed() {
  start=true;
  stop=true;
  score=0;
  lives=5; 
  index=1;
}

