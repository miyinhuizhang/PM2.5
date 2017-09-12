package com.rjb.service;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.rjb.entity.pm25;




public class pm25service {

    


    public pm25[] pm25arr_return(String url)
    {
        
         Pm25getjson a=new Pm25getjson(url);
         String json=a.getJson();
        JSONArray jsonArray = null;
                    try {
                        jsonArray = new JSONArray(json);
                    } catch (JSONException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }
                    int iSize = jsonArray.length();
                    pm25[] pm25arr=new pm25[iSize];
                    System.out.println("Size:" + iSize);
                    for (int i = 0; i < iSize; i++) {
                     pm25arr[i]=new pm25();
                    
                    try {
                        System.out.println(jsonArray.getJSONObject(i).get("aqi").toString());
                        pm25arr[i].setAqi(jsonArray.getJSONObject(i).get("aqi").toString());
                    } catch (JSONException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }
                    try {
                        pm25arr[i].setArea(jsonArray.getJSONObject(i).get("area").toString());
                    } catch (JSONException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }
                    try {
                        pm25arr[i].setPm2_5(jsonArray.getJSONObject(i).get("pm2_5").toString());
                    } catch (JSONException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }
                    try {
                        pm25arr[i].setPm2_5_24h(jsonArray.getJSONObject(i).get("pm2_5_24h").toString());
                    } catch (JSONException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }
                    try {
                        pm25arr[i].setPrimary_pollutant(jsonArray.getJSONObject(i).get("position_name").toString());
                    } catch (JSONException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }
                    try {
                        pm25arr[i].setQuality(jsonArray.getJSONObject(i).get("quality").toString());
                    } catch (JSONException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }
                    try {
                        pm25arr[i].setStation_code(jsonArray.getJSONObject(i).get("station_code").toString());
                    } catch (JSONException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }
                    try {
                        pm25arr[i].setTime_point(jsonArray.getJSONObject(i).get("time_point").toString());
                    } catch (JSONException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }
                  
                  
                    }
                    return pm25arr;
        
        
        
        
        
        
        
        
        
        
    }
    
}