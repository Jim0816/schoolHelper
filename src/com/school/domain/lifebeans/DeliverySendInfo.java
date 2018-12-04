package com.school.domain.lifebeans;
/*
 * 该项目目前没有使用，备用拓展
 */
import java.sql.Timestamp;

public class DeliverySendInfo {
	private int sendDeliveryId;
	private int clientUserId;
	private String clientUserName;
	private String clientUserTel;
	private String clientAddress;
	private String clientSendAddress;
	private String deliveryCompany;
	private String companyArea;
	private String receiptUserName;
	private String receiptUserTel;
	private String receiptAddress;
	private String deliveryWeight;
	private String clientRemark;
	private String basicMoney;
	private String serverMoney;
	private Timestamp sendTime;
	public int getSendDeliveryId() {
		return sendDeliveryId;
	}
	public void setSendDeliveryId(int sendDeliveryId) {
		this.sendDeliveryId = sendDeliveryId;
	}
	public int getClientUserId() {
		return clientUserId;
	}
	public void setClientUserId(int clientUserId) {
		this.clientUserId = clientUserId;
	}
	public String getClientUserName() {
		return clientUserName;
	}
	public void setClientUserName(String clientUserName) {
		this.clientUserName = clientUserName;
	}
	public String getClientUserTel() {
		return clientUserTel;
	}
	public void setClientUserTel(String clientUserTel) {
		this.clientUserTel = clientUserTel;
	}
	public String getClientAddress() {
		return clientAddress;
	}
	public void setClientAddress(String clientAddress) {
		this.clientAddress = clientAddress;
	}
	public String getClientSendAddress() {
		return clientSendAddress;
	}
	public void setClientSendAddress(String clientSendAddress) {
		this.clientSendAddress = clientSendAddress;
	}
	public String getDeliveryCompany() {
		return deliveryCompany;
	}
	public void setDeliveryCompany(String deliveryCompany) {
		this.deliveryCompany = deliveryCompany;
	}
	
	public String getCompanyArea() {
		return companyArea;
	}
	public void setCompanyArea(String companyArea) {
		this.companyArea = companyArea;
	}
	public String getReceiptUserName() {
		return receiptUserName;
	}
	public void setReceiptUserName(String receiptUserName) {
		this.receiptUserName = receiptUserName;
	}
	public String getReceiptUserTel() {
		return receiptUserTel;
	}
	public void setReceiptUserTel(String receiptUserTel) {
		this.receiptUserTel = receiptUserTel;
	}
	public String getReceiptAddress() {
		return receiptAddress;
	}
	public void setReceiptAddress(String receiptAddress) {
		this.receiptAddress = receiptAddress;
	}
	public String getDeliveryWeight() {
		return deliveryWeight;
	}
	public void setDeliveryWeight(String deliveryWeight) {
		this.deliveryWeight = deliveryWeight;
	}
	public String getClientRemark() {
		return clientRemark;
	}
	public void setClientRemark(String clientRemark) {
		this.clientRemark = clientRemark;
	}
	public String getBasicMoney() {
		return basicMoney;
	}
	public void setBasicMoney(String basicMoney) {
		this.basicMoney = basicMoney;
	}
	public String getServerMoney() {
		return serverMoney;
	}
	public void setServerMoney(String serverMoney) {
		this.serverMoney = serverMoney;
	}
	public Timestamp getSendTime() {
		return sendTime;
	}
	public void setSendTime(Timestamp sendTime) {
		this.sendTime = sendTime;
	}
	
	
}
