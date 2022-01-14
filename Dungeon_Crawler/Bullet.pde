class Bullet extends GameObject {
  int timer;
  int bulletcolor;
  int damage;
  Bullet(PVector aimVector, color bc, int s) {
   bulletcolor = bc;
size = s;
    timer = 60;
    hp = 1;
    loc = new PVector (myHero.loc.x, myHero.loc.y);
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
  }
}
    
  
  
  
  
  
  
  
  
  
  
  
  
