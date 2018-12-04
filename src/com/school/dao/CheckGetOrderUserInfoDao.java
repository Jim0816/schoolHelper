package com.school.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.school.domain.lifebeans.CheckGetOrderUserInfo;

@Repository
public class CheckGetOrderUserInfoDao {
	@Resource  
    private JdbcTemplate jdbcTemplate; 
	//��ѯ�ӵ��û��������Ϣ
	public  List<Map<String, Object>> queryGetOrderUserInfo(int checkedUserId){
		String sql="select * from getordercheck where checkedUserId=?";
		return jdbcTemplate.queryForList(sql, checkedUserId);
	}
	
	//���������Ȩ��Ϣ
	public int addCheckUserInfo(CheckGetOrderUserInfo checkGetOrderUserInfo){
		String sql="insert into getordercheck(checkedUserId,trueName,theUsertel,stuCardAndPersonImg," +
				"guaranteeMoney,state) values(?,?,?,?,?,?)";
		return jdbcTemplate.update(sql, checkGetOrderUserInfo.getCheckedUserId(),checkGetOrderUserInfo.getTrueName(),
				checkGetOrderUserInfo.getTheUsertel(),checkGetOrderUserInfo.getStuCardAndPersonImg(),
				checkGetOrderUserInfo.getGuaranteeMoney(),checkGetOrderUserInfo.getState());
	}
}
