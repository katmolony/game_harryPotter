public class Goal
{
  private int xCoord;        // X coordinate of the goal
  private int yCoord;        // Y coordinate of the goal
  private int goalWidth;   // width of the goal
  private int goalHeight;  // height of the goal
  private color goalColor;

  // consturtors

  public Goal (int yCoord, int goalHeight)
  {
    setGoalWidth(goalWidth);
    //the xCoordinate variable is set here and it stays this value for duration of the program.
    xCoord = width - this.goalWidth;
    this.yCoord = yCoord;
    this.goalHeight=(goalHeight);
    goalColor =#FFAB0D; // yellow goal
  }

  public Goal(int goalWidth)  //NOT USED IN GAME
  {
    setGoalWidth(goalWidth);
    //the xCoordinate variable is set here and it stays this value for duration of the program.
    xCoord = width - this.goalWidth;
    yCoord = height/2;
    goalColor = #751807; // red main goal
  }

  public void display() {
    fill(goalColor);
    noStroke();
    rect(xCoord, yCoord, goalWidth, goalHeight);
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

  public int getGoalWidth()
  {
    return goalWidth;
  }

  public int getGoalHeight()
  {
    return goalHeight;
  }


  // setters

  public void setXCoord (int xCoord) {
    if ((xCoord >= width-goalWidth) && (xCoord <= width)) {
      this.xCoord = xCoord;
    } else {
      this.xCoord = width-20;
    }
  }

  public void setYCoord (int yCoord) {
    if ((yCoord >= goalHeight) && (yCoord <= height)) {
      this.yCoord = yCoord;
    } else {
      this.yCoord = height-100;
    }
  }

  public void setGoalWidth(int goalWidth) {
    if ((goalWidth >= 20) && (goalWidth <= width/2)) {
      this.goalWidth = goalWidth;
    } else {
      this.goalWidth = 20;
    }
  }

  public void setGoalHeight(int goalHeight) {
    if ((goalHeight >= 60) && (goalHeight <= 200)) {
      this.goalHeight = goalHeight;
    } else {
      this.goalHeight = 100;
    }
  }
}
