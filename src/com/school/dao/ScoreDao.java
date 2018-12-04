package com.school.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.school.utils.PageUtil;
@Repository
public class ScoreDao {
	 @Resource  
	 private JdbcTemplate jdbcTemplate;  
	 //��ѯ���8������,����ͨ��ʱ�併������
	 public  List<Map<String, Object>> getAllScore(){
		 String sql = "select * from lookscore order by lookScoreDate desc";
		 PageUtil pageUtil = new PageUtil(sql, 1, 8, jdbcTemplate);
		 return pageUtil.getResultList();
	 }
}
