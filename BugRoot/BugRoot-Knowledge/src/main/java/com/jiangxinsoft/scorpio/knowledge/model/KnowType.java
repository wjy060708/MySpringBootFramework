package com.jiangxinsoft.scorpio.knowledge.model;

import java.io.Serializable;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import com.jiangxinsoft.scorpio.base.TreeModel;

/**
 * 知识类型分类
 * @author J01052304
 *
 */
public class KnowType implements TreeModel,Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * 类型ID
	 */
	private String typeId;
	
	private String parentId;
	
	private String imageUrl;
	/**
	 * 类型名称
	 */
	private String typeName;
	
	/**
	 * 类型备注
	 */
	private String typeRemark;
	
	/**
	 * 类型序号
	 */
	private String typeOrder;
	
	public String getTypeOrder() {
		return typeOrder;
	}

	public void setTypeOrder(String typeOrder) {
		this.typeOrder = typeOrder;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
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

	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	private Date updateTime;

	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	private Date createTime;
	
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

	public String getTypeRemark() {
		return typeRemark;
	}

	public void setTypeRemark(String typeRemark) {
		this.typeRemark = typeRemark;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	@Override
	public String getId() {
		return typeId;
	}

	@Override
	public String getText() {
		return typeName;
	}

	@Override
	public String getIconCls() {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}
