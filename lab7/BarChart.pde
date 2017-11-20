import java.util.*;

class BarChart extends Chart{
  String[] names;
  Data data;
  Bar [] bars;

  float yMin, yMax; 
  int xNum;
  float xMargin;
  float yMargin;
  float barFill = 0.8; 
  float barWidth, spacing;
  float xAxisLen;
  float yAxisLen;
  float ySpacing;
  int chartWidth, chartHeight, chartX, chartY;
  boolean isColor;
  boolean contrast;


  BarChart(int chartX, int chartY, int chartWidth, int chartHeight, Data data, boolean isColor, boolean contrast) {
    super(data, chartX, chartY, chartWidth, chartHeight, "Bar chart");
    this.data = data;
    this.chartX = chartX;
    this.chartY = chartY;
    this.yMin = data.getMin();
    this.yMax = data.getMax(); 
    this.xNum = data.size; 
    this.chartWidth = chartWidth;
    this.chartHeight = chartHeight;
    this.xMargin = 0.15 * chartWidth; 
    this.yMargin = 0.05 * chartHeight;
    this.bars = new Bar[this.xNum];
    this.spacing = (chartWidth)/xNum; 
    this.barWidth = this.barFill * spacing;
    this.isColor = isColor;
    this.contrast = contrast;
    calcStuff();
  }
  

  
  void calcStuff() {
    xAxisLen = (chartWidth);
    yAxisLen = (chartHeight);
    //spacing 

    float xStart = this.chartX; 
    ySpacing = (yAxisLen) / this.yMax;  
    
   color c1 = color(random(255), random(255), random(255));
   color c2 = color(random(60), random(255), random(255));
   boolean first = false;
    for (int i = 0; i < xNum; i++) {
        float x, y; 
        float val = this.data.dataPoints[i].getValue();
        boolean marked = this.data.dataPoints[i].isMarked();
        float barHeight = val * ySpacing; 
        x = xStart + this.spacing * i; 
        y = (yAxisLen - barHeight + chartY);
        println(x, this.spacing, i);
        Bar bar;
        if(contrast && marked){
            if (!first){
              bar = new Bar(this.barWidth, barHeight, x, y, val, marked, isColor, c1);
              first = true;
            }
              
            else  bar = new Bar(this.barWidth, barHeight, x, y, val, marked, isColor, c2);
        }
        else bar = new Bar(this.barWidth, barHeight, x, y, val, marked, isColor, c1);
        bars[i] = bar;   
    }
    
    
  }

  void draw() { 
    for (int i = 0; i < bars.length; i++) {
        bars[i].drawBar();
    }
    drawAxes();
  
  }
  
void drawAxes(){
    strokeWeight(1);
    stroke(0);
    fill(0);
    line(chartX, chartY + chartHeight, chartX, chartY);
    line(chartX, chartY + chartHeight, chartWidth + chartX, chartY + chartHeight);
 
  }

}