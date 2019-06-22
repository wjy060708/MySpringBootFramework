package com.jiangxinsoft.scorpio.sys.model;

import java.io.Serializable;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonIgnore;

import com.jiangxinsoft.scorpio.base.TreeModel;

/**
 * 系统功能模块实体类
 * @author J01052050
 *
 */
@SuppressWarnings("serial")
public class SysModulePage implements TreeModel, Serializable {
	
	/**
	 * 唯一标识
	 */
	private String pageId;
	
	/**
	 * 上级页面ID
	 */
	private String parentId;
	
	/**
	 * 所属模块ID
	 */
	@JsonIgnore
	private String moduleId;
	
	/**
	 * 页面名称
	 */
	private String pageName;
	
	@JsonIgnore
	private String pageIcon;
	
	private String pageURL;
	
	private int pageOrder;
	
	@JsonIgnore
	private String pageFlag;
	
	/**
	 * 页面访问令牌
	 */
	@JsonIgnore
	private String pageToken;
	
	private String pageRemark;
	
	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	private Date createTime; // 结束时间
	
	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	private Date updateTime; // 结束时间
	
	@Override
	public String getId() {
		return pageId;
	}

	public String getPageId() {
		return pageId;
	}

	public void setPageId(String pageId) {
		this.pageId = pageId;
	}
	
	@Override
	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	
	public String getModuleId() {
		return moduleId;
	}

	public void setModuleId(String moduleId) {
		this.moduleId = moduleId;
	}

	@Override
	public String getText() {
		return pageName;
	}

	public String getPageName() {
		return pageName;
	}

	public void setPageName(String pageName) {
		this.pageName = pageName;
	}

	public String getPageIcon() {
		return pageIcon;
	}

	public void setPageIcon(String pageIcon) {
		this.pageIcon = pageIcon;
	}
	
	public String getUrl() {
		return pageURL;
	}
	
	public String getPageURL() {
		return pageURL;
	}

	public void setPageURL(String pageURL) {
		this.pageURL = pageURL;
	}

	public int getPageOrder() {
		return pageOrder;
	}

	public void setPageOrder(int pageOrder) {
		this.pageOrder = pageOrder;
	}

	public String getPageFlag() {
		return pageFlag;
	}

	public void setPageFlag(String pageFlag) {
		this.pageFlag = pageFlag;
	}
	
	public String getPageToken() {
		return pageToken;
	}

	public void setPageToken(String pageToken) {
		this.pageToken = pageToken;
	}

	public String getPageRemark() {
		return pageRemark;
	}

	public void setPageRemark(String pageRemark) {
		this.pageRemark = pageRemark;
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

	@Override
	public String getIconCls() {
		return this.pageIcon;
	}

}
