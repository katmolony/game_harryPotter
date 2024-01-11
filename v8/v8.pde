
Scoreboard scoreboard;

GreenBall greenBall;
RedBall redBall;

Player player;

Goal goal;

int lives = 100;
int greenScore = 0;
int redScore = 0;

//for movement control of player
boolean up, down, left, right;

void setup () {
  //setup using rules set by assignment
  size (1280, 720);
  surface.setTitle("20104127 Kate Molony Assignment 2");
  noCursor();
  surface.setLocation(100, 50); // sets location of the display window

  //setting up the ball with hard-coded sizes.
  greenBall = new GreenBall(20.0);
  redBall = new RedBall(20.0);

  player = new Player (20, 100);

  goal = new Goal (60, 100);
  
  scoreboard = new Scoreboard ();
}



//maybe make this a method
// using keyPressed and keyReleased allows
// for 2 variable being pressed at the same time to be true
// as key can't have two values
public void keyPressed () {
  if (key == 'a') left = true;
  if (key == 'd') right = true;
  if (key == 'w') up = true;
  if (key == 's') down = true;
}

public void keyReleased () {
  if (key == 'a') left = false;
  if (key == 'd') right = false;
  if (key == 'w') up = false;
  if (key == 's') down = false;
}

boolean hitGoalGreen (Goal goal, GreenBall greenBall)
{
  //These variables measure the magnitude of the gap between the goal and the ball.
  float circleGoalGreenDistanceX = abs(greenBall.getXCoord() - goal.getXCoord());
  float circleGoalGreenDistanceY = abs(greenBall.getYCoord() - goal.getYCoord() - goal.getGoalHeight()/2);

  if (circleGoalGreenDistanceX > (greenBall.getDiameter()/2)) {
    return false;
  }
  if (circleGoalGreenDistanceY > (goal.getGoalHeight()/2 + greenBall.getDiameter()/2)) {
    return false;
  }
  //We have a score for Green
  return true;
}

boolean hitGoalRed (Goal goal, RedBall redBall)
{
  //These variables measure the magnitude of the gap between the goal and the ball.
  float circleGoalRedDistanceX = abs(redBall.getXCoordRed() - goal.getXCoord());
  float circleGoalRedDistanceY = abs(redBall.getYCoordRed() - goal.getYCoord() - goal.getGoalHeight()/2);

  if (circleGoalRedDistanceX > (redBall.getDiameterRed()/2)) {
    return false;
  }
  if (circleGoalRedDistanceY > (goal.getGoalHeight()/2 + redBall.getDiameterRed()/2)) {
    return false;
  }
  //We have a score for Red
  return true;
}

boolean hitPlayerGreen(Player player, GreenBall greenBall)
{
  //These variables measure the magnitude of the gap between the paddle and the ball.
  float circleDistanceX = abs(greenBall.getXCoord() - player.getXCoord() - player.getPlayerWidth()/2);
  float circleDistanceY = abs(greenBall.getYCoord() - player.getYCoord() - player.getPlayerHeight()/2);

  if (circleDistanceX > (player.getPlayerWidth()/2  + greenBall.getDiameter()/2)) {
    return false;
  }
  if (circleDistanceY > (player.getPlayerHeight()/2 + greenBall.getDiameter()/2)) {
    return false;
  }

  if (circleDistanceX <= (player.getPlayerWidth()/2)) {
    return true;
  }
  if (circleDistanceY <= (player.getPlayerHeight()/2)) {
    return true;
  }

  float cornerDistance = pow(circleDistanceX - player.getPlayerWidth()/2, 2) +
    pow(circleDistanceY - player.getPlayerHeight()/2, 2);

  if (cornerDistance <= pow(greenBall.getDiameter()/2, 2)) {
    return true;
  } else {
    return false;
  }
}


boolean hitPlayerRed(Player player, RedBall redBall)
{
  //These variables measure the magnitude of the gap between the paddle and the ball.
  float redCircleDistanceX = abs(redBall.getXCoordRed() - player.getXCoord() - player.getPlayerWidth()/2);
  float redCircleDistanceY = abs(redBall.getYCoordRed() - player.getYCoord() - player.getPlayerHeight()/2);

  if (redCircleDistanceX > (player.getPlayerWidth()/2  + redBall.getDiameterRed()/2)) {
    return false;
  }
  if (redCircleDistanceY > (player.getPlayerHeight()/2 + redBall.getDiameterRed()/2)) {
    return false;
  }

  if (redCircleDistanceX <= (player.getPlayerWidth()/2)) {
    return true;
  }
  if (redCircleDistanceY <= (player.getPlayerHeight()/2)) {
    return true;
  }

  float redCornerDistance = pow(redCircleDistanceX - player.getPlayerWidth()/2, 2) +
    pow(redCircleDistanceY - player.getPlayerHeight()/2, 2);

  if (redCornerDistance <= pow(redBall.getDiameterRed()/2, 2)) {
    return true;
  } else {
    return false;
  }
}

void draw()
{
  background(0);       //Clear the background

  //Update the ball position and display.
  greenBall.update();
  greenBall.display();

  redBall.update();
  redBall.display();

  player.update();     //Update the player location in line with the cursor
  player.display();    //Draw the player in this new location

  goal.display();

  // this will be for when a score board is added
 scoreboard.update();
  scoreboard.display();

  //collision of player with green ball
  boolean greenCollision = hitPlayerGreen(player, greenBall);
  if (greenCollision == true) {
    greenBall.greenhit();        //the ball is hit i.e. reverses direction.
  }
  //collision of player with red ball
  boolean redCollision = hitPlayerRed(player, redBall);
  if (redCollision == true) {
    redBall.redhit();        //the ball is hit i.e. reverses direction.
  }
}
