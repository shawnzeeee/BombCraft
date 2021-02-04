class FBomb extends FBox{
  int timer;
  float x,y;
  int index;
  PImage img;
  FBomb(float _x , float _y, int _i){
   super(gridSize, gridSize);
   x = _x;
   y = _y;
   index = _i;
   timer = 100;
   img = loadImage("bomb.png");
   this.setPosition(_x , _y );
   this.setStatic(false);
   this.setSensor(false);
   img.resize((int)gridSize, (int)gridSize);
    this.attachImage(img);
   world.add(this);
  }
  void act(){
    
   timer -= 1;
   if (timer == 0){
     
    explosion();
    for(int i = 0; i < bomb.size(); i += 1){
      FBomb b = bomb.get(i);
      if(b.index == index){
           bomb.remove(i); 
      }
    }
    world.remove(this);
   }
  }
  void explosion(){  
  }
  
  
  
}

void BombAct(){
 int i = 0;
 while (i < bomb.size()){
  FBomb b = bomb.get(i);
  b.act();
  i += 1;
  
 }
}