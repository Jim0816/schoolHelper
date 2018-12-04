package com.school.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class SchoolMapDao {
	 @Resource  
	 private JdbcTemplate jdbcTemplate;  
	 //通过店主id查询店铺信息
	 public List<Map<String, Object>> querySchoolMap(String schoolName){
		 String sql="select *from schoolmap where schoolName=?";
		 return jdbcTemplate.queryForList(sql,schoolName);
	 }
}
