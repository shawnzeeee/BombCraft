int grassInv = 0;
boolean touchingWater;
void runAnimation(){
    run[0] = loadImage("terrariaSprites_7.png");
    run[1] = loadImage("terrariaSprites_8.png");
    run[2] = loadImage("terrariaSprites_9.png");
    run[3] = loadImage("terrariaSprites_10.png");
    run[4] = loadImage("terrariaSprites_11.png");
    run[5] = loadImage("terrariaSprites_12.png");
    leftRun[0] = reverse(run[0]);
    leftRun[1] = reverse(run[1]);
    leftRun[2] = reverse(run[2]);
    leftRun[3] = reverse(run[3]);
    leftRun[4] = reverse(run[4]);
    leftRun[5] = reverse(run[5]);
}
void idleAnimation(){
 idle[0] = loadImage ("terrariaSprites_1.png");
 leftIdle[0] = reverse(idle[0]);
}
void jumpingAnimation(){
 jumping[0] = loadImage("terrariaSprites_6.png");
 leftJumping[0] = reverse(jumping[0]);
}
void placeItemAnimation(){
  placeItem[0] = loadImage("terrariaSprites_2.png");
  placeItem[1] = loadImage("terrariaSprites_3.png");  
  placeItem[2] = loadImage("terrariaSprites_4.png");
  placeItem[3] = loadImage("terrariaSprites_5.png");
  leftplaceItem[0] = reverse(placeItem[0]);
  leftplaceItem[1] = reverse(placeItem[1]);
  leftplaceItem[2] = reverse(placeItem[2]);
  leftplaceItem[3] = reverse(placeItem[3]);
}
void Player(){
 // currentAction = new PImage[6];
 if (touchingWater == false){
 if(akey == true){
  dx = -200;
  direction = "left";
  if (jump == false)currentAction = leftRun;
 }
 if(dkey == true){
  dx = 200; 
  direction = "right";
  if (jump == false) currentAction = run;
 }
 if (akey == false && dkey == false){
  dx = 0; 
 }
 if(akey == false && dkey == false && jump == false && fkey == false && mousePressed == false){
  if (direction == "right")currentAction = idle;
  else currentAction = leftIdle;
 }
   playerCollisions();
 if (wkey == true && jump == false){
   dy = -250;
   jump = true;
 }
 if (jump == true){
   if (direction == "right") currentAction = jumping;
   else currentAction = leftJumping;
 }
 
 if (fkey == true && fpressed == false){
  if (direction == "right"){
    currentAction = placeItem;
    bomb.add(new FBomb(player.getX()+10, player.getY()-5, bomb.size()));
  }
  else{
    currentAction = leftplaceItem;
    bomb.add(new FBomb(player.getX()-10, player.getY()-5, bomb.size()));    
  }
  fpressed = true;
 }
 if (fkey == false){
  fpressed = false; 
 }
 dy += 10;
}
if (touchingWater == true){
 if(akey == true){
  dx = -100;
  direction = "left";
 }
 if(dkey == true){
  dx = 100;
  direction = "right";
 }
 if (akey == false && dkey == false){
  dx = 0; 
 }
 playerCollisions();
 if(wkey == true){
  dy = -100;  
 }else{
  dy = 100; 
 }
 if (direction == "right"){
  currentAction = jumping; 
 }
 if (direction == "left"){
  currentAction = leftJumping; 
 }
}
 player.setVelocity(dx,dy);
 
  if (costumeNum  >= currentAction.length){
  costumeNum = 0; 
 }
  player.attachImage(currentAction[costumeNum]);
 if (frameCount % 5 == 0){
  costumeNum += 1; 
 }
}
void playerCollisions(){
  ArrayList<FContact> playerContacts;
  playerContacts = player.getContacts();
  
  int i = 0;
  while (i < player.getContacts().size()){
    FContact object = playerContacts.get(i);
    if (object.contains ("grassBlock") || object.contains ("dirtBlock") || object.contains("stoneBlock") || object.contains("bedRockBlock") || object.contains("diamondBlock")|| object.contains("ironBlock") || object.contains("coalBlock")){
      dy = 0;
      jump = false;
    }
    if (object.contains("waterBlock")){
     touchingWater = true;
    }else touchingWater = false;
    i += 1;
    if(object.contains("springBlock")){
      dy = -300;
      jump = false;
    }
  }
  if (player.getContacts().size() == 0){
   touchingWater = false; 
  }
}
void ItemSelection(){
 if(onekey == true) selected = 0;
 if(twokey == true) selected = 1;
 if(threekey == true) selected = 2;
 if(fourkey == true) selected = 3;
 if(fivekey == true) selected = 4;
 if(sixkey == true) selected = 5;
 if(sevenkey == true) selected = 6;
 if(eightkey == true) selected = 7;
 if(ninekey == true) selected = 8;
}

void PlaceItem(){
  
 if (mousePressed && clicked == false){
   if (direction == "right") currentAction = placeItem;
   else currentAction = leftplaceItem;
   if(hotbar[selected].filled == "grass" && hotbar[selected].itemCount >0){
      grassBlock.add(new FGrassBlock (mouseCoordX, mouseCoordY,grassBlock.size()));
      hotbar[selected].itemCount -= 1;
   }
   if(hotbar[selected].filled == "dirt" && hotbar[selected].itemCount >0){
      dirtBlock.add(new FDirtBlock (mouseCoordX, mouseCoordY,grassBlock.size()));
      hotbar[selected].itemCount -= 1;
   }
   if(hotbar[selected].filled == "stone" && hotbar[selected].itemCount >0){
      stoneBlock.add(new FStoneBlock (mouseCoordX, mouseCoordY,grassBlock.size()));
      hotbar[selected].itemCount -= 1;
   }
   
   clicked = true;
 }  
  
}
  PImage reverse( PImage image ) {
  PImage reverse;
  reverse = createImage(image.width, image.height, ARGB );

  for ( int i=0; i < image.width; i++ ) {
    for (int j=0; j < image.height; j++) {
      int xPixel, yPixel;
      xPixel = image.width - 1 - i;
      yPixel = j;
      reverse.pixels[yPixel*image.width+xPixel]=image.pixels[j*image.width+i] ;
    }
  }
  return reverse;
}