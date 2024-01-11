public class Spell
{
  private float xCoord;
  private float yCoord;
  private int diameter;
  private float speedX;     //speed along the x-axis
  private float speedY;     //speed along the y-axis

  /*
    //get position of player to keep them joint
   xCoord = player2.getXCoord();
   yCoord = player2.getYCoord()+(player2.getPlayer2Height()/2);
   */

  //constructor
  Spell (int xCoordSpell, int yCoordSpell) {
    xCoord = player2.getXCoord();
    yCoord = player2.getYCoord();
    diameter = 20;
    speedX = 15;
    speedY = 15;
    resetBullet ();
  }

  //this is where you can change the colour
  public void display() {
    rect (xCoord, yCoord, diameter, diameter);
  }

  public void update() {
    if (shoot == true) {  //spacebar pressed
      for (int i = 0; i <= speedY; i++) {
        yCoord=yCoord-i;
      } 
      if (yCoord < diameter/2) {
        resetBullet();
      }
    }
  }
  private void resetBullet () {
    xCoord = player2.getXCoord();
    yCoord = player2.getYCoord();
  }
}
