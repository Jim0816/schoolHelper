package com.school.dao;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.school.domain.lifebeans.DeliverySendInfo;

/*
 * 该项目目前没有使用，备用拓展
 */
@Repository
public class DeliverySendInfoDao {
	@Resource  
    private JdbcTemplate jdbcTemplate; 
	//添加快递代领订单信息
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
