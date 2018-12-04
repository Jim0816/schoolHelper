package com.school.dao;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class OrderWaterDao {
	@Resource  
    private JdbcTemplate jdbcTemplate;
	public int addWaterOrder(String area,String unit,String houseNumber,String waterDept,
			int waterNum,String payMoney,String tel,int orderUserId){
		String waterStatement = "0";
		String sql ="insert into watercenterorder(area,unit,houseNumber,waterDept," +
				"waterNum,payMoney,tel,waterStatement,orderUserId) values(?,?,?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql, area,unit,houseNumber,waterDept,waterNum,payMoney,tel,waterStatement,orderUserId);
	}
}
