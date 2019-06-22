package com.jiangxinsoft.scorpio.sys.vo;

@SuppressWarnings("serial")
public class RoleMemberVo extends UserVo {
	
	private String roleId;
	
	private String roleName;
	
	public RoleMemberVo() {
		
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
	
}
