public class GreenBall
{
  private float xCoord;     //x coordinate of the ball
  private float yCoord;     //y coordinate of the ball
  private float diameter;   //diameter of the ball
  private float speedX;     //speed along the x-axis
  private float speedY;     //speed along the y-axis

  //Constructors
  public GreenBall(float diameter)
  {
    setDiameter(diameter);
    resetBallGreen();
  }

  public void update()
  {
    //update ball coordinates
    xCoord = xCoord + speedX;
    yCoord = yCoord + speedY;

    //reset position if the ball leaves the screen
    if (xCoord > width + diameter/2) {
      resetBallGreen();
    }
    //If ball hits the left edge of the display window, change direction of xCoord
    else if (xCoord < diameter/2) {
      resetBallGreen();
    }
    //If ball hits the top or bottom of the display window, change direction of yCoord
    if (yCoord > height - diameter/2) {
      yCoord = height - diameter/2;
      speedY = speedY * -1;
    } else if (yCoord < diameter/2) {
      yCoord = diameter/2;
      speedY = speedY * -1;
    }
  }

  //Draw the ball on the display window
  public void display()
  {
    fill(42, 98, 61); // Slytherin Green
    noStroke();
    ellipse(xCoord, yCoord, diameter, diameter);
  }

  //getter methods
  public float getXCoord()
  {
    return xCoord;
  }

  public float getYCoord()
  {
    return yCoord;
  }

  public float getDiameter()
  {
    return diameter;
  }

  //setter methods
  public void setDiameter(float diameter)
  {
    if ((diameter >= 20) && (diameter <= height/6)) {
      this.diameter = diameter;
    } else {
      this.diameter = 20;
    }
  }

  //bespoke methods

  // Change the ball direction when it hits the paddle
  // and bump it back to the edge of the paddle
  public void greenhit()
  {
    speedX = speedX * -2;   //speed made faster to hit hard away
    xCoord = xCoord + speedX;
  }

  //private helper method
  public void resetBallGreen()
  {
    xCoord = getDiameter();  //to stop from going from tiop to bottom
    yCoord = random(height);
    speedX = random(3, 5);
    speedY = random(-2, 2);
  }
}
