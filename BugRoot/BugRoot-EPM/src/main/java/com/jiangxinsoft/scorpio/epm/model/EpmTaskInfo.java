package com.jiangxinsoft.scorpio.epm.model;

import java.io.Serializable;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import com.jiangxinsoft.scorpio.base.TreeModel;

public class EpmTaskInfo implements TreeModel,Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String taskId;
	
	private String parentId;
	
	/**
	 * 项目
	 */
	private String projectId;
	private String projectName;
	
	/**
	 * 项目名称
	 */
	private String taskName;
	
	/**
	 * 项目备注
	 */
	private String taskRemark;

	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	private Date createTime;
	
	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	private Date updateTime;

	public String getTaskId() {
		return taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
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

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	public String getTaskRemark() {
		return taskRemark;
	}

	public void setTaskRemark(String taskRemark) {
		this.taskRemark = taskRemark;
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

	@Override
	public String getId() {
		return taskId;
	}

	@Override
	public String getParentId() {
		return parentId;
	}

	@Override
	public String getText() {
		return taskName;
	}

	@Override
	public String getIconCls() {
		return "";
	}
	
}
