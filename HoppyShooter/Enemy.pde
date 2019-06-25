class Enemy {

  float xPos, yPos;
  float speed;
  float radius;

  Enemy(float xPos, float yPos, float speed, float radius) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.speed = speed;
    this.radius = radius;
  }

  void display() {
    fill(255,0,0);
    ellipse(xPos, yPos, radius*2, radius*2);
  }

  void move() {
      xPos += speed;
   }
}
