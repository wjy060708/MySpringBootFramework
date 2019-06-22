package com.jiangxinsoft.scorpio.sys.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonIgnore;

@SuppressWarnings("serial")
public class SysPositionScope extends SysOrganization {
	
	private String id;
	
	/**
	 * 岗位
	 */
	private String positionId;
	private String positionName;
	
	@JsonIgnore
	private Date createTime;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPositionId() {
		return positionId;
	}

	public void setPositionId(String positionId) {
		this.positionId = positionId;
	}

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

}
