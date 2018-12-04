package com.school.utils;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;


/*
 * �����ϴ�����Ƭ
 */
public class uploadUtils {
	//�����û��ϴ��ĵ���ͼƬ
	private static String ip = "127.0.0.1";
	private static String port = "8080";
	public static String dealSimplePhoto(String Src,String virtualSrc,int id,MultipartFile img){
		String userUrl = "";
		//Src��ʾ�ļ���ŵ�·����MultipartFile imgǰ�˴����ͼƬ
		//����ÿ����Ƭ
		String origName = img.getOriginalFilename();//�õ��ϴ�ͼƬ��ԭ��(����չ������)
		String extendsName = origName.substring(origName.lastIndexOf("."));//�õ��ϴ�ͼƬ����չ��
		//�����µ��ļ���
		String newName = String.valueOf(id)+"-"+getNowDate()+extendsName;
		File uploadImg = new File(Src+newName);//��·��Ϊ��ʵ·��
		//���浽ָ��λ��
		try {
			img.transferTo(uploadImg);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		userUrl = "http://"+ip+":"+port+"/"+virtualSrc+"/"+newName;
		return userUrl;	
	}
	
	
	//�������ͼƬ,������ЩͼƬ��url���Զ��Ÿ���
	public static String dealSomePhoto(String Src,String virtualSrc,int id,MultipartFile img[]){
		String allUrl = "";
		//Src��ʾ�ļ���ŵ�·����MultipartFile[] imgǰ�˴����ͼƬ
		/*
		 * ȡǰ����ͼƬ
		 */
		int max = img.length;
		if(img.length>6){
			max = 6;
		}
		for(int i=0;i<max;i++){
			//����ÿ����Ƭ
			MultipartFile theImg = img[i];
			String origName = theImg.getOriginalFilename();//�õ��ϴ�ͼƬ��ԭ��(����չ������)
			String extendsName = origName.substring(origName.lastIndexOf("."));//�õ��ϴ�ͼƬ����չ��
			//�����µ��ļ���
			String index = String.valueOf(i+1);
			String newName = String.valueOf(id)+"-"+getNowDate()+"-"+index+extendsName;
			File uploadImg = new File(Src+newName);
			//���浽ָ��λ��
		    try {
				theImg.transferTo(uploadImg);
			} catch (Exception e) {
				e.printStackTrace();
			}
		    if(i==0){
		    	allUrl = "http://"+ip+":"+port+"/"+virtualSrc+"/"+newName;
		    }else{
		    	allUrl = allUrl+","+"http://"+ip+":"+port+"/"+virtualSrc+"/"+newName;
		    }	
		}
		return allUrl;	
	}
	
	
	public static String getNowDate(){
	   long currentTime = System.currentTimeMillis();
	   SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
	   Date date = new Date(currentTime);
	   String timeString = (formatter.format(date)).toString();
	   return timeString;
	}
}
