package com.jiangxinsoft.scorpio.epm.model;

import java.io.Serializable;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;

public class EpmProjectGroup implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * 项目群ID
	 */
	private String groupId;
	
	/**
	 * 项目群名称
	 */
	private String groupName;
	
	/**
	 * 项目群图标
	 */
	private String groupIcon;
	
	/**
	 * 项目群序号
	 */
	private String groupOrder;
	
	/**
	 * 项目群备注
	 */
	private String groupRemark;

	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	private Date createTime;
	
	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	private Date updateTime;

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
	

	public String getGroupIcon() {
		return groupIcon;
	}

	public void setGroupIcon(String groupIcon) {
		this.groupIcon = groupIcon;
	}

	public String getGroupOrder() {
		return groupOrder;
	}

	public void setGroupOrder(String groupOrder) {
		this.groupOrder = groupOrder;
	}

	public String getGroupRemark() {
		return groupRemark;
	}

	public void setGroupRemark(String groupRemark) {
		this.groupRemark = groupRemark;
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
