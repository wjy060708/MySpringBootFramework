package com.jiangxinsoft.scorpio.sys.model;

import java.io.Serializable;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;

/**
 * 数据字典条目
 * @author strawman
 *
 */
public class SysDictEntry implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String entryId;
	
	/**
	 * 字典类别
	 */
	private String categoryId;
	private String categoryCode;
	private String categoryName;
	
	private String entryName;
	
	private int entryOrder;
	
	private String entryState;
	
	private String entryRemark;
	
	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	private Date createTime;
	
	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	private Date updateTime;

	public String getEntryId() {
		return entryId;
	}

	public void setEntryId(String entryId) {
		this.entryId = entryId;
	}

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getEntryName() {
		return entryName;
	}

	public void setEntryName(String entryName) {
		this.entryName = entryName;
	}

	public int getEntryOrder() {
		return entryOrder;
	}

	public void setEntryOrder(int entryOrder) {
		this.entryOrder = entryOrder;
	}

	public String getEntryState() {
		return entryState;
	}

	public void setEntryState(String entryState) {
		this.entryState = entryState;
	}

	public String getEntryRemark() {
		return entryRemark;
	}

	public void setEntryRemark(String entryRemark) {
		this.entryRemark = entryRemark;
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
