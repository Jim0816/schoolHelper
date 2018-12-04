package com.school.dao;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.school.domain.lifebeans.ElectronicInfo;

@Repository
public class ElectronicInfoDao {
	@Resource  
    private JdbcTemplate jdbcTemplate; 
	//��ѯ���������(ͨ������λ�ò��ҵ�һ�м�¼)
	public List<Map<String, Object>> queryElectronicRemain(String area,String unit,String houseNumber){
		String sql = "select * from electronicinfo where area=? and unit=? and houseNumber=?";
		return jdbcTemplate.queryForList(sql,area,unit,houseNumber);   
	}
	//���·�������Ϣ
	public  int payElectronic(String area,String unit,String houseNumber,String remainMoney){
		String sql = "update electronicinfo set remainMoney=? where area=? and unit=? and houseNumber=?";
		return jdbcTemplate.update(sql,remainMoney,area,unit,houseNumber);
	}
}
