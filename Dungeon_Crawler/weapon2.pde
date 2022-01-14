class ShotGun extends Weapon {

  ShotGun() {
    super(SHOTGUN_THRESHOLD, SHOTGUN_BULLETSPEED);
  }

  void shoot() {
    if (shotTimer >= threshold) {
      for (int i=0; i <30; i++) {
        PVector aimVector = new PVector (mouseX-myHero.loc.x, mouseY-myHero.loc.y);
        aimVector.rotate(random(-PI, PI));
        aimVector.setMag(bulletSpeed);
        noStroke();
        myObjects.add(new Bullet(aimVector, red, 10));
      }
      shotTimer = 0;
    }
  }
}
