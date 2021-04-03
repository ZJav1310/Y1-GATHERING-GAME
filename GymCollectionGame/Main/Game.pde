import java.util.*;

public class Game {
  public Timer timer;
  public List<Collectable> collectablesList;
  public List<NPC> characterList;
  public Player playerCharacter;
  public int points, maxWaterBottles, maxCranberryJuice;
  private boolean gameStarted;
  private boolean gameEnded;
  private GameEndState endState;

  public Game(int waterBottlesCount, int cranberryJuiceCount, int gymBroCount, int chaserCount) {

    collectablesList = new ArrayList<Collectable>();
    characterList = new ArrayList<NPC>();
    points = 0;

    timer = new Timer(60000);

    // Spawn
    for (int i = 0; i < waterBottlesCount; i++)
    {
      collectablesList.add(new WaterBottle((int)random(760), (int)random(760)));
    }

    for (int i = 0; i < cranberryJuiceCount; i++)
    {
      collectablesList.add(new Cranberry((int)random(760), (int)random(760)));
    }

    for (int i = 0; i < gymBroCount; i++)
    {
      characterList.add(new GymBro((int)random(760), (int)random(760)));
    }

    for (int i = 0; i < chaserCount; i++)
    {
      characterList.add(new Chaser((int)random(760), (int)random(760)));
    }

    playerCharacter = new Player(width/2, height/2);

    this.maxCranberryJuice = cranberryJuiceCount;
    this.maxWaterBottles = waterBottlesCount;
    this.gameStarted = false;
    this.gameEnded = false;
    this.endState = GameEndState.NotEnded;
  }
  public GameEndState getEndState()
  {
    return this.endState;
  }
  public boolean hasGameEnded() {
    return gameEnded;
  }

  public void start() {
    timer.start();
    gameStarted = true;
  }

  public boolean hasGameStarted() {
    return gameStarted;
  }

  public void render() {
    playerCharacter.render();
    for (Collectable c : collectablesList) {
      c.render();
    }
    for (NPC npc : characterList) {
      npc.render();
    }

    text("T: " + timer.getRemainingTime(), height/2, width/2 - 50); //display seconds remaining top left

    // TODO Add proper interface
    text("P: " + points, height/2, width/2 - 20);
  }

  public void process() {
    // Check timer
    if (timer.isFinished())
    {
      gameEnded = true;
      endState = GameEndState.Dehydration;
    }

    if (points >= 100)
    {
      gameEnded = true;
      endState = GameEndState.Victory;
    }
    
    for (Collectable c : collectablesList) {
      if (playerCharacter.isColliding((GameObject) c))
        ((GameObject)c).onCollision();
    }

    for (NPC npc : characterList) {
      npc.doSomething();
      if (playerCharacter.isColliding(npc))
        npc.onCollision();
    }

    List<NPC> converted = new ArrayList<NPC>();
    for (NPC a : characterList) {
      if (a.isSuperSaiyan()) {
        converted.add((a));
        println("new chaser");
      }
    }
    characterList.removeAll(converted);

    // Adds new chaser for all gymbros converted
    for (NPC c : converted) {
      characterList.add(new Chaser(c.x, c.y));
    }
    for (NPC npc : characterList) {
      if (npc.isInstaDeath()) {
        println("you are dead");
        gameEnded = true;
        endState = GameEndState.DeathToChaser;
        System.out.println(hasGameEnded());
      }
    }


    // CLEAN UP FOR COLLECTABLES
    // collectablesList.removeIf(element -> element.hasCollided()); // PRESS F FOR SHITTY PROCESSING IDE NOT SUPPORTING LAMBDAS CUNT THING
    List<Collectable> garbage = new ArrayList<Collectable>();
    for (Collectable c : collectablesList) {
      if (c.hasCollided()) {
        this.points += c.getXpGiven();
        garbage.add((c));
      }
    }
    collectablesList.removeAll(garbage);


    // Respawn any necessary thingies
    int foundWater = 0, foundCranberry = 0;
    for (Collectable c : collectablesList) {
      if (c instanceof WaterBottle)
        foundWater++;
      else if (c instanceof Cranberry)
        foundCranberry++;
    }

    for (int i = 0; i < maxWaterBottles - foundWater; i++)
    {
      collectablesList.add(new WaterBottle((int)random(760), (int)random(760)));
    }

    for (int i = 0; i < maxCranberryJuice - foundCranberry; i++)
    {
      collectablesList.add(new Cranberry((int)random(760), (int)random(760)));
    }
  }
}
