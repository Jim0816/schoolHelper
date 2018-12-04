package com.school.dao;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ElectronicOrderDao {
	@Resource  
    private JdbcTemplate jdbcTemplate; 
	//���ӵ�Ѷ�����Ϣ
	public int addElectronicOrder(String area,String unit,String houseNumber,String payMoney,int payUserId){
		//payMoney��ʾ��ǰ��ֵ����
		String orderStatement = "0";
		String sql = "insert into electronicorder(area,unit,houseNumber,payMoney,payUserId,orderStatement) values(?,?,?,?,?,?)";
		return jdbcTemplate.update(sql,area,unit,houseNumber,payMoney,payUserId,orderStatement);
	}
}
