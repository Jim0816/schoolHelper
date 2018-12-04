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
	//查询房间电费余额(通过房间位置查找到一行记录)
	public List<Map<String, Object>> queryElectronicRemain(String area,String unit,String houseNumber){
		String sql = "select * from electronicinfo where area=? and unit=? and houseNumber=?";
		return jdbcTemplate.queryForList(sql,area,unit,houseNumber);   
	}
	//更新房间电费信息
	public  int payElectronic(String area,String unit,String houseNumber,String remainMoney){
		String sql = "update electronicinfo set remainMoney=? where area=? and unit=? and houseNumber=?";
		return jdbcTemplate.update(sql,remainMoney,area,unit,houseNumber);
	}
}
