public class Spell
{
  private float xCoord;
  private float yCoord;
  private int diameter;
  private float speedX;     //speed along the x-axis
  private float speedY;     //speed along the y-axis

  //constructor
  Spell (float xCoordSpell, float yCoordSpell) {
    xCoord = player2.getXCoord();
    yCoord = player2.getYCoord();
    diameter = 50;
    speedX = 15;
    speedY = 15;
    resetSpell ();
  }

  Spell (float xCoordSpell, float yCoordSpell, int speed) {
    xCoord = player2.getXCoord();
    yCoord = player2.getYCoord();
    diameter = 100;
    speedX = 15;
    speedY = speed;
    resetSpell ();
  }

  public void display() {
  }

  public void update() {
    if (shoot == true) { //spacebar pressed
      for (int i = 0; i <= speedY; i++) {
        yCoord=yCoord-i;
        drawBlueSpell ();
      }
      if (yCoord < diameter/2) {
        resetSpell();
      }
      if (shoot == false) {
        resetSpell();
      }
    }
    if (bigShoot == true) { //spacebar pressed
      for (int i = 0; i <= speedY; i++) {
        //  drawSpell ();
        yCoord=yCoord-(2*i);
        drawRedSpell ();
      }
      if (yCoord < diameter/2) {
        resetSpell();
      }
      if (bigShoot == false) {
        resetSpell();
      }
    }
  }

  //setters
  public void setSpellDiameter(int spellDiameter) {

    if ((diameter >= 30) && (diameter <= width/2)) {
      this.diameter = spellDiameter;
    } else {
      this.diameter = 200;
    }
  }


  //getters
  public float getXCoord() {
    return xCoord;
  }

  public float getYCoord() {
    return yCoord;
  }

  public int getDiameter()
  {
    return diameter;
  }

  //private helper methods
  private void resetSpell () {
    xCoord = player2.getXCoord();
    yCoord = player2.getYCoord();
  }

  private void drawBlueSpell () {
    image(spellImg, xCoord, yCoord, diameter, diameter);
  }
  private void drawRedSpell () {
    image(spell2, xCoord, yCoord, diameter, diameter);
  }
}
