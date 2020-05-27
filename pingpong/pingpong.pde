// Declare variables
float xBall;
float yBall;
float diameter; // diameter of ball
float radius;
float xSpeed; // right-left speed of ball
float ySpeed; // top-bottom speed of ball
float leftPaddleX; // X coordinate for left paddle
float leftPaddleY; // Y coordinate for left paddle
float rightPaddleX; // X coordinate for right paddle
float rightPaddleY; // Y coordinate for right paddle
float paddleHeight; // height of paddles
float paddleWidth; // width of paddles
int leftPlayerScore = 0; // score for player on left side
int rightPlayerScore; // score for player on right side
boolean gameOn;

void setup(){
  size(800,400);
  xBall = width/2; //horizontal position of ball
  yBall = height/2; //vertical position of ball
  diameter = 20;
  radius = diameter/2; //radius of ellipse
  xSpeed = 5; //horizontal speed of ball
  ySpeed = 5; //vertical speed of ball
  leftPaddleX = 0; 
  leftPaddleY = 0;
  rightPaddleX = 49*width/50;
  rightPaddleY = 3*height/4;
  paddleWidth = width/50;
  paddleHeight = height/4;
  leftPlayerScore = 0;
  rightPlayerScore = 0;
  gameOn = false;
} // end setup

void draw(){
  background(0,0,150);
  displayObjects();
  moveBall();
  moveLeftPaddle();
  moveRightPaddle();
  checkWall();
  checkLeftPaddle();
  checkRightPaddle();
} // end draw


void displayObjects(){
  // draw ball
  fill(255,255,0);
  ellipse(xBall, yBall, diameter, diameter);
  
  // draw paddles
  fill(255, 255, 0);
  rect(leftPaddleX, leftPaddleY, paddleWidth, paddleHeight);
  rect(rightPaddleX, rightPaddleY, paddleWidth, paddleHeight);

  // display scores
  textSize(20);
  text("Player1: " + leftPlayerScore, width/6, height/10);
  text("Player2: " + rightPlayerScore, 2.8*width/4, height/10);
  
  // draw center line
  stroke(255,255,0);
  strokeWeight(1.5);
  line(width/2,0,width/2,height);
} // end displayStuff

void moveLeftPaddle(){
  if (mouseX < width/2){ //moving left paddles
    leftPaddleY = mouseY;
    if (leftPaddleY + paddleHeight > height){
      leftPaddleY = height - paddleHeight;
    }
  }
} // end moveLeftPaddle

void moveRightPaddle(){
  if (mouseX > width/2){ //moving right paddle
    rightPaddleY = mouseY;
    if (rightPaddleY + paddleHeight > height){
      rightPaddleY = height - paddleHeight;
    }
  }
} // end moveRightPaddle

void checkLeftPaddle(){
  if ((xBall - radius <= leftPaddleX + paddleWidth) && (yBall > leftPaddleY) && (yBall < leftPaddleY + paddleHeight)){
    xSpeed = xSpeed * -1;
  }
} // end checkLeftPaddle

void checkRightPaddle(){
  if ((xBall + radius >= rightPaddleX) && (yBall > rightPaddleY) && (yBall < rightPaddleY + paddleHeight)){
    xSpeed = xSpeed * -1;
  }
} // end checkRightPaddle

void moveBall(){
  if(mousePressed){
    gameOn = true;
  }
  if(gameOn){
    xBall = xBall + xSpeed;
    yBall = yBall + ySpeed;
  }
} // end moveBall

void checkWall(){
  if (yBall + radius > height || yBall - radius < 0){ 
    ySpeed = ySpeed * -1;
  }
  if (xBall - radius <= 0){
    rightPlayerScore = rightPlayerScore + 1;
    xBall = width/2;
    yBall = height/2;
    gameOn = false;
  } 
  else if (xBall + radius >= width){
    leftPlayerScore = leftPlayerScore + 1;
    xBall = width/2;
    yBall = height/2;
    gameOn = false;
  }
} // end checkWall
