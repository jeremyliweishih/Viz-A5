

class Pie_chart extends Chart {
  
  float total = 0;
  //ArrayList<DataPoint> data = new ArrayList();
  Data data;
  float x, y;
  float radius;
  int i = 0;

  public Pie_chart(Data data, int chartX, int chartY, int chartWidth, int chartHeight) {
    super(data, chartX, chartY, chartWidth, chartHeight, "Pie chart");
    x = chartX + chartWidth/2;
    y = chartY + chartHeight/2;
    radius = chartWidth/2;
    for (int i = 0; i < data.size; i++) {
         this.data = data;
           total += data.dataPoints[i].value; 
      }
  }
  @Override
  public void draw() {
    float startTheta = 0;
    float theta;
    i = 0;
    
    for (int i = 0; i < this.data.size; i++) {
      theta = 2*PI * this.data.dataPoints[i].getValue() / total;
      
      fill(255, 255, 255); 
      stroke(0);
      strokeWeight(1);
      arc(x, y, radius * 2, radius * 2, startTheta, theta + startTheta, PIE);  
      if (this.data.dataPoints[i].isMarked()) {
         stroke(0);
         strokeWeight(5);
         point(x + radius/2 * cos((startTheta + theta + startTheta)/2), y + radius/2 * sin((startTheta + theta + startTheta)/2));
      }
      startTheta += theta;
    }
    
  }
 
}