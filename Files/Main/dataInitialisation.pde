void dataInit()
{
  textFont(menuFont,50);
  String[] menuNames = {"Play","High Scores","Achievements","Options",};
  
  for(int i=0;i<menuNames.length;i++)
  {
    float optionX = (width/3)-textWidth(menuNames[i]);
    float optionY = (height/3)+((textDescent()+textAscent())*i);
    menuOpt o = new menuOpt(menuNames[i],optionX,optionY);
    menuOptions.add(o);
    
  }
  
  Table t = loadTable("maps.csv","header");
  
  for(TableRow row:t.rows())
  {
     map m = new map(row);
     maps.add(m);
  }
  
  Table t2 = loadTable("rounds.csv","header");
  
  for(TableRow row:t2.rows())
  {
    round r = new round(row);
    rounds.add(r);
  }
  
}

void roundData()
{
  if(basics.size() < rounds.get(currentRound).basic && frameCount % 60 == 0)
  {
    enemy b = new basic();
    enemies.add(b);
  }

  if(heavys.size() < rounds.get(currentRound).heavy && frameCount % 90 == 0)
  {
    enemy h = new heavy();
    enemies.add(h);
  }  
  
  if(fasts.size() < rounds.get(currentRound).fast && frameCount % 120 == 0)
  {
    enemy f = new fast();
    enemies.add(f);
  }    
}

void towerType()
{
  cannon c = new cannon();
  towerMenu.add(c);
  
  AOE a = new AOE();
  towerMenu.add(a);
  
  rocket r = new rocket();
  towerMenu.add(r);
  
  sniper s = new sniper();
  towerMenu.add(s);
  
}