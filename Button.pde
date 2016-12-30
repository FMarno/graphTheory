abstract class Button {
  PVector l;
  float w;
  float h;
  
  public Button(PVector l, float w, float h){
   this.l = l;
   this.w = w;
   this.h = h;
  }
  
  abstract void run();
  abstract void display();
  
  boolean contains(float x, float y){
      return (l.x -w/2 <= x && x <= l.x+w/2 && l.y - h/2 <= y && y <= l.y + h/2);
  }
}