package com.jiangxinsoft.scorpio.sys.model;

import java.io.Serializable;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * 系统用户实体类
 * @author J01052050
 *
 */
@SuppressWarnings("serial")
public class SysUser implements Serializable {
	
	/**
	 * 唯一标识
	 */
	private String userId;
	
	/**
	 * 登录名
	 */
	private String userName;
	
	/**
	 * 用户编码
	 */
	private String userCard;
	
	/**
	 * 用户头像
	 */
	@JsonIgnore
	private String userIcon;
	
	/**
	 * 密码
	 */
	@JsonIgnore
	private String password;
	
	/**
	 * 人员姓名
	 */
	private String trueName;
	
	/**
	 * 人员所属部门ID
	 */
	private String departmentId;
	
	/**
	 * 人员所属部门编码
	 */
	private String departmentCode;
	
	/**
	 * 人员所属部门名称
	 */
	private String departmentName;
	
	/**
	 * 用户类型
	 */
	private String userKind;	// 默认值
	
	/**
	 * 可用状态
	 */
	private String userState;	// 默认值
	
	/**
	 * 用户描述
	 */
	private String userRemark;
	
	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	private Date createTime; // 结束时间
	
	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	private Date updateTime; // 结束时间

	public SysUser() {
	}
	
	public SysUser(String userName, String password) {
		this.userName = userName;
		this.password = password;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserCard() {
		return userCard;
	}

	public void setUserCard(String userCard) {
		this.userCard = userCard;
	}
	
	public String getUserIcon() {
		return userIcon;
	}

	public void setUserIcon(String userIcon) {
		this.userIcon = userIcon;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getTrueName() {
		return trueName;
	}

	public void setTrueName(String trueName) {
		this.trueName = trueName;
	}

	public String getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}

	public String getDepartmentCode() {
		return departmentCode;
	}

	public void setDepartmentCode(String departmentCode) {
		this.departmentCode = departmentCode;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public String getUserKind() {
		return userKind;
	}

	public void setUserKind(String userKind) {
		this.userKind = userKind;
	}

	public String getUserState() {
		return userState;
	}

	public void setUserState(String userState) {
		this.userState = userState;
	}

	public String getUserRemark() {
		return userRemark;
	}

	public void setUserRemark(String userRemark) {
		this.userRemark = userRemark;
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
