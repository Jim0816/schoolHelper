package com.school.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.school.domain.lifebeans.DeliveryGetInfo;
import com.school.utils.PageUtil;
@Repository
public class DeliveryGetInfoDao {
	@Resource  
    private JdbcTemplate jdbcTemplate; 
	//��ӿ�ݴ��충����Ϣ
	public int addDeliveryGetInfo(DeliveryGetInfo deliveryGetInfo){
		String state = "0";//������ʼ״̬
		String sql="insert into deliverygetinfo(clientUserId,clientUserName,clientUserTel,clientAddress," +
				"clientRemark,deliveryCompany,companyArea,getDeliveryCode,deliveryContent,deliveryWeight," +
				"serverMoney,state) values(?,?,?,?,?,?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql, deliveryGetInfo.getClientUserId(),deliveryGetInfo.getClientUserName(),
		deliveryGetInfo.getClientUserTel(),deliveryGetInfo.getClientAddress(),deliveryGetInfo.getClientRemark(),
		deliveryGetInfo.getDeliveryCompany(),deliveryGetInfo.getCompanyArea(),deliveryGetInfo.getGetDeliveryCode(),
		deliveryGetInfo.getDeliveryContent(),deliveryGetInfo.getDeliveryWeight(),deliveryGetInfo.getServerMoney(),state);
	}
	
	//���ҿ�ݴ�����Ϣ
	public List<Map<String, Object>> getDeliveryInfo(int getDeliveryId){
		String sql="select *from deliverygetinfo where getDeliveryId=?";
		return jdbcTemplate.queryForList(sql, getDeliveryId);
	}
	
	//�õ����п�ݴ��충������Ϣ����ҳ��
	public PageUtil getAllDeliveryOrderInfo(int currentPage,int numPerPage){
		String sql = "select *from deliverygetinfo where state='0' order by sendTime desc";
		 PageUtil pageUtil = new PageUtil(sql, currentPage, numPerPage, jdbcTemplate);
		 return pageUtil;
	}
	
	//�޸Ķ�����״̬(�ӵ���״̬Ϊ1)
	public int updateDeliveryOrderInfo(int getDeliveryId){
		String sql="update deliverygetinfo set state='1' where getDeliveryId=?";
		return jdbcTemplate.update(sql, getDeliveryId);
	}
}
