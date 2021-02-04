class FItem extends FBox{
  float x,y;
  String itemType;
  boolean dead;
  boolean touching;
  int i;
  PImage img;
 FItem(float _x, float _y, String _itemType, int _i){
  super(gridSize/2, gridSize/2); 
  x = _x;
  y = _y;
  i = _i;
  touching = false;
  itemType = _itemType;
  dead = false;
  this.setPosition(x,y);
  this.setStatic(false);
  world.add(this);
 }
  void act(){
    if(itemType == "grass"){
      this.setFillColor(#089512);
    }
    if(itemType == "dirt"){
      this.setFillColor(#9B5013); 
    }
    if(itemType == "stone"){
      this.setFillColor(#797471);
    }
    if (itemType == "diamond"){
      img = loadImage("diamond.png");
     //img.resize((int)gridSize, (int)gridSize);
      this.attachImage(img);
    }
   
    ItemContact();
    

  }
void ItemContact(){
  ArrayList<FContact> itemContacts;

   itemContacts = item.get(i).getContacts();
    for(int i = 0; i < itemContacts.size(); i += 1){
      FContact object = itemContacts.get(i);
         if (object.contains (player) && touching == false){
          if (itemType == "grass"){
           for(int count = 0; count < n; count += 1){
            if (hotbar[count].filled == "grass" && hotbar[count].itemCount < maxItem){
              hotbar[count].itemCount += 1;
              break;
            }
            if (hotbar[count].filled == "empty"){
              hotbar[count].filled = "grass";
              hotbar[count].itemCount += 1;
              break;
            }
           }
          }
          if(itemType == "dirt"){
           for(int count = 0; count < n; count += 1){
            if (hotbar[count].filled == "dirt" && hotbar[count].itemCount < maxItem){
              hotbar[count].itemCount += 1;
              break;
            }
            if (hotbar[count].filled == "empty"){
              hotbar[count].filled = "dirt";
              hotbar[count].itemCount += 1;
              break;
            }
           }  
          }
          if(itemType == "stone"){
           for(int count = 0; count < n; count += 1){
            if (hotbar[count].filled == "stone" && hotbar[count].itemCount < maxItem){
              hotbar[count].itemCount += 1;
              break;
            }
            if (hotbar[count].filled == "empty"){
              hotbar[count].filled = "stone";
              hotbar[count].itemCount += 1;
              break;
            }
           }  
          }
          if(itemType == "diamond"){
           for(int count = 0; count < n; count += 1){
            if (hotbar[count].filled == "diamond" && hotbar[count].itemCount < maxItem){
              hotbar[count].itemCount += 1;
              break;
            }
            if (hotbar[count].filled == "empty"){
              hotbar[count].filled = "diamond";
              hotbar[count].itemCount += 1;
              break;
            }
           }  
          }
           touching = true;
           //for(int c = 0; i < item.size(); i += 1){
           //  FItem t = item.get(c);
           //  if (t.i == c){
           //   item.remove(c); 
           //  }
           //}
           world.remove(this);

         } 
      }
} 
  
  
}

void ItemAct(){
 int i = 0;
 while ( i < item.size()){
  FItem object = item.get(i);
  object.act();
  i += 1;
 }
  
}