package com.school.domain.lifebeans;

import java.sql.Timestamp;

public class DeliveryGetInfo {
	private int getDeliveryId;
	private int clientUserId;
	private String clientUserName;
	private String clientUserTel;
	private String deliveryCompany;
	private String companyArea;
	private String getDeliveryCode;
	private String deliveryContent;
	private String deliveryWeight;
	private String clientAddress;
	private String clientRemark;
	private String serverMoney;
	private Timestamp sendTime;
	private String state;
	public int getGetDeliveryId() {
		return getDeliveryId;
	}
	public void setGetDeliveryId(int getDeliveryId) {
		this.getDeliveryId = getDeliveryId;
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
	public String getGetDeliveryCode() {
		return getDeliveryCode;
	}
	public void setGetDeliveryCode(String getDeliveryCode) {
		this.getDeliveryCode = getDeliveryCode;
	}
	public String getDeliveryContent() {
		return deliveryContent;
	}
	public void setDeliveryContent(String deliveryContent) {
		this.deliveryContent = deliveryContent;
	}
	public String getDeliveryWeight() {
		return deliveryWeight;
	}
	public void setDeliveryWeight(String deliveryWeight) {
		this.deliveryWeight = deliveryWeight;
	}
	public String getClientAddress() {
		return clientAddress;
	}
	public void setClientAddress(String clientAddress) {
		this.clientAddress = clientAddress;
	}
	public String getClientRemark() {
		return clientRemark;
	}
	public void setClientRemark(String clientRemark) {
		this.clientRemark = clientRemark;
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
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
}
