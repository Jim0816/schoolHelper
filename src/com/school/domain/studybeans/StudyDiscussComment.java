package com.school.domain.studybeans;

import java.sql.Timestamp;

public class StudyDiscussComment {
	private int studyDiscussCommentId;
	private int studyDiscussInfoId;
	private int studyCommenterId;
	private String studyCommentContent;
	private Timestamp studyCommentTime;
	public int getStudyDiscussCommentId() {
		return studyDiscussCommentId;
	}
	public void setStudyDiscussCommentId(int studyDiscussCommentId) {
		this.studyDiscussCommentId = studyDiscussCommentId;
	}
	public int getStudyDiscussInfoId() {
		return studyDiscussInfoId;
	}
	public void setStudyDiscussInfoId(int studyDiscussInfoId) {
		this.studyDiscussInfoId = studyDiscussInfoId;
	}
	public int getStudyCommenterId() {
		return studyCommenterId;
	}
	public void setStudyCommenterId(int studyCommenterId) {
		this.studyCommenterId = studyCommenterId;
	}
	public String getStudyCommentContent() {
		return studyCommentContent;
	}
	public void setStudyCommentContent(String studyCommentContent) {
		this.studyCommentContent = studyCommentContent;
	}
	public Timestamp getStudyCommentTime() {
		return studyCommentTime;
	}
	public void setStudyCommentTime(Timestamp studyCommentTime) {
		this.studyCommentTime = studyCommentTime;
	}
	
	
}
