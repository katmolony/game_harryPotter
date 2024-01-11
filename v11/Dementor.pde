public class Dementor {

  private float xCoord;
  private float yCoord;
  private int dementorWidth;
  private int dementorHeight;

  private float speedX;     //speed along the x-axis
  private float speedY;     //speed along the y-axis

  //tommorw make an array of ghost all with nesting if statmenyts and loops

  public Dementor (int dementorWidth, int dementorHeight) {
    setDementorWidth(dementorWidth);
    setDementorHeight(dementorHeight);
    resetDementor();
  }

  public void update()
  {
    //update ball coordinates
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

    //If ball hits the top or bottom of the display window, change direction of yCoord
    if (yCoord > height - dementorWidth) {
      speedY = speedY * -1;
    } else if (yCoord < dementorWidth) {
      speedY = speedY * -1;
    }
  }

  public void display () {
    image(dementorImg, xCoord, yCoord, dementorWidth, 60);
  }


  public void killDementor () {
    for (int i =0; i<2; i++) {
      dementors[i].resetDementor();
    }
  }

  //setters
  public void setDementorWidth(int dementorWidth) {

    if ((dementorWidth >= 50) && (dementorWidth <= width/2)) {
      this.dementorWidth = dementorWidth;
    } else {
      this.dementorWidth = 90;
    }
  }

  //change the shape of the player here height
  public void setDementorHeight(int dementorHeight) {
    if ((dementorHeight >= 50) && (dementorHeight <= height/2)) {
      this.dementorHeight = dementorHeight;
    } else {
      this.dementorHeight = 90;
    }
  }

  ////// getters ///////
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

  //private helper method
  private void resetDementor()
  {
    xCoord = random(width);  //to stop from going from top to bottom
    yCoord = random(height/4);
    speedX = random(1, 2);
    speedY = random(-2, 1);
  }
}
