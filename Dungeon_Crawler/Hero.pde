class Hero extends GameObject {

  float speed;
AnimatedGIF currentAction;
  Weapon myWeapon;


  Hero() {

    
    loc= new PVector (width/3, height/3);
    vel = new PVector (0, 0);

    hp = 5;
    speed = 5;
    roomX = 1; 
    roomY = 1;
    size = 40;
    myWeapon = new AutoPistol();
    currentAction = MCDOWN;
  }
  void show() {
        textFont (fontfont);
        fill(0);
          text(hp, loc.x, loc.y);
   /* fill (#FF0DAB);
    stroke (0);
    strokeWeight(2);
    circle(loc.x, loc.y, size);
    */
    currentAction.show(loc.x,loc.y,size/1,size);
  }

  void act() {
    super.act();
    if (w) vel.y = -speed;
    if (a) vel.x = -speed;
    if (s) vel.y = speed;
    if (d) vel.x = speed;

    if (vel.mag() >speed)
      vel.setMag(speed);
    if (!w && !s) vel.y = vel.y*0.75;
    if (!a && !d) vel.x = vel.x*0.75;

if (abs(vel.y) > abs(vel.x)){
  if (vel.y > 0) currentAction = MCDOWN;
  else currentAction = MCUP;
}else {
  if (vel.x >0) currentAction = MCRIGHT;
  else currentAction = MCLEFT;
}
    //check exits
    //north
    if (northRoom!=#FFFFFF && loc.y == height*0.1 && loc.x >= width/2-50 && loc.x <= width/2+50) {
      roomY= roomY-1;
      loc = new PVector(width/2, height*0.9-10);
    }
    //east
    if (eastRoom !=#FFFFFF && loc.x == width*0.9 && loc.y>= height/2-50 && loc.y <= height/2+50) {
      roomX++;
      loc = new PVector(width*0.1, height/2);
    }
    //south
    if (southRoom!=#FFFFFF && loc.y==height*0.9 && loc.x >= width/2-50 && loc.x <=width/2+50) {
      roomY=roomY+1;
      loc = new PVector (width/2, height*0.1);
    }
    //West
    if (westRoom!=#FFFFFF && loc.x == width*0.1 && loc.y>= height/2-50 && loc.y<= height/2 +50) {
      roomX--;
      loc = new PVector(width*0.9, height/2);
    }
    myWeapon.update();
    if (space) myWeapon.shoot();
    //check for collisions
    int i =0;
    while (i<myObjects.size()){
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof badbullet && isCollidingWith(myObj)){
        hp = hp-int(myObj.vel.mag());
        myObj.hp=0;
      }
      
      
  if (myObj instanceof DroppedItem && isCollidingWith(myObj)) {
    DroppedItem item = (DroppedItem) myObj;
    if (item.type == GUN) {
      myWeapon = item.w;
      item.hp=0; }
      else if (item.type == HEALTH) {
        myHero.hp ++;
        item.hp = 0;
      }
  }i ++;
    }
  }



}
