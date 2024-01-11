public class Spell
{
  private float xCoord;
  private float yCoord;
  private int diameter;
  private float speedY;     //speed along the y-axis


  //constructor
  Spell () {
    xCoord = player2.getXCoord();
    yCoord = player2.getYCoord();
    diameter = 30;
    speedY = 200;
    resetSpell ();
  }

  Spell (int speed) {
    xCoord = player2.getXCoord();
    yCoord = player2.getYCoord();
    diameter = 50;
    speedY = speed;
    resetSpell ();
  }

  public void display() {
  }

  //public methods
  public void update() {
    if (shoot == true) { //spacebar pressed
      for (int i = 0; i <= speedY; i++) {
        drawSpell ();
        yCoord=yCoord-i;
      }
      if (yCoord < diameter/2) {
        resetSpell();
      }
      if (shoot == false) {
        resetSpell();
      }
    }
    if (bigShoot == true) { //spacebar pressed
      for (int i = 0; i <= height; i++) {
        drawSpell ();
        yCoord=yCoord-i;
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
    //setters
  public void setSpellDiameter(int spellDiameter) {

    if ((diameter >= 30) && (diameter <= width/2)) {
      this.diameter = spellDiameter;
    } else {
      this.diameter = 50;
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

  private void drawSpell () {
    image(spellImg, xCoord, yCoord, diameter, diameter);
  }
}
