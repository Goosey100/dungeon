class Turret extends Enemy {
      int timer, stoptimer;
      

  Turret(int x, int y){
    super(100,50,x,y);
    
  }
  
  Turret() {
     timer = 0;

  }
    
  
  void show() {
        textFont (fontfont);
     stroke(0);
    strokeWeight(2);
    fill(green);
    circle(loc.x, loc.y, size);
    fill(0);
    textSize(20);
    // textFont(font);
    text(hp, loc.x, loc.y);

  }
  
  void act() { 
    super.act();
 
  timer ++;
  
    

  super.act();

    int i = 0;
    while (i< myObjects.size()) { 
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet) {
        float d = dist(obj.loc.x, obj.loc.y, loc.x, loc.y);
        if (d <= size/2 + obj.size/2) {
          hp = hp -
            //((Bullet)obj).damage
            int(obj.vel.mag());
          obj.hp = 0;
        }
      }
      i++;
    }
      if(dist(loc.x,loc.y,myHero.loc.x,myHero.loc.y) <=size/2+myHero.size){
      myHero.hp--;
    }
    
      if(hp>0 && timer>=100){
              PVector aimVector = new PVector (myHero.loc.x-loc.x,myHero.loc.y-loc.y);
              myObjects.add(new badbullet(aimVector,#E80971,10));
 //  myObjects.add(new badbullet(loc.x,loc.y));
      timer =0;
  }
    
    
    
    /*
    void shoot() {
    if(hp>0 && timer>=30){
         PVector aimVector = new PVector (myHero.loc.x,myHero.loc.y);
      myObjects.add(new badbullet(aimVector,#E80971,10));
  
    }
    */
  }
}
