public class Cranberry extends GameObject implements Collectable {

  private boolean hasCollided;

  public Cranberry(int x, int y) {
    super(x, y, new PImage[]{ loadImage("cranberry1.png"), loadImage("cranberry2.png")});
  }

  int getXpGiven() {
    return 20;
  }

  public void onCollision() {
    println("I BE FAKE COCA COLA I ALSO HAVE MANY SUGAR");
    hasCollided = true;
  }

  public boolean hasCollided() {
    return hasCollided;
  }
}
