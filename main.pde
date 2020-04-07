float x = random(640);
float y = 10;
float dx = 2;
float dy=4;
float gravity = 0.0981;
float[] puddingX= new float[5];
float[] puddingY= new float[5];

boolean over = false;


void setup() {
  size(640, 480);
  for (int i =0; i < 5; i++) {
    puddingX[i]=random(1.15, 1.2);
    puddingY[i]=random(0.2, 1.2);
  }
}

void draw() {
  background(71, 186, 242);

  int colorG = 50;
  rectMode(CORNER);
  for (int i = 0; i<=height; i+=height/10) {
    noStroke();
    fill(50, colorG, 222, 185);
    rect(0, i, width, height/10);
    colorG+=12;
  }

  fill(31, 155, 32);
  rect(0, height-80, width, 80);

  rectMode(CORNER);
  stroke(0);
  fill(198, 123, 42);
  rect(503, 370, 120, 90);//basket 

  fill(211, 232, 54);
  rectMode(CENTER);
  rect(mouseX, 345, 80, 7);//hat 

  ellipseMode(CENTER);
  fill(206, 182, 141);
  ellipse(mouseX, 362, 20, 20);//face

  noStroke();
  fill(53, 91, 232);
  rect(mouseX-20, 415, 8, 20);//leg
  rect(mouseX+20, 415, 8, 20);

  fill(206, 182, 141);
  rect(mouseX-30, 367, 7, 30);//hand
  rect(mouseX+30, 367, 7, 30);//hand

  fill(62, 124, 104);
  square(mouseX, 390, 30);
  rect(mouseX+22, 387, 25, 10);//arm
  rect(mouseX-22, 387, 25, 10);


  for (int i = 0; i<5; i++) {
    fill(200, 0, 0);
    ellipse(x, y, 20, 20);
    puddingY[i]+=gravity;

    x+=puddingX[i];
    y+=puddingY[i];

    if (x>width||x<0) {
      puddingX[i]=-puddingX[i];
    }

    if (y>height-30) {   
      over = true ;
    }

    if (x > mouseX-45 && x<mouseX+45 && y >330 && y<360 ) {
      puddingY[i]= puddingY[i]*-0.90;
    }
  }

  if (over==true ) {
    //background(255,0,0);
    rectMode(CORNER);
    fill(255, 0, 0);
    rect(0, 0, width, height);
   
    fill(0);
    textSize(64);
    text("GAME OVER", 137, height/2);
   
  }
}
