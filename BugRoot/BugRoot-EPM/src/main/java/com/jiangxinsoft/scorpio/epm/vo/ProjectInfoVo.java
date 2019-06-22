package com.jiangxinsoft.scorpio.epm.vo;

import com.jiangxinsoft.scorpio.epm.model.EpmProjectInfo;

@SuppressWarnings("serial")
public class ProjectInfoVo extends EpmProjectInfo {
	
	/**
	 * 项目责任人
	 */
	private String userId;	
	private String trueName;
	
	/**
	 * 项目责任单位
	 */
	private String departmentId;
	private String departmentName;
	
	/**
	 * 项目背景
	 */
	private String projectGround;
	
	/**
	 * 项目经费
	 */	
	private String projectMonney;
	
	/**
	 * 项目状态
	 */	
	private String projectStatus;

	private String startTime;
	
	private String endTime;

	public ProjectInfoVo() {
		super();
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getTrueName() {
		return trueName;
	}

	public void setTrueName(String trueName) {
		this.trueName = trueName;
	}

	public String getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public String getProjectGround() {
		return projectGround;
	}

	public void setProjectGround(String projectGround) {
		this.projectGround = projectGround;
	}

	public String getProjectStatus() {
		return projectStatus;
	}

	public void setProjectStatus(String projectStatus) {
		this.projectStatus = projectStatus;
	}

	public String getProjectMonney() {
		return projectMonney;
	}

	public void setProjectMonney(String projectMonney) {
		this.projectMonney = projectMonney;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

}

