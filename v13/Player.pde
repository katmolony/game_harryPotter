public class Player
{
  private int xCoord;        // X coordinate of the player
  private int yCoord;        // Y coordinate of the player
  private int playerWidth;   // width of the player
  private int playerHeight;  // height of the player


  // consturtors
  public Player(int playerWidth, int playerHeight)
  {
    setPlayerWidth(playerWidth);
    setPlayerHeight(playerHeight);

    //starting position in middle of screen
    xCoord = width/2;
    yCoord = height/2;
  }

  public void display() {
    drawPlayer();
  }

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


  //setters
  public void setPlayerWidth(int playerWidth) {
    if ((playerWidth >= 50) && (playerWidth <= width/2)) {
      this.playerWidth = playerWidth;
    } else {
      this.playerWidth = 90;
    }
  }

  public void setPlayerHeight(int playerHeight) {
    if ((playerHeight >= 50) && (playerHeight <= height/2)) {
      this.playerHeight = playerHeight;
    } else {
      this.playerHeight = 50;
    }
  }

  // getters
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

  //private helper methods
  private void drawPlayer() {
    image(playerImg, xCoord, yCoord, playerWidth, playerHeight);
  }
}
