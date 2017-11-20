class Bar {
  color c1, c2, currColor;
  color[] colours;
  String name;
  float value;
  float x, y;
  float w, h;
  boolean marked;
  boolean isColor;

  
  Bar(float w, float h, float x, float y, float value, boolean marked, boolean isColor, color c) {
    this.w = w;
    this.h = h;
    this.x = x;
    this.y = y;
    this.value = value;
    this.marked = marked;
    this.isColor = isColor;

     this.c1 = color(255);
     this.c2 = c;
    currColor = c1; 
 } 
 
 void setColor(color c) {
  this.c1 = c; 
 }
   
 
 void drawBar() {
   
    stroke(0);
    if(isColor && marked) fill(this.c2); 
    else fill(c1);
    rect(x, y, w, h);
    
    if (marked && !this.isColor) {
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