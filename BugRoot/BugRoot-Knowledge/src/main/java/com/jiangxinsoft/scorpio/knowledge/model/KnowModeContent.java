package com.jiangxinsoft.scorpio.knowledge.model;

import java.io.Serializable;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
/**
 * 
 * @author 汪进银
 *
 */
public class KnowModeContent implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 模式内容ID
	 */
	private String modeContentId;
	private String modeContentName;
	
	/**
	 * 模式信息
	 */
	private String modeId;
	private String modeName;
	
	/**
	 * 缺陷原因
	 */
	private String reason;
	
	/**
	 * 缺陷造成的后果
	 */
	private String consequence;
	
	/**
	 * 预防措施
	 */
	private String prevention;
	
	/**
	 * 编码规范
	 */
	private String ruleId;
	
	/**
	 * 文件资源
	 */
	private String resourceId;
	
	/**
	 * 模式内容状态
	 */
	private String stage;
	
	/**
	 * 关键字
	 */
	private String tagKey;
	
	/**
	 * 作者
	 */
	private String author;
	
	/**
	 * 摘要
	 */
	private String summary;
	
	private String currentUser;
	
	/**
	 * 发布时间
	 */
	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	private Date publishTime;
	/**
	 * 更新时间
	 */
	@JSONField(format="yyyy-MM-dd HH:mm:ss")
    private Date updateTime;
    
    /**
     * 创建时间
     */
    @JSONField(format="yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    
    /**
     * 最后一次访问时间
     */
    @JSONField(format="yyyy-MM-dd HH:mm:ss")
    private Date lastVisitTime;
    
    /**
     * 浏览次数
     */
    private int visitNum;

	public String getModeContentId() {
		return modeContentId;
	}

	public void setModeContentId(String modeContentId) {
		this.modeContentId = modeContentId;
	}

	public String getModeContentName() {
		return modeContentName;
	}

	public void setModeContentName(String modeContentName) {
		this.modeContentName = modeContentName;
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

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getConsequence() {
		return consequence;
	}

	public void setConsequence(String consequence) {
		this.consequence = consequence;
	}

	public String getPrevention() {
		return prevention;
	}

	public void setPrevention(String prevention) {
		this.prevention = prevention;
	}

	public String getRuleId() {
		return ruleId;
	}

	public void setRuleID(String ruleId) {
		this.ruleId = ruleId;
	}

	public String getResourceId() {
		return resourceId;
	}

	public void setResourceID(String resourceId) {
		this.resourceId = resourceId;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getStage() {
		return stage;
	}

	public void setStage(String stage) {
		this.stage = stage;
	}

	public String getTagKey() {
		return tagKey;
	}

	public void setTagKey(String tagKey) {
		this.tagKey = tagKey;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getCurrentUser() {
		return currentUser;
	}

	public void setCurrentUser(String currentUser) {
		this.currentUser = currentUser;
	}

	public Date getPublishTime() {
		return publishTime;
	}

	public void setPublishTime(Date publishTime) {
		this.publishTime = publishTime;
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

	public Date getLastVisitTime() {
		return lastVisitTime;
	}

	public void setLastVisitTime(Date lastVisitTime) {
		this.lastVisitTime = lastVisitTime;
	}

	public int getVisitNum() {
		return visitNum;
	}

	public void setVisitNum(int visitNum) {
		this.visitNum = visitNum;
	}
    
    
	
	
	
	
	

}
