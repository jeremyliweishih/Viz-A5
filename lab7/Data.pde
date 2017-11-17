import java.util.Arrays;

public class Data{

  private int size;
  private DataPoint[] dataPoints;

  public Data(int size){
    this.size = size;
    this.dataPoints = new DataPoint[size];
     float d1 = 0;
     float d2  = 0;
     while((int)d1 == (int)d2){
       d1 = random(10);
       d2 = random(10);
     }
       
    for(int i = 0; i < size; i++){
       float value = random(100);
       
       DataPoint dp;
       
       if(i == (int)d1 || i == (int)d2){
         dp = new DataPoint(value, true);
       }
       else dp = new DataPoint(value, false);
       
       
       dataPoints[i] = dp;
    }

    //ToDo: how to generate data points and mark two of the data points
  }
  
 public float getMin(){
   float min = dataPoints[0].value;
   for(DataPoint dp : dataPoints){
      if(dp.value < min){
         min = dp.value; 
      }
   }
   
   return min;
 }
 
 public float[] getMarked(){
   float one = 9999;
   float two = 8888;
   for(DataPoint dp: dataPoints){
     if(one == 9999 && dp.isMarked()){
        one = dp.getValue(); 
     }
     else if(one != 9999 && dp.isMarked()){
        two = dp.getValue(); 
     }
     
   }
   
  float[] arr = new float[2];
  arr[0] = one;
  arr[1] = two;
  Arrays.sort(arr);
  return arr;
 }
public float getMax(){
   float max = dataPoints[0].value;
   for(DataPoint dp : dataPoints){
      if(dp.value > max){
         max = dp.value; 
      }
   }
   
   return max;
 }
  //ToDo: feel free to add varialves and methods for your convenience


  public int size(){
    return this.size;
  }

  private class DataPoint{
    private float value;
    private boolean isMarked;

    public DataPoint(float value, boolean isMarked){
      this.value = value;
      this.isMarked = isMarked;
    }

    public boolean isMarked(){
      return this.isMarked;
    }

    public float getValue(){
      return this.value;
    }

  }

}