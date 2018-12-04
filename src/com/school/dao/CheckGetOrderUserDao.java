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
	//ͨ���ӵ���id��ѯ�ӵ��ߵ���Ϣ
	//���ҿ�ݴ�����Ϣ
	public List<Map<String, Object>> getGetOrderUserInfo(int getOrderUserId){
		String sql="select *from getordercheck where checkedUserId=?";
		return jdbcTemplate.queryForList(sql, getOrderUserId);
	}
}
