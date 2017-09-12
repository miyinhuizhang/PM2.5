package com.rjb.entity;

//json 格式数据的对象的实体类
public class pm25 {
//aqi指数
  private String aqi;
  //地域名称
  private String area;
  //颗粒物（粒径小于等于2.5μm）1小时平均
  private String  pm2_5;
  //颗粒物（粒径小于等于2.5μm）24小时滑动平均
  private String pm2_5_24h;
  //监测点名称
  private String position_name;
  //首要污染物
  private String primary_pollutant;
  //空气质量指数类别，有“优、良、轻度污染、中度污染、重度污染、严重污染”6类
  private String quality;
  //监测点编码
  private String station_code;
  //数据发布的时间
  private String time_point;
  public String getAqi() {
      return aqi;
  }
  public void setAqi(String aqi) {
      this.aqi = aqi;
  }
  public String getArea() {
      return area;
  }
  public void setArea(String area) {
      this.area = area;
  }
  public String getPm2_5() {
      return pm2_5;
  }
  public void setPm2_5(String pm2_5) {
      this.pm2_5 = pm2_5;
  }
  public String getPm2_5_24h() {
      return pm2_5_24h;
  }
  public void setPm2_5_24h(String pm2_5_24h) {
      this.pm2_5_24h = pm2_5_24h;
  }
  public String getPosition_name() {
      return position_name;
  }
  public void setPosition_name(String position_name) {
      this.position_name = position_name;
  }
  public String getPrimary_pollutant() {
      return primary_pollutant;
  }
  public void setPrimary_pollutant(String primary_pollutant) {
      this.primary_pollutant = primary_pollutant;
  }
  public String getQuality() {
      return quality;
  }
  public void setQuality(String quality) {
      this.quality = quality;
  }
  public String getStation_code() {
      return station_code;
  }
  public void setStation_code(String station_code) {
      this.station_code = station_code;
  }
  public String getTime_point() {
      return time_point;
  }
  public void setTime_point(String time_point) {
      this.time_point = time_point;
  }
  @Override
  public String toString() {
      System.out.println( "pm25 [aqi=" + aqi + ", area=" + area + ", pm2_5=" + pm2_5
              + ", pm2_5_24h=" + pm2_5_24h + ", position_name="
              + position_name + ", primary_pollutant=" + primary_pollutant
              + ", quality=" + quality + ", station_code=" + station_code
              + ", time_point=" + time_point + "]");
      return null;
  }
  
  
}