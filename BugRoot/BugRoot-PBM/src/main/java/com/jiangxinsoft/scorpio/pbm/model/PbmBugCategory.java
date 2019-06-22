package com.jiangxinsoft.scorpio.pbm.model;

import java.io.Serializable;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;

/**
 * 缺陷类别
 * @author strawman
 *
 */
public class PbmBugCategory implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * 缺陷类型ID
	 */
	private String categoryId;
	
	/**
	 * 缺陷类型名称
	 */
	private String categoryName;
	
	/**
	 * 缺陷类型备注
	 */
	private String categoryRemark;

	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	private Date createTime;
	
	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	private Date updateTime;

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getCategoryRemark() {
		return categoryRemark;
	}

	public void setCategoryRemark(String categoryRemark) {
		this.categoryRemark = categoryRemark;
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
