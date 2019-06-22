package com.jiangxinsoft.scorpio.knowledge.model;

import java.io.Serializable;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;

/**
 * 软件开发过程
 * @author J01052304
 *
 */
public class KnowProcess implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * 过程ID
	 */
	private String processId;
	
	/**
	 * 过程名称
	 */
	private String processName;
	
	/**
	 * 过程备注
	 */
	private String processRemark;
	
	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	private Date updateTime;

	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	private Date createTime;
	
	public String getProcessId() {
		return processId;
	}

	public void setProcessId(String processId) {
		this.processId = processId;
	}

	public String getProcessName() {
		return processName;
	}

	public void setProcessName(String processName) {
		this.processName = processName;
	}

	public String getProcessRemark() {
		return processRemark;
	}

	public void setProcessRemark(String processRemark) {
		this.processRemark = processRemark;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
}
