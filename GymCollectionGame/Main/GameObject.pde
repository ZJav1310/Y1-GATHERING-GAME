public abstract class GameObject {

  public int x;
  public int y;

  private int counter;
  private PImage[] idleImages;

  public GameObject(int x, int y, PImage[] idleImages) {
    this.x = x; 
    this.y = y;
    this.idleImages = idleImages;
  }

  public void update() {
    render();
    move();
  }
  public void move() {
  }

  public void render() { // Something something triple buffering hacky thingy 
    singleRender();
    singleRender();
  }
  public void singleRender() {
    if (counter < 24) {
      image(idleImages[0], x, y);
    } else if (counter < 48) {
      image(idleImages[1], x, y);
    } else {
      counter = 0;
    }
    counter++;
  }

  //Detect if objects intersect
  public abstract void onCollision();

  public boolean isColliding(GameObject other) {
    if (this.x < other.x + 48 &&
      this.x + 48 > other.x &&
      this.y < other.y + 48 &&
      this.y + 48 > other.y)
    {
      return true;
    }
    return false;
  }
}
