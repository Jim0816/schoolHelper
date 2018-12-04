package com.school.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.school.domain.marketbeans.ShopApplyInfo;
@Repository
public class ShopApplyDao {
	@Resource  
    private JdbcTemplate jdbcTemplate;
	//��ѯ����������Ϣ(ͨ�������˵��˺�)
	public List<Map<String, Object>> queryShopApplyInfo(int applyUserId){
		String sql="select *from shop_apply where applyUserId=?";
		return jdbcTemplate.queryForList(sql,applyUserId);
	}
	//��ӵ���������Ϣ(����ʱֻ��Ҫ������Ϣ)
	public int addShopApplyInfo(ShopApplyInfo shopApplyInfo){
		String sql="insert into shop_apply(belongsAcademy,applyUserId,linkman,applyImg,phoneNo," +
				"applyDesc,applyStatus,handleDesc,shopId) values(?,?,?,?,?,?,?,?,?)";
		String applyStatus = "0";//���״̬Ĭ��Ϊ0��ʾ�����
		return jdbcTemplate.update(sql,shopApplyInfo.getBelongsAcademy(),shopApplyInfo.getApplyUserId(),
				shopApplyInfo.getLinkman(),shopApplyInfo.getApplyImg(),shopApplyInfo.getPhoneNo(),
				shopApplyInfo.getApplyDesc(),applyStatus,shopApplyInfo.getHandleDesc(),
				shopApplyInfo.getShopId());
	}
}
