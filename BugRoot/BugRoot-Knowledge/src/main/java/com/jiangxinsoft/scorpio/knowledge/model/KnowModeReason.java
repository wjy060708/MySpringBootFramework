package com.jiangxinsoft.scorpio.knowledge.model;

import java.io.Serializable;
import java.util.Date;


import com.alibaba.fastjson.annotation.JSONField;


public class KnowModeReason implements Serializable{
	
	private static final long serialVersionUID = 1L;

	/**
	 * 知识模式id
	 */
	private String reasonId;
	
	/**
	 * 缺陷模式关联资源文档
	 */
	private String modeId;
	private String modeName;
	
	private String typeId;
	
	/**
	 * 知识模式名称
	 */
	private String reasonContent;

	public String getReasonId() {
		return reasonId;
	}

	public void setReasonId(String reasonId) {
		this.reasonId = reasonId;
	}

	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
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

	public String getReasonContent() {
		return reasonContent;
	}

	public void setReasonContent(String reasonContent) {
		this.reasonContent = reasonContent;
	}
}
