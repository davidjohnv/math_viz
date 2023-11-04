// Rock Class
// Author: David Vitt

class Rock{
  
  
  Rock(int rock_x, int rock_y, int rock_width, int rock_height){
  rect(rock_x, rock_y, rock_width, rock_height);
  }
  
  
boolean collision(int x, int y){
  
  if (((y >= rock_y) && (x >= rock_x))&&(x<= rock_x + rock_width)){
    return true;
  }else{
    return false;
  }
  }
 
}
