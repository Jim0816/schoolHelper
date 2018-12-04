package com.school.dao;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ElectronicOrderDao {
	@Resource  
    private JdbcTemplate jdbcTemplate; 
	//增加电费订单信息
	public int addElectronicOrder(String area,String unit,String houseNumber,String payMoney,int payUserId){
		//payMoney表示当前充值费用
		String orderStatement = "0";
		String sql = "insert into electronicorder(area,unit,houseNumber,payMoney,payUserId,orderStatement) values(?,?,?,?,?,?)";
		return jdbcTemplate.update(sql,area,unit,houseNumber,payMoney,payUserId,orderStatement);
	}
}
