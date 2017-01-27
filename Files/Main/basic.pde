class basic extends enemy
{
  
  basic()
  {
    entityColour = color(255,0,0);
    entityWidth = 25;
    entityHeight = 25;
    speed = 3;
    health = 100;
  }
  
  void drawEnemy()
  {
    fill(255,0,0);
    stroke(0,255,0);
    
    pushMatrix();
    translate(source.x,source.y);
    ellipse(curr.x,curr.y,entityWidth,entityHeight);
    popMatrix();
  }
}