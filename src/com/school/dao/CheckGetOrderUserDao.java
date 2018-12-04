package com.school.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class CheckGetOrderUserDao {
	@Resource  
    private JdbcTemplate jdbcTemplate; 
	//通过接单者id查询接单者的信息
	//查找快递代领信息
	public List<Map<String, Object>> getGetOrderUserInfo(int getOrderUserId){
		String sql="select *from getordercheck where checkedUserId=?";
		return jdbcTemplate.queryForList(sql, getOrderUserId);
	}
}
