package com.mycompany.ldit.project.model.vo;

import java.sql.Date;

public class Project {
	private static final long serialVersionUID = 1111L;
	private int proNo;
	private String proTitle;
	private String proContent;
	private Date proStart;
	private Date proEnd;
	private String proManager;
	private char proStatus;

	public Project() {
	}
	
	@Override
	public String toString() {
		return "Project [proNo=" + proNo + ", proTitle=" + proTitle + ", proContent=" + proContent + ", proStart="
				+ proStart + ", proEnd=" + proEnd + ", proManager=" + proManager + ", proStatus=" + proStatus + "]";
	}

	public int getProNo() {
		return proNo;
	}

	public void setProNo(int proNo) {
		this.proNo = proNo;
	}

	public String getProTitle() {
		return proTitle;
	}

	public void setProTitle(String proTitle) {
		this.proTitle = proTitle;
	}

	public String getProContent() {
		return proContent;
	}

	public void setProContent(String proContent) {
		this.proContent = proContent;
	}

	public Date getProStart() {
		return proStart;
	}

	public void setProStart(Date proStart) {
		this.proStart = proStart;
	}

	public Date getProEnd() {
		return proEnd;
	}

	public void setProEnd(Date proEnd) {
		this.proEnd = proEnd;
	}

	public String getProManager() {
		return proManager;
	}

	public void setProManager(String proManager) {
		this.proManager = proManager;
	}

	public char getProStatus() {
		return proStatus;
	}

	public void setProStatus(char proStatus) {
		this.proStatus = proStatus;
	}
}
