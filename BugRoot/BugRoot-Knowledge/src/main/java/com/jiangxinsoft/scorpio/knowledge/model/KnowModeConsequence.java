package com.jiangxinsoft.scorpio.knowledge.model;

import java.io.Serializable;
import java.util.Date;

import org.apache.solr.client.solrj.beans.Field;


import com.alibaba.fastjson.annotation.JSONField;


public class KnowModeConsequence implements Serializable{
	
	private static final long serialVersionUID = 1L;

	/**
	 * 知识模式id
	 */
	@Field
	private String consequenceId;
	
	/**
	 * 缺陷模式关联资源文档
	 */
	@Field
	private String modeId;
	@Field
	private String modeName;
	@Field
	private String typeId;
	
	/**
	 * 知识模式名称
	 */
	private String consequenceContent;

	public String getConsequenceId() {
		return consequenceId;
	}

	public void setConsequenceId(String consequenceId) {
		this.consequenceId = consequenceId;
	}

	public String getModeId() {
		return modeId;
	}

	public void setModeId(String modeId) {
		this.modeId = modeId;
	}

	public String getConsequenceContent() {
		return consequenceContent;
	}

	public void setConsequenceContent(String consequenceContent) {
		this.consequenceContent = consequenceContent;
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
