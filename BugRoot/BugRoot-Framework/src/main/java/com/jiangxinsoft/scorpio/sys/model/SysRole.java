package com.jiangxinsoft.scorpio.sys.model;

import java.io.Serializable;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import com.jiangxinsoft.scorpio.base.TreeModel;

/**
 * 系统角色实体类
 * @author J01052050
 *
 */
@SuppressWarnings("serial")
public class SysRole implements TreeModel, Serializable {
	
	/**
	 * 唯一标识
	 */
	private String roleId;
	
	private String roleName;
	
	private String roleCode;
	
	private String roleKind;
	
	private String roleRemark;
	
	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	private Date createTime; // 结束时间
	
	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	private Date updateTime; // 结束时间

	public String getRoleId() {
		return roleId;
	}
	
	@Override
	public String getId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	
	@Override
	public String getParentId() {
		return null;
	}

	public String getRoleName() {
		return roleName;
	}
	
	@Override
	public String getText() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRoleCode() {
		return roleCode;
	}

	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}

	public String getRoleKind() {
		return roleKind;
	}

	public void setRoleKind(String roleKind) {
		this.roleKind = roleKind;
	}

	public String getRoleRemark() {
		return roleRemark;
	}

	public void setRoleRemark(String roleRemark) {
		this.roleRemark = roleRemark;
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
		return "icon-sys-role";
	}
	
}
