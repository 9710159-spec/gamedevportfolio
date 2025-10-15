class Rock {
  // Member variables
  int x, y, diam, speed;
  PImage Rock;

  // Constructor
  Rock() {
    diam = int(random(50, 100));
    x = int(random(width));
    y = -diam; // why are you putting your rocks at half height ? 
    speed = int(random(1, 10));
    if (random(10)>6.6) {
      Rock = loadImage("rock1.png");
    } else if (random(10)>5.0) {
      Rock = loadImage("rock2.png");
    } else {
      Rock = loadImage("rock3.png");
    }
  }

  // Member Methods
  void display() {
    imageMode(CENTER);
    Rock.resize(diam, diam);
    image(Rock, x, y);
    rectMode(CENTER);
  }
  void move() {
    y = y + speed;
  }
  void fire() {
  }
  boolean reachedBottom() {
    if (y>height+100) {
      return true;
    } else {
      return false;
    }
  }
}
