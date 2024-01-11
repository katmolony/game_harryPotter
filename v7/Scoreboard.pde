public class Scoreboard {

  public Scoreboard () {
  }

  public void display() {
    fill (225);
    textSize (32);
    text ("Slytherin Score: " + greenScore + " Gryffindor Score: " + redScore, width/10, height/10);
  }
  public void update()
  {
    boolean greenGoal = hitGoalGreen (goal, greenBall);
    if (greenGoal== true) {
      println("Green Goal:  "  + greenScore);
    }
        boolean redGoal = hitGoalRed (goal, redBall);
    if (redGoal== true) {
      println("Red Goal:  "  + redScore);
    }
  }
}
