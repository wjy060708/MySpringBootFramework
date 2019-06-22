package com.jiangxinsoft.scorpio.knowledge.model;

import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;

public class KnowRemark {
	
	private String remarkId;
	
	private String userId;
	private String userName;
	
	private String content;
	
	private String modeId;
	
	private String parentId;
	
	private String goodNum;
	
	private String badNum;
	
	private String userIcon;
	
	public String getUserIcon() {
		return userIcon;
	}

	public void setUserIcon(String userIcon) {
		this.userIcon = userIcon;
	}

	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	private Date remarkTime;

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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getModeId() {
		return modeId;
	}

	public void setModeId(String modeId) {
		this.modeId = modeId;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getGoodNum() {
		return goodNum;
	}

	public void setGoodNum(String goodNum) {
		this.goodNum = goodNum;
	}

	public String getBadNum() {
		return badNum;
	}

	public void setBadNum(String badNum) {
		this.badNum = badNum;
	}

	public Date getRemarkTime() {
		return remarkTime;
	}

	public void setRemarkTime(Date remarkTime) {
		this.remarkTime = remarkTime;
	}

	public String getRemarkId() {
		return remarkId;
	}

	public void setRemarkId(String remarkId) {
		this.remarkId = remarkId;
	}

}
