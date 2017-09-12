package com.rjb.service;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

public class Pm25getjson {

    private String json;
        public Pm25getjson(String url)
        {
             StringBuilder jsonbuilder = new StringBuilder();
           try {  
                URL urlObject = new URL(url);  
                URLConnection uc = urlObject.openConnection();  
                BufferedReader in = new BufferedReader(new InputStreamReader(uc.getInputStream(), "UTF-8"));  
                String inputLine = null;  
                while ( (inputLine = in.readLine()) != null) {  
                    jsonbuilder.append(inputLine);  
                }  
                in.close();  
            } catch (MalformedURLException e) {  
                e.printStackTrace();  
            } catch (IOException e) {  
                e.printStackTrace();  
            }  
         json=jsonbuilder.toString();
        }
        public String getJson() {
            return json;
        }
        public void setJson(String json) {
            this.json = json;
        }
        
}