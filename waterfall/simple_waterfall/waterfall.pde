// Waterfall 
// Author: David Vitt


class Waterfall{
  int x,y;
  int dropy;
  int a_y;
  int v_y;
  int drop_size;
  int fill_color;
  int water_height=height/9;
  
  // init waterfall
  Waterfall() {
    x = width/2;
    y = water_height;
  }
  
  // Render the droplet
  void render(){
    stroke(0,0,200-random(100));
    fill(random(20),random(20), fill_color);
    circle(x,y,drop_size);
  }

  // fall a single step 
  void fall(){
    
    //Accel
    a_y = 1;
    
    // velocity of
    v_y += a_y;
     
     // y position
     y += v_y; 
     
     // If you go below screen, reset new drop
     if (y >= height){
       v_y = 0;
       y = water_height - int(random(10));
       x = width/2 + int(random(-width/5, width/5));
       drop_size = int(random(10));
       fill_color = 200 - int(random(150));
     }
  
  }
  
}
