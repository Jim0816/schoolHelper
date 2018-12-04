package com.school.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.school.domain.lifebeans.HouseRentInfo;
import com.school.utils.PageUtil;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;


@Repository
public class HouseRentInfoDao {
	@Resource  
    private JdbcTemplate jdbcTemplate; 
	//查询所有租赁信息(分页，按照发布时间排序)
	public PageUtil getAllRentInfo(int currentPage,int numPerPage){
		String sql = "select * from renthouse order by sendDate desc";
		 PageUtil pageUtil = new PageUtil(sql, currentPage, numPerPage, jdbcTemplate);
		 return pageUtil;
	}
	//修改浏览数量
	public int updateRentLookNum(int rentId){
		//查看前把浏览数量先更新
		String sql = "update renthouse set lookNum=lookNum+1 where rentId=?";
		return jdbcTemplate.update(sql, rentId);
	}
	//查询指定的租赁信息
	public List<Map<String, Object>> getRentDetail(int rentId){
		String sql = "select * from renthouse where rentId=?";
		return jdbcTemplate.queryForList(sql, rentId);
	}
	//插入租赁信息
	public int addHouseRentInfo(HouseRentInfo houseRentInfo){
		String sql="insert into renthouse(rentTitle,rentPhoto,rentDetail,rentWay,houseStruct,houseArea," +
				"rentPrice,address,ownerName,ownerId,ownerTel) values(?,?,?,?,?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql,houseRentInfo.getRentTitle(),houseRentInfo.getRentPhoto(),
				houseRentInfo.getRentDetail(),houseRentInfo.getRentWay(),houseRentInfo.getHouseStruct(),
				houseRentInfo.getHouseArea(),houseRentInfo.getRentPrice(),houseRentInfo.getAddress(),
				houseRentInfo.getOwnerName(),houseRentInfo.getOwnerId(),houseRentInfo.getOwnerTel());
	}
	
	
	
}



