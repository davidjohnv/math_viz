// Water Fall
// Author: David Vitt

Waterfall w; 
Waterfall w2;

void setup(){
  size(400, 400);
  
  // create the first instance of a waterfall
  w = new Waterfall();
  w2 = new Waterfall();
  background(255);
  
}

void draw(){
  // run the waterfall object
  w.fall();
  w.render();
  w2.fall();
  w2.render();
}
