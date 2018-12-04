package com.school.dao;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MakeOrderRelationDao {
	@Resource  
    private JdbcTemplate jdbcTemplate; 
	//��Ӷ�����ϵ,�����ݶ���id�ͽӵ���id
	public int addOrderRelation(int deliveryOrderId,int getOrderUserId){
		String sql="insert into orderrelation(deliveryOrderId,getOrderUserId) values(?,?)";
		return jdbcTemplate.update(sql,deliveryOrderId,getOrderUserId);
	}
	//��ѯĳ�û����з��񶩵���Ϣ
	
}
