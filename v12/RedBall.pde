public class RedBall
{
  private float xCoordRed;     //x coordinate of the ball
  private float yCoordRed;     //y coordinate of the ball
  private float diameterRed;   //diameter of the ball
  private float speedXRed;     //speed along the x-axis
  private float speedYRed;     //speed along the y-axis

  //Constructor
  public RedBall(float diameterRed)
  {
    setDiameterRed(diameterRed);
    resetBallRed();
  }

  public void update()
  {
    //update ball coordinates
    xCoordRed = xCoordRed + speedXRed;
    yCoordRed = yCoordRed + speedYRed;

    //reset position if the ball leaves the screen
    if (xCoordRed > width + diameterRed/2) {
      resetBallRed();
    }

    //If ball hits the left edge of the display window reset
    else if (xCoordRed < diameterRed/2) {
      resetBallRed();
    }

    //If ball hits the top or bottom of the display window, change direction of yCoord
    if (yCoordRed > height - diameterRed/2) {
      yCoordRed = height - diameterRed/2;
      speedYRed = speedYRed * -1;
    } else if (yCoordRed < diameterRed/2) {
      yCoordRed = diameterRed/2;
      speedYRed = speedYRed * -1;
    }
  }

  public void display()
  {
    fill(184, 67, 58); //Gryffindor Red
    noStroke();
    ellipse(xCoordRed, yCoordRed, diameterRed, diameterRed);
  }

  //getter methods
  public float getXCoordRed()
  {
    return xCoordRed;
  }

  public float getYCoordRed()
  {
    return yCoordRed;
  }

  public float getDiameterRed()
  {
    return diameterRed;
  }

  //setter methods
  public void setDiameterRed(float diameterRed)
  {
    if ((diameterRed >= 20) && (diameterRed <= height/6)) {
      this.diameterRed = diameterRed;
    } else {
      this.diameterRed = 20;
    }
  }

//bespoke methods
 public void redhit()
  {
    speedXRed = speedXRed * -2;
    xCoordRed = xCoordRed + speedXRed;
  }
  
//private helper methods
  public void resetBallRed()
  {
    xCoordRed = getDiameterRed();
    yCoordRed = random(height);
    speedXRed = random(3, 5);
    speedYRed = random(-2, 2);
  }
}
