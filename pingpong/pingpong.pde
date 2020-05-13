// declare variables
float ballx,bally,ballradius; // ball's x-coordinate, y-coordinate & radius
float xspeed,yspeed; // ball's horizontal speed(left-right), vertical speed(top-bottom)
float leftrectx,leftrecty,rightrectx,rightrecty,rectwidth,rectheight; // rectangular paddles' x & y coordinates and width & height
float leftcirclex,leftcircley,rightcirclex,rightcircley,circleradius;// circular paddles' x & y coordinates and width, height & radius
int score1,score2;
float score1x,score2x,scorey;
boolean gameOn;

void setup(){
  size(800,400); // screen size
  
  // initialize variables
  ballx = width/2;
  bally = height/2;
  ballradius = 20;
  xspeed = 15;
  yspeed = 15;
  gameOn = false;
  leftrectx = 0;
  leftrecty = 0;
  rightrectx = 29*width/30;
  rightrecty = 3.97*height/5;
  rectwidth = width/30;
  rectheight = height/5;
  leftcirclex = 0;
  leftcircley = height/2;
  rightcirclex = width;
  rightcircley = height/2;
  circleradius = 50;
  score1 = 0;
  score2 = 0;
  score1x = 2*width/10;
  score2x = 6.8*width/10;
  scorey = height/15;
} // end setup

void draw(){
  background(0,0,150);
  //background(0,140,0);
  drawBall();
  moveBall();
  checkWalls(); // bounce ball off the top, bottom, left and right walls
  //rectangularPaddles();
  //moveRectPaddles();
  circluarPaddles();
  moveCircularPaddles();
  separationLines();// draw horizontal and vertical separation lines
  borderLines(); // draw white lines around all 4 edges
  playerInfo();
} // end draw


void drawBall(){
  fill(255);
  ellipse(ballx,bally,ballradius,ballradius);
}

void moveBall(){
  if(mousePressed){
    gameOn = true;
  }
  if(gameOn){
    ballx = ballx + xspeed;
    bally = bally + yspeed;
  }
} // end moveBall

void checkWalls(){
  // bounce ball off left and right walls
  if((ballx+ballradius) > width || (ballx-ballradius) < 0){
    xspeed *= -1;
  }
  // bounce ball off top and bottom walls
  if((bally+ballradius) > height || (bally-ballradius) < 0){
    yspeed *= -1;
  }
} // end checkWalls

void rectangularPaddles(){
  fill(200,0,0);
  stroke(255);
  strokeWeight(2);
  rect(leftrectx,leftrecty,rectwidth,rectheight); // left rectangular paddle
  rect(rightrectx,rightrecty,rectwidth,rectheight); // right rectangular paddle
} // end rectangularPaddles

void moveRectPaddles(){ // prevent both rectangular paddles from leaving the screen
  // move left paddle
  if(mouseX < width/2){
    leftrecty = mouseY;
  }
  // move right paddle
  else{
    rightrecty = mouseY;
  }
  
  // contain left rectangular paddle
  if( (leftrecty+rectheight) > height){
    leftrecty = height - rectheight;
  }
  // contain right rectangular paddle
  else if(rightrecty+rectheight > height){
    rightrecty = height - rectheight;
  }
}

void circluarPaddles(){
  fill(200,0,0);
  stroke(255);
  strokeWeight(2);
  ellipse(leftcirclex,leftcircley,circleradius,circleradius); // left circular paddle
  ellipse(rightcirclex,rightcircley,circleradius,circleradius); // right circular paddle
} // end circluarPaddles

void moveCircularPaddles(){
  // move left circular paddle
  if(mouseX < width/2){
    leftcircley = mouseY;
  }
  // move right circular paddle
  else {
    rightcircley = mouseY;
  }
  
  // contain left circular paddle in the screen
  if((leftcircley-circleradius) < 0){
    leftcircley = 0 + circleradius;
  }
  else if((leftcircley+circleradius) > height){
    leftcircley = height - circleradius;
  }
  
  // contain right circular paddle in the screen
  if((rightcircley-circleradius) < 0){
    rightcircley = 0 + circleradius;
  }
  else if((rightcircley+circleradius) > height){
    rightcircley = height - circleradius;
  }
} // end moveCircularPaddles

void separationLines(){
  // vertical separation line
  stroke(100);
  strokeWeight(2);
  line(width/2,0,width/2,height);
  
  // horizontal separation line
  stroke(255);
  strokeWeight(1);
  line(0,height/2,width,height/2);
} // end separationLines

void borderLines(){
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

void playerInfo(){
  String p1score = "Player1: " + score1;
  String p2score = "Player2: " + score2;
  fill(255);
  textSize(20);
  text(p1score,score1x,scorey);
  text(p2score,score2x,scorey);
}
