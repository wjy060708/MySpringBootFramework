package com.jiangxinsoft.scorpio.sys.mapper;

import java.util.List;

import com.jiangxinsoft.scorpio.sys.model.SysOrganizationRelationship;


public interface SysOrganizationRelationshipMapper {
	
	/**
	 * 插入机构关联关系
	 * @param organizationRelationship
	 */
	public void insert(SysOrganizationRelationship organizationRelationship);
	
	/**
	 * 查询组织机构关联关系列表
	 * @param departmentId
	 * @return
	 */
	public List<SysOrganizationRelationship> selectByDepartmentId(String departmentId);
	
	/**
	 * 删除组织机构关联关系
	 * @param departmentId
	 */
	public void deleteByByDepartmentId(String departmentId);

}