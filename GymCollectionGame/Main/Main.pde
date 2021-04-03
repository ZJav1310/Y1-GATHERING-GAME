// Things to add if im not deaded; Explosions.

Game gameState;
GameMode gameMode = GameMode.startMenu;
PImage backGround;

void setup() {
  size(800, 800);
  backGround = loadImage("gymfloor.jpg");
  backGround.resize(width, height);
  gameState = new Game(4, 1, 4, 4); //Represents waterbottles, cranberry, gymbro, chaser amount on spawn
}

void draw() {
  // State of game mode
  switch (gameMode) {
  case startMenu:
    startMenu();
    break;
  case gamePlaying:
    gamePlaying();
    break;
  case finishedPlaying:
    finishedPlaying();
    break;
  }
}

// Content that displays
void startMenu() {
  background(0);
  textAlign(CENTER);
  text("Mouse click to start", width / 2, height / 2);
  text("Collect as many waterbottles and cranberry juice cartons", width / 2, height / 2 + 20);
  text("if you touch the gymbros, they'll be mad... and turn green", width / 2, height / 2 + 40);
  text("they can kill you if they turn green.", width / 2, height / 2 + 60);
  text("you have 60 seconds or else you die from dehydration.... good luck.", width / 2, height / 2 + 80);
}

void gamePlaying() {
  background(backGround);
  if (!gameState.hasGameStarted())
    gameState.start();
  gameState.render();
  gameState.process();
  gameEnd();
}

void finishedPlaying() {
  String gameOverMessage = "";
  switch (gameState.getEndState())
  {
  case Dehydration:
    gameOverMessage = "Dehydrated! :(";
    break;
  case DeathToChaser:
    gameOverMessage = "Caught! :(";
    break;
  case Victory:
    gameOverMessage = "Yay! :)";
    break;
  default:
    gameOverMessage = "Mouse click!";
    break;
  }
  background(0);
  textAlign(CENTER);
  fill(255);
  textSize(30);
  text("Game Over: " + gameOverMessage, height / 2, width / 2 - 20);
  textSize(15);
  text("Click to Restart", height / 2, width / 2 + 10);
}

// They need to click the mouse to start the game
public void mousePressed() {
  if (gameMode == GameMode.startMenu) {
    startGame();
  } else if (gameMode == GameMode.gamePlaying) {
    gameOver(); // quick yeet game
  } else if (gameMode == GameMode.finishedPlaying) {
    restart();
  }
}

//Arrow keys to move the player
void keyPressed() {

  if (key == CODED) {
    // PLAYER DO SOMETHING
    if (gameState.hasGameStarted())
      gameState.playerCharacter.processKeypress();
  }
}

void gameEnd() {
  if (gameState.hasGameEnded())
    gameOver();
}
void startGame() {
  gameMode = GameMode.gamePlaying;
}
void gameOver() {
  gameMode = GameMode.finishedPlaying;
}
void restart() {
  gameState = new Game(4, 1, 4, 4);
  gameMode = GameMode.gamePlaying;
}
