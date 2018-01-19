/*******************************
 
 The idea for this class is for this objects to be droped when the ball collides a Brick that it is an AidBox.
 The type of AidBox should be assign to abType. It will get an initial Location where the box will drop from. 
 
 Type of AidBoxes:
 type 1: Weapon Pad
 type 2: Longer Pad
 type 3: Shorter Pad (negative AidBox)
 type 4: multiple Balls 
 
 Every type of AidBox will have their own texture in the future for the player to identify them.      
 
 *******************************************************************************************************/

class AidBox {

  Body body;  

  //An aidBox is simply a box of size w and h with an initial location, a type and the length of the effect.
  Vec2 initLoc;
  int abType;
  int lifeSpan;
  float w = 20; 
  float h = 10;



  AidBox (Vec2 initLoc, int abType) {

    this.initLoc = initLoc;
    this.abType = abType;
    lifeSpan = 255;     

    //Creating a body definition for bricks
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(initLoc);

    //Create Body
    body = box2d.createBody(bd);
    println(body);

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

    //Assigning UserData to this body
    body.setUserData(this);
  }

  void display () {

    //Vec2 pos = box2d.getBodyPixelCoord(body);
    fill(255);
    stroke(175);
    strokeWeight(2);
    rectMode (CENTER);
    rect (initLoc.x, initLoc.y, w, h);
  }
}