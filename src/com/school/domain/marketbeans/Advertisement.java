package com.school.domain.marketbeans;

import java.sql.Timestamp;

public class Advertisement {
	private int advId;
	private String advSender;
	private String advAddress;
	private String advTitle;
	private String advContent;
	private Timestamp advTime;
	public int getAdvId() {
		return advId;
	}
	public void setAdvId(int advId) {
		this.advId = advId;
	}
	public String getAdvSender() {
		return advSender;
	}
	public void setAdvSender(String advSender) {
		this.advSender = advSender;
	}
	public String getAdvAddress() {
		return advAddress;
	}
	public void setAdvAddress(String advAddress) {
		this.advAddress = advAddress;
	}
	public String getAdvTitle() {
		return advTitle;
	}
	public void setAdvTitle(String advTitle) {
		this.advTitle = advTitle;
	}
	public String getAdvContent() {
		return advContent;
	}
	public void setAdvContent(String advContent) {
		this.advContent = advContent;
	}
	public Timestamp getAdvTime() {
		return advTime;
	}
	public void setAdvTime(Timestamp advTime) {
		this.advTime = advTime;
	}
	
}
