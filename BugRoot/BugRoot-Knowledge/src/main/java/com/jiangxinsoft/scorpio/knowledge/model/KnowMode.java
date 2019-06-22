package com.jiangxinsoft.scorpio.knowledge.model;

import java.io.Serializable;
import java.util.Date;

import org.apache.solr.client.solrj.beans.Field;

import com.alibaba.fastjson.annotation.JSONField;


public class KnowMode implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 知识模式id
	 */
	@Field
	private String modeId;
	
	/**
	 * 缺陷模式关联资源文档
	 */
	@Field
	private String resourceId;
	
	/**
	 * 知识模式名称
	 */
	@Field
	private String modeName;
	
	/**
	 * 所属的知识分类
	 */
	@Field
	private String typeId;
	
	@Field
	private String typeName;
	
	/**
	 * 是否可操作
	 */
	@Field
	private String isEdit;
	
	@Field
	private String isRead;
	
	/**
	 *知识模式创建人
	 */
	@Field
	private String author;
	
	/**
	 * 当前阅读的人
	 */
	@Field
	private String currentUser;
	
	@Field
	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	private Date updateTime;

	@Field
	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	private Date createTime;
	/**
	 * 知识模式备注
	 */
	@Field
	private String imgeUrl;
	@Field
	private int greatNum;
	@Field
	private int badNum;
	@Field
	private int remarkNum;
	@Field
	private int privateNum;
	@Field
	private int visitNum;
	
	private int total;
	
	private String userIcon;
	
	public String getUserIcon() {
		return userIcon;
	}

	public void setUserIcon(String userIcon) {
		this.userIcon = userIcon;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	private String keyWords;
	
	public String getKeyWords() {
		return keyWords;
	}

	public void setKeyWords(String keyWords) {
		this.keyWords = keyWords;
	}

	public String getImgeUrl() {
		return imgeUrl;
	}

	public void setImgeUrl(String imgeUrl) {
		this.imgeUrl = imgeUrl;
	}

	private String modeRemark;
	

	public int getGreatNum() {
		return greatNum;
	}

	public void setGreatNum(int greatNum) {
		this.greatNum = greatNum;
	}

	public int getBadNum() {
		return badNum;
	}

	public void setBadNum(int badNum) {
		this.badNum = badNum;
	}

	public int getRemarkNum() {
		return remarkNum;
	}

	public void setRemarkNum(int remarkNum) {
		this.remarkNum = remarkNum;
	}

	public int getPrivateNum() {
		return privateNum;
	}

	public void setPrivateNum(int privateNum) {
		this.privateNum = privateNum;
	}

	public int getVisitNum() {
		return visitNum;
	}

	public void setVisitNum(int visitNum) {
		this.visitNum = visitNum;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getModeId() {
		return modeId;
	}

	public void setModeId(String modeId) {
		this.modeId = modeId;
	}

	public String getModeName() {
		return modeName;
	}

	public void setModeName(String modeName) {
		this.modeName = modeName;
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

	public String getIsEdit() {
		return isEdit;
	}

	public void setIsEdit(String isEdit) {
		this.isEdit = isEdit;
	}

	public String getIsRead() {
		return isRead;
	}

	public void setIsRead(String isRead) {
		this.isRead = isRead;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getModeRemark() {
		return modeRemark;
	}

	public void setModeRemark(String modeRemark) {
		this.modeRemark = modeRemark;
	}
	
	public String getCurrentUser() {
		return currentUser;
	}

	public void setCurrentUser(String currentUser) {
		this.currentUser = currentUser;
	}

	public String getResourceId() {
		return resourceId;
	}

	public void setResourceId(String resourceId) {
		this.resourceId = resourceId;
	}

}
