package com.school.domain.schoolbeans;

import java.sql.Date;

public class SchoolNews {
	private Integer schoolNewsId;
	private String schoolNewsTitle;
	private String schoolNewsContent;
	private Date schoolNewsDate;
	private String schoolNewsSrc;
	public Integer getSchoolNewsId() {
		return schoolNewsId;
	}
	public void setSchoolNewsId(Integer schoolNewsId) {
		this.schoolNewsId = schoolNewsId;
	}
	public String getSchoolNewsTitle() {
		return schoolNewsTitle;
	}
	public void setSchoolNewsTitle(String schoolNewsTitle) {
		this.schoolNewsTitle = schoolNewsTitle;
	}
	public String getSchoolNewsContent() {
		return schoolNewsContent;
	}
	public void setSchoolNewsContent(String schoolNewsContent) {
		this.schoolNewsContent = schoolNewsContent;
	}
	public Date getSchoolNewsDate() {
		return schoolNewsDate;
	}
	public void setSchoolNewsDate(Date schoolNewsDate) {
		this.schoolNewsDate = schoolNewsDate;
	}
	public String getSchoolNewsSrc() {
		return schoolNewsSrc;
	}
	public void setSchoolNewsSrc(String schoolNewsSrc) {
		this.schoolNewsSrc = schoolNewsSrc;
	}
	
	
}
