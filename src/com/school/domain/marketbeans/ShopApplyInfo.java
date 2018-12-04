package com.school.domain.marketbeans;

import java.sql.Timestamp;

/*
 * µÍ∆Ã…Í«Î¿‡
 */
public class ShopApplyInfo {
	private int applyId;
	private String belongsAcademy;
	private int applyUserId;
	private String linkman;
	private String applyImg;
	private String phoneNo;
	private String applyDesc;
	private String applyStatus;
	private String handleDesc;
	private int shopId;
	private Timestamp createTime;
	
	public int getApplyId() {
		return applyId;
	}
	public void setApplyId(int applyId) {
		this.applyId = applyId;
	}
	
	public String getBelongsAcademy() {
		return belongsAcademy;
	}
	public void setBelongsAcademy(String belongsAcademy) {
		this.belongsAcademy = belongsAcademy;
	}
	public int getApplyUserId() {
		return applyUserId;
	}
	public void setApplyUserId(int applyUserId) {
		this.applyUserId = applyUserId;
	}
	public String getLinkman() {
		return linkman;
	}
	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}
	public String getApplyImg() {
		return applyImg;
	}
	public void setApplyImg(String applyImg) {
		this.applyImg = applyImg;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	public String getApplyDesc() {
		return applyDesc;
	}
	public void setApplyDesc(String applyDesc) {
		this.applyDesc = applyDesc;
	}
	
	public String getApplyStatus() {
		return applyStatus;
	}
	public void setApplyStatus(String applyStatus) {
		this.applyStatus = applyStatus;
	}
	public String getHandleDesc() {
		return handleDesc;
	}
	public void setHandleDesc(String handleDesc) {
		this.handleDesc = handleDesc;
	}
	public int getShopId() {
		return shopId;
	}
	public void setShopId(int shopId) {
		this.shopId = shopId;
	}
	public Timestamp getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}
	
	
}
