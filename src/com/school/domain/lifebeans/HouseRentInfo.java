package com.school.domain.lifebeans;

import java.sql.Timestamp;

public class HouseRentInfo {
	private int rentId;
	private String rentTitle;
	private String rentPhoto;
	private String rentDetail;
	private String rentWay;
	private String houseStruct;
	private String houseArea;
	private String rentPrice;
	private String address;
	private Timestamp sendDate;
	private String ownerName;
	private int ownerId;
	private String ownerTel;
	private int lookNum;
	public int getRentId() {
		return rentId;
	}
	public void setRentId(int rentId) {
		this.rentId = rentId;
	}
	public String getRentTitle() {
		return rentTitle;
	}
	public void setRentTitle(String rentTitle) {
		this.rentTitle = rentTitle;
	}
	public String getRentPhoto() {
		return rentPhoto;
	}
	public void setRentPhoto(String rentPhoto) {
		this.rentPhoto = rentPhoto;
	}
	public String getRentDetail() {
		return rentDetail;
	}
	public void setRentDetail(String rentDetail) {
		this.rentDetail = rentDetail;
	}
	public String getRentWay() {
		return rentWay;
	}
	public void setRentWay(String rentWay) {
		this.rentWay = rentWay;
	}
	public String getHouseStruct() {
		return houseStruct;
	}
	public void setHouseStruct(String houseStruct) {
		this.houseStruct = houseStruct;
	}
	public String getHouseArea() {
		return houseArea;
	}
	public void setHouseArea(String houseArea) {
		this.houseArea = houseArea;
	}
	public String getRentPrice() {
		return rentPrice;
	}
	public void setRentPrice(String rentPrice) {
		this.rentPrice = rentPrice;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Timestamp getSendDate() {
		return sendDate;
	}
	public void setSendDate(Timestamp sendDate) {
		this.sendDate = sendDate;
	}
	public String getOwnerName() {
		return ownerName;
	}
	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}
	public int getOwnerId() {
		return ownerId;
	}
	public void setOwnerId(int ownerId) {
		this.ownerId = ownerId;
	}
	public String getOwnerTel() {
		return ownerTel;
	}
	public void setOwnerTel(String ownerTel) {
		this.ownerTel = ownerTel;
	}
	public int getLookNum() {
		return lookNum;
	}
	public void setLookNum(int lookNum) {
		this.lookNum = lookNum;
	}
}
