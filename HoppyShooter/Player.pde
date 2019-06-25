class Player {

  float xPos, yPos;
  float radius;
  float bulletSpeed;
  ArrayList<Bullet> bulletList;

  Player(float xPos, float yPos, float radius, float bulletSpeed) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.radius = radius;
    this.bulletSpeed = bulletSpeed;

    bulletList = new ArrayList<Bullet>();
  }

  void display() {
    fill(0, 255, 0);
    ellipse(xPos, yPos, radius*2, radius*2);
  }

  void gravity() {
    yPos += 9.81;
  }

  void bounce(float bounceAmount) {
    yPos += bounceAmount;
  }

  void addBullet() {
    bulletList.add(new Bullet(xPos+radius, yPos, bulletSpeed, 10));
  }

  void removeBullet(int bulletIndex) {
    bulletList.remove(bulletIndex);
  }

  void fireBullet() {
    for (Bullet bullet : bulletList) {
      bullet.display();
      bullet.move();
    }
  }

  boolean shootEnemy(Enemy enemy) {
    for (Bullet bullet : bulletList) {
      if (bullet.collideWithEnemy(enemy)) {
      return true;
    } 
    }
    return false;
  }
  
  boolean collideWithEnemy(Enemy enemy) {
    if (dist(xPos, yPos, enemy.xPos, enemy.yPos) < radius + enemy.radius) {
      return true;
    }
    return false;
  }

  boolean offScreen() {
    if (yPos >= height+radius || yPos <= -radius) {
      return true;
    }
    return false;
  }
}
