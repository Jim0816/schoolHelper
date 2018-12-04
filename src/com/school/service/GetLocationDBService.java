package com.school.service;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.school.dao.SchoolMapDao;
import com.school.utils.UpdateConfig;

@Service
public class GetLocationDBService {
	@Autowired
	private SchoolMapDao schoolMapDao;
	@Transactional
	//修改配置文件，并且重新加载配置
    public  boolean updateConfig(String schoolName){
    	boolean flag = false;
    	String path="G://workspace//myeclipse//work//schoolHelper//WebRoot//WEB-INF//c3p0.properties";
    	String key="url";
    	String schoolDataName = "jxau";//默认为江西农业大学
    	List<Map<String, Object>> resultList = schoolMapDao.querySchoolMap(schoolName);
    	if(resultList.size()>0){
    		//存在该校数据库
    		schoolDataName = (String) resultList.get(0).get("schoolDataName");
    	}else{
    		//不存在该校数据库
    		System.out.println("没有找到"+schoolName+"的数据库");
    	}
    	
    	String newValue = "jdbc:mysql://localhost:3306/"+schoolDataName;
    	//比较学校数据库名字是否一致，相同则不需要修改
    	String nowValue = UpdateConfig.getPro(path,key);
    	if(nowValue.equals(newValue)){
    		//相同，不修改配置
    		flag = true;
    		System.out.println("学校相同，不修改配置");
    	}else{
    		//不相同，需要修改数据源配置
    		flag= UpdateConfig.updatePro(path,key,newValue);	
    	}	
    	return flag;
    }
}
