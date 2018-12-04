package com.school.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;


import org.springframework.jdbc.core.JdbcTemplate;

import org.springframework.stereotype.Repository;


@Repository
public class AdvertisementDao {
    @Resource  
    private JdbcTemplate jdbcTemplate;  
   /* public List<Map<String, Object>> selectPage(){
    	PageUtil pageUtil = new PageUtil("select *from advinfo",1,7,jdbcTemplate);
    	return pageUtil.getResultList();
	}*/
    
    //得到最新记录
	public  List<Map<String, Object>> getAdvInfo(){
    	String sql = "select * from advinfo";
    	return jdbcTemplate.queryForList(sql);
    }
}
