// Rocky Water Fall
// Author: David Vitt

Waterfall w; 
Waterfall w2;

int size = 400;

// Rock description
int rock_width = 100;
int rock_height = 20;
int rock_x=size/2 - rock_width/2;
int rock_y=size-40;

void setup(){
  size(400, 400);
  
  // create the first instance of a waterfall
  w = new Waterfall();
  w2 = new Waterfall();
  background(255);
  
  // Draw Rock
  rect(rock_x, rock_y, rock_width, rock_height);
  
}

void draw(){
  // run the waterfall object
  w.fall();
  w.render();
  w2.fall();
  w2.render();
}
