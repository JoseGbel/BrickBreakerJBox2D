class CollisionListener {

  CollisionListener () {

    box2d.listenForCollisions();
  }



  void beginContact (Contact c) {
    //Get fixtures colliding
    Fixture f1= c.getFixtureA();
    Fixture f2= c.getFixtureB();

    //Get bodies attached to those fixtures
    Body b1 = f1.getBody();
    Body b2 = f2.getBody();

    //Get object attached to those bodies
    Object o1 = b1.getUserData();
    Object o2 = b2.getUserData();

    //Compare class of the object colliding and delete the brick
    if (o1.getClass() == Brick.class && o2.getClass() == Ball.class) {
      Brick brick = (Brick)o1;

      //if brick is a regular brick, remove a life or remove the brick
      if (!brick.isAidBox) {
        if (brick.life == 0)
          brick.delete();
        else { 
          brick.life--;
          brick.brickColor = color(0, brick.life*50, 205);
        }
        
      //If the brick hit is an aidbox...
      } else {
        
        //Create an aidBox object and delete the brick
        //DEBUGGING!!!!! ASSERTION ERROR
        //This call at the constructor crashes the game when creating a Body for box2d
        println(brick.body.getPosition() + " type " + brick.aidBoxType);
        //Comenting this line and the mirror line to this code bellow will execute the game correctly.
        aidBox = new AidBox (brick.body.getPosition(), brick.aidBoxType); 
        aidBoxes.add(aidBox);
        brick.delete();
      }
    }
    //MIRROR CODE
    //The next code is the viceversa code in case o1 and o2 were switched
    if (o1.getClass() == Ball.class && o2.getClass() == Brick.class) {

      Brick brick = (Brick)o2;

      if (!brick.isAidBox) {

        if (brick.life == 0)
          brick.delete();
        else { 
          brick.life--;
          brick.brickColor = color(0, brick.life*50, 205);
        }
      } else {
        println(brick.body.getPosition() + " type " + brick.aidBoxType); //Debugging
        
        //This call at the constructor crashes the game when creating a Body for box2d
        aidBox = new AidBox (brick.body.getPosition(), brick.aidBoxType); 
        aidBoxes.add(aidBox);
        brick.delete();
      }
    }
  }

  void endContact(Contact c) {
  }
  
}