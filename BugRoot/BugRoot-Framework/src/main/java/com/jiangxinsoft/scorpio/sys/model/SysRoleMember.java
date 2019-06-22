package com.jiangxinsoft.scorpio.sys.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonIgnore;

@SuppressWarnings("serial")
public class SysRoleMember extends SysUser {
	
	private String id;
	
	/**
	 * 人员角色
	 */
	private String roleId;
	private String roleName;
	
	@JsonIgnore
	private Date createTime;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
}
