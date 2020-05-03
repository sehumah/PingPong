// declare variables
float x,y,r; // x-coordinate, y-coordinate, radius
float xspeed,yspeed;
boolean gameOn;

void setup(){
  background(100);
  size(800,400);
  
  // initialize variables
  x = width/2;
  y = height/2;
  r = 30;
  xspeed = 5;
  yspeed = 5;
  gameOn = false;
}

void draw(){
  background(100);
  
  // draw the ball
  fill(255);
  ellipse(x,y,r,r);
  
  // move the ball
  if(mousePressed){
    gameOn = true;
  }
  if(gameOn){
    x = x + xspeed;
    y = y + yspeed;
  }
  
  // bounce ball off the left and right walls
  if((x+r) > width || (x-r) < 0){
    xspeed *= -1;
  }
  
  // bounce ball off top and bottom walls
  if((y+r) > height || (y-r)<0){
    yspeed *= -1;
  }
  
  // draw rectangular paddles
  fill(139,69,19);
  stroke(0);
  rect(0,0,width/30,height/5);
  rect(29*width/30,3.97*height/5,width/30,height/5);
  
  
  /*
    // draw semi-circle paddles
  fill(255,255,0);
  ellipse(0,height/2,100,100);
  ellipse(width,height/2,100,100);
  */

  
  
  // draw separation line
  // vertical line
  stroke(0);
  strokeWeight(2);
  line(width/2,0,width/2,height);
  
  // horizontal line
  stroke(200);
  strokeWeight(1);
  line(0,width/4,width,width/4);
  
}




class Ball{}

class Paddle{}

class Score{}
