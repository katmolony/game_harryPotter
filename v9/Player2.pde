public class Player2
{
  private int xCoord;        // X coordinate of the player
  private int yCoord;        // Y coordinate of the player
  private int player2Width;   // width of the player
  private int player2Height;  // height of the player

  private float speedX;     //speed along the x-axis
  private float speedY;     //speed along the y-axis


  ////// consturtors ///////

  public Player2(int player2Width, int player2Height)
  {
    setPlayer2Width(player2Width);
    setPlayer2Height(player2Height);

    // this defines the start position of the player
    // the xCoordinate variable is set here
    xCoord = width/2;

    // the yCoordinate variable is set here and changes
    // later in the program as the mouse moves on the
    // vertical plane.
    yCoord = height-player2Height;
  }

  //this is where you can change the colour
  public void display() {
    fill(184, 67, 58); //Gryffindor Red
    stroke(60);
    rect(xCoord, yCoord, player2Width, player2Height);
    line (xCoord, (yCoord+(player2Height/2)), mouseX, mouseY); //aim for wand
 
  }


  //may make this to key pressed for changing position
  // i think this will have to be fully changed
  //to the youtube vid on key events
  public void update()
  {
    xCoord = pmouseX;

    //Reset yCoord if its outside the window coordinates.
    if (yCoord < 0) {
      yCoord = 0;
    }
    if (yCoord > (height - player2Height)) {
      yCoord = height - player2Height;
    }
    //Reset xCoord if its outside the window coordinates.
    if (xCoord < 0) {
      xCoord = 0;
    }
    if (xCoord > width - player2Width) {
      xCoord = width - player2Width;
    }
  }



  ////// setters ///////

  // change the shape of the player here width
  public void setPlayer2Width(int playerWidth) {
    //The player width must be between 10 and
    //width/2 (inclusive)
    if ((player2Width >= 50) && (player2Width <= width/2)) {
      this.player2Width = player2Width;
    } else {
      // If an invalid width is passed as a parameter, a default
      // width of 20 is imposed.  With this animation, if we do
      // not supply a default value for the width, a player
      //may not be drawn on the display window.  Important
      // note: it is not always appropriate to provide a default
      // value at setter level; this will depend on your
      //design.
      this.player2Width = 50;
    }
  }

  //change the shape of the player here height
  public void setPlayer2Height(int playerHeight) {
    //The player height must be between 50
    //and height/2 (inclusive)
    if ((player2Height >= 50) && (player2Height <= height/2)) {
      this.player2Height = player2Height;
    } else {
      // If an invalid height is passed as a parameter, a default
      // height of 50 is imposed.  With this animation, if we do
      // not supply a default value for the height, a player
      // may not be drawn on the display window.  Important
      // note: it is not always appropriate to provide a default
      // value at setter level; this will depend on your design.
      this.player2Height = 50;
    }
  }


  ////// getters ///////
  public int getXCoord() {
    return xCoord;
  }

  public int getYCoord() {
    return yCoord;
  }

  public int getPlayer2Width() {
    return player2Width;
  }

  public int getPlayer2Height() {
    return player2Height;
  }
}
