public class Scoreboard {

  public Scoreboard () {
  }

  public void display() {
    fill (225);
    textSize (32);
    textFont (potter);
    textAlign (LEFT);
    image (slyLogo, 0, 0, 80, 90);
    text ("Slytherin Score: " + greenScore, width/17, height/10);
    textAlign (RIGHT);
    image (griffLogo, width-80, 0, 80, 90);
    text ("Gryffindor Score: " + redScore, width-100, height/10);
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
