package com.school.dao;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class PartTimeJobDao {
	@Resource  
    private JdbcTemplate jdbcTemplate;  
	
	//得到后五条记录
	public  List<Map<String, Object>> selectEndTwelve(){
    	String sql1 = "select count(*) from parttimejob";
    	String sql2 = null;
    	int allNums = jdbcTemplate.queryForInt(sql1);
    	if(allNums>=12){
    		sql2="select *from parttimejob limit "+(allNums-12)+",12";
    	}else{
    		sql2="select *from parttimejob";
    	}
    	return jdbcTemplate.queryForList(sql2);
    }
}
