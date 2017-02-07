class cannon extends tower
{  
  cannon()
  {
    super();
    damage = 20;
    rateOfFire = 1;
    towerColour = color(255,0,255);
    range = width/8;
    priority = "Heavy";
    price = 100;
  }
  
  void drawTower()
  {
    pushMatrix();
    translate(pos.x,pos.y);
      
    if(target != null)
    {
      theta = degrees(atan2(target.curr.x+target.source.x-pos.x,target.curr.y+target.source.y-pos.y));   
    }
    else
    {
      theta = lerp(theta,0,0.1); 
    }
    
    rotate(-radians(theta-90));
      
    stroke(towerColour);
    noFill();
    strokeWeight(3);
      
    ellipse(0,0,towerWidth,towerHeight);
    triangle(towerWidth/4,0,-towerWidth/4,towerHeight/4,-towerWidth/4,-towerHeight/4);  
    
    if(pos.x > menuWidth && clicked == true)
    {
      strokeWeight(1);
      ellipse(0,0,range*2,range*2);
    } 
    
    popMatrix();
  }
  
  void fire()
  {
    ArrayList<enemy> inRange = rangeCheck(pos,range);
    
    if(inRange != null )
    {
      super.choose(inRange);
     
      if(millis()-timeDamage >= 1000/rateOfFire && target != null && placing == false)  
      {    
        target.takeDamage(damage);
        timeDamage = millis();
        drawShot = true;
      } 
      
      if(drawShot == true)
      {
        pushMatrix();
        translate(target.source.x,target.source.y);
        strokeWeight(5);
        stroke(255,0,0);
        line(pos.x-target.source.x,pos.y-target.source.y,target.curr.x,target.curr.y);
        popMatrix();
        
        if(millis()-timeDraw > (1000/rateOfFire)/3)
        {
          drawShot = false;
          timeDraw = millis();
        } 
      }
    }
    else
    {
     target = null; 
    }
  }
}