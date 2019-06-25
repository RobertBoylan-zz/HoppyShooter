Player player;
float playerXPos = 150;
float playerYPos = 200;
float playerRadius = 50;
float playerBounceAmount = 0;

float bulletSpeed = 15;

ArrayList<Enemy> enemyList;
float enemySpeed = -5;
float enemyRadius = 20;
int numEnemies = 5;

int score = 0;
boolean gameOver = false;
boolean increaseDifficulty = false;

void setup() {
  size(1000, 1000); 

  textAlign(CENTER);

  player = new Player(playerXPos, playerYPos, playerRadius, bulletSpeed);

  enemyList = new ArrayList<Enemy>();

  for (int i = 0; i < numEnemies; i++) {
    enemyList.add(new Enemy(random(width+enemyRadius, width+800), random(enemyRadius, height-enemyRadius), enemySpeed, enemyRadius));
  }
}

void draw() {
  background(0);

  if (!gameOver) {
    player.display();
    player.gravity();
    player.fireBullet();

    if (playerBounceAmount < 0) {
      player.bounce(playerBounceAmount);
      playerBounceAmount += 1;
    }

    if (player.offScreen()) {
      gameOver = true;
    }

    for (Enemy enemy : enemyList) {
      enemy.display();
      enemy.move();

      if (player.collideWithEnemy(enemy)) {
        gameOver = true;
      }
    }

    addEnemy();
    removeEnemy();

    fill(255);
    textSize(18);
    text("Score: " + score, 50, 50);
  } else {
    fill(255, 0, 0);
    textSize(40);
    text("Game Over", width/2, height/2-50);
    textSize(25);
    text("High Score: " + score, width/2, height/2+25);
    text("Press 'R' to Restart", width/2, height/2+100);

    if (keyPressed) {
      if (key == 'r' || key == 'R') {
        gameOver = false;
        player.xPos = 150;
        player.yPos = 200;
        playerBounceAmount = 0;

        enemySpeed = -5;

        score = 0;

        for (int i = enemyList.size()-1; i >= 0; i--) {
          enemyList.remove(i);
        }
        for (int i = 0; i < numEnemies; i++) {
          enemyList.add(new Enemy(random(width+enemyRadius, width+800), random(enemyRadius, height-enemyRadius), enemySpeed, enemyRadius));
        }
      }
    }
  }
}

void addEnemy() {
  if (enemyList.size() < 5) {
    enemyList.add(new Enemy(random(width+enemyRadius, width+400), random(enemyRadius, height-enemyRadius), enemySpeed, enemyRadius));
  }
}

void removeEnemy() {
  for (int i = enemyList.size()-1; i >= 0; i--) {
    if (enemyList.get(i).xPos <= -enemyList.get(i).radius || player.shootEnemy(enemyList.get(i))) {
      enemyList.remove(i);
      score++;
    }
  }
}

void keyReleased() {
  if (key == ' ') {
    player.addBullet();
  }
}

void mouseReleased() {
  if (mouseButton == LEFT) {
    playerBounceAmount = -30;
  }
}
