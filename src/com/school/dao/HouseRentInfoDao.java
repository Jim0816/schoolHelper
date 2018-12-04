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
	//��ѯ����������Ϣ(��ҳ�����շ���ʱ������)
	public PageUtil getAllRentInfo(int currentPage,int numPerPage){
		String sql = "select * from renthouse order by sendDate desc";
		 PageUtil pageUtil = new PageUtil(sql, currentPage, numPerPage, jdbcTemplate);
		 return pageUtil;
	}
	//�޸��������
	public int updateRentLookNum(int rentId){
		//�鿴ǰ����������ȸ���
		String sql = "update renthouse set lookNum=lookNum+1 where rentId=?";
		return jdbcTemplate.update(sql, rentId);
	}
	//��ѯָ����������Ϣ
	public List<Map<String, Object>> getRentDetail(int rentId){
		String sql = "select * from renthouse where rentId=?";
		return jdbcTemplate.queryForList(sql, rentId);
	}
	//����������Ϣ
	public int addHouseRentInfo(HouseRentInfo houseRentInfo){
		String sql="insert into renthouse(rentTitle,rentPhoto,rentDetail,rentWay,houseStruct,houseArea," +
				"rentPrice,address,ownerName,ownerId,ownerTel) values(?,?,?,?,?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql,houseRentInfo.getRentTitle(),houseRentInfo.getRentPhoto(),
				houseRentInfo.getRentDetail(),houseRentInfo.getRentWay(),houseRentInfo.getHouseStruct(),
				houseRentInfo.getHouseArea(),houseRentInfo.getRentPrice(),houseRentInfo.getAddress(),
				houseRentInfo.getOwnerName(),houseRentInfo.getOwnerId(),houseRentInfo.getOwnerTel());
	}
	
	
	
}



