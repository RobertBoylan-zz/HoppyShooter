class Bullet {

  float xPos, yPos;
  float speed;
  float radius;

  Bullet(float xPos, float yPos, float speed, float radius) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.speed = speed;
    this.radius = radius;
  }

  void display() {
    fill(255);
    ellipse(xPos, yPos, radius*2, radius*2);
  }

  void move() {
      xPos += speed;
   }
   
   boolean collideWithEnemy(Enemy enemy) {
    if (dist(xPos, yPos, enemy.xPos, enemy.yPos) < radius + enemy.radius) {
      return true;
    }
    return false;
  }
}
