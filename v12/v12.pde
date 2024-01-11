/*
Name :             Kate Molony
 Student Number:    20104127
 
 Brief description of the game developed 1/2 sentences:
 
 Keystrokes/Mouse: BRIEF PLEASE
 
 Known bugs/problems:
 
 References:
 Any sources referred to during the development of the assignment (be precise and specific with references) {there no need to reference lecture/lab materials}:
 
 */
import javax.swing.JOptionPane;

Scoreboard scoreboard;
GreenBall greenBall;
RedBall redBall;
Player player;
Spell spell;
Player2 player2;

Goal [] goals = new Goal[3];
Dementor [] dementors = new Dementor[2];

String playerName [] = new String [3];

PImage playerImg;
PImage player2Img;
PImage pitch;
PImage dementorImg;
PImage griffLogo;
PImage slyLogo;
PImage spellImg;

PFont potter;

int lives = 5;
int greenScore = 0;
int redScore = 0;
//int highscore =-1;

public int xCoordSpell;
public int yCoordSpell;

//for movement control of player
boolean up, down, left, right;
boolean left2, right2;
boolean shoot, bigShoot; //for shooting spells

//boolean hitGreenGoal, hitRedGoal;
boolean greenGoal, redGoal;

//String playerName;

void setup () {
  //setup using rules set by assignment
  size (1280, 720);
  surface.setTitle("20104127 Kate Molony Assignment 2");
  noCursor();
  surface.setLocation(100, 50); // sets location of the display window

  greenBall = new GreenBall(20.0);
  redBall = new RedBall(20.0);
  player = new Player (20, 100);
  player2 = new Player2 (40, 40);
  scoreboard = new Scoreboard ();

  //overloading methods
  spell = new Spell (100);
  spell = new Spell ();


  //while loop
  int a = 0;
  while (a < goals.length)
  {
    goals[a] = new Goal((200*a)+100, 100);
    a++;
  }

  //do while loop
  int j = 0;
  do {
    dementors[j] = new Dementor(80, 80);
    j++;
  } while (j < dementors.length);

  //load images
  playerImg = loadImage("player.png");
  player2Img = loadImage("player2Img.png");
  pitch = loadImage("pitch.png");
  dementorImg = loadImage("dementorImg.png");
  slyLogo =loadImage("slyLogo.png");
  griffLogo = loadImage ("griffLogo.png");
  spellImg = loadImage ("spell.gif");
  //load font
  potter = createFont("HarryP.ttf", 60);
}

public void keyPressed () {
  if (key == 'a') left = true;
  if (key == 'd') right = true;
  if (key == 'w') up = true;
  if (key == 's') down = true;

  if (keyCode == LEFT) left2 = true;
  if (keyCode == RIGHT) right2 = true;

  if (key == ' ') shoot = true;
  if (key == 'b') bigShoot = true;
}

public void keyReleased () {
  if (key == 'a') left = false;
  if (key == 'd') right = false;
  if (key == 'w') up = false;
  if (key == 's') down = false;

  if (keyCode == LEFT) left2 = false;
  if (keyCode == RIGHT) right2 = false;

  if (key == ' ') shoot = false;
  if (key == 'b') bigShoot = false;
}

boolean hitGoalGreen (Goal goals, GreenBall greenBall)
{
  //These variables measure the magnitude of the gap between the goal and the ball.
  float circleGoalGreenDistanceX = abs(greenBall.getXCoord() - goals.getXCoord());
  float circleGoalGreenDistanceY = abs(greenBall.getYCoord() - goals.getYCoord() - goals.getGoalHeight()/2);

  if (circleGoalGreenDistanceX > (greenBall.getDiameter()/2)) {
    return false;
  }
  if (circleGoalGreenDistanceY > (goals.getGoalHeight()/2 + greenBall.getDiameter()/2)) {
    return false;
  }
  //We have a score for Green
  return true;
}


boolean hitGoalRed (Goal goals, RedBall redBall)
{
  //These variables measure the magnitude of the gap between the goal and the ball.
  float circleGoalRedDistanceX = abs(redBall.getXCoordRed() - goals.getXCoord());
  float circleGoalRedDistanceY = abs(redBall.getYCoordRed() - goals.getYCoord() - goals.getGoalHeight()/2);

  if (circleGoalRedDistanceX > (redBall.getDiameterRed()/2)) {
    return false;
  }
  if (circleGoalRedDistanceY > (goals.getGoalHeight()/2 + redBall.getDiameterRed()/2)) {
    return false;
  }
  //We have a score for Red
  return true;
}

boolean hitPlayerGreen(Player player, GreenBall greenBall)
{
  //These variables measure the magnitude of the gap between the paddle and the ball.
  float circleDistanceX = abs(greenBall.getXCoord() - player.getXCoord() - player.getPlayerWidth()/2);
  float circleDistanceY = abs(greenBall.getYCoord() - player.getYCoord() - player.getPlayerHeight()/2);

  if (circleDistanceX > (player.getPlayerWidth()/2  + greenBall.getDiameter()/2)) {
    return false;
  }
  if (circleDistanceY > (player.getPlayerHeight()/2 + greenBall.getDiameter()/2)) {
    return false;
  }

  if (circleDistanceX <= (player.getPlayerWidth()/2)) {
    return true;
  }
  if (circleDistanceY <= (player.getPlayerHeight()/2)) {
    return true;
  }

  float cornerDistance = pow(circleDistanceX - player.getPlayerWidth()/2, 2) +
    pow(circleDistanceY - player.getPlayerHeight()/2, 2);

  if (cornerDistance <= pow(greenBall.getDiameter()/2, 2)) {
    return true;
  } else {
    return false;
  }
}


boolean hitPlayerRed(Player player, RedBall redBall)
{
  //These variables measure the magnitude of the gap between the paddle and the ball.
  float redCircleDistanceX = abs(redBall.getXCoordRed() - player.getXCoord() - player.getPlayerWidth()/2);
  float redCircleDistanceY = abs(redBall.getYCoordRed() - player.getYCoord() - player.getPlayerHeight()/2);

  if (redCircleDistanceX > (player.getPlayerWidth()/2  + redBall.getDiameterRed()/2)) {
    return false;
  }
  if (redCircleDistanceY > (player.getPlayerHeight()/2 + redBall.getDiameterRed()/2)) {
    return false;
  }

  if (redCircleDistanceX <= (player.getPlayerWidth()/2)) {
    return true;
  }
  if (redCircleDistanceY <= (player.getPlayerHeight()/2)) {
    return true;
  }

  float redCornerDistance = pow(redCircleDistanceX - player.getPlayerWidth()/2, 2) +
    pow(redCircleDistanceY - player.getPlayerHeight()/2, 2);

  if (redCornerDistance <= pow(redBall.getDiameterRed()/2, 2)) {
    return true;
  } else {
    return false;
  }
}

boolean spellHitDementor (Spell spell, Dementor dementors)
{
  //These variables measure the magnitude of the gap between the goal and the ball.
  float spellDementorDistanceX = abs(spell.getXCoord() - dementors.getXCoord() - dementors.getDementorWidth()/2);
  float spellDementorDistanceY = abs(spell.getYCoord() - dementors.getYCoord()- dementors.getDementorHeight()/2);

  if (spellDementorDistanceX > (spell.getDiameter()/2)) {
    return false;
  }
  if (spellDementorDistanceY > (dementors.getDementorHeight()/2 + spell.getDiameter()/2)) {
    return false;
  }
  //A spell hit a dementor
  return true;
}

boolean dementorHitplayer (Player player, Dementor dementors)
{
  //These variables measure the magnitude of the gap between the goal and the ball.
  float playerDementorDistanceX = abs(player.getXCoord() - dementors.getXCoord() - dementors.getDementorWidth()/2);
  float playerDementorDistanceY = abs(player.getYCoord() - dementors.getYCoord()-player.getPlayerHeight()/2);

  if (playerDementorDistanceX > (player.getPlayerWidth()/2)+dementors.getDementorWidth()/2) {
    return false;
  }
  if (playerDementorDistanceY > (player.getPlayerHeight()/2) + dementors.getDementorHeight()/2) {
    return false;
  }
  //dementor hit player
  return true;
}

//method with return value to get final score
int getFinalScore (int red, int green)
{
  return red - green;
}

//public String getHighScore()
//{
//format: Kate : 20

//}

void displayScores () {
  for (int i = 0; i< playerName.length; i++) {
    JOptionPane.showMessageDialog(null,
      "Your final score is \n\n" +
      getFinalScore(redScore, greenScore),
      "High Scores", JOptionPane.PLAIN_MESSAGE);
  }
  //initialise highscore
}

void getPlayerName () {
  String playerName  = JOptionPane.showInputDialog(
    "Welcome to the Quidditch School Cup Game\n\n " + "Please enter your name: ",
    "Max 5 char.");
  println(playerName);

  int confirmStart = JOptionPane.showConfirmDialog(null,
    "Would you like to start the game?", "Quittitch",
    JOptionPane.YES_NO_OPTION);
  if (confirmStart == JOptionPane.NO_OPTION) {
    System.exit(0);
  } else {
    setup();  //restarts game
  }
}

//method to restart the game
void reset () {
  setup();
  lives = 50;
  greenScore = 0;
  redScore = 0;
}

// method to end or restart the game when all lives are lost
void gameOver () {
  if (lives == 0) {
    JOptionPane.showMessageDialog(null,
      "Dementors have taken all your energy! Lives: "  + lives,
      "GAME OVER", JOptionPane.PLAIN_MESSAGE);

    if (redScore > greenScore) {
      JOptionPane.showMessageDialog(null,
        "Gryffindor wins!",
        "GAME OVER", JOptionPane.PLAIN_MESSAGE);
    } else if (redScore < greenScore) {
      JOptionPane.showMessageDialog(null,
        "Slytherin wins!",
        "GAME OVER", JOptionPane.PLAIN_MESSAGE);
    }
    JOptionPane.showMessageDialog(null,
      "The final score is \n\n" +
      "Gryffindor "  + redScore + " points \n\n" +
      "Slytherin "  + greenScore + " points",
      "GAME OVER", JOptionPane.PLAIN_MESSAGE);
    JOptionPane.showMessageDialog(null,
      "Your final score is \n\n" +
      getFinalScore(redScore, greenScore),
      "GAME OVER", JOptionPane.PLAIN_MESSAGE);

    int confirmDialog = JOptionPane.showConfirmDialog(null,
      "Would you like to play again?",
      "GAME OVER", JOptionPane.YES_NO_OPTION);

    if (confirmDialog == JOptionPane.NO_OPTION) {
      System.exit(0);
    } else {
      reset (); // restarts the games
    }
  }
}

void draw()
{
  // getPlayerName ();
  gameOver (); //method for when all lives are lost
  //displayScores ();

  background(pitch);       //Clear the background, pictch of pitch

  greenBall.update();
  greenBall.display();

  redBall.update();
  redBall.display();

  player.update();
  player.display();

  player2.update();
  player2.display();

  int g=0;
  do
  {
    goals[g].display();
    g++;
  }
  while (g < goals.length);

  // this will be for when a score board is added
  scoreboard.update();
  scoreboard.display();

  if (shoot == true) { //spacebar pressed
    spell = new Spell ();
  }
  if (bigShoot == true) {
    spell = new Spell (100);
  }

  spell.update();
  spell.display();

  /*
 if the redScore reaches 3 array of dementors are displayed
   when the red score reaches a certain score the array of
   dementors become faster
   */
  if (redScore >= 3) {
    for (int i=0; i < dementors.length; i++) {
      dementors[i].display();
      dementors[i].update();
    }
    if (redScore >= 6) {
      int a=0;
      while (a < dementors.length) {
         dementors[a].display();
        dementors[a].update();
        a++;
        if (redScore >= 8) {
          for (int b=0; b< dementors.length; b++) {
             dementors[b].display();
            dementors[b].update();
          }
        }
      }
    }
  }


  /*
  when the greenBall (greenGoal) or redBall (redGoal) hit any of the goals
   in the array of goals the points will be added for said team
   (i.e. if the green ball hits the goal a point goes to green (slytherine))
   and said ball will be reset
   */

  for (int a =0; a<goals.length; a++) {
    boolean greenGoal = hitGoalGreen (goals[a], greenBall);
    if (greenGoal== true) {
      greenBall.resetBallGreen();
      greenScore ++;            //add a green score and reset ball
    }
  }

  for (int b =0; b < goals.length; b++) {
    boolean redGoal = hitGoalRed (goals[b], redBall);
    if (redGoal== true) {
      redScore ++;            //add a red score and reset ball
      redBall.resetBallRed();
    }
  }

  /*
  collision of player with greenBall or redBall causing
   either to be hit in the reverse direction
   */

  boolean greenCollision = hitPlayerGreen(player, greenBall);
  if (greenCollision == true) {
    greenBall.greenhit();        //the ball is hit i.e. reverses direction.
  }

  boolean redCollision = hitPlayerRed(player, redBall);
  if (redCollision == true) {
    redBall.redhit();        //the ball is hit i.e. reverses direction.
  }

  /*
collision of spell with the array of dementors
   causing whatever dementor hit with spell to
   BE PUSHED UP THE SCREEN
   */
  for (int i =0; i<2; i++) {
    boolean hitDementor = spellHitDementor (spell, dementors[i]);
    if (hitDementor == true)
    {
      dementors[i].yCoord = dementors[i].yCoord-50;
    }
  }

  /*
if the dementor comes in contact with the Player(i.e. player 1, Harry)
   a life is lost and the dementor is reset
   */
  for (int i =0; i<2; i++) {
    boolean playerHurt = dementorHitplayer (player, dementors[i]);
    if (playerHurt == true)
    {
      lives--;
      println("Life lost:  "  + lives);
      dementors[i].resetDementor();
    }
  }
}
