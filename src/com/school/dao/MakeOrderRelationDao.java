package com.school.dao;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MakeOrderRelationDao {
	@Resource  
    private JdbcTemplate jdbcTemplate; 
	//添加订单关系,传入快递订单id和接单者id
	public int addOrderRelation(int deliveryOrderId,int getOrderUserId){
		String sql="insert into orderrelation(deliveryOrderId,getOrderUserId) values(?,?)";
		return jdbcTemplate.update(sql,deliveryOrderId,getOrderUserId);
	}
	//查询某用户所有服务订单信息
	
}
