package com.jiangxinsoft.scorpio.sys.base;

import org.apache.shiro.SecurityUtils;

import com.jiangxinsoft.scorpio.base.ShiroUser;

public class SysCurrentUser {
	
	public static String getUserId() {
		return currentUser().getUserId();
	}

	public static String getUserName() {
		return currentUser().getUserName();
	}
	
	public static String getUserKind() {
		return currentUser().getUserKind();
	}
	
	public static String getUserIcon() {
		return currentUser().getUserIcon();
	}

	public static String getTrueName() {
		return currentUser().getTrueName();
	}
	
    public static ShiroUser currentUser() {
        ShiroUser shiroUser = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
        return shiroUser;
    }
}
