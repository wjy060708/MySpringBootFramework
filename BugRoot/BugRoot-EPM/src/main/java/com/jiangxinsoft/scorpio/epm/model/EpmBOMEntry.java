package com.jiangxinsoft.scorpio.epm.model;

import java.io.Serializable;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import com.jiangxinsoft.scorpio.base.TreeModel;

public class EpmBOMEntry implements TreeModel, Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String entryId;
	
	/**
	 * 产品清单所属模板
	 */
	private String templateId;
	private String templateName;
	

	/**
	 * 项目类型
	 */
	private String typeId;
	
	/**
	 * 产品清单所属项目
	 */
	private String projectId;
	private String projectName;
	
	private String parentId;
	
	private String entryName;
	
	private String entryRemark;
	
	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	private Date createTime;
	
	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	private Date updateTime;

	@Override
	public String getId() {
		return entryId;
	}
	
	public String getEntryId() {
		return entryId;
	}

	public void setEntryId(String entryId) {
		this.entryId = entryId;
	}

	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}

	public String getTemplateId() {
		return templateId;
	}

	public void setTemplateId(String templateId) {
		this.templateId = templateId;
	}

	public String getTemplateName() {
		return templateName;
	}

	public void setTemplateName(String templateName) {
		this.templateName = templateName;
	}

	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	@Override
	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	@Override
	public String getText() {
		return entryName;
	}
	
	public String getEntryName() {
		return entryName;
	}

	public void setEntryName(String entryName) {
		this.entryName = entryName;
	}

	public String getEntryRemark() {
		return entryRemark;
	}

	public void setEntryRemark(String entryRemark) {
		this.entryRemark = entryRemark;
	}
	
	@Override
	public String getIconCls() {
		return "";
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	
}
