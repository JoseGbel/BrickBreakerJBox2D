/**********************

The idea for this class in the future is to implement methods for location awareness. For example if the ball Hits any brick in the wall
whereever its position, there will be methods that returns the position of the last element in the brick´s row. 

Future updates will display circular arc shaped walls rotating around the screen.

****************************/

class Wall {
  int size; 
  ArrayList<Brick> bricks;

  Wall (int s) {
    int offSet = 0;
    int rows = int(random(6)+4);
    int brickWidth = 40;
    int brickHeight = 10;
    int centerX = width/2;
    int northBoundSeparation = 30;
    size = s;
    boolean endOfRow; 
    bricks = new ArrayList<Brick>();

    for (int j = 1, refNumber = 0; j <= rows; j++) {
      endOfRow = false;
      for (int i = 0; !endOfRow; i++) {    
        bricks.add(new Brick(new PVector (centerX + (i * (brickWidth + offSet)), northBoundSeparation + j * (brickHeight + offSet)), 
          brickWidth, brickHeight, refNumber));
        refNumber++;
        bricks.add(new Brick(new PVector (centerX - (i * (brickWidth + offSet)), northBoundSeparation + j * (brickHeight + offSet)), 
          brickWidth, brickHeight, refNumber));
        refNumber++;
        if (width - (centerX + (i * (brickWidth + offSet))) < random(1, 6)*brickWidth)
          endOfRow = true;
      }
    }
  }


  void display() {
    //for (Brick b : bricks) {
    //  b.display();
    // // b.checkCollision(ball);
    //}
    for (int i = bricks.size()-1; i >= 0; i--) {
      Brick b = bricks.get(i);
      b.display();
      // Bricks that collide with the ball, we delete them
      // (note they have to be deleted from both the box2d world and our list
      if (b.done()) {
        bricks.remove(i);
      }
    }
  }
  
  float getLastBrickInRowCoord (Brick brick){
    return 0;
    
  }
} 