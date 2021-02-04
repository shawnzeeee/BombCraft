class Hotbar{
  float x,y;
  String filled;
  int itemCount;
  int index;
  PImage img;
 Hotbar(float _x, float _y, int _i){
   filled = "empty";
   itemCount = 0;
   index = _i;
   x = _x;
   y = _y;
   
   
 }
  
  void show(){
    if (itemCount == 0){
     filled = "empty"; 
    }
    if(selected == index){
     strokeWeight(5); 
    }else strokeWeight(0);
      fill(#1F1F1F,50);      
      rect(x,y,50,50);
      strokeWeight(0);
    if (filled == "grass"){
     fill(#089512);
    }
    
    if(filled == "dirt"){
     fill(#9B5013);
    }
    if(filled == "stone"){
     fill(#797471); 
    }
    if(filled == "diamond"){
     img = loadImage("diamond.png");
     image(img,x + 12.5, y + 12.5,25,25);
     fill(0);
    }
    if (filled != "empty" && filled != "diamond"){
      rect(x + 12.5,y +12.5,30,30); 
      fill(0);
    }
      textSize(10);
      text(itemCount,x+35,y+47);
  }
  
  void act(){
    
  }
  
  
  
}