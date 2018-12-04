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
	//�޸������ļ����������¼�������
    public  boolean updateConfig(String schoolName){
    	boolean flag = false;
    	String path="G://workspace//myeclipse//work//schoolHelper//WebRoot//WEB-INF//c3p0.properties";
    	String key="url";
    	String schoolDataName = "jxau";//Ĭ��Ϊ����ũҵ��ѧ
    	List<Map<String, Object>> resultList = schoolMapDao.querySchoolMap(schoolName);
    	if(resultList.size()>0){
    		//���ڸ�У���ݿ�
    		schoolDataName = (String) resultList.get(0).get("schoolDataName");
    	}else{
    		//�����ڸ�У���ݿ�
    		System.out.println("û���ҵ�"+schoolName+"�����ݿ�");
    	}
    	
    	String newValue = "jdbc:mysql://localhost:3306/"+schoolDataName;
    	//�Ƚ�ѧУ���ݿ������Ƿ�һ�£���ͬ����Ҫ�޸�
    	String nowValue = UpdateConfig.getPro(path,key);
    	if(nowValue.equals(newValue)){
    		//��ͬ�����޸�����
    		flag = true;
    		System.out.println("ѧУ��ͬ�����޸�����");
    	}else{
    		//����ͬ����Ҫ�޸�����Դ����
    		flag= UpdateConfig.updatePro(path,key,newValue);	
    	}	
    	return flag;
    }
}
