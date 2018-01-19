/*******************************

This class seems to be working properly. 
Future updates in the code will make the size of the standard pad much shorter.

There is some work to be done to this class in term of clearing and cleaning.

*********************************/


class Pad {

  Body body;

  int w;
  int h; 
  PVector loc; 

  Pad () {
    w = 100;
    h = 10;
    loc = new PVector(mouseX, height - 60);
  
    //Creating a body definition for bricks
    BodyDef bd = new BodyDef();
    bd.type = BodyType.KINEMATIC;
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
    fd.friction = 0;
    fd.restitution = 0;

    //Attach shape to body with fixture
    body.createFixture(fd);
    body.setGravityScale(0.5);
    body.setUserData(this);
  }


  void display () {


    Vec2 pos = box2d.getBodyPixelCoord(body);
    fill(0, 81, 250);
    stroke (175);
    rect (pos.x, pos.y, w, h);
  }

  void update () {

    //get mouse location
    Vec2 mouseLoc = new Vec2 (box2d.coordPixelsToWorld(mouseX, loc.y));
    body.setTransform(mouseLoc, 0);
    
    ////get current location in world coord
    //Vec2 currentWorld = new Vec2 (box2d.coordPixelsToWorld (body.getPosition()));


    //body.setLinearVelocity(getVel());

    ////check right edge
    //if (body.getPosition().x - box2d.scalarPixelsToWorld(w/1.25) >= box2d.scalarPixelsToWorld(height/2)) {
    //  body.setLinearVelocity(new Vec2(0, 0));
    //  if (mouseLoc.x - currentWorld.x - box2d.scalarPixelsToWorld(width/2)<0)
    //    body.setLinearVelocity(new Vec2(-10, 0));
    //}
    ////check left edge    
    //if (body.getPosition().x - box2d.scalarPixelsToWorld(-w/1.25) <= box2d.scalarPixelsToWorld(-height/2)) {
    //  body.setLinearVelocity(new Vec2(0, 0));
    //  if (mouseLoc.x - currentWorld.x - box2d.scalarPixelsToWorld(width/2)>0)
    //    body.setLinearVelocity(new Vec2(10, 0));
    //}
  }
  
    //Vec2 getVel () {
  //  //get mouse location
  //  Vec2 mouseLoc = new Vec2 (box2d.coordPixelsToWorld(mouseX, mouseY));

  //  //get current location in world coord
  //  Vec2 currentWorld = new Vec2 (box2d.coordPixelsToWorld (body.getPosition()));


  //  //offset of Y location as Y loc is always fixed and we only move through the X axis
  //  float yPosWorld = box2d.scalarPixelsToWorld(loc.y);

  //  //vel=mouseLoc - currentLoc
  //  Vec2 vel = new Vec2 ((mouseLoc.x - currentWorld.x - box2d.scalarPixelsToWorld(width/2))*3, 0);
  //  //map(vel, -50, 50, 0, box2d.coord
    
  //  return vel;
  //}
}