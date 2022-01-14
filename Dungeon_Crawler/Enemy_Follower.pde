class Follower extends Enemy {
  Follower(int x, int y) {
    super(100, 50, x, y);
    
  }
   void show() {

    stroke(0);
    strokeWeight(2);
    fill(brown);
    circle(loc.x, loc.y, size);
    fill(0);
    textSize(20);
    // textFont(font);
    text(hp, loc.x, loc.y);
  
  }
  
  void act() { 
    super.act();
    //println(myHero.loc.y);
//if (myHero.loc.x <= 400 && myHero.loc.y <= 200){
  
        if(dist(loc.x,loc.y,myHero.loc.x,myHero.loc.y) <=size/0.1+myHero.size){
    
    vel = new PVector(myHero.loc.x-loc.x,myHero.loc.y - loc.y);
    vel.setMag(2);
      }
      else {

  
      }
}
}
