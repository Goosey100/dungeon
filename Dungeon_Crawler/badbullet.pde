class badbullet extends GameObject {
  int timer;
  int bulletcolor;
  int damage;
  badbullet(PVector aimVector, color bc, int s) {
   bulletcolor = bc;
size = s;
    timer = 60;
    hp = 1;
     loc = new PVector (loc.x, loc.y);
    vel = aimVector.copy();
//    vel = new PVector (myHero.direct.x, myHero.direct.y);
    vel.setMag(10);
    
    roomX = myHero.roomX;
    roomY= myHero.roomY;

  }
  
  void show() {
    stroke (255);
    fill( bulletcolor); 
    ellipse( loc.x,loc.y,size,size);
  }
  
  void act() {
    super.act();
    timer--;
    if(timer==0){
      hp=0;
    }
       if(dist(loc.x,loc.y,myHero.loc.x,myHero.loc.y) <=size/2+myHero.size){
      myHero.hp = myHero.hp-1;
       }
  }
}




/*
class badbullet extends GameObject{
  int timer;
  int bulletcolor;
  int damage;
  badbullet(PVector aimVector, color bc, int s){
    bulletcolor = bc;
    size = s;
timer = 60;
hp = 1;
loc = new PVector (loc.x, loc.y);
vel = aimVector.copy();
vel.setMag(10);
  }
   void show(){ //show the bad bullet. ============================
  stroke (255);
fill(bulletcolor);
  ellipse (loc.x,loc.y,size,size);
  }
  
  void act() {
    super.act();
    timer--;
    if(timer==0){
      hp=0;
    }
  }
}









class badbullet extends GameObject{
  int timer; 
  PVector target;
  badbullet(float x, float y){
    loc = new PVector (x,y);
    vel = new PVector( myHero.loc.x - x, myHero.loc.y-y);
   vel = new PVector (myHero.loc.x-x, myHero.loc.y-y);
    vel.setMag(10);
    timer = 60;
    size = 10;
    hp = 1;
  }
  
  
  void show(){ //show the bad bullet. ============================
  stroke (255);
  fill ( #E80971);
  ellipse (loc.x,loc.y,size,size);
  }
  void act() {

    timer--;
    if (timer ==0){
      hp = 0;
    }
  }
}
*/
