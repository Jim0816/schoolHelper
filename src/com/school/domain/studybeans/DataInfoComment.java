package com.school.domain.studybeans;

import java.sql.Timestamp;

public class DataInfoComment {
	private int dataInfoCommentId;
	private int dataShareInfoId;
	private int dataInfoCommenterId;
	private Timestamp dataCommentTime;
	private String dataCommentContent;
	public int getDataInfoCommentId() {
		return dataInfoCommentId;
	}
	public void setDataInfoCommentId(int dataInfoCommentId) {
		this.dataInfoCommentId = dataInfoCommentId;
	}
	public int getDataShareInfoId() {
		return dataShareInfoId;
	}
	public void setDataShareInfoId(int dataShareInfoId) {
		this.dataShareInfoId = dataShareInfoId;
	}
	public int getDataInfoCommenterId() {
		return dataInfoCommenterId;
	}
	public void setDataInfoCommenterId(int dataInfoCommenterId) {
		this.dataInfoCommenterId = dataInfoCommenterId;
	}
	public Timestamp getDataCommentTime() {
		return dataCommentTime;
	}
	public void setDataCommentTime(Timestamp dataCommentTime) {
		this.dataCommentTime = dataCommentTime;
	}
	public String getDataCommentContent() {
		return dataCommentContent;
	}
	public void setDataCommentContent(String dataCommentContent) {
		this.dataCommentContent = dataCommentContent;
	}
	
}
