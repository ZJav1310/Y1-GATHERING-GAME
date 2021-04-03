public class GymBro extends NPC {

  private boolean isInstaDeath;
  private boolean hasCollided;
  private boolean isSuperSaiyan;
  private int lastMoveTime;

  GymBro(int x, int y) {
    super(x, y, new PImage[] {loadImage("GymBro1.png"), loadImage("GymBro2.png")});
    hasCollided = false;
    lastMoveTime = millis();
  }

  public void doSomething() {
    if (millis() > lastMoveTime + 500) // change this 500 to something else if faster/slower movement is wanted
    {
      println("Moving GymBro!");
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
      this.lastMoveTime = millis();
    }
  }
  public void onCollision() {
    if (this.isArmed())
    {
      println("DEATH IS THE ONLY SALVATION");
      hasCollided = true;
      isInstaDeath = false;
      isSuperSaiyan = true;
      System.out.println( "saiyan roar");
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
