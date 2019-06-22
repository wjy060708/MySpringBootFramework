package com.jiangxinsoft.scorpio.epm.model;

import java.util.Date;

public class EpmProjectAchie {

	/**
	 * 项目成果
	 */
	private String achieId;
	
	private String entryId;
	
	private String userId;
	
	private String projectId;
	
	private String resourceId;
	
	private String achieTitle;
	private String achieAthor;
	private String achieRemark;
	
	private String documentExtension;
	
	private Date createTime;

	public String getAchieId() {
		return achieId;
	}

	public void setAchieId(String achieId) {
		this.achieId = achieId;
	}

	public String getEntryId() {
		return entryId;
	}

	public void setEntryId(String entryId) {
		this.entryId = entryId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	public String getResourceId() {
		return resourceId;
	}

	public void setResourceId(String resourceId) {
		this.resourceId = resourceId;
	}

	public String getAchieTitle() {
		return achieTitle;
	}

	public void setAchieTitle(String achieTitle) {
		this.achieTitle = achieTitle;
	}

	public String getAchieAthor() {
		return achieAthor;
	}

	public void setAchieAthor(String achieAthor) {
		this.achieAthor = achieAthor;
	}

	public String getAchieRemark() {
		return achieRemark;
	}

	public void setAchieRemark(String achieRemark) {
		this.achieRemark = achieRemark;
	}

	public String getDocumentExtension() {
		return documentExtension;
	}

	public void setDocumentExtension(String documentExtension) {
		this.documentExtension = documentExtension;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
}
