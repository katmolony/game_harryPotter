public class Dementor {

  // fields
  private float xCoord;
  private float yCoord;
  private int dementorWidth;
  private int dementorHeight;
  private float speedX;     //speed along the x-axis
  private float speedY;     //speed along the y-axis

  // constructors
  public Dementor (int dementorWidth, int dementorHeight) {
    setDementorWidth(dementorWidth);
    setDementorHeight(dementorHeight);
    resetDementor();
  }

  public void update()
  {
    //update dementors coordinate
    xCoord = xCoord + speedX;
    yCoord = yCoord + speedY;

    //reset position of dementor on right side of window
    if (xCoord > width - dementorWidth) {
      speedX = speedX * -1;
    }

    //If dementor hits the left edge of the display window, change direction of xCoord
    else if (xCoord < dementorWidth) {
      speedX = speedX * -1;
    }

    if (yCoord > height - dementorWidth) {
      speedY = speedY * -1;
    } else if (yCoord < dementorWidth) {
      resetDementor();
    }
  }

  public void display () {
    drawDementor ();
  }


  //setters
  public void setDementorWidth(int dementorWidth) {

    if ((dementorWidth >= 50) && (dementorWidth <= width/2)) {
      this.dementorWidth = dementorWidth;
    } else {
      this.dementorWidth = 90;
    }
  }

  public void setDementorHeight(int dementorHeight) {
    if ((dementorHeight >= 50) && (dementorHeight <= height/2)) {
      this.dementorHeight = dementorHeight;
    } else {
      this.dementorHeight = 90;
    }
  }

  // getters
  public float getXCoord() {
    return xCoord;
  }

  public float getYCoord() {
    return yCoord;
  }

  public int getDementorWidth() {
    return dementorWidth;
  }

  public int getDementorHeight() {
    return dementorHeight;
  }
  public float getDementorSpeedX() {
    return speedX;
  }
  public float getDementorSpeedY() {
    return speedY;
  }

  //bespoke methods
  public void resetDementor()
  {
    xCoord = random(width);
    yCoord = random(height/6);
    speedX = random(1, 2);
    speedY = random(-1, 1);
  }

  //private helper method
  private void drawDementor () {
    image(dementorImg, xCoord, yCoord, dementorWidth, 60);
  }
}
