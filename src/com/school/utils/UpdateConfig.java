package com.school.utils;

import java.io.FileInputStream;    
import java.io.FileNotFoundException;    
import java.io.FileOutputStream;    
import java.io.IOException;    
import java.util.Properties;  

public class UpdateConfig {
	private static Properties prop;  
    public static void load(String path){  
        //�����path����Ŀ�ļ��ľ���·��  
        //�Ȼ�ȡ��Ŀ�� ��·����Thread.currentThread().getContextClassLoader().getResource("").getPath();  
        //Ȼ������Ŀ·������ƴ��"properties/sysConfig.properties";  
        prop= new Properties();// ���Լ��϶���     
        FileInputStream fis;    
        try {    
            System.out.println(path);  
            fis = new FileInputStream(path);  
            prop.load(fis);  
            fis.close();// �ر���    
        } catch (FileNotFoundException e) {    
            e.printStackTrace();    
        } catch (IOException e) {    
            e.printStackTrace();    
        } 
        //System.out.println("user" + prop.getProperty("user"));  
    }  
      
    //����ΪҪ�޸ĵ��ļ�·��  �Լ�Ҫ�޸ĵ�������������ֵ    
    public static Boolean updatePro(String path,String key,String value){  
        if(prop==null){  
            load(path);  
            //System.out.println("�޸�ǰ���¼���һ��");  
        }  
        //System.out.println("��ȡ��ӻ��޸�ǰ������ֵ��"+key+"=" + prop.getProperty(key));  
        prop.setProperty(key, value);     
        // �ļ������     
        try {    
            FileOutputStream fos = new FileOutputStream(path);     
            // ��Properties���ϱ��浽����     
            prop.store(fos, "Copyright (c) Boxcode Studio");  
            fos.close();// �ر���     
        } catch (FileNotFoundException e) {    
            // TODO Auto-generated catch block    
            e.printStackTrace();    
            return false;    
        } catch (IOException e) {    
            // TODO Auto-generated catch block    
            e.printStackTrace();    
            return false;    
        }    
        //System.out.println("��ȡ��ӻ��޸ĺ������ֵ��"+key+"=" + prop.getProperty(key));  
        return true;    
    }    
      
  //����ΪҪ�޸ĵ��ļ�·��  �Լ�Ҫ�޸ĵ�������������ֵ    
    public static String getPro(String path,String key){    
        if(prop==null){  
            load(path);  
            //System.out.println("���¼���һ��");  
        }  
        FileInputStream fis;    
        try {    
            fis = new FileInputStream(path);    
            prop.load(fis);// �������ļ���װ�ص�Properties������     
            fis.close();// �ر���    
        } catch (FileNotFoundException e) {    
            e.printStackTrace();    
        } catch (IOException e) {    
            e.printStackTrace();    
        }    
        //System.out.println("��ѯ����"+key+"��ֵ��"+prop.getProperty(key));  
        return prop.getProperty(key);    
    }
}
