class DarknessCell {
  float opacity;
  float x, y, size;




  DarknessCell(float _x, float _y, float s) {
    size = s;
    x =_x;
    y =_y;
   

    //  square(x,y,size);
  }
  void show() {
    noStroke();
 float  d= dist(myHero.loc.x, myHero.loc.y,x,y);
      opacity = map(d,0, 500, 0, 300);
    fill (0, opacity);
    square(x, y, size);
  }
}
