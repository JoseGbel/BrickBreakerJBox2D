/*************************
This class seems to be working as expected

There is some work to be done to this class in terms of cleaning though
****************************/

class Brick {

  Body body;
  boolean isAidBox = false; //"is this brick an AidBox?" boolean
  int aidBoxType = -1; //Define the kind of weapon player gets
  int h; //Height 
  int w; //Width
  PVector loc = new PVector(0, 0); //location
  float life; //How many lifes left
  color brickColor;
  int brickNumber = 0;
  boolean delete = false;
  int ref;

  Brick (PVector loc_, int w, int h, int ref) {
   
    this.ref = ref;
    this.h = h;
    this.w = w;
   
    loc = loc_;
    life = int(noise(ref, 1000) * 5);
    brickColor = color(0, life*50, 205);
     
    //This line assign AidBoxes to the bricks. 
    //The ammount of aidBoxes is set on 50% for developing and debugging purpouses
    if (random(1) < 0.5){ 
      isAidBox = true;
      aidBoxType = 1;
      life = 1;
      brickColor = color(278,71,234);
    }
    //Creating a body definition for bricks
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(loc.x, loc.y));

    //Create Body
    body = box2d.createBody(bd);

    //Create Shape
    PolygonShape ps = new PolygonShape();
    float box2Dw = box2d.scalarPixelsToWorld(w/2);
    float box2Dh = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2Dw, box2Dh);

    //Create a fixture
    FixtureDef  fd = new FixtureDef();
    fd.shape = ps;
    //Parameters that affect physics
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;

    //Attach shape to body with fixture
    body.createFixture(fd);
    body.setUserData(this);
  }

  // This function removes the particle from the box2d world
  void killBody() {
    box2d.destroyBody(body);
  }

  void delete() {
    delete = true;
  }

  // Change color when hit
  void change() {
    brickColor = color(255, 0, 0);
  }

  // Is the particle ready for deletion?
  boolean done() {

    if (delete) {
      killBody();
      return true;
    }
    return false;
  }


  void display () {

    Vec2 pos = box2d.getBodyPixelCoord(body);
    fill(brickColor);
    stroke(175);
    strokeWeight(2);
    rectMode (CENTER);
    rect (pos.x, pos.y, w, h);
  }

  boolean isAlive() {

    return (false);
  }
}