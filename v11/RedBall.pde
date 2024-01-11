public class RedBall
{
  private float xCoordRed;     //x coordinate of the ball
  private float yCoordRed;     //y coordinate of the ball
  private float diameterRed;   //diameter of the ball
  private float speedXRed;     //speed along the x-axis
  private float speedYRed;     //speed along the y-axis

  //Constructor to set up the ball and its diameter
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

    //If ball hits the left edge of the display window, change direction of xCoord
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
    //reset ball when hits goal and add point
    boolean redGoal = hitGoalRed (goal, redBall);
    if (redGoal== true) {
      resetBallRed();
      redScore ++;
    }
  }

  //Draw the ball on the display window
  public void display()
  {
    fill(184, 67, 58); //Gryffindor Red
    noStroke();
    ellipse(xCoordRed, yCoordRed, diameterRed, diameterRed);
  }

  // Change the ball direction when it hits the paddle
  // and bump it back to the edge of the paddle
  public void redhit()
  {
    speedXRed = speedXRed * -2;
    xCoordRed = xCoordRed + speedXRed;
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
    //The ball diameter must be between 20 and height/6 (inclusive)
    if ((diameterRed >= 20) && (diameterRed <= height/6)) {
      this.diameterRed = diameterRed;
    } else {
      // If an invalid diameter is passed as a parameter, a default of 20 is imposed.
      // With this animation, if we do not supply a default value for the diameter, a ball may not be
      // drawn on the display window.  Important note: it is not always appropriate to provide a default
      // value at mutator level; this will depend on your design.
      this.diameterRed = 20;
    }
  }

  //private helper method
  private void resetBallRed()
  {
    xCoordRed = getDiameterRed();
    yCoordRed = random(height);
    speedXRed = random(3, 5);
    speedYRed = random(-2, 2);
  }
}
