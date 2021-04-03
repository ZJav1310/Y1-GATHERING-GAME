public class Timer {

  private int startTime;
  private int duration;

  public Timer(int duration) {
    this.duration = duration;
  }

  // Starting the timer
  public void start() {
    startTime = millis();
    println("timer has started" + startTime);
  }

  public int getRemainingTime() {
    return max(0, (this.getTargetTime() - millis())/1000);
  }
  
  public int getElapsedTime() {
    return millis()- startTime;
  }
  
  public int getTargetTime() {
    return duration + startTime;
  }
  


  public boolean isFinished() { 
    // Check how much time has passed
    if (millis() > this.getTargetTime()) {
      println("Timer done");
      return true;
    } else {
      println("Timer still running - " + millis() + " | START: " + startTime + " | TARGET: " + this.getTargetTime());
      return false;
    }
  }
}
