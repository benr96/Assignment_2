class AOE extends tower
{
  float pulse;
  
  AOE()
  {
    super();
    damage = 50;
    rateOfFire = 2;
    towerColour = color(0,255,255);
    towerWidth = 50;
    towerHeight = 50;
    range = 100;
    pulse = towerWidth/2;
  }
  
  void drawTower()
  {
    stroke(towerColour);
    noFill();
    strokeWeight(3);
    
    ellipse(pos.x,pos.y,towerWidth,towerHeight);
    ellipse(pos.x,pos.y,towerWidth/2,towerHeight/2);
  }
  
  void fire()
  {
    ArrayList<enemy> inRange = rangeCheck(this);
    
    if(inRange != null)
    {
      if(millis()-timeDamage >= rateOfFire*1000)
      {
        timeDamage = millis();
        drawShot = true;
      }
      
      if(drawShot == true)
      {
        stroke(towerColour);
        strokeWeight(2);
        pulse = lerp(pulse,range*2,0.1);
        ellipse(pos.x,pos.y,pulse,pulse);
      
        if(pulse > (range*2)-1)
        {
          pulse = towerWidth/2;
          drawShot = false;
          for(int i=0;i<inRange.size();i++)
          {
            inRange.get(i).takeDamage(damage); 
          }
        } 
      }
 
    }
    else
    {
        pulse = towerWidth/2;  
    }
  }
}