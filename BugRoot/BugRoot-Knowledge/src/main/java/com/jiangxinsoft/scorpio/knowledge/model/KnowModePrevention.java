package com.jiangxinsoft.scorpio.knowledge.model;

import java.io.Serializable;
import java.util.Date;


import com.alibaba.fastjson.annotation.JSONField;


public class KnowModePrevention implements Serializable{
	
	private static final long serialVersionUID = 1L;

	/**
	 * 知识模式id
	 */
	private String preventionId;
	
	/**
	 * 缺陷模式关联资源文档
	 */
	private String modeId;
	private String modeName;
	
	private String typeId;
	
	/**
	 * 知识模式名称
	 */
	private String preventionContent;

	public String getPreventionId() {
		return preventionId;
	}

	public void setPreventionId(String preventionId) {
		this.preventionId = preventionId;
	}

	public String getModeId() {
		return modeId;
	}

	public void setModeId(String modeId) {
		this.modeId = modeId;
	}

	public String getPreventionContent() {
		return preventionContent;
	}

	public void setPreventionContent(String preventionContent) {
		this.preventionContent = preventionContent;
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

}
