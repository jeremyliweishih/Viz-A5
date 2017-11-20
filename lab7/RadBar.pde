 class RadBar {
  color c1, c2, currColor, buffColor;
  String name;
  float value;
  float x, y;
  float w, h, angle;
  boolean marked;
  
  RadBar(float w, float h, String name, float x, float y, float value, float angle, boolean marked) {
    this.name = name;   
    this.w = w;
    this.h = h;
    this.x = x;
    this.y = y;
    this.angle = angle;
    this.value = value;
    this.marked = marked;
    c1 = color(255, 255, 255);
    c2 = color(55, 206, 229);
    currColor = c1; 
 } 
 
 void setBuffColor(color c) {
   this.buffColor = c;  
 }
  
 void drawBar() {
    stroke(0);
    fill(currColor);
    pushMatrix();  
    rotate(angle);
    rect(x, y, w, h);
    if(marked){
       strokeWeight(5);
       point((x+w)/2, (y+h)/2 + 5); 
    }
    strokeWeight(1);
    popMatrix();
  }
    

  void highlighted() {
    this.currColor = this.c2;  
  }
  
  void notHighlighted() {
    this.currColor = this.c1; 
  }
  
  boolean isect(PGraphics pg) {
    color c = pg.get(mouseX, mouseY);
    if (c == buffColor) {
      return true;
    }
    return false;
  }
  
}