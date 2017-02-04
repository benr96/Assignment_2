class AOE extends tower
{
  float pulse;
  
  AOE()
  {
    super();
    damage = 70;
    rateOfFire = 0.5;
    towerColour = color(0,255,255);
    range = 100;
    pulse = towerWidth/2;
    price = 120;
  }
  
  void drawTower()
  {
    stroke(towerColour);
    noFill();
    strokeWeight(3);
    
    ellipse(pos.x,pos.y,towerWidth,towerHeight);
    ellipse(pos.x,pos.y,towerWidth/2,towerHeight/2);
    
    if(placing == true && pos.x > menuWidth || clicked == true)
    {
      strokeWeight(1);
      ellipse(pos.x,pos.y,range*2,range*2);
    } 
  }
  
  void fire()
  {
    ArrayList<enemy> inRange = rangeCheck(this);
    
    if(inRange != null)
    {
      if(millis()-timeDamage >= 1000/rateOfFire)
      {
        timeDamage = millis();
        drawShot = true;
        for(int i=0;i<inRange.size();i++)
        {
          inRange.get(i).takeDamage(damage); 
        }
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
          
        } 
      }
    }
    else
    {
      pulse = lerp(pulse,towerWidth/2,0.1);  
    }
  }
}