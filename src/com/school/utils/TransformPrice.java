package com.school.utils;

public class TransformPrice {
	//���ַ����۸�������㣬��󷵻ش�����λС�����ַ���
	public static String countPrice(String str1,String str2){
		String result = String.valueOf(Float.valueOf(str1)+Float.valueOf(str2));
		String str[] = result.split("\\.");
		if(str[1].toCharArray().length==1){
			//���ֻ��һλС��
			result = result+"0";
		}else if(str[1].toCharArray().length>2){
			//С��������λ
			result = str[0]+"."+str[1].substring(0,2);
		}else{
		}
		return result;	
	}
	
	//�����ַ���������ˣ���������λС�����ֵ��ַ���
	public static String multiply(String str1,String str2){
		String result = String.valueOf(Float.valueOf(str1)*Float.valueOf(str2));
		String str[] = result.split("\\.");
		if(str[1].toCharArray().length==1){
			//���ֻ��һλС��
			result = result+"0";
		}else if(str[1].toCharArray().length>2){
			//С��������λ
			result = str[0]+"."+str[1].substring(0,2);
		}else{
		}
		return result;		
	}
}
