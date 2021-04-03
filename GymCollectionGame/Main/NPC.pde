public abstract class NPC extends GameObject {
  
  private int armingTime;
  public NPC(int x, int y, PImage[] images) {
    super(x, y, images);
    this.armingTime = millis() + 2000;
  }
  
  public int getArmingTime() {
    return armingTime;
  }
  
  public boolean isArmed() {
    return millis() > armingTime;
  }
  
  public abstract void doSomething();
  public abstract boolean hasCollided();
  public abstract boolean isInstaDeath();
  public abstract boolean isSuperSaiyan();
}
