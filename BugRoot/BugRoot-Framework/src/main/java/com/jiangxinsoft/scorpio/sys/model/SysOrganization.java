package com.jiangxinsoft.scorpio.sys.model;

import java.io.Serializable;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import com.jiangxinsoft.scorpio.base.TreeModel;

@SuppressWarnings("serial")
public class SysOrganization implements TreeModel, Serializable {
	
	/**
	 * 唯一标识
	 */
	private String departmentId;
	
	/**
	 * 父机构ID
	 */
	private String parentId;
	
	/**
	 * 机构名称
	 */
	private String departmentName;
	
	/**
	 * 机构编码
	 */
	private String departmentCode;
	
	/**
	 * 机构类型
	 */
	private String departmentKind;
	
	/**
	 * 序号
	 */
	private int departmentOrder;
	
	/**
	 * 机构描述
	 */
	private String departmentRemark;
	
	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	private Date createTime; // 结束时间
	
	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	private Date updateTime; // 结束时间

	@Override
	public String getId() {
		return departmentId;
	}
	
	public String getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
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
		return departmentName;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public String getDepartmentCode() {
		return departmentCode;
	}

	public void setDepartmentCode(String departmentCode) {
		this.departmentCode = departmentCode;
	}

	public String getDepartmentKind() {
		return departmentKind;
	}

	public void setDepartmentKind(String departmentKind) {
		this.departmentKind = departmentKind;
	}

	public int getDepartmentOrder() {
		return departmentOrder;
	}

	public void setDepartmentOrder(int departmentOrder) {
		this.departmentOrder = departmentOrder;
	}

	public String getDepartmentRemark() {
		return departmentRemark;
	}

	public void setDepartmentRemark(String departmentRemark) {
		this.departmentRemark = departmentRemark;
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
	public String getIconCls() {
		if(departmentKind != null) {
			return "icon-" + departmentKind;
		} else {
			return "icon-ogn";
		}
	}
}
