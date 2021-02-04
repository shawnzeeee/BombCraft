
class FGrassBlock extends FBox{
  float x,y;
  int i;
  boolean spawn;
 FGrassBlock(float _x, float _y, int _i){
   super(gridSize,gridSize);
   x = _x * gridSize;
   y = _y * gridSize;
   i = _i;
   spawn = false;
   this.setPosition(_x * gridSize, _y * gridSize);
   this.setFillColor(#089512);
   this.setStatic(true);
   this.setStrokeColor(#089512);
   this.setName("grassBlock");
   this.setGrabbable(false);
   world.add(this);
   println( "  " + "  " + x + "  " + y);
 }
 
 void act(){
  
   
   int i = 0;
   while ( i < bomb.size()){
    FBomb b = bomb.get(i);
     if(b.timer <= 1 && dist(x, y , b.getX() , b.getY() )<100 && spawn == false){
       item.add(new FItem(x,y-gridSize, "grass",item.size()));
       world.remove(this);
       spawn = true;
      }
      i += 1;
   }
   
 }
}
void GrassBlockAct(){
   int i = 0;
   while(i < grassBlock.size()){
    FGrassBlock b = grassBlock.get(i);
    b.act();
    i += 1;
   }

}

class FDirtBlock extends FBox{
  float x, y;
  boolean spawn;
 FDirtBlock(float _x, float _y, int _i){
    super(gridSize, gridSize); 
    x = _x * gridSize;
    y = _y * gridSize;
    spawn = false;
    this.setPosition(x,y);
    this.setStatic(true);
    this.setStrokeColor(#9B5013);
    this.setFillColor(#9B5013);
    this.setName("dirtBlock");
       this.setGrabbable(false);
    world.add(this);
 }
  void act(){
    int i = 0;
    while (i < bomb.size()){
     FBomb b = bomb.get(i);
     if(b.timer <= 10 && dist(x, y , b.getX() , b.getY() )<100 && spawn == false){
       item.add(new FItem(x,y-gridSize, "dirt",item.size()));  
       spawn = true;
       world.remove(this);
      }
      i += 1;
    }
  }
  
}
void DirtBlockAct(){
 int i = 0;
 while (i < dirtBlock.size()){
   FDirtBlock b = dirtBlock.get(i);
   b.act();
   i += 1;
 }
}

class FStoneBlock extends FBox{
  float x,y;
  boolean spawn;
 FStoneBlock(float _x, float _y, int _i){
  super(gridSize, gridSize); 
    x = _x * gridSize;
    y = _y * gridSize;
    spawn = false;
    this.setPosition(x,y);
    this.setStatic(true);
    this.setStrokeColor(#797471);
    this.setFillColor(#797471);
    this.setName("stoneBlock");
       this.setGrabbable(false);
    world.add(this);
 }
  void act(){
    int i = 0;
    while (i < bomb.size()){
     FBomb b = bomb.get(i);
     if(b.timer <= 10 && dist(x, y , b.getX() , b.getY() )<50 && spawn == false){
       item.add(new FItem(x,y-gridSize, "stone",item.size()));
       spawn = true;
       world.remove(this);
      }
      i += 1;
    }
  }
}
void StoneBlockAct(){
 int i = 0;
 while (i < stoneBlock.size()){
   FStoneBlock b = stoneBlock.get(i);
   b.act();
   i += 1;
 }
}
class FDiamondOreBlock extends FBox{
  float x,y;
  boolean spawn;  
  PImage img;
  FDiamondOreBlock(float _x, float _y, int _i){
    super(gridSize, gridSize);
    x = _x * gridSize;
    y = _y * gridSize;
    spawn = false;
    img = loadImage("diamond_ore.png");
   img.resize((int)gridSize, (int)gridSize);
    this.setPosition(x,y);
    this.setStatic(true);
    this.setName("diamondBlock");
    this.setGrabbable(false);
    world.add(this);    
  }
  
  void act(){
    this.attachImage(img);
    int i = 0;
    while (i < bomb.size()){
     FBomb b = bomb.get(i);
     if(b.timer <= 10 && dist(x, y , b.getX() , b.getY() )<50 && spawn == false){
       item.add(new FItem(x,y-gridSize, "diamond",item.size()));
       spawn = true;
       world.remove(this);
      }
      i += 1;
    }
  }
}
void DiamondBlockAct(){
 int i = 0;
 while (i < diamondOreBlock.size()){
   FDiamondOreBlock b = diamondOreBlock.get(i);
   b.act();
   i += 1;
 }
}
class FIronOreBlock extends FBox{
  float x,y;
  boolean spawn;  
  PImage img;
  FIronOreBlock(float _x, float _y, int _i){
    super(gridSize, gridSize);
    x = _x * gridSize;
    y = _y * gridSize;
    spawn = false;
    img = loadImage("iron_ore.png");
   img.resize((int)gridSize, (int)gridSize);
    this.setPosition(x,y);
    this.setStatic(true);
    this.setName("ironBlock");
    this.setGrabbable(false);
    world.add(this);    
  }
  
  void act(){
    this.attachImage(img);
    int i = 0;
    while (i < bomb.size()){
     FBomb b = bomb.get(i);
     if(b.timer <= 10 && dist(x, y , b.getX() , b.getY() )<50 && spawn == false){
       item.add(new FItem(x,y-gridSize, "iron",item.size()));
       spawn = true;
       world.remove(this);
      }
      i += 1;
    }
  }
}
void IronBlockAct(){
 int i = 0;
 while (i < ironOreBlock.size()){
   FIronOreBlock b = ironOreBlock.get(i);
   b.act();
   i += 1;
 }
}
class FCoalOreBlock extends FBox{
  float x,y;
  boolean spawn;  
  PImage img;
  FCoalOreBlock(float _x, float _y, int _i){
    super(gridSize, gridSize);
    x = _x * gridSize;
    y = _y * gridSize;
    spawn = false;
    img = loadImage("coal_ore.png");
   img.resize((int)gridSize, (int)gridSize);
    this.setPosition(x,y);
    this.setStatic(true);
    this.setName("coalBlock");
    this.setGrabbable(false);
    world.add(this);    
  }
  
  void act(){
    this.attachImage(img);
    int i = 0;
    while (i < bomb.size()){
     FBomb b = bomb.get(i);
     if(b.timer <= 10 && dist(x, y , b.getX() , b.getY() )<50 && spawn == false){
       item.add(new FItem(x,y-gridSize, "coal",item.size()));
       spawn = true;
       world.remove(this);
      }
      i += 1;
    }
  }
}
void CoalBlockAct(){
 int i = 0;
 while (i < coalOreBlock.size()){
   FCoalOreBlock b = coalOreBlock.get(i);
   b.act();
   i += 1;
 }
}
class FBedRockBlock extends FBox{
  float x,y;
  boolean spawn;
 FBedRockBlock(float _x, float _y, int _i){
  super(gridSize, gridSize); 
    x = _x * gridSize;
    y = _y * gridSize;
    spawn = false;
    this.setPosition(x,y);
    this.setStatic(true);
    this.setStrokeColor(#141415);
    this.setFillColor(#141415);
    this.setName("bedRockBlock");
    this.setGrabbable(false);
    world.add(this);
 }
  void act(){
  }
}
void BedRockBlockAct(){
 int i = 0;
 while (i < bedRockBlock.size()){
   FBedRockBlock b = bedRockBlock.get(i);
   b.act();
   i += 1;
 }
}

class FWaterBlock extends FBox{
  float x,y;
  boolean spawn;
 FWaterBlock(float _x, float _y, int _i){
  super(gridSize, gridSize); 
    x = _x * gridSize;
    y = _y * gridSize;
    spawn = false;
    this.setPosition(x,y);
    this.setStatic(true);
    this.setStrokeColor(#000AFA);
    this.setFillColor(#000AFA);
    this.setSensor(true);
    this.setName("waterBlock");
       this.setGrabbable(false);
    world.add(this);
 }
  void act(){

  }
}
void WaterBlockAct(){
 int i = 0;
 while (i < waterBlock.size()){
   FWaterBlock b = waterBlock.get(i);
   b.act();
   i += 1;
 }
}
class FSpringBlock extends FBox{
  float x,y;
  boolean spawn;
  PImage img;
 FSpringBlock(float _x, float _y, int _i){
  super(gridSize, gridSize); 
    x = _x * gridSize;
    y = _y * gridSize;
    img = loadImage("spring.png");
    img.resize((int)gridSize, (int)gridSize);
    spawn = false;
    this.setPosition(x,y);
    this.setStatic(true);
    this.setStrokeColor(#141415);
    this.setFillColor(#141415);
    this.setName("springBlock");
       this.setGrabbable(false);
    world.add(this);
 }
  void act(){
    this.attachImage(img);
  }
}
void SpringBlockAct(){
 int i = 0;
 while (i < springBlock.size()){
   FSpringBlock b = springBlock.get(i);
   b.act();
   i += 1;
 }
}

class FOakWoodBlock extends FBox{
  float x,y;
  boolean spawn;
 FOakWoodBlock(float _x, float _y){
    super(gridSize,gridSize);
    x = _x * gridSize;
    y = _y * gridSize;
    spawn = false;
    this.setPosition(x,y);
    this.setStatic(true);
    this.setSensor(false);
    this.setStrokeColor(#5F2727);
    this.setFillColor(#5F2727);
    this.setName("oakWoodBlock");
    this.setGrabbable(false);
    world.add(this); 
   
 }
  void act(){
    
    int i = 0;
    while (i < bomb.size()){
     FBomb b = bomb.get(i);
     if(b.timer <= 10 && dist(x, y , b.getX() , b.getY() )<50 && spawn == false){
       item.add(new FItem(x,y-gridSize, "oakWood",item.size()));
       spawn = true;
       world.remove(this);
      }
      i += 1;
    }    
  }
  
}