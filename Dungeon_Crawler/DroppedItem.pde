class DroppedItem extends GameObject { 
  int type;
  Weapon w;
  int numbergenerator;
  
  
  DroppedItem(float x, float y, int rx, int ry){
    
    
    numbergenerator = (int)random(1,3);
    if (numbergenerator == 1) {
         c = yellow;
   type = GUN;
    w = new ShotGun();
    hp = 1;
    loc = new PVector (x,y);
    vel = new PVector (0,0);
    size = 20;
    roomX= rx;
    roomY = ry;

    }
    else if  (numbergenerator ==2) {
             c =pink;
       type = HEALTH;
       hp = 1;
       loc  = new PVector (x,y);
       vel = new PVector (0,0);
       size = 20;
       roomX = rx;
       roomY = ry;
     //  println (numbergenerator);
  }
  }
  void show () {

    stroke(0);
    strokeWeight(2);
    circle(loc.x,loc.y,size);
    
   
}

void act() {
   
  //do nothing, not even get shot or move
}

}
