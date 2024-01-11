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

boolean playerHit (Player player, GreenBall greenBall)
{
  //might have to change get diameter to get green ball diameter
  float playerDistanceLeft = (player.getXCoord() - (greenBall.getXCoord()+ (greenBall.getDiameter()/2)));
//  float playerDistanceRight = ((player.getXCoord() + player.getPlayerWidth()) - (greenBall.getXCoord() + (greenBall.getDiameter()/2)));
//  float playerDistanceUp = (player.getYCoord() - (greenBall.getYCoord() + greenBall.getDiameter()/2));
//  float playerDistanceDown = ((player.getYCoord() + player.getPlayerHeight()) - (greenBall.getYCoord() - (greenBall.getDiameter()/2)));
  
    //The Ball is too far away from the Paddle on the X axis to have a collision, so abandon collision detection
  if (playerDistanceLeft > 0) {
    return false;
  }
  /*
    if (playerDistanceRight > 0) {
    return false;
  }
    if (playerDistanceUp > 0) {
    return false;
  }
    if (playerDistanceDown > 0) {
    return false;
  }
    if (playerDistanceLeft <= 0) {
    return true;
  }
    if (playerDistanceRight <= 0) {
    return true;
  }
    if (playerDistanceUp <= 0) {
    return true;
  }
    if (playerDistanceDown <= 0) {
    return true;
  }
  */

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

  boolean collision = playerHit(player, greenBall);
  if (collision == true) {
    greenBall.hit();        //the ball is hit i.e. reverses direction.
  }
}
