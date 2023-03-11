//Pong game Final Exam
//Pong game controlled through two players. At the moment CPU integration is not available.
//A tiny proportion of my code is creditted at the end of the code
//Pong is a simulation of table tennis, where players control paddles, the goal is end with more points then
//your opponent. First to score 3 wins.

//I modified my code a tiny bit from the video. So if the ball goes past the right side of the screen, player1's score is increased...
//instead of player's 2 score being increased. Basically the opposite of what I had before.

int BallX = width/2; //Position of ball, starts in middle
int BallY = height/2; 

boolean Right = true;
boolean Down = true; // Use these later on for borders of screen

int speedHorz = 5;  //Horizontal speed of ball, both are changable of course
int speedVert = 4;  //Speed in y direction of ball

int Score1 = 0;
int Score2 = 0; //Scoreboard, Score1 is for player1, Score2 is for player 2

PFont font; //Loads in the foat for the scoreboard, declares it as veriable

int LeftPaddle = 360;
int RightPaddle = 360;

void setup() {
  size(700,700);  //Size of the screen, pretty simple
  
  font = loadFont("TwCenMT-Condensed-48.vlw"); //Font loaded in from tools menu
}



void draw(){
  background(0);  
  fill(255);
  ellipse(BallX,BallY,50,50); //Ball
  
  fill(255);
  rect(20,LeftPaddle,30,80); //Player 1
  
  fill(255);
  rect(650,RightPaddle,30,80);  //Player 2
  
  
  
  //Controls For both players
  
  if (keyPressed == true && key == 'w'){
    LeftPaddle = LeftPaddle - 12;    //Controls vertical movement of paddle1 by pressing W key
  }
  
  if (keyPressed == true && key == 's'){
    LeftPaddle = LeftPaddle + 12;     //Controls downward movement of paddle1 by pressing S key
  }
  
  if (keyPressed == true && key == 'i'){
    RightPaddle = RightPaddle - 12;  //Controls vertical movement of paddle2 by pressing i key
  }
  if (keyPressed == true && key == 'k'){
    RightPaddle = RightPaddle + 12;  //Controls downward movement of paddle2 by pressing k key
  }
  
  //SCOREBOARD
  textFont (font);  //Specify font used
  
  fill(255);
  text("Pong",320,80); //Text in the middle
  
  fill(255);
  text(Score1,240,85);  //Score on left hand side
  
  fill(255);
  text(Score2,460,85);  //Score on right hand side
  
  if(Score1 == 3){
    background(0);
    text("Player 1 Wins", 250,350);
    noLoop();  //If the score on the left hits 3 first, player1 wins, and the games stops.
  }
  else if(Score2 == 3){
    background(0);
    text("Player 2 Wins", 250,350);
    noLoop();  //If the score on the Right hits 3 first, player2 wins, and the games stops.
  }
  
  
  
  //Ball Movement and Sets borders for Ball!
  
  if(Right == true){
    BallX = BallX + speedHorz;  //Right speed of ball, can be modified 
  }
  else {
    BallX = BallX - speedHorz;  //Left horziontal speed of ball, can be modified
  }
  
  if(Down == true){
    BallY = BallY + speedVert;    //Downward direction of ball, can be modified
  }
  else {
    BallY = BallY - speedVert;    //Upward direction of ball, can be modified
  }
  
  
  //BORDERS FOR BALL
  
  if (BallY <= 10 ){
    Down = true;  //Border at top of screen
    //Ball is unable to go past y = 10
  }
  
  if (BallY >= 680){
    Down = false;  //Creates border at bottom of screen
    //Ball is unable to go past y = 680
  }
  
  if (BallX <= 10){
    Right = true;  //Creates border on the left hand side of screen
    //Ball is unable to go past x = 10
    
    Score2++;  //If the ball hits the right side of the screen, Score2 is increased by 1
    BallX = width/2;
    BallY = height/2; //Resets ball back to middle
  }
  
  if(BallX >= 680){
    Right = false;  //This creates a border on the right hand side of the screen.
    //Which does not allow the ball to go past x=680
    
    Score1++;  //If the ball hits the left side of the screen, Score1 is increased by 1
    BallX = width/2;
    BallY = height/2; //Resets ball back to middle
    
  }
  
  //REGISTERS BALL HITS
  
  if (BallX >= 615 && BallY > RightPaddle && BallY < (RightPaddle +100)){
    Right = false;
    //What this does is creates a right boundary for the right paddle in order for it to bounce off
    //Credits to Eprittinen over at instrucables.com, because i could not for the life of me get this part.
  }
  
  if(BallX <= 75 && BallY > LeftPaddle && BallY <(LeftPaddle + 100)){
    Right = true;
     //What this does is creates a left boundary for the left paddle in order for it to bounce off
    //Credits to Eprittinen over at instrucables.com,
  }
  
}
