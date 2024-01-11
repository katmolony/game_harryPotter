public class Player2
{
  private int xCoord;        // X coordinate of the player
  private int yCoord;        // Y coordinate of the player
  private int player2Width;   // width of the player
  private int player2Height;  // height of the player


  //consturtors
  public Player2(int player2Width, int player2Height)
  {
    setPlayer2Width(player2Width);
    setPlayer2Height(player2Height);

    xCoord = width/2;
    yCoord = height-player2Height; //stays at the bottom of screen
  }

  public void display() {
    stroke (0);
    line (xCoord, (yCoord+(player2Height/2)), xCoord, (yCoord+(player2Height/2))-50); //aim for wand
    drawPlayer2 ();
  }

  public void update()
  {
    // the movement controllers for the player
    if (left2 == true) {  //left
      xCoord -= 5;
    }
    if (right2 == true) {  //right
      xCoord += 5;
    }

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

  // setters

  public void setPlayer2Width(int player2Width) {
    if ((player2Width >= 50) && (player2Width <= width/2)) {
      this.player2Width = player2Width;
    } else {
      this.player2Width = 60;
    }
  }

  public void setPlayer2Height(int player2Height) {
    if ((player2Height >= 50) && (player2Height <= height/2)) {
      this.player2Height = player2Height;
    } else {
      this.player2Height = 80;
    }
  }


  // getters
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

  //bespoke methods
  //private helper methods
  private void drawPlayer2 () {
    image(player2Img, xCoord, yCoord, player2Width, player2Height);
  }
}
