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
	 //��ѯ����֪ͨ,����ͨ��ʱ�併������
	 public  List<Map<String, Object>> getAllReform(){
		 String sql = "select * from schoolreform order by schoolReformDate desc";
		 PageUtil pageUtil = new PageUtil(sql, 1, 15, jdbcTemplate);
		 return pageUtil.getResultList();
	 }
	 
	 //��ѯ������Ƹ��֪ͨ
	 public  PageUtil getTestAndEmployReform(int currentPage,int numPerPage){
		 String sql = "select * from schoolreform where schoolReformType='������Ƹ' order by schoolReformDate desc";
		 PageUtil pageUtil = new PageUtil(sql, currentPage, numPerPage, jdbcTemplate);
		 return pageUtil;
	 }

	 //��ѯ�������֪ͨ
	 public  PageUtil getActivityAndCompeteReform(int currentPage,int numPerPage){
		 String sql = "select * from schoolreform where schoolReformType='�����' order by schoolReformDate desc";
		 PageUtil pageUtil = new PageUtil(sql, currentPage, numPerPage, jdbcTemplate);
		 return pageUtil;
	 }
	 //��ѯУ��ѶϢ��֪ͨ
	 public  PageUtil getSchoolDateReform(int currentPage,int numPerPage){
		 String sql = "select * from schoolreform where schoolReformType='У��ѶϢ' order by schoolReformDate desc";
		 PageUtil pageUtil = new PageUtil(sql, currentPage, numPerPage, jdbcTemplate);
		 return pageUtil;
	 }
	 //��ѯע��������֪ͨ
	 public  PageUtil getNoticeReform(int currentPage,int numPerPage){
		 String sql = "select * from schoolreform where schoolReformType='ע������' order by schoolReformDate desc";
		 PageUtil pageUtil = new PageUtil(sql, currentPage, numPerPage, jdbcTemplate);
		 return pageUtil;
	 }
}
