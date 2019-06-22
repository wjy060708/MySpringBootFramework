package com.jiangxinsoft.scorpio.base;

import java.io.Serializable;

import com.google.common.base.Objects;

@SuppressWarnings("serial")
public class ShiroUser implements Serializable {

	/**
	 * 唯一标识
	 */
	private String userId;

	/**
	 * 登录名
	 */
	private String userName;
	
	/**
	 * 用户类型
	 */
	private String userKind;
	
	/**
	 * 用户头像
	 */
	private String userIcon;

	/**
	 * 人员姓名
	 */
	private String trueName;

	public ShiroUser() {
	}

	public ShiroUser(String userId, String userName, String userKind, String userIcon, String trueName) {
		this.userId = userId;
		this.userName = userName;
		this.userKind = userKind;
		this.userIcon = userIcon;
		this.trueName = trueName;
	}

	public String getUserId() {
		return userId;
	}

	public String getUserName() {
		return userName;
	}

	public String getUserKind() {
		return userKind;
	}
	
	public String getUserIcon() {
		return userIcon;
	}

	public String getTrueName() {
		return trueName;
	}

	@Override
	public String toString() {
		return userName;
	}

	@Override
	public int hashCode() {
		return Objects.hashCode(userName);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		ShiroUser other = (ShiroUser) obj;
		if (userName == null) {
			return other.userName == null;
		} else {
			return userName.equals(other.userName);
		}
	}
}
