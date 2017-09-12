package com.rjb.main;

import com.rjb.entity.pm25;
import com.rjb.service.pm25service;




public class pm25test {

    /**
     * @param args
     */
    public static void main(String[] args) {
        // TODO Auto-generated method stub
     String url = "http://www.pm25.in/api/querys/pm2_5.json?city=dalian&token=5j1znBVAsnSf5xQyNQyq";

//http://www.pm25.in/api/querys.json 获取实施了新《环境空气质量标准》的城市列表，即有PM2.5数据的城市列表
		//http://www.pm25.in/api/query。s/all_cities.json  获取所有城市的空气质量详细数据
		//http://www.pm25.in/api/querys/aqi_ranking.json 获取全部城市的空气质量指数(AQI)排行榜

        pm25service pm25services=new pm25service();
        pm25[] pm25entity=pm25services.pm25arr_return(url);
        for(int i=0;i<pm25entity.length;i++)
        {
        System.out.println(    pm25entity[i].getAqi());
        System.out.println(    pm25entity[i].getArea());
        System.out.println(    pm25entity[i].getPm2_5());
        System.out.println(    pm25entity[i].getPm2_5_24h());
        System.out.println(    pm25entity[i].getPosition_name());
        System.out.println(    pm25entity[i].getPrimary_pollutant());
        System.out.println(    pm25entity[i].getQuality());
        System.out.println(    pm25entity[i].getStation_code());
        System.out.println(    pm25entity[i].getTime_point());
            System.out.println();
        }
        /* Pm25getjson a=new Pm25getjson(url);
        
        System.out.println(a.getJson());*/
    }

}