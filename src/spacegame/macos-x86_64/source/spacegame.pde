// Mark Connell | 17 sept 2025 | spacegame
Spaceship s1;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Star> stars = new ArrayList<Star>();
ArrayList<PowerUp> powups = new ArrayList<PowerUp>();
int score, rocksPassed, level;
boolean play;
PImage title;


Timer rockTimer, puTimer;
void setup() {
  fullScreen();
  size(displayWidth, displayHeight);
  background(20);
  s1 = new Spaceship();
  puTimer = new Timer (5000);
  puTimer.start();
  //rock1 = new Rock();
  rockTimer = new Timer(300);
  rockTimer.start();
  score = 0;
  {
  title=loadImage("intro-1.png");
}
  rocksPassed = 0;
  size(400, 400);
}


void draw() {
  if (!play) {
    startScreen();
  } else {



    background(22);
    if (puTimer.isFinished()) {
      powups.add(new PowerUp());
      puTimer.start();
    }
    for (int i =0; i < powups.size(); i++) {
      PowerUp pu = powups.get(i);
      pu.display();
      pu.move();
      if (pu.intersect(s1)) {
        powups.remove(pu);
        if (pu.type == 'h') {
          s1.health+=100;
        } else if (pu.type == 't') {
          s1.turretCount+=1;
          if (s1.turretCount>5) {
            s1.turretCount = 5;

          }
        }
      }
    }

    
      stars.add(new Star());
      for (int i = 0; i < stars.size(); i++) {
        Star star = stars.get(i);
        star.move();
        star.display();
        if (star.reachedbottom()) {
          // removew star from stars
        }
      }
      infopanel();
      if (rockTimer.isFinished()) {
        rocks.add(new Rock());
        rockTimer.start();
        score = 0;
      }
      for (int i = 0; i < rocks.size(); i++) {
        Rock rock = rocks.get(i);
        rock.display();

        if (s1.intersect(rock)) {
          rocks.remove(rock);
          score+=rock.diam;
          s1.health-=10;
        }
        rock.move();
        if (rock.reachedBottom()) {
          rocksPassed++;
          rocks.remove(rock);
          i--;
        }
        println("Rocks: "+ rocks.size());
      }
      for (int i = 0; i < lasers.size(); i++) {
        Laser laser = lasers.get(i);
        laser.display();
        laser.move();
        if (laser.reachedTop()) {
          lasers.remove(laser);
          i--;
          continue;
        }
        for (int j = 0; j<rocks.size(); j++) {
          Rock r = rocks.get(j);
          if (laser.intersect(r)) {
            lasers.remove(laser);
            r.diam -= 50;
          }
          if (r.diam<5) {
            rocks.remove(r);
            j--;
          }
          score+=r.diam;
          println(lasers.size());
        }
      }
      //rock1.display();
      // rock1.move();
      s1.display();
      s1.move(mouseX, mouseY);
    
  }
}




void mousePressed() {
  lasers.add(new Laser(s1.x, s1.y));
}

void infopanel() {
  rectMode(CENTER);


  fill(127, 127);
  //noStroke();
  rect(width/2, 4.4*height/5, width, 50);
  fill(255);
  textSize(30);
  text("score: " + score, 30, width/2);
  text("health: " + s1.health, 300, width/2);
  text("Rocks Passed: " + rocksPassed, 500, width/2);
  text("Ammo: " + s1.laserCount, 800, width/2);
}
void gameOver()
{
  background(0);
  fill(255);
  text("Game Over!", width/2, width/2);
  text("Score: " + score, width/2, height/2);
  noLoop();
}
void startScreen() {
  image(title, 200, 200);
  fill(255);
  //text("Click Mouse To Start", width/2, height/2);
  if (mousePressed)
    play = true;
}
