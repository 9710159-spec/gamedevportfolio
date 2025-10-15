class Spaceship {
  // Member variables
  int x, y, w, health, ammo, turretCount, laserCount;
  PImage ship;

  // Constructor
  Spaceship() {
    x = width/2;
    y = height/2;
    w = 100;
    laserCount = 100;
    turretCount = 1;
    health = 100;
    ship = loadImage("ufo.png");
  }

  // Member Methods
  void display() {
    rectMode(CENTER);
    image(ship, x-0, y-0);
  }
  void move(int x, int y) {
    this.y = y;
    this.x = x;
  }
  boolean fire() {
    if (laserCount>0) {
      return true;
    } else {
      return false;
    }
  }


  boolean intersect(Rock r) {
    float d = dist(x, y, r.x, r.y);
    if (d<5) {
      return true;
    } else {
      return false;
    }
  }
}
