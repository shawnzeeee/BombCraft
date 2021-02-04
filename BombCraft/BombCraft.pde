import fisica.*;
FWorld world;
float gridSize;
float dx,dy;
boolean wkey, akey, skey, dkey, fkey;
boolean onekey,twokey,threekey,fourkey,fivekey,sixkey,sevenkey,eightkey,ninekey;
boolean jump = false;
float spawnPointX;
float spawnPointY;
boolean fpressed = false;
boolean clicked;
  PImage [] currentAction;
  PImage []run, leftRun;
  PImage []idle ,leftIdle;
  PImage[] jumping, leftJumping;
  PImage []placeItem, leftplaceItem;
  int costumeNum;
  String direction = "right";
  FBox player;
  Hotbar[] hotbar;
  int hotBarX = 175, hotBarY = height - 100;;
  ArrayList<FBomb> bomb = null;
  ArrayList<FGrassBlock> grassBlock;
  ArrayList<FDirtBlock> dirtBlock;
  ArrayList<FStoneBlock> stoneBlock;
  ArrayList<FDiamondOreBlock> diamondOreBlock;
  ArrayList<FIronOreBlock> ironOreBlock;
  ArrayList<FCoalOreBlock> coalOreBlock;
  ArrayList<FBedRockBlock> bedRockBlock;
  ArrayList<FWaterBlock> waterBlock;
  ArrayList<FSpringBlock> springBlock;
  ArrayList<FOakWoodBlock> oakWoodBlock;
  ArrayList<FZombie> zombie;
  ArrayList<FItem> item = null;
  int n;
  int maxItem;
  float  mouseCoordX, mouseCoordY;
  int selected;
void setup(){
  size(800,600);
  costumeNum = 0;
  clicked = false;
  n = 9;
  maxItem = 32;
  hotbar = new Hotbar[n];
  bomb = new ArrayList<FBomb>();
  grassBlock = new ArrayList<FGrassBlock>();
  dirtBlock = new ArrayList<FDirtBlock>();
  stoneBlock = new ArrayList<FStoneBlock>();
  diamondOreBlock = new ArrayList<FDiamondOreBlock>();
  ironOreBlock = new ArrayList<FIronOreBlock>();
  coalOreBlock = new ArrayList<FCoalOreBlock>();
  bedRockBlock = new ArrayList<FBedRockBlock>();
  waterBlock = new ArrayList<FWaterBlock>();
  springBlock = new ArrayList<FSpringBlock>();
  oakWoodBlock = new ArrayList<FOakWoodBlock>();
  zombie = new ArrayList<FZombie>();
  item = new ArrayList<FItem>();
  run = new PImage [6];
  idle = new PImage[1];
  jumping = new PImage[1];
  placeItem = new PImage[4];
  leftRun = new PImage[6];
  leftIdle = new PImage[1];
  leftplaceItem = new PImage[4];
  leftJumping = new PImage[1];
  runAnimation();
  idleAnimation();
  jumpingAnimation();
  placeItemAnimation();
  currentAction = idle;
  gridSize = 32;
  Fisica.init(this);
  world = new FWorld(0,0,10000,20000);
  world.setGravity(0,1000);
  x = 0;
  y = 0;
  start = false;
  yoff = random(1,10);
 GenerateMap();
 player = new FBox(25,25);
 player.setStrokeWeight(0);
 player.setPosition(spawnPointX * gridSize,spawnPointY * gridSize);
 player.setFillColor(#FF0307);
 player.setStatic(false);
 player.setRotatable(false);
 for(int i = 0; i < n; i += 1){
  hotbar[i] = new Hotbar(hotBarX, hotBarY, i);
  hotBarX += 50;
 }
 world.add(player);
}

void draw(){
  background(#42CDF2);
  textSize(50);
//  println(selected);
  if (!mousePressed){
   clicked = false; 
  }
  GrassBlockAct();
  DirtBlockAct();
  StoneBlockAct();
  DiamondBlockAct();
  IronBlockAct();
  CoalBlockAct();
  BedRockBlockAct();
  WaterBlockAct();
  SpringBlockAct();
  BombAct();
  ItemAct();
  ItemSelection();
  PlaceItem();
  Player();
  
  mouseCoordX = round((player.getX()+(mouseX-width/2))/gridSize);
  mouseCoordY = round((player.getY() +(mouseY-height/2))/gridSize);

 pushMatrix();
 translate(-player.getX()+width/2, -player.getY()+height/2);
 translate(-mouseX+width/2, -mouseY+height/2);
   //translate(-mouseX+width/2,-mouseY+height/2);
  world.step();
  world.draw();
  popMatrix();
  for(int i = 0;i < n;i += 1){
   Hotbar h = hotbar[i];
   h.show();
   h.act();
  }
}

void keyPressed(){
 if (key == 'w' || key == 'W'){
   wkey = true;
 }
 if (key == 's' || key == 'S'){
   skey = true; 
 }
 if (key == 'd' || key == 'D'){
   dkey = true;
 }
 if (key == 'a' || key == 'A'){
  akey = true; 
 }
 if (key == 'f' || key == 'F'){
  fkey = true; 
 }
 if (keyCode == '1'){
   onekey = true;
 }
 if (keyCode == '2'){
   twokey = true;
 }
 if (keyCode == '3'){
   threekey = true;
 }
 if (keyCode == '4'){
   fourkey = true;
 }
 if (keyCode == '5'){
   fivekey = true;
 }
 if (keyCode == '6'){
   sixkey = true;
 }
 if (keyCode == '7'){
   sevenkey = true;
 }
 if (keyCode == '8'){
   eightkey = true;
 }
 if (keyCode == '9'){
   ninekey = true;
 }
}
void keyReleased(){
 if (key == 'w' || key == 'W'){
   wkey = false;
 }
 if (key == 's' || key == 'S'){
   skey = false; 
 }
 if (key == 'd' || key == 'D'){
   dkey = false;
 }
 if (key == 'a' || key == 'A'){
  akey = false; 
 }
 if (key == 'f' || key == 'F'){
  fkey = false; 
 }  
 if (keyCode == '1'){
   onekey = false;
 }
 if (keyCode == '2'){
   twokey = false;
 }
 if (keyCode == '3'){
   threekey = false;
 }
 if (keyCode == '4'){
   fourkey = false;
 }
 if (keyCode == '5'){
   fivekey = false;
 }
 if (keyCode == '6'){
   sixkey = false;
 }
 if (keyCode == '7'){
   sevenkey = false;
 }
 if (keyCode == '8'){
   eightkey = false;
 }
 if (keyCode == '9'){
   ninekey = false;
 }
}