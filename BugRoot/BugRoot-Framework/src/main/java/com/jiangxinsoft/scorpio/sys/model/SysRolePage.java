package com.jiangxinsoft.scorpio.sys.model;

import com.fasterxml.jackson.annotation.JsonIgnore;


/**
 * 系统功能模块实体类
 * @author J01052050
 *
 */
@SuppressWarnings("serial")
public class SysRolePage extends SysModulePage {
	
	/**
	 * 授权ID
	 */
	@JsonIgnore
	private String authId;
	
	/**
	 * 用户ID
	 */
	private String userId;
	
	/**
	 * 角色ID
	 */
	private String roleId;
	
	/**
	 * 授权标志
	 */
	private String flag;
	
	public SysRolePage() {
		super();
	}
	
	public String getAuthId() {
		return authId;
	}

	public void setAuthId(String authId) {
		this.authId = authId;
	}
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}
	
	public boolean isChecked() {
		if(roleId != null) {
			return true;
		}
		return false;
	}

}
