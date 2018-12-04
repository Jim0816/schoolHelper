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
	//得到所有校园新闻记录，时间降序排序
	public List<Map<String, Object>> getAllNews(){
		List<Map<String, Object>> allNews = schoolNewsDao.getAllNews();
		System.out.println("allNews:"+allNews.size());
		return allNews;
	}
	
	//得到所有校园通知记录，时间降序排序
	public List<Map<String, Object>> getAllReform(){
		List<Map<String, Object>> allReform = schoolReformDao.getAllReform();
		System.out.println("allReform:"+allReform.size());
		return allReform;
	}
	
	//得到所有校园视频记录，时间降序排序
	public List<Map<String, Object>> getAllVedio(){
		List<Map<String, Object>> allVideo = schoolVideoDao.getAllVideo();
		System.out.println("allVideo:"+allVideo.size());
		return allVideo;
	}
	
	//得到不同类型的通知
	public PageUtil getReformByType(int currentPage,int numPerPage,int type){
		if(type==1){
			//查询考试招聘类通知
			return schoolReformDao.getTestAndEmployReform(currentPage, numPerPage);
		}else if(type==2){
			//查询活动竞赛类通知
			return schoolReformDao.getActivityAndCompeteReform(currentPage, numPerPage);
		}else if(type==3){
			//查询校历讯息类通知
			return schoolReformDao.getSchoolDateReform(currentPage, numPerPage);
		}else if(type==4){
			//查询注意事项类通知
			return schoolReformDao.getNoticeReform(currentPage, numPerPage);
		}else{
			System.out.println("查询类型有误！！！");
			return null;	
		}	
	}
}
