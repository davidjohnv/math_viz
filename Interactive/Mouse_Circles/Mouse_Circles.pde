// Mouse Cirles
// Author: David Vitt

// This project is playing around with interactions that the mouse can do within processing

int radius=20;

void setup(){
 size(500, 500);
 
 background(0);
  
}


void draw(){
 
  if (mousePressed == true){
   
   background(0);
   circle(pmouseX, pmouseY, radius);
  
  }
  
   //while (mousePressed == true){1
   //radius +=10;
   //}

}
