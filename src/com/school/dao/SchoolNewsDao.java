package com.school.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class SchoolNewsDao {
	 @Resource  
	 private JdbcTemplate jdbcTemplate;  
	 //��ѯ����,����ͨ��ʱ�併������
	 public  List<Map<String, Object>> getAllNews(){
		 String sql = "select * from schoolNews order by schoolNewsDate desc";
		 return jdbcTemplate.queryForList(sql);
	 }
}
