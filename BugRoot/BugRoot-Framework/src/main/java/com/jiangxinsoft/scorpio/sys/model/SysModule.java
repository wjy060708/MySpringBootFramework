package com.jiangxinsoft.scorpio.sys.model;

import java.io.Serializable;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import com.jiangxinsoft.scorpio.base.TreeModel;

/**
 * 系统中子系统的实体类
 * @author J01052050
 *
 */
@SuppressWarnings("serial")
public class SysModule implements TreeModel, Serializable {
	
	/**
	 * 模块ID
	 */
	private String moduleId;
	
	/**
	 * 模块名称
	 */
	private String moduleName;
	
	/**
	 * 模块图标
	 */
	private String moduleIcon;
	
	/**
	 * 模块序号
	 */
	private int moduleOrder;
	
	/**
	 * 模块备注
	 */
	private String moduleRemark;
	
	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	private Date createTime; // 结束时间
	
	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	private Date updateTime; // 结束时间

	@Override
	public String getId() {
		return moduleId;
	}
	
	public String getModuleId() {
		return moduleId;
	}

	public void setModuleId(String moduleId) {
		this.moduleId = moduleId;
	}

	@Override
	public String getParentId() {
		return null;
	}
	
	@Override
	public String getText() {
		return moduleName;
	}
	
	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	public String getModuleIcon() {
		return moduleIcon;
	}

	public void setModuleIcon(String moduleIcon) {
		this.moduleIcon = moduleIcon;
	}

	public int getModuleOrder() {
		return moduleOrder;
	}

	public void setModuleOrder(int moduleOrder) {
		this.moduleOrder = moduleOrder;
	}

	public String getModuleRemark() {
		return moduleRemark;
	}

	public void setModuleRemark(String moduleRemark) {
		this.moduleRemark = moduleRemark;
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
		return moduleIcon;
	}

}
