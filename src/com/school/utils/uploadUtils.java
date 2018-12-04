package com.school.utils;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;


/*
 * 处理上传的照片
 */
public class uploadUtils {
	//处理用户上传的单张图片
	private static String ip = "127.0.0.1";
	private static String port = "8080";
	public static String dealSimplePhoto(String Src,String virtualSrc,int id,MultipartFile img){
		String userUrl = "";
		//Src表示文件存放的路径，MultipartFile img前端传入的图片
		//遍历每张照片
		String origName = img.getOriginalFilename();//得到上传图片的原名(含拓展名在内)
		String extendsName = origName.substring(origName.lastIndexOf("."));//得到上传图片的拓展名
		//产生新的文件名
		String newName = String.valueOf(id)+"-"+getNowDate()+extendsName;
		File uploadImg = new File(Src+newName);//该路径为真实路径
		//保存到指定位置
		try {
			img.transferTo(uploadImg);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		userUrl = "http://"+ip+":"+port+"/"+virtualSrc+"/"+newName;
		return userUrl;	
	}
	
	
	//处理多张图片,返回这些图片的url，以逗号隔开
	public static String dealSomePhoto(String Src,String virtualSrc,int id,MultipartFile img[]){
		String allUrl = "";
		//Src表示文件存放的路径，MultipartFile[] img前端传入的图片
		/*
		 * 取前六张图片
		 */
		int max = img.length;
		if(img.length>6){
			max = 6;
		}
		for(int i=0;i<max;i++){
			//遍历每张照片
			MultipartFile theImg = img[i];
			String origName = theImg.getOriginalFilename();//得到上传图片的原名(含拓展名在内)
			String extendsName = origName.substring(origName.lastIndexOf("."));//得到上传图片的拓展名
			//产生新的文件名
			String index = String.valueOf(i+1);
			String newName = String.valueOf(id)+"-"+getNowDate()+"-"+index+extendsName;
			File uploadImg = new File(Src+newName);
			//保存到指定位置
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
