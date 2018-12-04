package com.school.utils;

public class TransformPrice {
	//将字符串价格进行运算，最后返回带有两位小数的字符串
	public static String countPrice(String str1,String str2){
		String result = String.valueOf(Float.valueOf(str1)+Float.valueOf(str2));
		String str[] = result.split("\\.");
		if(str[1].toCharArray().length==1){
			//结果只有一位小数
			result = result+"0";
		}else if(str[1].toCharArray().length>2){
			//小数超出两位
			result = str[0]+"."+str[1].substring(0,2);
		}else{
		}
		return result;	
	}
	
	//两个字符串进行相乘，结果输出两位小数部分的字符串
	public static String multiply(String str1,String str2){
		String result = String.valueOf(Float.valueOf(str1)*Float.valueOf(str2));
		String str[] = result.split("\\.");
		if(str[1].toCharArray().length==1){
			//结果只有一位小数
			result = result+"0";
		}else if(str[1].toCharArray().length>2){
			//小数超出两位
			result = str[0]+"."+str[1].substring(0,2);
		}else{
		}
		return result;		
	}
}
