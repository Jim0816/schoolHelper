package com.school.utils;

import java.util.ArrayList;
import java.util.List;

/*
 * ���ڲ�����ݿ���һ��ͼƬ·��
 */
public class DivideImgSrc {
	public static List<String> divideSrc(String src){
		List<String> imgList = new  ArrayList<String>();
		String strs[] = src.split(",");
		System.out.println("����"+strs.length+"��ͼƬ");
		for(int i=0;i<strs.length;i++){
			imgList.add(strs[i]);
		}
		return imgList;
	}
}
