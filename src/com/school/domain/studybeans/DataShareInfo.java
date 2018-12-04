package com.school.domain.studybeans;

import java.sql.Timestamp;
import java.util.Date;

public class DataShareInfo {
	private int dataShareInfoId;
	private String dataType;
	private String dataTypeName;
	private int shareUserId;
	private String dataTitle;
	private String linkText;
	private String linkPwd;
	private String shareTime;
	private int loadNum;
	public int getDataShareInfoId() {
		return dataShareInfoId;
	}
	public void setDataShareInfoId(int dataShareInfoId) {
		this.dataShareInfoId = dataShareInfoId;
	}
	public String getDataType() {
		return dataType;
	}
	public void setDataType(String dataType) {
		this.dataType = dataType;
	}
	
	public String getDataTypeName() {
		return dataTypeName;
	}
	public void setDataTypeName(String dataTypeName) {
		this.dataTypeName = dataTypeName;
	}
	public int getShareUserId() {
		return shareUserId;
	}
	public void setShareUserId(int shareUserId) {
		this.shareUserId = shareUserId;
	}
	public String getDataTitle() {
		return dataTitle;
	}
	public void setDataTitle(String dataTitle) {
		this.dataTitle = dataTitle;
	}
	public String getLinkText() {
		return linkText;
	}
	public void setLinkText(String linkText) {
		this.linkText = linkText;
	}
	public String getLinkPwd() {
		return linkPwd;
	}
	public void setLinkPwd(String linkPwd) {
		this.linkPwd = linkPwd;
	}
	public String getShareTime() {
		return shareTime;
	}
	public void setShareTime(String string) {
		this.shareTime = string;
	}
	public int getLoadNum() {
		return loadNum;
	}
	public void setLoadNum(int loadNum) {
		this.loadNum = loadNum;
	}
	
	
}
