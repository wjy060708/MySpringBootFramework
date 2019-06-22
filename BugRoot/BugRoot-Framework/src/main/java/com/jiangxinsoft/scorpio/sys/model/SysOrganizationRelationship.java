package com.jiangxinsoft.scorpio.sys.model;


public class SysOrganizationRelationship {
	
	/**
	 * 唯一标识
	 */
	private String id;
	
	/**
	 * 唯一标识
	 */
	private String departmentId;
	
	/**
	 * 父机构ID
	 */
	private String parentId;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	
}
