/*------------------------------------------------------*\
 |      Jose Garcia Brick Breaker with jBox2D - 2018      |
 | - - - - - - - - - - - - - - - - - - - - - - - - - - - -|                                                        
 |       This is my adaptation of this classic game       | 
 |                   using Proccesing.                    |
 |  Daniel Shiffman´s work inspired me for this project.  |
 |   Part of this code has been reused from his work on   |
 |  the Nature of Code, a serie of videos where Shiffman  |
 |          teaches how to code our real world.           |       
 \*------------------------------------------------------*/

import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;



Box2DProcessing box2d;
public Ball ball;
Pad pad;
Wall brickWall;
AidBox aidBox;
CollisionListener cs; 
Boundary eastBound, westBound, northBound, southBound;
ArrayList<AidBox> aidBoxes;


void setup () {
  size (640, 360);

  //creation of the Box2d world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();

  //Create a collision Listener Object to make the code more clear.
  //There are two fuctions after the draw() function that are
  //going to call this object
  cs = new CollisionListener();

  //Creation of the screen Objects
  ball = new Ball (); 
  pad = new Pad (); 
  brickWall = new Wall (6);
  eastBound = new Boundary (0, height/2, 10, height);
  westBound = new Boundary (width, height/2, 10, height);
  northBound = new Boundary (width/2, 0, width, 10);
  southBound = new Boundary (width/2, height, width, 10);

  //Temporary ArrayList of AidBox
  aidBoxes = new ArrayList<AidBox>();

  //REVISION NEEDED NEXT LINE
  ball.update();
}



void draw () {
  
  background (0);
  
  //Move to the next step in box2d
  box2d.step();
  
  //Update of the screen objects
  //ball.update();
  pad.update();

  //Display of the screen objects
  ball.display();
  pad.display();
  brickWall.display();
  eastBound.display();
  westBound.display();
  northBound.display();
  southBound.display();
  //Display AidBoxes
  for (AidBox a : aidBoxes)
    a.display();
}

void beginContact (Contact c) {
  cs.beginContact (c);
}


void endContact (Contact c) {
  cs.beginContact (c);
}