class Bar {
  color c1, c2, currColor;
  color[] colours;
  String name;
  float value;
  float x, y;
  float w, h;
  boolean marked;
  
  
  Bar(float w, float h, float x, float y, float value, boolean marked) {
    this.w = w;
    this.h = h;
    this.x = x;
    this.y = y;
    this.value = value;
    this.marked = marked;
    c1 = color(255, 255, 255);
    currColor = c1; 
 } 
 
 void setColor(color c) {
  this.c1 = c; 
 }
   
 
 void drawBar() {
   
    stroke(0);
    fill(currColor);
    rect(x, y, w, h);
    
    if (marked) {
       strokeWeight(5);
       point( x + (w/2), y + (h/2)); 
    }
    
    strokeWeight(1);
  }
    
  
  void changeHeight(float change) {
    this.h += change;
  }
  
  void changeWidth(float change) {
   this.w += change;
  }
}