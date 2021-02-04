float x,y;
float yoff;
int count = 0;
boolean start;
boolean spawnWater = false, deepWater;
boolean spawnSpring;
int waterChance, waterCount = 0;
int oreChance;
float grassy, dirty, stoney;
float grassyoff = random(1,10), dirtyoff =  random(1,10), stoneyoff =  random(1,10);
void GenerateMap(){
 while ( x < 100){
  if (start == false){
   if (spawnWater == false){
    grassyoff += 0.1;
    grassy = round(noise(grassyoff)*12);
    if((int)random(1,10) == 5){
     springBlock.add(new FSpringBlock(x,grassy-1,springBlock.size())); 
    }
    waterChance = round(random(1,20));
     if (waterChance == 5){
       spawnWater = true;
       if (round(random(1,3)) == 1){
         deepWater = true;
       }else deepWater = false;
     }
   }
   else{
    waterCount += 1; 
   }
   dirtyoff += 0.15;
   dirty = round(noise(dirtyoff)*grassy);
   stoneyoff += 0.7;
   stoney = round(noise(stoneyoff)*dirty+5);
   

   y = grassy;
    if (x == 50){
     spawnPointX = x;
     spawnPointY = y-2;
    }
   if (waterCount > round(random(5,10))){
    waterCount = 0;
    spawnWater = false; 
    deepWater = false;
   }
   start = true;
  }
   if (y < grassy + (abs(dirty - grassy))){
    if (spawnWater == false){
      grassBlock.add(new FGrassBlock(x,y,grassBlock.size()));
    } else{
     waterBlock.add(new FWaterBlock(x,y+1,waterBlock.size())); 
    }
    y += 1;
   }else{
    if (y < grassy + dirty + stoney){
     if (spawnWater == false){
      dirtBlock.add(new FDirtBlock(x,y, dirtBlock.size()));       
     }
     else{
      if (deepWater == true) waterBlock.add(new FWaterBlock(x,y,waterBlock.size())); 
      else  dirtBlock.add(new FDirtBlock(x,y, dirtBlock.size()));   
     }
     y += 1;
    }else{
     if(y < 24){
      oreChance = (int)random(1,100);
      if(oreChance > 0 && oreChance < 5){
       coalOreBlock.add(new FCoalOreBlock(x,y,coalOreBlock.size()));         
      }else{
       if (oreChance >= 10 && oreChance < 12){
        ironOreBlock.add(new FIronOreBlock(x,y,ironOreBlock.size()));           
       }else{
        if (oreChance ==  25 && y > 20){
         diamondOreBlock.add(new FDiamondOreBlock(x,y,diamondOreBlock.size())); 
        }else{
          stoneBlock.add(new FStoneBlock(x,y,stoneBlock.size()));
        }         
       }
      }
      y += 1;
     }
     else{
     if (y <= 25){
      bedRockBlock.add(new FBedRockBlock(x,y,bedRockBlock.size()));
      y += 5;
     }else{
      x += 1;
      start = false;
      }
     }
    }
   }
   
 }
 
  
  
}