package com.jiangxinsoft.scorpio.sys.service;

import java.util.List;


import com.jiangxinsoft.scorpio.exception.OperationException;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.sys.model.SysOrganization;
import com.jiangxinsoft.scorpio.sys.vo.OrganizationVo;

public interface ISysOrganizationService {

	/**
	 * 插入组织机构
	 * @param organization
	 */
	public void saveOrganization(SysOrganization organization);
	
	/**
	 * 更新组织机构
	 * @param organization
	 */
	public void updateOrganization(SysOrganization organization) throws OperationException;
	
	/**
	 * 根据组织机构ID查找组织机构
	 * @param departmentId
	 * @return
	 */
	public SysOrganization getOrganizationById(String departmentId);
	
	/**
	 * 查询组织机构列表
	 * @param organizationVo
	 * @return
	 */
	public List<SysOrganization> getOrganizations(OrganizationVo organizationVo);
	
	/**
	 * 查询用户主管部门列表
	 * @param userId
	 * @return
	 */
	public List<SysOrganization> getUserOrganizations(String userId);
	
	/**
	 * 查询组织机构列表
	 * @param organizationVo
	 * @param currentPage
	 * @param pageSize
	 * @param sortName
	 * @param sortOrder
	 * @return
	 */
	public PageInfo<SysOrganization> getOrganizationPage(OrganizationVo organizationVo, 
			int currentPage, int pageSize, String sortName, String sortOrder);
	
	/**
	 * 根据组织机构ID删除组织机构
	 * @param departmentId
	 * @throws OperationException
	 */
	public void deleteOrganizationById(String departmentId) throws OperationException;
}
