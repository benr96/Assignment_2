class basic extends enemy
{
  
  basic()
  {
    
    for(int i=0;i<maps.size();i++)
    {
      if(maps.get(i).name.equals(selectedMap)) 
      {
        pos1 = new PVector(maps.get(i).points.get(0).x,maps.get(i).points.get(0).y);
      }
    }
    
    dest1 = new PVector(0,0);
    speed = 0;
    entityColour = color(255,0,0);
    entityWidth = 50;
    entityHeight = 50;
  }
  void drawEnemy()
  {
    fill(255,0,0);
    stroke(0,255,0);
    
    rect(pos1.x,pos1.y,entityWidth,entityHeight);
  }
}