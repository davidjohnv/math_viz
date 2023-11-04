// Waterfall 
// Author: David Vitt


Rock r1;

class Waterfall{
  int x,y;
  int dropy;
  int a_y;
  float v_y, v_x=0;
  int drop_size;
  int r, g, b;
  int water_height=height/9;
  
  //r1= new Rock(rock_1_x, rock_1_y, rock_1_width, rock_1_height);
  // r2 = new Rock();
  
  // init waterfall
  Waterfall() {
    x = width/2;
    y = water_height;
    r=int(random(20));
    g=int(200-random(100));
    b=int(200-random(200));
    constrain(g, 0, b);
  }
  
 void add_rock(int rock_1_width, int rock_1_height, int rock_1_x, int rock_1_y){
    r1 = new Rock(rock_1_width, rock_1_height, rock_1_x, rock_1_y);
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
     
     // Check to see if there is a collision with rock 1
      if (r1.collision(x,y)){
        
       // If there is not x velocity, add some random
       if (v_x == 0){
         v_x = int(random(-5,5));
       }
       
       // Bounce back up by inverting the velocity
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



// Old code to be deleted

 // If the droplet is lower than the rock and between the rock x
     //if (((y >= rock_y) && (x >= rock_x))&&(x<= rock_x + rock_width)){
       
     //  // If there is not x velocity, add some random
     //  if (v_x == 0){
     //    v_x = int(random(-5,5));
     //  }
     //  v_y = -v_y*random(0.25,0.9);
