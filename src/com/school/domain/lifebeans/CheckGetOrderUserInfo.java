package com.school.domain.lifebeans;

import java.sql.Timestamp;

public class CheckGetOrderUserInfo {
	private int checkInfoId;
	private int checkedUserId;
	private String trueName;
	private String theUsertel;
	private String stuCardAndPersonImg;
	private int guaranteeMoney;
	private String state;
	private Timestamp time;
	public int getCheckInfoId() {
		return checkInfoId;
	}
	public void setCheckInfoId(int checkInfoId) {
		this.checkInfoId = checkInfoId;
	}
	public int getCheckedUserId() {
		return checkedUserId;
	}
	public void setCheckedUserId(int checkedUserId) {
		this.checkedUserId = checkedUserId;
	}
	public String getTrueName() {
		return trueName;
	}
	public void setTrueName(String trueName) {
		this.trueName = trueName;
	}
	public String getTheUsertel() {
		return theUsertel;
	}
	public void setTheUsertel(String theUsertel) {
		this.theUsertel = theUsertel;
	}
	public String getStuCardAndPersonImg() {
		return stuCardAndPersonImg;
	}
	public void setStuCardAndPersonImg(String stuCardAndPersonImg) {
		this.stuCardAndPersonImg = stuCardAndPersonImg;
	}
	public int getGuaranteeMoney() {
		return guaranteeMoney;
	}
	public void setGuaranteeMoney(int guaranteeMoney) {
		this.guaranteeMoney = guaranteeMoney;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	
}
