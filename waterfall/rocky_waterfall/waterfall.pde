// Waterfall 
// Author: David Vitt


class Waterfall{
  int x,y;
  int dropy;
  int a_y;
  float v_y, v_x=0;
  int drop_size;
  int r, g, b;
  int water_height=height/9;
  
  // init waterfall
  Waterfall() {
    x = width/2;
    y = water_height;
    r=int(random(20));
    g=int(200-random(100));
    b=int(200-random(200));
    constrain(g, 0, b);
  }
  
  // Render the droplet
  void render(){
    
    
    stroke(r,g,b);
    fill(r,g,b);
    circle(x,y,drop_size);
  }

  // fall a single step 
  void fall(){
    
    //Accel
    a_y = 1;
    
    // velocity of
    v_y += a_y;
     
     // Rock Bounce handeling
    
     // If the droplet is lower than the rock and between the rock x
     if (((y >= rock_y) && (x >= rock_x))&&(x<= rock_x + rock_width)){
       
       // If there is not x velocity, add some random
       if (v_x == 0){
         v_x = int(random(-5,5));
       }
       v_y = -v_y*random(0.25,0.9);
     }else{
     
       // If you go below screen, reset new drop
       if (y >= height){
         v_y = 0;
         v_x = 0;
         y = water_height - int(random(10));
         x = width/2 + int(random(-width/5, width/5));
         drop_size = int(random(10));
         r=int(random(20));
         g=int(200-random(100));
         b=int(200-random(200));
     }
    }
 
     // Update position
     y += v_y; 
     x += v_x;
  }
  
}
