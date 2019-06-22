package com.jiangxinsoft.scorpio.sys.vo;

import com.jiangxinsoft.scorpio.sys.model.SysRole;

@SuppressWarnings("serial")
public class RoleVo extends SysRole {
	
	private String userId;
	
	public RoleVo() {
		super();
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public boolean isChecked() {
		if(this.getUserId() != null) {
			return true;
		}
		return false;
	}
	
}
