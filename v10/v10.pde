/*
Name :             Kate Molony
 Student Number:    20104127
 
 Brief description of the game developed 1/2 sentences:
 
 Keystrokes/Mouse: BRIEF PLEASE
 
 Known bugs/problems:
 
 References:
 Any sources referred to during the development of the assignment (be precise and specific with references) {there no need to reference lecture/lab materials}:
 
 */

Scoreboard scoreboard;
GreenBall greenBall;
RedBall redBall;
Player player;
Goal goal;
Spell spell;
Player2 player2;
Goal [] goals;
Dementor [] dementors = new Dementor[2];

PImage playerImg;
PImage player2Img;
PImage pitch;
PImage dementorImg;
PImage griffLogo;
PImage slyLogo;

PFont potter;

int lives = 100;
int greenScore = 0;
int redScore = 0;

public int xCoordSpell;
public int yCoordSpell;

//for movement control of player
boolean up, down, left, right;

boolean shoot; //for shooting spells

void setup () {
  //setup using rules set by assignment
  size (1280, 720);
  surface.setTitle("20104127 Kate Molony Assignment 2");
  noCursor();
  surface.setLocation(100, 50); // sets location of the display window

  //setting up the ball with hard-coded sizes.
  greenBall = new GreenBall(20.0);
  redBall = new RedBall(20.0);
  player = new Player (20, 100);
  player2 = new Player2 (40, 40);

  goal = new Goal (60, 100);

  goals = new Goal[3];
  for (int i = 1; i <= goals.length; i++) {
    goals[i-1] = new Goal((((height/3)/2)*(i)), (50*i));
  }
  scoreboard = new Scoreboard ();
  spell = new Spell (player2.getXCoord(), (player2.getYCoord()+(player2.getPlayer2Height()/2)));

  for (int j = 0; j < dementors.length; j++) {
    dementors[j] = new Dementor(60);
  }

  playerImg = loadImage("player.png");
  player2Img = loadImage("player2Img.png");
  pitch = loadImage("pitch.png");
  dementorImg = loadImage("dementorImg.png");
  slyLogo =loadImage("slyLogo.png");
  griffLogo = loadImage ("griffLogo.png");

  potter = createFont("HarryP.ttf", 60);
}



//maybe make this a method
// using keyPressed and keyReleased allows
// for 2 variable being pressed at the same time to be true
// as key can't have two values
public void keyPressed () {
  if (key == 'a') left = true;
  if (key == 'd') right = true;
  if (key == 'w') up = true;
  if (key == 's') down = true;

  if (key == ' ') shoot = true;
}

public void keyReleased () {
  if (key == 'a') left = false;
  if (key == 'd') right = false;
  if (key == 'w') up = false;
  if (key == 's') down = false;

  if (key == ' ') shoot = false;
}

boolean hitGoalGreen (Goal goal, GreenBall greenBall)
{
  //These variables measure the magnitude of the gap between the goal and the ball.
  float circleGoalGreenDistanceX = abs(greenBall.getXCoord() - goal.getXCoord());
  float circleGoalGreenDistanceY = abs(greenBall.getYCoord() - goal.getYCoord() - goal.getGoalHeight()/2);

  if (circleGoalGreenDistanceX > (greenBall.getDiameter()/2)) {
    return false;
  }
  if (circleGoalGreenDistanceY > (goal.getGoalHeight()/2 + greenBall.getDiameter()/2)) {
    return false;
  }
  //We have a score for Green
  return true;
}

boolean hitGoalRed (Goal goal, RedBall redBall)
{
  //These variables measure the magnitude of the gap between the goal and the ball.
  float circleGoalRedDistanceX = abs(redBall.getXCoordRed() - goal.getXCoord());
  float circleGoalRedDistanceY = abs(redBall.getYCoordRed() - goal.getYCoord() - goal.getGoalHeight()/2);

  if (circleGoalRedDistanceX > (redBall.getDiameterRed()/2)) {
    return false;
  }
  if (circleGoalRedDistanceY > (goal.getGoalHeight()/2 + redBall.getDiameterRed()/2)) {
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
  float spellDementorDistanceX = abs(spell.getXCoord() - dementors.getXCoord());
  float spellDementorDistanceY = abs(spell.getYCoord() - dementors.getYCoord() - dementors.getDementorHeight()/2);

  if (spellDementorDistanceX > (spell.getDiameter()/2)) {
    return false;
  }
  if (spellDementorDistanceY > (dementors.getDementorHeight()/2 + spell.getDiameter()/2)) {
    return false;
  }
  //A spell hit a dementor
  return true;
}



void draw()
{
  background(pitch);       //Clear the background, pictch of pitch

  //Update the ball position and display.
  greenBall.update();
  greenBall.display();

  redBall.update();
  redBall.display();

  player.update();     //Update the player location in line with the cursor
  player.display();    //Draw the player in this new location

  player2.update();     //Update the player location in line with the cursor
  player2.display();    //Draw the player in this new location

  for (int i=0; i < goals.length; i++) {
    goals[i].display();
  }

  // this will be for when a score board is added
  scoreboard.update();
  scoreboard.display();

  spell.update();
  spell.display();

  for (int i=0; i < dementors.length; i++) {
    dementors[i].display();
    dementors[i].update();
  }

  //collision of player with green ball
  boolean greenCollision = hitPlayerGreen(player, greenBall);
  if (greenCollision == true) {
    greenBall.greenhit();        //the ball is hit i.e. reverses direction.
  }
  //collision of player with red ball
  boolean redCollision = hitPlayerRed(player, redBall);
  if (redCollision == true) {
    redBall.redhit();        //the ball is hit i.e. reverses direction.
  }

  for (int i =0; i<2; i++) {
    boolean hitDementor = spellHitDementor (spell, dementors[i]);
    if (hitDementor == true)
    {
      dementors[i].yCoord = dementors[i].yCoord-50;
    }
  }
}

/* Reflection
 
 Name :           Kate Molony
 
 Student Number:  20104127
 
 Link to your development Blog on Blogger:
 e.g. https://setu-hdipcs-2023-a2.blogspot.com/
 
 Link to Video on YouTube:
 e.g. https://youtu.be/DvnEIN8FIgA
 
 
 Part A - Mark (X /11)
 -----------------------------
 
 Includsion of completed:
 - Readme             (1)
 - Reflection        (4)
 - Video                (4)
 - Blog                (2)
 
 These are all created to spec, so I am awarding myself 11 marks update X above!
 
 
 Part B - Mark (X /4)
 -----------------------------
 
 - Comments,
 - Indentation,
 - Naming,
 - Structure of code.
 
 <just a mark needed here>
 
 
 Part C - Mark (X /5)
 -----------------------------
 Use of standard programming control constructs
 (if, loop, nesting):
 
 * if statements
 
 line 10 is an IF to validate ...
 line 20 is an IF to check ...
 line 24 is an IF with multiple branches for determing which key was pressed
 
 * Loops
 
 FOR loops used on:
 line 43 to draw aliens
 line 70 to draw bonus pickups
 
 DO While loops use on:
 line 90 to keep the program going (resetting)
 line 108 to draw the fleet
 
 FOR EACH loops used on:
 line 99 to draw fleet
 
 NESTED loops used on:
 line 183 is the outer loop to draw aliens
 line 185 to the inner nested loop draw fleet
 
 line 193 is the outer loop to draw baddies
 line 195 to the inner nested loop draw baddies
 
 I have multiple examples of nesting, if statements and loops so 5/5 ** update X above!
 
 Part D1 - Mark (x /10)
 -----------------------------
 
 My game demonstrates use collision detection, scoring, live and the game resets correctly to play a new game.
 Therefore I score 6/10
 
 
 Part D2 - Mark (x /10)
 -----------------------------
 I have a key handler set up on line 99
 it handles:
 - left (A)
 - right(D)
 - up(w)
 - down(x)
 
 - It also handles the cursor keys to navigate
 
 Additional keys include
 - [space] to fire bullet
 - b to launch bomb
 - m to launch missile
 - s to turn on shield
 
 I have working key handler, cursor keys too, and an additional 4 key features so I am awarding 10/10 UPDATE X ABOVE!
 
 
 Part D3 - Mark (x /10)
 -----------------------------
 Collision detection BESPOKE METHODS defined in main program file:
 
 Method0() on line x to detect collision between ship and alien. Called on line ...
 
 --
 
 Method1() on line x to detect edge conditions. Called on line ...
 
 ---
 
 Method2() on line y to detect collision between bullet and alien. Called on line ...
 
 Method3() on line z to to detect collision between bomb and alien. Called on line ...
 
 Method4() on line z to to detect collision between alienBomb and ship. Called on line ...
 
 Method5() on line z to to detect collision between  ship and shield. Called on line ...
 
 I have the basic collision detection between 2 objects
 I am also checking edge conditions, and I have 4 other collision detections therefor I am scoring myself 10/10
 UPDATE X ABOVE!
 
 
 -----------------------------
 Part E USER DEFINED CLASSES
 -----------------------------
 
 Part E1 - Mark (x /10)
 -----------------------------
 Excluding the player class and the main program, I have 3 other classes defined in their own files/tabs:
 
 1- Scoreboard
 2- Bomb
 3- Bullet
 
 Each of these user-defined classes has appropriate fields, constructors, getters, setters. These are highlighted as follows:
 
 1.Scoreboard CLASS
 Fields begin line: 8
 Constructors begin line: 13
 Getters begin line: 36
 Setters begin line: 65
 Bespoke methods begin line: 21
 
 2.Bomb CLASS
 Fields begin line: 8
 Constructors begin line: 15
 Getters begin line: 51
 Setters begin line: 77
 Bespoke methods begin line: 25
 
 3.Bullet CLASS
 Fields begin line: 8
 OVERLOADED Constructors: 16, 23, 31
 Getters begin line: 66
 Setters begin line: 91
 Bespoke methods begin line: 39
 
 ...
 
 I have documented 3 classes and they include overloaded constructors therefore I am scoring 7/10
 UPDATE X ABOVE!
 
 
 
 Part E2 - Mark (x /10)
 -----------------------------
 
 Class bespoke methods i.e. private helper methods:
 
 I have private helper methods in 3 classes
 
 1. Scoreboard Class
 
 line 5 takes in 2 parameters and returns a value
 line 20 takes in 3 parameters and returns a value
 line 55 takes in 0 parameters and returns NO value
 
 2. Bomb Class
 
 line 5 takes in 2 parameters and returns a value
 line 15 takes in 3 parameters and returns a value. OVERLOADING the first method
 
 3. Bullet Class
 
 line 5 takes in 2 parameters and returns a value
 line 15 takes in 3 parameters and returns a value. OVERLOADING the first method
 
 Private help methods for 3 classes are highlighted showing multiple examples of Methods with no return values, return values, parameters, and overloading. I am awarding myself 10/10
 UPDATE X ABOVE!
 
 
 Part E3 - Mark (x /10)
 -----------------------------
 
 - The user-defined class(es) are USED in an appropriate manner
 
 multiple declarations of user defined classes are USED:
 [TABName]line x, to declare ...
 [TABName]line y, to declare ...
 
 [TABName]line x, to initialise ...
 [TABName]line y, to initialise ...
 
 getters/setters are USED on...
 [TABName]line y,
 ...
 
 default constructors USED on lines...
 [TABName]line y,
 
 overloaded constructors USED on lines...
 [TABName]line y,
 
 
 <<Summarise, and mark according to marking scheme>>
 
 ------------------------
 PART F - DATA STRUCTURES
 ------------------------
 
 Part F1 - Mark (x /10)
 -----------------------------
 - Use of a data structure to store information i.e. array
 
 <<use [TABName]line y to be specific>>
 
 declared on line...to ...
 initialized on line...
 used on line...
 ...
 
 Part F2 - Mark (x /10)
 -----------------------------
 - Calculations performed on the information stored
 
 <<use [TABName]line y to be specific>>
 
 line X
 ...
 
 
 TOTAL MARK = REPLACE THIS TEXT WITH YOUR TOTAL
 
 
 FINAL CHECK:
 I have checked the constraints (and I am not breaking any constraints)
 
 remove brackets and this text when check is complete
 failing to do so will result in loss of marks
 
 */
