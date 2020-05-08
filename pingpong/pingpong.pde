// declare variables
float x,y,r; // x-coordinate, y-coordinate, radius
float xspeed,yspeed; // horizontal speed(left-right), vertical speed(top-bottom)
boolean gameOn;

void setup(){
  background(0,0,200);
  size(800,400);
  //fullScreen();
  
  // initialize variables
  x = width/2;
  y = height/2;
  r = 30;
  xspeed = 10;
  yspeed = 10;
  gameOn = false;
} // end setup

void draw(){
  background(0,0,140);
  drawBall(); // draw the ball
  moveBall(); // move the ball
  checkWalls(); // bounce ball off the left and right walls
  rectangularPaddles();// draw rectangular paddles
  circluarPaddles(); // draw circular paddles
  drawLines();// draw separation line
  edgeLines(); // draw white lines around the edges
} // end draw


void drawBall(){
  fill(255);
  ellipse(x,y,r,r);
}

void moveBall(){
  if(mousePressed){
    gameOn = true;
  }
  if(gameOn){
    x = x + xspeed;
    y = y + yspeed;
  }
} // end moveBall

void checkWalls(){
  if((x+r) > width || (x-r) < 0){
    xspeed *= -1;
  }
  // bounce ball off top and bottom walls
  if((y+r) > height || (y-r)<0){
    yspeed *= -1;
  }
} // end checkWalls

void rectangularPaddles(){
  fill(200,0,0);
  stroke(0);
  rect(0,0,width/30,height/5);
  rect(29*width/30,3.97*height/5,width/30,height/5);
} // end rectangularPaddles

void circluarPaddles(){
  fill(200,0,0);
  ellipse(0,height/2,100,100);
  ellipse(width,height/2,100,100);
} // end circluarPaddles

void drawLines(){
  // vertical line
  stroke(0);
  strokeWeight(2);
  line(width/2,0,width/2,height);
  // horizontal line
  stroke(255);
  strokeWeight(1);
  line(0,height/2,width,height/2);
} // end drawLines

void edgeLines(){
  // top white line
  stroke(255);
  strokeWeight(5);
  line(0,0,width,0);
  
  // bottom white line
  stroke(255);
  strokeWeight(5);
  line(0,height,width,height);
  
  // left white line
  stroke(255);
  strokeWeight(5);
  line(0,0,0,height);
  
  // right white line
  stroke(255);
  strokeWeight(5);
  line(width,0,width,height);
}
