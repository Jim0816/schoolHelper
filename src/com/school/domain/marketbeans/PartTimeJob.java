package com.school.domain.marketbeans;

import java.sql.Timestamp;

public class PartTimeJob {
	private int jobId;
	private String jobSender;
	private String jobAddress;
	private String jobTitle;
	private String jobContent;
	private Timestamp jobSendTime;
	public int getJobId() {
		return jobId;
	}
	public void setJobId(int jobId) {
		this.jobId = jobId;
	}
	public String getJobSender() {
		return jobSender;
	}
	public void setJobSender(String jobSender) {
		this.jobSender = jobSender;
	}
	public String getJobAddress() {
		return jobAddress;
	}
	public void setJobAddress(String jobAddress) {
		this.jobAddress = jobAddress;
	}
	public String getJobTitle() {
		return jobTitle;
	}
	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}
	public String getJobContent() {
		return jobContent;
	}
	public void setJobContent(String jobContent) {
		this.jobContent = jobContent;
	}
	public Timestamp getJobSendTime() {
		return jobSendTime;
	}
	public void setJobSendTime(Timestamp jobSendTime) {
		this.jobSendTime = jobSendTime;
	}
}
