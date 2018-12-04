package com.school.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.school.utils.PageUtil;

@Repository
public class SchoolReformDao {

	 @Resource  
	 private JdbcTemplate jdbcTemplate;
	 //查询所有通知,数据通过时间降序排列
	 public  List<Map<String, Object>> getAllReform(){
		 String sql = "select * from schoolreform order by schoolReformDate desc";
		 PageUtil pageUtil = new PageUtil(sql, 1, 15, jdbcTemplate);
		 return pageUtil.getResultList();
	 }
	 
	 //查询考试招聘类通知
	 public  PageUtil getTestAndEmployReform(int currentPage,int numPerPage){
		 String sql = "select * from schoolreform where schoolReformType='考试招聘' order by schoolReformDate desc";
		 PageUtil pageUtil = new PageUtil(sql, currentPage, numPerPage, jdbcTemplate);
		 return pageUtil;
	 }

	 //查询活动竞赛类通知
	 public  PageUtil getActivityAndCompeteReform(int currentPage,int numPerPage){
		 String sql = "select * from schoolreform where schoolReformType='活动竞赛' order by schoolReformDate desc";
		 PageUtil pageUtil = new PageUtil(sql, currentPage, numPerPage, jdbcTemplate);
		 return pageUtil;
	 }
	 //查询校历讯息类通知
	 public  PageUtil getSchoolDateReform(int currentPage,int numPerPage){
		 String sql = "select * from schoolreform where schoolReformType='校历讯息' order by schoolReformDate desc";
		 PageUtil pageUtil = new PageUtil(sql, currentPage, numPerPage, jdbcTemplate);
		 return pageUtil;
	 }
	 //查询注意事项类通知
	 public  PageUtil getNoticeReform(int currentPage,int numPerPage){
		 String sql = "select * from schoolreform where schoolReformType='注意事项' order by schoolReformDate desc";
		 PageUtil pageUtil = new PageUtil(sql, currentPage, numPerPage, jdbcTemplate);
		 return pageUtil;
	 }
}
