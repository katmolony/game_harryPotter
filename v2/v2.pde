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
}

GreenBall greenBall;
RedBall redBall;

Player player;

//method returns true if the ball and paddle overlap (i.e. ball is hit), false otherwise.
boolean hitPlayer(Player player, GreenBall greenBall)
{
  //These variables measure the magnitude of the gap between the paddle and the ball.
  //X is horizontal
  float circleDistanceX = abs(greenBall.getXCoord() - player.getXCoord());
  //Y is verticle
  float circleDistanceY = abs(greenBall.getYCoord() - player.getYCoord() - player.getPlayerHeight()/2);

  //The Ball is too far away from the Paddle on the X axis to have a collision, so abandon collision detection
  if (circleDistanceX > (greenBall.getDiameter()/2)) {
    return false;
  }

  //The Ball is too far away from the Paddle on the Y axis to have a collision, so abandon collision detection
  if (circleDistanceY > (player.getPlayerHeight()/2 + greenBall.getDiameter()/2)) {
    return false;
  }

  //We have a collision!
  return true;
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

  // this will be for when a score bopard is added
  //scoreboard.update();
  //scoreboard.display();

  boolean collision = hitPlayer(player, greenBall);
  if (collision == true) {
    greenBall.hit();        //the ball is hit i.e. reverses direction.
  }
}
