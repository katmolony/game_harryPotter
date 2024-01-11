//----------------------------------------------//
// Idea is based on Reas and Fry (2014) example //
//----------------------------------------------//
public class GreenBall
{
  private float xCoord;     //x coordinate of the ball
  private float yCoord;     //y coordinate of the ball
  private float diameter;   //diameter of the ball
  private float speedX;     //speed along the x-axis
  private float speedY;     //speed along the y-axis

  //Constructor to set up the ball and its diameter
  public GreenBall(float diameter)
  {
    setDiameter(diameter);
    resetBall();
  }

  //Change ball position.  Returns true if the ball goes off the screen (i.e. life lost)
  public void update()
  {
    //update ball coordinates
    xCoord = xCoord + speedX;
    yCoord = yCoord + speedY;

    //reset position if the ball leaves the screen
    if (xCoord > width + diameter/2) {
      resetBall();
    } 

    //If ball hits the left edge of the display window, change direction of xCoord
    else if (xCoord < diameter/2) {
      resetBall();
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

  // Change the ball direction when it hits the paddle
  // and bump it back to the edge of the paddle
  public void hit()
  {
    speedX = speedX * -2;   //speed made faster to hit hard away
    xCoord = xCoord + speedX;

  //  speedY = speedY * -1;
    //yCoord = yCoord + speedY;
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
    //The ball diameter must be between 20 and height/6 (inclusive)
    if ((diameter >= 20) && (diameter <= height/6)) {
      this.diameter = diameter;
    } else {
      // If an invalid diameter is passed as a parameter, a default of 20 is imposed.
      // With this animation, if we do not supply a default value for the diameter, a ball may not be
      // drawn on the display window.  Important note: it is not always appropriate to provide a default
      // value at mutator level; this will depend on your design.
      this.diameter = 20;
    }
  }

  //private helper method
  private void resetBall()
  {
    xCoord = getDiameter();  //to stop from going from tiop to bottom
    yCoord = random(height);
    speedX = random(3, 5);
    speedY = random(-2, 2);
  }
}
