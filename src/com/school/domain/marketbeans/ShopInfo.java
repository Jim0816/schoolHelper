package com.school.domain.marketbeans;

import java.sql.Timestamp;

/*
 * µÍ∆Ã–≈œ¢¿‡
 */
public class ShopInfo {
	private int shopId;
	private String belongsAcademy;
	private String academyName;
	private int shopUserId;
	private String shopUserName;
	private String shopName;
	private String shopAdress;
	private String shopDesc;
	private String shopReform;
	private String shopImg;
	private String shopTel;
	private Timestamp shopCreateTime;
	private String shopState;
	private String shopStatus;
	public int getShopId() {
		return shopId;
	}
	public void setShopId(int shopId) {
		this.shopId = shopId;
	}
	public String getBelongsAcademy() {
		return belongsAcademy;
	}
	public void setBelongsAcademy(String belongsAcademy) {
		this.belongsAcademy = belongsAcademy;
	}
	
	public String getAcademyName() {
		return academyName;
	}
	public void setAcademyName(String academyName) {
		this.academyName = academyName;
	}
	public int getShopUserId() {
		return shopUserId;
	}
	public void setShopUserId(int shopUserId) {
		this.shopUserId = shopUserId;
	}
	public String getShopUserName() {
		return shopUserName;
	}
	public void setShopUserName(String shopUserName) {
		this.shopUserName = shopUserName;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public String getShopAdress() {
		return shopAdress;
	}
	public void setShopAdress(String shopAdress) {
		this.shopAdress = shopAdress;
	}
	public String getShopDesc() {
		return shopDesc;
	}
	public void setShopDesc(String shopDesc) {
		this.shopDesc = shopDesc;
	}
	public String getShopReform() {
		return shopReform;
	}
	public void setShopReform(String shopReform) {
		this.shopReform = shopReform;
	}
	public String getShopImg() {
		return shopImg;
	}
	public void setShopImg(String shopImg) {
		this.shopImg = shopImg;
	}
	public String getShopTel() {
		return shopTel;
	}
	public void setShopTel(String shopTel) {
		this.shopTel = shopTel;
	}
	public Timestamp getShopCreateTime() {
		return shopCreateTime;
	}
	public void setShopCreateTime(Timestamp shopCreateTime) {
		this.shopCreateTime = shopCreateTime;
	}
	public String getShopState() {
		return shopState;
	}
	public void setShopState(String shopState) {
		this.shopState = shopState;
	}
	public String getShopStatus() {
		return shopStatus;
	}
	public void setShopStatus(String shopStatus) {
		this.shopStatus = shopStatus;
	}
}
