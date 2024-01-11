Goal [] goals;
Scoreboard scoreboard;

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

  goals = new Goal[3];
  for (int i = 1; i <= goals.length; i++) {
    goals[i-1] = new Goal((((height/3)/2)*(i)), (50*i));
  }
}

GreenBall greenBall;
RedBall redBall;

Player player;

Goal goal;

//for movement control of player
boolean up;
boolean down;
boolean left;
boolean right;

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

  for (int i=0; i < goals.length; i++) {
    goals[i].display();
  }

  textSize (32);
  text ("Points:", width/2, height/10);
  // this will be for when a score bopard is added
  //scoreboard.update();
  //scoreboard.display();

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
