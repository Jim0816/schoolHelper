package com.school.domain.studybeans;

import java.sql.Timestamp;

public class StudyDiscussInfo {
	private int studyDiscussInfoId;
	private int writeDiscussId;
	private String discussTitle;
	private String discussContent;
	private String discussPhoto;
	private Timestamp sendDiscussTime;
	private int discussSearchNum;
	public int getStudyDiscussInfoId() {
		return studyDiscussInfoId;
	}
	public void setStudyDiscussInfoId(int studyDiscussInfoId) {
		this.studyDiscussInfoId = studyDiscussInfoId;
	}
	
	public int getWriteDiscussId() {
		return writeDiscussId;
	}
	public void setWriteDiscussId(int writeDiscussId) {
		this.writeDiscussId = writeDiscussId;
	}
	public String getDiscussTitle() {
		return discussTitle;
	}
	public void setDiscussTitle(String discussTitle) {
		this.discussTitle = discussTitle;
	}
	public String getDiscussContent() {
		return discussContent;
	}
	public void setDiscussContent(String discussContent) {
		this.discussContent = discussContent;
	}
	public String getDiscussPhoto() {
		return discussPhoto;
	}
	public void setDiscussPhoto(String discussPhoto) {
		this.discussPhoto = discussPhoto;
	}
	public Timestamp getSendDiscussTime() {
		return sendDiscussTime;
	}
	public void setSendDiscussTime(Timestamp sendDiscussTime) {
		this.sendDiscussTime = sendDiscussTime;
	}
	public int getDiscussSearchNum() {
		return discussSearchNum;
	}
	public void setDiscussSearchNum(int discussSearchNum) {
		this.discussSearchNum = discussSearchNum;
	}
	
	
}
