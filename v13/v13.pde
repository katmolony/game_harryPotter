/*
Name :             Kate Molony
 Student Number:    20104127
 
 Brief description of the game developed 1/2 sentences:
 
 Based off the game Quidditch from 'Harry Potter' movies. You play 2 charaters (Harry and Hermione
 who play for the Gryffindor team (red team).
 
 (Player 1) Harry's aim is to prevent the green balls (Slytherin team balls) from going into the
 goals but allow the red balls (Gryffindor team balls).
 
 (Player 2) Hermione's aim is to prevent the dementors from hitting Harry by shooting spells to push
 them up screen.
 
 Once Harry has lost all his life points the game is over the final scores are given.
 
 Keystrokes/Mouse:
 The'w' (up), 's' (down), 'a' (left) & 'd' (right) are used for first Player class
 (Harry) allowing it to move anywhere on the screen.
 
 LEFT and RIGHT cursor key used to move second Player class (Player 2) from left
 to right at the bottowm of the screen. Spacebar used to shoot slower blue spells
 and 'b' used to shoot faster red spells.
 
 Known bugs/problems:
 
 No known bugs.
 
 References:
 Any sources referred to during the development of the assignment (be precise and specific with references) {there no need to reference lecture/lab materials}:
 
 https://www.youtube.com/watch?v=yKv02lq7JHs
 https://fontswan.com/harry-potter-font/#google_vignette
 https://www.youtube.com/watch?v=cFT3-SG6fSg
 https://www.youtube.com/watch?v=cFT3-SG6fSg
 https://color.adobe.com/new-Harry-Potter-color-theme-10171239/
 */
import javax.swing.JOptionPane;

//classes
Scoreboard scoreboard;
GreenBall greenBall;
RedBall redBall;
Player player;
Spell spell;
Player2 player2;

//arrays classes
Goal [] goals = new Goal[3];
Dementor [] dementors = new Dementor[2];

//images
PImage playerImg;
PImage player2Img;
PImage pitch;
PImage dementorImg;
PImage griffLogo;
PImage slyLogo;
PImage spellImg;
PImage spell2;

//font
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
//for shooting spells
boolean shoot, bigShoot;
//boolean hitGreenGoal, hitRedGoal;
boolean greenGoal, redGoal;

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

  //overloading methods for different spells
  spell = new Spell (player2.getXCoord(), (player2.getYCoord()+(player2.getPlayer2Height()/2)), 100);
  spell = new Spell (player2.getXCoord(), (player2.getYCoord()+(player2.getPlayer2Height()/2)));

  if (shoot == true) { //spacebar pressed
    spell = new Spell (spell.getXCoord(), spell.getYCoord());
  }
  if (bigShoot == true) { //b pressed
    spell = new Spell (spell.getXCoord(), spell.getYCoord(), 200);
  }

  //while loop for array of goals
  //giving each goal a different position on yCord of screen
  int a = 0;
  while (a < goals.length)
  {
    goals[a] = new Goal((200*a)+100, 100);
    a++;
  }

  //do while loop for array of dementors
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
  spell2 = loadImage ("spell2.png");

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

//Collision detection for goals and greenBall
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

//Collision detection for goals and redBall
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

//Collision detection for player and greenBall
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

//Collision detection for player and redBall
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

//Collision detection for spell and dementors
boolean spellHitDementor (Spell spell, Dementor dementors)
{
  //These variables measure the magnitude of the gap between the goal and the ball.
  float spellDementorDistanceX = abs(spell.getXCoord() - dementors.getXCoord() - dementors.getDementorWidth()/2);
  float spellDementorDistanceY = abs(spell.getYCoord() - dementors.getYCoord());

  if (spellDementorDistanceX > (spell.getDiameter()/2)) {
    return false;
  }
  if (spellDementorDistanceY > (dementors.getDementorHeight()/2 + spell.getDiameter()/2)) {
    return false;
  }
  //A spell hit a dementor
  return true;
}

//Collision detection for player and dementor
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
/*
method with return value to get final score
 which is redScore (gryffindor) minus greenScore (slytherin)
 */
int getFinalScore (int red, int green)
{
  return red - green;
}

//method to restart the game
void reset () {
  setup();
  lives = 50;
  greenScore = 0;
  redScore = 0;
}

// Game over method to end the game when all lives are lost
//uses rest method to restart game
void gameOver () {
  if (lives == 0) {
    JOptionPane.showMessageDialog(null,
      "Dementors have taken all your energy! \n\n" 
      + "Lives: "  + lives,
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
  gameOver (); //method for when all lives are lost

  background(pitch);       //Clear the background, picture of pitch

  greenBall.update();
  greenBall.display();

  redBall.update();
  redBall.display();

  player.update();
  player.display();

  player2.update();
  player2.display();

  scoreboard.update();
  scoreboard.display();

  spell.update();
  spell.display();


  //display the array of 3 goals
  int g=0;
  do
  {
    goals[g].display();
    g++;
  }
  while (g < goals.length);

  /*
 if the redScore reaches  a specific number an array of dementors
   are displayed.
   Then as the redScore increases the array of
   dementors become faster.
   */
  if (redScore >= 5) {
    for (int i=0; i < dementors.length; i++) {
      dementors[i].display();
      dementors[i].update();
    }
    if (redScore >= 8) {
      int a=0;
      while (a < dementors.length) {
        dementors[a].update();
        a++;
        if (redScore >= 10) {
          for (int b=0; b< dementors.length; b++) {
            dementors[b].update();
          }
        }
      }
    }
  }


  /*
  when the greenBall (greenGoal) or redBall (redGoal) hit any of the goals
   (in the array of goals) the points will be added for said team
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


/* Reflection
 
 Name :           Kate Molony
 
 Student Number:  20104127
 
 Link to your development Blog on Blogger:
 https://katemol.blogspot.com/
 
 Link to Video on YouTube:
https://youtu.be/rppThgB1Qxg
 
 
 Part A - Mark (11 /11)
 -----------------------------
 
 Includsion of completed:
 - Readme             (1)
 - Reflection        (4)
 - Video                (4)
 - Blog                (2)
 
 These are all created to spec, so I am awarding myself 11 marks!
 
 
 Part B - Mark (4 /4)
 -----------------------------
 
 - Comments,
 - Indentation,
 - Naming,
 - Structure of code.
 
 I award myself 4 marks.
 
 
 Part C - Mark (5 /5)
 -----------------------------
 Use of standard programming control constructs
 (if, loop, nesting):
 
 * if statements
 
 Main Sketch:
 line 99 & 102 to check check if boolean variable is true
 line 137-146 are IF to check if multiple key have been pressed
 line 150-159 are IF to check multiple keys being released
 line 169 & 172 are IF to check if the boolean variable returns true of
 false for the distance of green ball to goal
 line 186 & 189 are IF to check if the boolean variable returns true of
 false for the distance of red ball to goal
 line 203, 206, 210, 213, 220 & 223 are IF inside boolean to validate whether the
 greenBall has hit the sides or corners of the player
 line 234, 237, 241, 244 & 251 are IF inside boolean to validate whether the
 redBall has hit the sides or corners of the player
 line 265 & 268 are IF inside boolean to validate whether the spell has
 hit the dementor or not
 
 There are many other uses of IF statements throughout the code (main sketch and classes),
 however I feel the amount I've shown are efficient to cover this score
 
 * Loops
 
 FOR loops used on:
 line 389 to display and update dementors array
 line 399 to repeat the display and update dementors array (making them faster)
 line 415 & 423 to check goals array to validate collision
 line 451 & 463 to check dementors array to validate collision
 
 WHILE loop
 line 109 to draw an array of goals
 line 395 to update and display dementors array (making them faster)
 
 DO While loops use on:
 line 117 to draw an array of dementor
 line 375 to draw display of array of goals
 
 NESTED loops used on:
 line 388-405 if for and while all nested in an IF statement which causes array of
 dementors to update (speed up) if scores for red team reach a certain point
 line 415 & 423 IF nested in for loops to check if array of goals were hit with ball
 line 451 & 453 IF nested in for loops to check if array of demoentors were hit
 with spell or player
 
 Scoreboard class:
 line 33 & 35 while nested in for to outline text
 line 54 and 55 to outline text
 line 72 and 73 to outline text
 
 Spell Class
 line 32 & 33 for nested in if to validate boolean statement and increase yCoord on spell
 line 44 & 45 for nested in if to validate boolean statement and increase yCoord on spell
 
 I have multiple examples of nesting, if statements and loops so 5/5
 
 Part D1 - Mark (9 /10)
 -----------------------------
 
 My game demonstrates use collision detection, is sized at 1280*720, has objects which are
 shoot, scoring live and the game resets correctly to play a new game (Score 6/10).
 Additionally my game has graphics, special font, shoots overloaded objects (i.e. 'spacebar'
 for shoot and 'b' for bigShoot).
 
 Overall I give myself a 9.
 
 Part D2 - Mark (8 /10)
 -----------------------------
 I have a key handler set up on line 137-140
 it handles:
 - left (a)
 - right(d)
 - up(w)
 - down(s)
 
 I also use the cursor keys to navigate
 left to right for player 2 line 142 & 143
 
 Additional keys include line 145 & 146
 - [space] to shoot a spell
 - b to shoor a big spell
 
 I have working key handler, cursor keys too, and an additional 2 key
 features so I am awarding 8/10.
 
 
 Part D3 - Mark (9 /10)
 -----------------------------
 Collision detection BESPOKE METHODS defined in main program file:
 
 hitGoalGreen() on line 163
 to detect collision between greenBall and array of goals
 Called on line 146
 
 hitGoalRed() on line 180
 to detect collision between redBall and array of goals
 Called on line 424
 
 hitPlayerGreen() on line 197
 to detect collision between greenBall and player
 Called on line 436
 
 hitPlayerRed() on line 228
 to detect collision between redBall and player
 Called on line 441
 
 spellHitDementor() on line 259
 to detect collision between spells and array of dementors
 Called on line 452
 
 dementorHitplayer() on line 276
 to detect collision between player and array of dementors
 Called on line 464
 
 I have the basic collision detection between 2 objects.
 As some of my detections are very similar (e.g. hitGoalRed() and hitGoalGreen())
 I have not given myself extras marks.
 I am also checking edge conditions. I have 2 other collision detections
 both which are with arrays of objects therefor I am giving myself an extra mark.
 
 Overall, I am scoring myself 9/10
 
 -----------------------------
 Part E USER DEFINED CLASSES
 -----------------------------
 
 Part E1 - Mark (10 /10)
 -----------------------------
 Excluding the player class and the main program, I have 6 other classes defined in their own files/tabs:
 
 1- Dementor
 2- Goal
 3- GreenBall/RedBall (seperate classes but similar)
 4- Player2
 5- Scoreboard
 6- Spell
 
 Each of these user-defined classes has appropriate fields, constructors, getters, setters. These are highlighted as follows:
 
 1.Dementor CLASS
 Fields begin line: 4
 Constructors begin line: 12
 Getters begin line: 65
 Setters begin line: 47
 Bespoke methods begin line: 88
 
 2.Goal CLASS
 Fields begin line: 3
 Constructors begin line: 11
 Getters begin line: 37
 Setters begin line: 60
 
 3.GreenBall CLASS
 Fields begin line: 3
 Constructors begin line: 10
 Getters begin line: 47
 Setters begin line: 63
 Bespoke methods begin line: 74
 
 4.Player2 CLASS
 Fields begin line: 3
 Constructors begin line: 10
 Getters begin line: 70
 Setters begin line: 52
 Bespoke methods begin line: 88
 
 5.RedBall CLASS
 Fields begin line: 3
 Constructors begin line: 10
 Getters begin line: 49
 Setters begin line: 65
 Bespoke methods begin line: 75
 
 6.Scoreboard CLASS
 Constructors begin line: 4
 Bespoke methods begin line: 24
 
 7.Spell CLASS
 Fields begin line: 3
 OVERLOADED Constructors: 10, 19
 Getters begin line: 71
 Setters begin line: 60
 Bespoke methods begin line: 85
 
 I have documented 7 classes and they include overloaded constructors therefore I am scoring 10/10
 
 
 Part E2 - Mark (4 /10)
 -----------------------------
 
 Class bespoke methods i.e. private helper methods:
 
 I have private helper methods in 6 classes
 
 1. Dementor Class
 
 line 88 takes in 0 parameters and returns NO value
 line 97 takes in 0 parameters and returns NO value
 
 2. GreenBall Class
 
 line 74 takes in 0 parameters and returns NO value
 line 81 takes in 0 parameters and returns NO value
 
 3. Player2 Class
 
 line 88 takes in 0 parameters and returns NO value
 
 4. RedBall Class
 
 line 75 takes in 0 parameters and returns NO value
 line 82 takes in 0 parameters and returns NO value
 
 5. Scoreboard Class
 
 line 24 takes in 0 parameters and returns NO value
 line 45 takes in 0 parameters and returns NO value
 line 64 takes in 0 parameters and returns NO value
 
 6. Spell Class
 
 line 85 takes in 0 parameters and returns NO value
 line 90 takes in 0 parameters and returns NO value
 line 93 takes in 0 parameters and returns NO value
 
 7.  Main Sketch
 line 296 takes in 2 parameters and returns a value
 //however this is not counted as is in the main sketch!
 
 
 Private help methods for 6 classes are highlighted showing multiple examples of Methods
 with no return values. I am awarding myself 4/10
 
 
 Part E3 - Mark (10 /10)
 -----------------------------
 
 - The user-defined class(es) are USED in an appropriate manner
 
Declaration:
 multiple declarations of user defined classes are USED:
 Scoreboard line 42, to declare scoreboard
 GreenBall line 43, to declare greenBall
 RedBall line 44, to declare redBall
 Player line 45, to declare player
 Spell line 46, to declare spell
 Player2 line 47, to declare player2
 
 Arrays of Classes
 Goal line 50, to declare goals array and inistialise array of 3 Goal
 Dementor line 51, to declare array of dementors and initialise array of 2
 
Initialisation:
 Scoreboard line 93, to initialise new scoreboard object and call to constructor
 GreenBall line 89, to initialise new greenBall object and call to constructor
 RedBall line 90, to initialise new redBall object call to constructor
 Player line 91, to initialise new player object call to constructor
 Player2 line 92, to initialise new player2 object call to constructor
 
 Goal line 111 to initialise new array of goals
 Dementor line 118 to initialise new array of dementors
 
 Spell line 96, to initialise new spell object and call to constructor
 Spell line 97, to initialise new spell object and call to overloaded constructor
 
 Getters/setters are USED on...
Player line 96 & 97 to get x and y coordinates for the Spell class to use
Player line 200, 201, 203, 206, 210, 213, 217, 218, 231, 232, 234, 237, 241, 244,
248, 249, 297, 280, 282, 285
Spell line 100, 103, 262, 263, 265, 268
GreenBall line 166, 167, 169, 172, 200, 201, 203, 206, 220
Goal line 166, 167, 172, 183, 184, 189
Dementor line 263, 263, 279, 280, 282, 285
 
 overloaded constructors USED on lines...
 Spell line 100 and 103
 
I have Declaration of variable names with an object types. Initialisation of new object and
calls to constructors. I have called to the getters & setters, calling to an overloaded
constructor and two examples using array variables. 

Overall I give myself 10/10.
 
 ------------------------
 PART F - DATA STRUCTURES
 ------------------------
 
 Part F1 - Mark (6 /10)
 -----------------------------
 - Use of a data structure to store information i.e. array
 
 I have 2 arrays of any non-primitive (i.e. object) type with a fixed size, 
 values computed
 
Goal
 declared on line 50
 initialized on line 111
 used on line 377
 
 Dementors
  declared on line 51
 initialized on line 118
 used on line 390, 391, 396, 400, 455, 469
 
 Overall I give myself a 6/10 as there is no user input in my array but an extra
 point for having 2 array examples.
 
 Part F2 - Mark (7 /10)
 -----------------------------
 - Calculations performed on the information stored
 
 Dementor line 389, 396, 400 

line 395, 399 speed of dementors in the array is updated using a
loop, and using .length value. 
line 451 dementors are checked for collision detection with spell 
if deteceted the dementor are moved up the screen.
line 463 dementors are checked for collision detection with player 
if deteceted the dementor resets.
 
I've shown examples of an e lement in the array being checked as part of a loop 
using .length. Each value is compared to some collision/dectection criteria and 
value of the array element are updated.

Overall, I give myself a 7/10.
 
 
 FINAL CHECK:
 I have checked the constraints and I am not breaking any constraints
 
 Final score: 83
 
 *Intermediate games effectively marked out of 90
 
 Total Mark: 83 *.9 = 74.7
 
 */
