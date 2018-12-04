package com.school.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class SchoolVideoDao {

	 @Resource  
	 private JdbcTemplate jdbcTemplate;  
	 //查询所有通知,数据通过时间降序排列
	 public  List<Map<String, Object>> getAllVideo(){
		 String sql = "select * from schoolvideo order by schoolVideoDate desc";
		 return jdbcTemplate.queryForList(sql);
	 }
}
