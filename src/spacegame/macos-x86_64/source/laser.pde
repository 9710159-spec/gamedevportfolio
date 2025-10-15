class Laser {
  // Member variables
  int w, h, x, y, diam, speed;
  PImage Laser;

  // Constructor
  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    w = 4;
    h = 10;
    speed = 20;
    diam = int(random(50, 100));
    x = int(random(width));
    y = -diam; 
    if (random(10)>6.6) {
      Laser = loadImage("laser.png");
    } else if (random(10)>5.0) {
      Laser = loadImage("laser.png");
    } else {
      Laser = loadImage("laser.png");
    }
  }

  // Member Methods
  void display() {
    rectMode(CENTER);
    fill(255, 0, 0);
    rect(x, y, w, h);
  }
  void move() {
    y = y - speed;
  }
  void fire() {
  }
  boolean reachedTop() {
    if (y<0-10) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock r) {
    float d = dist(x, y, r.x, r.y);
    if (d<=r.diam) {
      return true;
    } else {
      return false;
    }
  }
}
