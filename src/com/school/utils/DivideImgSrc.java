package com.school.utils;

import java.util.ArrayList;
import java.util.List;

/*
 * 用于拆分数据库中一组图片路径
 */
public class DivideImgSrc {
	public static List<String> divideSrc(String src){
		List<String> imgList = new  ArrayList<String>();
		String strs[] = src.split(",");
		System.out.println("共有"+strs.length+"张图片");
		for(int i=0;i<strs.length;i++){
			imgList.add(strs[i]);
		}
		return imgList;
	}
}
