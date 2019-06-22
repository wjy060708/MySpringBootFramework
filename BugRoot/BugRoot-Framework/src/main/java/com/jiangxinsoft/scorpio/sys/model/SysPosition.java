package com.jiangxinsoft.scorpio.sys.model;

import java.io.Serializable;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import com.jiangxinsoft.scorpio.base.TreeModel;

/**
 * 系统岗位实体类
 * @author J01052050
 *
 */
@SuppressWarnings("serial")
public class SysPosition implements TreeModel, Serializable {
	
	/**
	 * 唯一标识
	 */
	private String positionId;
	
	/**
	 * 岗位所属部门
	 */
	private String departmentId;
	private String departmentName;
	
	/**
	 * 岗位名称
	 */
	private String positionName;
	
	/**
	 * 岗位备注
	 */
	private String positionRemark;
	
	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	private Date createTime; // 结束时间
	
	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	private Date updateTime; // 结束时间

	@Override
	public String getId() {
		return positionId;
	}
	
	public String getPositionId() {
		return positionId;
	}

	public void setPositionId(String positionId) {
		this.positionId = positionId;
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

	@Override
	public String getParentId() {
		return null;
	}

	@Override
	public String getText() {
		return positionName;
	}
	
	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}
	
	public String getPositionRemark() {
		return positionRemark;
	}

	public void setPositionRemark(String positionRemark) {
		this.positionRemark = positionRemark;
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
		return "icon-sys-pos";
	}
	
}
