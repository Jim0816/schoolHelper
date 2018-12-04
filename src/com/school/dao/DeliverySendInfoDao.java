package com.school.dao;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.school.domain.lifebeans.DeliverySendInfo;

/*
 * ����ĿĿǰû��ʹ�ã�������չ
 */
@Repository
public class DeliverySendInfoDao {
	@Resource  
    private JdbcTemplate jdbcTemplate; 
	//��ӿ�ݴ��충����Ϣ
	public int addDeliverySendInfo(DeliverySendInfo deliverySendInfo){
		String sql="insert into deliverysendinfo(clientUserId,clientUserName,clientUserTel,clientAddress," +
				"clientSendAddress,deliveryCompany,companyArea,receiptUserName,receiptUserTel,receiptAddress," +
				"deliveryWeight,clientRemark,basicMoney,serverMoney values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql,deliverySendInfo.getClientUserId(),deliverySendInfo.getClientUserName(),
				deliverySendInfo.getClientUserTel(),deliverySendInfo.getClientAddress(),deliverySendInfo.getClientSendAddress(),
				deliverySendInfo.getDeliveryCompany(),deliverySendInfo.getCompanyArea(),deliverySendInfo.getReceiptUserName(),
				deliverySendInfo.getReceiptUserTel(),deliverySendInfo.getReceiptAddress(),deliverySendInfo.getDeliveryWeight(),
				deliverySendInfo.getClientRemark(),deliverySendInfo.getBasicMoney(),deliverySendInfo.getServerMoney());
	}
}
