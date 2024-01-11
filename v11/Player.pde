public class Player
{
  private int xCoord;        // X coordinate of the player
  private int yCoord;        // Y coordinate of the player
  private int playerWidth;   // width of the player
  private int playerHeight;  // height of the player

  private float speedX;     //speed along the x-axis
  private float speedY;     //speed along the y-axis


  ////// consturtors ///////

  // this will have to be fully changed
  // the xCord will be differnet as we will have the charater move
  public Player(int playerWidth, int playerHeight)
  {
    setPlayerWidth(playerWidth);
    setPlayerHeight(playerHeight);

    // this defines the start position of the player
    // the xCoordinate variable is set here
    xCoord = width/2;

    // the yCoordinate variable is set here and changes
    // later in the program as the mouse moves on the
    // vertical plane.
    yCoord = height/2;
  }

  //this is where you can change the colour
  public void display() {
    fill(184, 67, 58); //Gryffindor Red
    stroke(60);
    image(playerImg, xCoord, yCoord, playerWidth, playerHeight);
    //  line (xCoord,(yCoord+(playerHeight/2)),mouseX,mouseY); //aim for wand
    //  spell (xCoord,(yCoord+(playerHeight/2)));
  }

  //may make this to key pressed for changing position
  // i think this will have to be fully changed
  //to the youtube vid on key events
  public void update()
  {

    //Reset yCoord if its outside the window coordinates.
    if (yCoord < 0) {
      yCoord = 0;
    }
    if (yCoord > (height - playerHeight)) {
      yCoord = height - playerHeight;
    }
    //Reset xCoord if its outside the window coordinates.
    if (xCoord < 0) {
      xCoord = 0;
    }
    if (xCoord > width - playerWidth) {
      xCoord = width - playerWidth;
    }

    // the movement controllers for the player
    if (left == true) {  //left
      xCoord -= 5;
    }
    if (right == true) {  //right
      xCoord += 5;
    }
    if (up == true) {  //up
      yCoord -= 5;
    }
    if (down == true) {  //down
      yCoord += 5;
    }
  }




  ////// setters ///////

  // change the shape of the player here width
  public void setPlayerWidth(int playerWidth) {
    //The player width must be between 10 and
    //width/2 (inclusive)
    if ((playerWidth >= 50) && (playerWidth <= width/2)) {
      this.playerWidth = playerWidth;
    } else {
      // If an invalid width is passed as a parameter, a default
      // width of 20 is imposed.  With this animation, if we do
      // not supply a default value for the width, a player
      //may not be drawn on the display window.  Important
      // note: it is not always appropriate to provide a default
      // value at setter level; this will depend on your
      //design.
      this.playerWidth = 90;
    }
  }

  //change the shape of the player here height
  public void setPlayerHeight(int playerHeight) {
    //The player height must be between 50
    //and height/2 (inclusive)
    if ((playerHeight >= 50) && (playerHeight <= height/2)) {
      this.playerHeight = playerHeight;
    } else {
      // If an invalid height is passed as a parameter, a default
      // height of 50 is imposed.  With this animation, if we do
      // not supply a default value for the height, a player
      // may not be drawn on the display window.  Important
      // note: it is not always appropriate to provide a default
      // value at setter level; this will depend on your design.
      this.playerHeight = 50;
    }
  }


  ////// getters ///////
  public int getXCoord() {
    return xCoord;
  }

  public int getYCoord() {
    return yCoord;
  }

  public int getPlayerWidth() {
    return playerWidth;
  }

  public int getPlayerHeight() {
    return playerHeight;
  }
}
