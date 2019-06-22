package com.jiangxinsoft.scorpio.epm.model;

import java.io.Serializable;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;

public class EpmProjectInfo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 项目ID
	 */
	private String projectId;
	
	/**
	 * 项目群
	 */
	private String groupId;
	private String groupName;
	
	/**
	 * 项目模板
	 */
	private String templateId;
	private String templateName;
	
	/**
	 * 项目类型
	 */
	private String typeId;
	private String typeName;
	
	/**
	 * 项目群图标
	 */
	private String projectIcon;
	
	/**
	 * 项目群序号
	 */
	private String projectOrder;
	
	/**
	 * 项目名称
	 */
	private String projectName;
	
	/**
	 * 项目备注
	 */
	private String projectRemark;

	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
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

	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getProjectIcon() {
		return projectIcon;
	}

	public void setProjectIcon(String projectIcon) {
		this.projectIcon = projectIcon;
	}

	public String getProjectOrder() {
		return projectOrder;
	}

	public void setProjectOrder(String projectOrder) {
		this.projectOrder = projectOrder;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getProjectRemark() {
		return projectRemark;
	}

	public void setProjectRemark(String projectRemark) {
		this.projectRemark = projectRemark;
	}

	
}
