public class Ball {

  Body body;

  private PVector position;
  private PVector velocity;
  private PVector acceleration;
  private float maxSpeed;
  int r;
  
  //Constructor
  Ball() {
 
    r = 20;
    position = new PVector(random (0, width), height/2);
    
    //THIS CODE NEEDS TO BE REVIEWED
    velocity = new PVector (int(random(-1, 1)+1)*50000, -40000);
    //acceleration = new PVector (0,0);
    maxSpeed=36;
    
    //Create BodyDefinition
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.linearDamping = 0;
    bd.angularDamping = 0;
    bd.position.set(box2d.coordPixelsToWorld(position.x, position.y));
    
    //create a body
    body = box2d.createBody(bd);
    
    //create a shape
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r/2);
    
    //create a fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    
    //Physics parameters
    fd.density = 1;
    fd.restitution = 1;
    fd.friction = 0.0;

    //Put all together
    body.createFixture(fd);
    
    //The ball should not be affected by gravity
    body.setGravityScale(0);
    
    //Assigning UserData to this body
    body.setUserData(this);
  }

  void display () {
    
    Vec2 pos = box2d.getBodyPixelCoord(body);
    fill(175);
    stroke(0);
    ellipse (pos.x, pos.y, r, r);
    
    //Constraining Velocity
    if (body.getLinearVelocity().length() > maxSpeed) {
      Vec2 aux = new Vec2 (body.getLinearVelocity());
      aux.normalize();
      aux.mulLocal(maxSpeed);
      body.setLinearVelocity(aux);
    }
  }

  public void update () {
    
    Vec2 pos = body.getWorldCenter();
    Vec2 force = new Vec2 (box2d.coordPixelsToWorld(velocity.x, velocity.y));
    body.applyForce (force, pos);

    // Velocity changes according to acceleration
    //velocity.add(acceleration);
    // Limit the velocity by topspeed
    //velocity.limit(topspeed);
    // position changes by velocity
    //position.add(velocity);
  }
}