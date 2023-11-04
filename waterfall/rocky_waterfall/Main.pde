// Rocky Water Fall
// Author: David Vitt

// TODO: Add more rocks

Waterfall w;
Waterfall w2;
Waterfall w3;
Waterfall w4;
Waterfall w5;
Waterfall w6;

int size = 400;

// Rock description
int rock_width = 200;
int rock_height = 20;
int rock_x=size/2 - rock_width/2;
int rock_y=size-40;

void setup(){
  size(400, 400);

  // create the first instance of a waterfall
  w = new Waterfall();
  w2 = new Waterfall();
  w3 = new Waterfall();
  w4 = new Waterfall();
  w5 = new Waterfall();
  w6 = new Waterfall();
  
  w.add_rock(rock_x, rock_y, rock_width, rock_height);
  
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
  w3.fall();
  w3.render();
  w4.fall();
  w4.render();
  w5.fall();
  w5.render();
  w6.fall();
  w6.render();
}
