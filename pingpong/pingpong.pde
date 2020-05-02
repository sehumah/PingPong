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
  fill(255,0,0);
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
  if((x+r) > width || (x+r) < 0){
    xspeed *= -1;
  }
  
  // bounce ball off top and bottom walls
  if((y+r) > height || (y+r)<0){
    yspeed *= -1;
  }
  
  // draw rectangular paddles
  //fill(139,69,19);
  //stroke(0);
  //rect(0,0,width/30,height/5);
  //rect(29*width/30,3.97*height/5,width/30,height/5);
  
  
  // draw semi-circle paddles
  fill(255,255,0);
  ellipse(0,height/2,100,100);
  ellipse(width,height/2,100,100);
  
  // draw separation line
  stroke(255);
  line(width/2,0,width/2,height);
  
}



/*
class Ball{
  
  float xcoordinate = width/2;
  float ycoordinate = height/2;
  float radius = 30;
  
  // constructor
  Ball(float x, float y, int r){
    this.xcoordinate = x;
    this.ycoordinate = y;
    this.radius = r;
  }
  
  // draw the ball
  void drawBall(){
    stroke(0); // apply a yellow outline
    strokeWeight(2); // thickness of outline
    fill(230); // color of ball
    ellipse(xcoordinate,ycoordinate,radius,radius); // draw a ball
  }
  
  // move the ball
  void moveBall(){
    if(mousePressed){
      xcoordinate = xcoordinate + 1;
    }
  }
}



class Paddle{}

class Score{}
*/
