public class Player extends GameObject {

  private PImage[] downSprites, upSprites;
  private int counter;

  public Player (int x, int y) {
    super(x, y, new PImage[] { loadImage("idle1.png"), loadImage("idle2.png") });
    downSprites = new PImage[] { loadImage("forward1.png"), loadImage("forward2.png") };
    upSprites = new PImage[] {loadImage("back1.png"), loadImage("back2.png")};
    counter = 0;
  }

  public void update() {
  }

  public void processKeypress() {
    if (keyCode == UP && this.y > 0 + 5)
      this.y -= 5;
    else if (keyCode == DOWN && this.y < height - 60)
      this.y += 5;
    else if (keyCode == LEFT && this.x > 0)
      this.x -= 5;
    else if (keyCode == RIGHT && this.x < width - 60)
      this.x += 5;
  }

  @Override
    public void singleRender() {
    if (key == CODED) {
      PImage[] spritesToUse = downSprites;
      if (keyCode == UP) {
        spritesToUse = upSprites;
      }
      println("rendering back sprite");
      if (counter < 24) {
        image(spritesToUse[0], x, y);
      } else if (counter < 48) {
        image(spritesToUse[1], x, y);
      } else {
        counter = 0;
      }
      counter++;
    } else
    {
      println("render normally");
      super.singleRender();
    }
  }

  public void onCollision() {
  }

  // TODO need to add actual sprites to Player
}
