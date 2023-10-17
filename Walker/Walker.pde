// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// A random walker object!

class Walker1 {
  int x,y;

  Walker1() {
    x = width/2;
    y = height/2;
  }

  void render() {
    stroke(255);
    point(x,y);
  }

  // Randomly move to any neighboring pixel (or stay in the same spot)
  void step() {
    int stepx = int(random(10))-1;
    int stepy = int(random(3))-1; 
    if (x >= width*0.75){
      stepx = stepx - 3;
    }
    if (x >= width * 0.85){
      stepx = stepx - width/2;
    }
    
    x += stepx;
    y += stepy;
    x = constrain(x,0,width-1);
    y = constrain(y,0,height-1);
  }
}
