public class Chaser extends NPC {

  private boolean hasCollided;
  private boolean isInstaDeath;
  private boolean isSuperSaiyan;
  private int lastMoveTime;
  
  public Chaser(int x, int y) {
    super(x, y, new PImage[]{loadImage("Chaser1.png"), loadImage("Chaser2.png")});
    hasCollided = false;
    lastMoveTime = millis();
  }

  public void doSomething() {
    if (millis() > lastMoveTime + 100) // change this 100 to something else if faster/slower movement is wanted
    {
      println("Moving Chaser!");
      int randomAction = (int) random(0, 10);

      if (randomAction < 3)
      {
        double randomX = random(-10, 10);
        double randomY = random(-10, 10);
        if (randomY > 0)
        {
          if (this.y < height - 60)
          {
            this.y += randomY;
          }
        } else if (randomY < 0)
        {
          if (this.y > 0 + 10)
          {
            this.y += randomY;
          }
        }

        if (randomX > 0)
        {
          if (this.x < width - 60)
          {
            this.x += randomX;
          }
        } else if (randomX < 0)
        {
          if (this.x > 0 + 10)
          {
            this.x += randomX;
          }
        }
      } else
      {
        if (keyCode == UP && this.y > 0 + 5)
          this.y -= 5;
        else if (keyCode == DOWN && this.y < height - 60)
          this.y += 5;
        else if (keyCode == LEFT && this.x > 0)
          this.x -= 5;
        else if (keyCode == RIGHT && this.x < width - 60)
          this.x += 5;
      }
      this.lastMoveTime = millis();
    }
  }
  public void onCollision() {
    if (this.isArmed())
    {
      println("POWER THROUGH CHAOS MY BROTHER");
      hasCollided = true;
      isInstaDeath = true;
      isSuperSaiyan = false;
    }
  }

  public boolean hasCollided() {
    return hasCollided;
  }
  public boolean isInstaDeath() {
    return isInstaDeath;
  }
  public boolean isSuperSaiyan() {
    return isSuperSaiyan;
  }
}
