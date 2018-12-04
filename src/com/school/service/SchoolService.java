package com.school.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.school.dao.SchoolNewsDao;
import com.school.dao.SchoolReformDao;
import com.school.dao.SchoolVideoDao;
import com.school.utils.PageUtil;

@Service
public class SchoolService {
	@Autowired
	private SchoolNewsDao schoolNewsDao;
	@Autowired
	private SchoolReformDao schoolReformDao;
	@Autowired
	private SchoolVideoDao schoolVideoDao;
	//�õ�����У԰���ż�¼��ʱ�併������
	public List<Map<String, Object>> getAllNews(){
		List<Map<String, Object>> allNews = schoolNewsDao.getAllNews();
		System.out.println("allNews:"+allNews.size());
		return allNews;
	}
	
	//�õ�����У԰֪ͨ��¼��ʱ�併������
	public List<Map<String, Object>> getAllReform(){
		List<Map<String, Object>> allReform = schoolReformDao.getAllReform();
		System.out.println("allReform:"+allReform.size());
		return allReform;
	}
	
	//�õ�����У԰��Ƶ��¼��ʱ�併������
	public List<Map<String, Object>> getAllVedio(){
		List<Map<String, Object>> allVideo = schoolVideoDao.getAllVideo();
		System.out.println("allVideo:"+allVideo.size());
		return allVideo;
	}
	
	//�õ���ͬ���͵�֪ͨ
	public PageUtil getReformByType(int currentPage,int numPerPage,int type){
		if(type==1){
			//��ѯ������Ƹ��֪ͨ
			return schoolReformDao.getTestAndEmployReform(currentPage, numPerPage);
		}else if(type==2){
			//��ѯ�������֪ͨ
			return schoolReformDao.getActivityAndCompeteReform(currentPage, numPerPage);
		}else if(type==3){
			//��ѯУ��ѶϢ��֪ͨ
			return schoolReformDao.getSchoolDateReform(currentPage, numPerPage);
		}else if(type==4){
			//��ѯע��������֪ͨ
			return schoolReformDao.getNoticeReform(currentPage, numPerPage);
		}else{
			System.out.println("��ѯ�������󣡣���");
			return null;	
		}	
	}
}
