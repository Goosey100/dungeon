void game() {
  drawRoom();
  drawGameObjects();
  drawDarkness();
  drawMiniMap();
  textFont(fontfont);
  println (pkey);
  if (pkey == true) {// IF PKEY IS TRUE, GAME WILL PAUSE
  pause();
  }else{
  }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         }





void drawGameObjects() {
  for (int i = 0; i < myObjects.size(); i++) {
    GameObject obj = myObjects.get(i);
    if (obj.roomX == myHero.roomX && obj.roomY == myHero.roomY) {
      obj.show();
      obj.act();
      if (obj.hp <= 0 ) {
        myObjects.remove(i);
        i--;
      }
    }
  }
}

void drawRoom() {
  textFont (font);
 //println (myHero.hp);
  //  text ( myHero.hp, 500,100);
  background (#D8C19B);

  stroke(3);

  line (0, 0, width, height);
  line (width, 0, 0, height);

  //draw exits
  //#1 find out which directions have exits
  northRoom = map.get(myHero.roomX, myHero.roomY-1);
  eastRoom = map.get(myHero.roomX+1, myHero.roomY);
  southRoom = map.get(myHero.roomX, myHero.roomY+1);
  westRoom = map.get(myHero.roomX-1, myHero.roomY);

  //#2 Draw the door wherer there are exits
  noStroke();
  fill(0);
  if (northRoom != #FFFFFF) {
    ellipse (width/2, height*0.1, 109, 100);
  }
  if (eastRoom != #FFFFFF) {
    ellipse(width*0.9, height/2, 100, 100);
  }
  if (southRoom != #FFFFFF) {
    ellipse(width/2, height*0.9, 100, 100);
  }
  if (westRoom !=#FFFFFF) {
    ellipse(width*0.1, height/2, 100, 100);
  }




  //draw floor
  rectMode(CENTER);
  stroke(0);
  fill(#64481A);
  rect(width/2, height/2, width*0.8, height*0.8);
}

void drawMiniMap() {

  float size = 10;
  int x = 0;
  int y = 0;
  while (y < map.height) {
    color c = map.get(x, y);
    fill(c);
    square(x*size+50, y*size+50, size);
    x = x+ 1;
    if (x >= map.width) {
      x=0;
      y = y+ 1;
    }
  }
  /*
  if (northRoom != #FFFFFF) {
   fill (#FF03D1);
   square(10, 20, size);
   } else  if (eastRoom != #FFFFFF) {
   fill (#FF03D1);
   square ( 10, 10, size);
   } else  if (westRoom != #FFFFFF) {
   fill (#FF03D1);
   square (100, 30, size);
   */
  size = 10;
  fill(red);
  square(myHero.roomX*size+50, myHero.roomY*size+50, size);
}



void drawDarkness() {
  for (int i = 0; i < darkness.size(); i++) {
    DarknessCell obj = darkness.get(i);
    obj.show();
    //println(i, obj.x, obj.y, darkness.size());
  }
}
