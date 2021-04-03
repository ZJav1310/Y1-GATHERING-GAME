class WaterBottle extends GameObject implements Collectable {

  private boolean hasCollided;

  public WaterBottle(int x, int y) {
    super(x, y, new PImage[]{ loadImage("waterbottle1.png"), loadImage("waterbottle2.png") });
    hasCollided = false;
  }

  int getXpGiven() {
    return 10;
  }

  public void onCollision() {
    println("I BE WATER I GOOD FOR U");
    hasCollided = true;
  }

  public boolean hasCollided() {
    return hasCollided;
  }
}
