// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

Walker1 w;

void setup() {
  size(200,200);
  // Create a walker object
  w = new Walker1();
  background(0);
}

void draw() {
  // Run the walker object
  w.step();
  w.render();
}
