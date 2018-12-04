package com.school.domain.lifebeans;

public class ElectronicInfo {
	private int electricChargeInfoId;
	private String area;
	private String unit;
	private String houseNumber;
	private Float remainMoney;
	public int getElectricChargeInfoId() {
		return electricChargeInfoId;
	}
	public void setElectricChargeInfoId(int electricChargeInfoId) {
		this.electricChargeInfoId = electricChargeInfoId;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getHouseNumber() {
		return houseNumber;
	}
	public void setHouseNumber(String houseNumber) {
		this.houseNumber = houseNumber;
	}
	public Float getRemainMoney() {
		return remainMoney;
	}
	public void setRemainMoney(Float remainMoney) {
		this.remainMoney = remainMoney;
	}
}
