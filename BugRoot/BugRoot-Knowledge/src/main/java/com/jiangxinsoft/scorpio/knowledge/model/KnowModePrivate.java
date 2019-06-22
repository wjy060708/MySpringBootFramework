package com.jiangxinsoft.scorpio.knowledge.model;

import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
/**
 * 收藏表
 * @author Administrator
 */
public class KnowModePrivate {
	
	private String privateId;
	
	private String modeId;
	private String modeName;
	
	private String author;
	
	private String typeId;
	private String typeName;
	
	public String getModeName() {
		return modeName;
	}

	public void setModeName(String modeName) {
		this.modeName = modeName;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	private String userId;
	
	
	
	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	private Date createTime;
	
	private String privateRemark;

	public String getPrivateId() {
		return privateId;
	}

	public void setPrivateId(String privateId) {
		this.privateId = privateId;
	}

	public String getModeId() {
		return modeId;
	}

	public void setModeId(String modeId) {
		this.modeId = modeId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getPrivateRemark() {
		return privateRemark;
	}

	public void setPrivateRemark(String privateRemark) {
		this.privateRemark = privateRemark;
	}
}
