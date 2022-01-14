



//settings: dropped item types
final int AMMO = 0;
final int HEALTH = 1;
final int GUN = 2;


//settings: enemies
final int TURRET_HP = 50;
final int TURRET_SIZE = 50;
final int TURRET_THRESHOLD = 60;
final int TURRET_BULLET_SPEED = 5;
final int SPAWNINGPOOL_HP = 50;
final int SPAWNINGPOOL_SIZE = 100;
final int SPAWNINGPOOL_THRESHOLD = 100;

//settings: weapons
final int SHOTGUN_THRESHOLD = 100;
final int SHOTGUN_BULLETSPEED = 5;
final int SNIPER_RIFLE_THRESHOLD = 100;
final int SNIPER_RIFLE_BULLETSPEED = 20;
final int AUTOPISTOL_THRESHOLD = 10;
final int AUTOPISTOL_BULLETSPEED = 5;


// IMAGES
PImage map;
color northRoom, eastRoom, southRoom, westRoom;
//MODE
int mode;

//BUTTON
boolean mouseReleased;
boolean wasPressed;
boolean w, a, s, d, space;
boolean pkey;

Button startbutton;

//coolfont
PFont font; 
PFont fontfont;

final int INTRO = 0;
final  int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;
final int TODO=4;
//visual effects
int textAngle;


//GIF JIF
AnimatedGIF myGIF;

AnimatedGIF MCUP, MCDOWN,MCRIGHT,MCLEFT;
AnimatedGIF SHOOTUP,SHOOTDOWN,SHOOTRIGHT,SHOOTLEFT;
//darkness variables...
int [] x; //array/ book of x coords
int [] y; //array/ book of  y coords
boolean [] alive;
int n;  // how many 'pages' in book
int pixeld; //diameter of all bricks
int tempx, tempy; 
int i;


//Game objects
ArrayList<GameObject> myObjects;
//ArrayList<GameObject> myPain;
ArrayList <DarknessCell> darkness;
Hero myHero;
//color
color green = #0AFA74;
color red = #FA0A46;
color brown = #E89002;
color white = 255;
color pink = #cd5959;
color blue = #47dbe6;
color yellow = #F7DA2F;

void setup() {
pkey = false;
  map = loadImage("map.png");
  startbutton = new Button("START", 400, 300, 200, 80, brown, white);
  myGIF = new AnimatedGIF(16,2, "dungeon/frame_", "_delay-0.1s.gif");
  
  //sprite gif
 MCUP = new AnimatedGIF(4,10,"MAIN/MCUP/mcup_",".png");
MCDOWN = new AnimatedGIF(4,10,"MAIN/MCDOWN/mcdown_",".png");
MCLEFT = new AnimatedGIF ( 4,10,"MAIN/MCLEFT/mcleft_", ".png");
MCRIGHT = new AnimatedGIF (4,10,"MAIN/MCRIGHT/mcright_",".png");

//SNAKESHOOTER GIF
SHOOTUP = new AnimatedGIF(8,10,"SHOOTER/SHOOTRIGHT/snakeright_",".png");
SHOOTDOWN = new AnimatedGIF (8,10,"SHOOTER/SHOOTDOWN/snakedown_",".png");
SHOOTLEFT = new AnimatedGIF (8,10,"SHOOTER/SHOOTLEFT/snakeleft_", ".png");
SHOOTRIGHT = new AnimatedGIF (8,10,"SHOOTER/SHOOTRIGHT/snakeright_",".png");

  //FONT DECLARATION
  font = createFont ("yes.ttf", 80);
  fontfont = createFont ("bad.ttf", 40);
  //create darkness
  darkness = new ArrayList<DarknessCell>();
  float size = 8;
  int x = 0;
  int y = 0;
  while (y < height+10) {
    darkness.add(new DarknessCell(x, y, size));
    x += size;
    if (x >= width+10) {
      x=0;
      y+= size;
    }
  }


  mode = 0;

  size(800, 600);

  //create objects
  myHero = new Hero();
  myObjects = new ArrayList<GameObject> (1000);
  myObjects.add(myHero);
  // myObjects.add(new Enemy());
  //  myObjects.add(new Follower(1,2));
  // myObjects.add(new Turret(2,1));
  //  myObjects.add(new Spawner(1,3));

  // myObjects = add(myHero);
  //Create darkness

  //loading the enemies from the map
  x = 0;
  y = 0;

  while (y< map.height) {
    color roomColor = map.get(x, y);

    if (roomColor== pink) {
      myObjects.add(new Turret(x, y));
    }
    //map.get(x,y);
    if (roomColor == blue) {
      myObjects.add(new Follower(x, y));
    } else {
    }
    x++;
    if (x== map.width) {
      x = 0;
      y++;
    }
  }
}

void draw() {
  //button
  click() ;

  if (startbutton.clicked) {
    mode = 1;
  }


  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  }
}

void click() {
  mouseReleased = false;
  if (mousePressed) wasPressed = true;
  if (wasPressed && !mousePressed) {
    mouseReleased = true;
    wasPressed = false;
  }
}



void keyPressed() {// IF KEY BUTTONS ARE PRESSED, WILL BECOME TRUE ===================================================
  if (keyCode == 'w'|| keyCode == 'W')        w= true;
  if (keyCode == 'a'|| keyCode == 'A')    a = true;
  if (keyCode == 's'|| keyCode == 'S')   s = true;
  if (keyCode == 'd'|| keyCode == 'D') d = true;
  if (keyCode ==' ') space = true;
    if (key == 'p' || key == 'P') pkey = true;
}



void keyReleased() {

  if (keyCode == 'w'|| keyCode == 'W') w = false;
  if (keyCode == 'a'|| keyCode == 'A') a = false;
  if (keyCode == 's'|| keyCode == 'S') s = false;
  if (keyCode == 'd'|| keyCode == 'D') d = false;
    if (key == 'p' || key == 'P') pkey = false;
  if (keyCode ==' ') space = false;
}
