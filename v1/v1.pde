void setup () {
  //setup using rules set by assignment
  size (1280, 720);
  surface.setTitle("20104127 Kate Molony Assignment 2");
  noCursor();
   surface.setLocation(100, 50); // sets location of the display window
  //setting up the ball with hard-coded sizes.
  greenBall = new GreenBall(20.0);
  redBall = new RedBall(20.0);
 
}

GreenBall greenBall;
RedBall redBall;



void draw()
{
  background(0);       //Clear the background

  //Update the ball position and display.
  greenBall.update();
  greenBall.display();

  redBall.update();
  redBall.display();

  // this will be for when a score bopard is added 
//scoreboard.update();
//scoreboard.display();

}
