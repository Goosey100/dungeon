class Enemy extends GameObject {


  Enemy() {
    loc = new PVector(width/2, height/2);
    vel= new PVector(0, 0);
    hp = 100;
    roomX = 1;
    roomY = 1;
    size = 50;

  }
  
    Enemy(int x, int y) {
    loc = new PVector(width/2, height/2);
    vel= new PVector(0, 0);
    hp = 100;
    roomX = 1;
    roomY = x;
    size = y;
  }
  
 
  
  

  Enemy(int _hp, int s, int x, int y) {
    loc = new PVector (width/2, height/2);
    vel = new PVector(0, 0);
    hp = _hp;
    size = s;
    roomX=x;
    roomY=y;
  }

  void show() {

    stroke(0);
    strokeWeight(2);
    fill(red);
    circle(loc.x, loc.y, size);
    fill(0);
    textSize(20);
    textFont(fontfont);
    text(hp, loc.x, loc.y);
  }
  void act() {
    super.act();

    int i = 0;
    while (i< myObjects.size()) { 
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet) {
        float d = dist(obj.loc.x, obj.loc.y, loc.x, loc.y);
        if (d <= size/2 + obj.size/2) {
          hp = hp - int(obj.vel.mag());
          
          obj.hp = 0;
          if (hp<=0){
             myObjects.add(new DroppedItem(loc.x,loc.y,roomX,roomY));
              myObjects.add(new particle(loc.x, loc.y));
               myObjects.add(new particle(loc.x, loc.y));
                myObjects.add(new particle(loc.x, loc.y));
                
          }
        // tweak this code a bit  myObjects.add(new DroppedItem(loc.x,loc.y,roomX,roomY));
        }
      }
      i++;
    }
    

      if(dist(loc.x,loc.y,myHero.loc.x,myHero.loc.y) <=size/2+myHero.size){
      myHero.hp--;
    }
  }
}
