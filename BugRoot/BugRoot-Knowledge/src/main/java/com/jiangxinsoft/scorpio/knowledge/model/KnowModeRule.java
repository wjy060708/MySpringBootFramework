package com.jiangxinsoft.scorpio.knowledge.model;

import java.io.Serializable;

public class KnowModeRule implements Serializable{
	
	private static final long serialVersionUID = 1L;

	/**
	 * 知识模式id
	 */
	private String ruleId;
	
	private String ruleTitle;
	
	/**
	 * 缺陷模式关联资源文档
	 */
	private String modeId;
	private String modeName;
	
	private String typeId;
	
	private String resourceId;
	
	private String documentExtension;
	
	/**
	 * 知识模式名称
	 */
	private String ruleContent;

	public String getRuleId() {
		return ruleId;
	}

	public void setRuleId(String ruleId) {
		this.ruleId = ruleId;
	}

	public String getRuleTitle() {
		return ruleTitle;
	}

	public void setRuleTitle(String ruleTitle) {
		this.ruleTitle = ruleTitle;
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

	public String getResourceId() {
		return resourceId;
	}

	public void setResourceId(String resourceId) {
		this.resourceId = resourceId;
	}

	public String getRuleContent() {
		return ruleContent;
	}

	public void setRuleContent(String ruleContent) {
		this.ruleContent = ruleContent;
	}

	public String getDocumentExtension() {
		return documentExtension;
	}

	public void setDocumentExtension(String documentExtension) {
		this.documentExtension = documentExtension;
	}

}
