public class Scoreboard {

  //constuctors
  public Scoreboard () {
  }

  public void display() {
    slyScoreboard();
    grifScoreboard ();
    lifeScoreboard ();
  }

  public void update()
  {

    if (greenGoal== true) {
      println("Green Goal:  "  + greenScore);
    }

    if (redGoal== true) {
      println("Red Goal:  "  + redScore);
    }
  }
  
  //private helper method
  private void grifScoreboard () {
    fill (184, 67, 58); //Gryffindor Red)
    textFont (potter);
    textAlign (RIGHT);
    image (griffLogo, width-80, 0, 80, 90);
    textSize (50);
    text ("Gryffindor Score: " + redScore, width-100, height/10);

    //for loop to outline text
    for (int x = -1; x < 2; x++) {
      int y = -1;
      while (y < 2) {
        text ("Gryffindor Score: " + redScore, width-100+x, height/10+y);
        y++;
      }
      fill(225); //white outline
    }
    fill (184, 67, 58); //Gryffindor Red)
    text ("Gryffindor Score: " + redScore, width-100, height/10);
  }

  private void slyScoreboard() {
    textFont (potter);
    textAlign (LEFT);
    image (slyLogo, 0, 0, 80, 90);
    fill (42, 98, 61); // Slytherin Green
    textSize (50);
    text ("Slytherin Score: " + greenScore, width/17, height/10);

    //for loop to outline text
    for (int x = -1; x < 2; x++) {
      for (int y = -1; y < 2; y++) {
        text ("Slytherin Score: " + greenScore, width/17+x, height/10+y);
      }
      fill(225); //white outline
    }
    fill (42, 98, 61); // Slytherin Green
    text ("Slytherin Score: " + greenScore, width/17, height/10);
  }

  private void lifeScoreboard () {
    fill (225);
    textFont (potter);
    textAlign (CENTER);
    textSize (40);
    text ("Life Score: " + lives, width/2, height/10);

    //for loop to outline text
    for (int x = -1; x < 2; x++) {
      for (int y = -1; y < 2; y++) {
        text ("Life Score: " + lives, width/2+x, height/10+y);
      }
      fill(0); //black outline
    }
    fill (255);
    text ("Life Score: " + lives, width/2, height/10);
  }
}
