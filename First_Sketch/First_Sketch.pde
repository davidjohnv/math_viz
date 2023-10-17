void setup() {
  size(480, 300);
}

void draw() {
  if (mousePressed) {
    fill(30);
  } else {
    fill(255);
  }
  ellipse(mouseX+10, mouseY, 40, 80);
}
