class PowerUp {
  // Member variables
  int x, y, w, diam, speed;
  //PImage pu;
  char type;
  color c1;
  // Constructor
  PowerUp() {
    x = int(random(width));
    y = -100;
    w = 100;
    speed = int(random(1, 10));

    if (random(10)>6.6) {
      //pu = loadImage("rock1.png");
      type = 'a'; //ammo
      c1 = color(255, 0, 0);
    } else if (random(10)>5.0) {
      //pu = loadImage("health.png");
      type = 'h'; //health
      c1 = color(0, 255, 0);
    } else {
      //pu = loadImage("rock3.png");
      type = 't'; //turret count
      c1 = color(0, 0, 255);
    }
  }

  // Member Methods
  void display() {
    fill(c1);
    ellipse(x, y, w, w);
    fill(255);
    textAlign(CENTER);
    //text(z, x, y);
   // imageMode(CENTER);
  //  pu.resize(diam, diam);
    //image(pu, x, y);
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
  boolean intersect(Spaceship s) {
    float d = dist(x, y, s.x, s.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
