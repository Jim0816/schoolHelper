package com.school.dao;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class RepairApplyInfoDao {
	@Resource  
    private JdbcTemplate jdbcTemplate;
	public int addRepairInfo(String area,String unit,String houseNumber,String repairContent,
			String remark,int repairUserId,String tel){
		String repairState ="0";
		String sql="insert into repairinfo(area,unit,houseNumber,repairContent,remark,repairUserId,tel," +
				"repairState) values(?,?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql,area,unit,houseNumber,repairContent,remark,repairUserId,tel,repairState);
	}
}
