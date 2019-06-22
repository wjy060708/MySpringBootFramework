package com.jiangxinsoft.scorpio.sys.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;

import org.apache.commons.lang3.StringUtils;

import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.sys.mapper.SysOrganizationMapper;
import com.jiangxinsoft.scorpio.sys.mapper.SysOrganizationRelationshipMapper;
import com.jiangxinsoft.scorpio.sys.mapper.SysSnUtilMapper;
import com.jiangxinsoft.scorpio.sys.model.SysOrganization;
import com.jiangxinsoft.scorpio.sys.model.SysOrganizationRelationship;
import com.jiangxinsoft.scorpio.sys.service.ISysOrganizationService;
import com.jiangxinsoft.scorpio.sys.vo.OrganizationVo;
import com.jiangxinsoft.scorpio.util.KeyGenerator;
import com.jiangxinsoft.scorpio.exception.OperationException;

@Service
public class SysOrganizationService implements ISysOrganizationService {

	@Autowired
	private SysSnUtilMapper sysSnUtilMapper;
	
	@Autowired
	private SysOrganizationMapper sysOrganizationMapper;
	
	@Autowired
	private SysOrganizationRelationshipMapper sysOrganizationRelationshipMapper;
	
	public SysOrganizationService() {
	}
	
	@Transactional
	@Override
	public void saveOrganization(SysOrganization organization) {
		String departmentId = KeyGenerator.getUUIDKey();
		organization.setDepartmentId(departmentId);
		String departmentCode = this.getDepartmentCode();
		organization.setDepartmentCode(departmentCode);
		organization.setCreateTime(new Date());
		
		sysOrganizationMapper.insert(organization);
		
		SysOrganizationRelationship relationship = new SysOrganizationRelationship();
		relationship.setId(KeyGenerator.getUUIDKey());
		relationship.setParentId(departmentId);
		relationship.setDepartmentId(departmentId);
		sysOrganizationRelationshipMapper.insert(relationship);
		
		// 2.创建组织机构关联关系
		String parentId = organization.getParentId();
		if(StringUtils.isNotBlank(parentId)) {
			List<SysOrganizationRelationship> list = sysOrganizationRelationshipMapper.selectByDepartmentId(parentId);
			if(list != null) {
				for(SysOrganizationRelationship departmentRelationship : list) {
					departmentRelationship.setId(KeyGenerator.getUUIDKey());
					departmentRelationship.setDepartmentId(departmentId);
					sysOrganizationRelationshipMapper.insert(departmentRelationship);
				}
			}
		}
	}

	@Transactional
	@Override
	public void updateOrganization(SysOrganization organization) throws OperationException {
		String departmentId = organization.getDepartmentId();
		if(StringUtils.isBlank(departmentId)) {
			throw new OperationException("更新组织机构失败,未指定更新的组织机构!");
		}
		
		SysOrganization organization2 = sysOrganizationMapper.selectByPrimaryKey(departmentId);
		if(organization2 == null) {
			throw new OperationException("更新组织机构失败,更新的组织机构已不存在!");
		}
		
		// 组织机构层次未发生变化
		if(StringUtils.equals(organization.getParentId(), organization2.getParentId())) {
			organization.setUpdateTime(new Date());
			sysOrganizationMapper.updateByPrimaryKey(organization);
		} else {
			Integer c = sysOrganizationMapper.countByParent(departmentId);
			if(c > 0) {
				throw new OperationException("调整组织机构层次失败,该机构还有下属机构!");
			}
			
			organization.setUpdateTime(new Date());
			sysOrganizationMapper.updateByPrimaryKey(organization);
			
			sysOrganizationRelationshipMapper.deleteByByDepartmentId(departmentId);
			
			SysOrganizationRelationship relationship = new SysOrganizationRelationship();
			relationship.setId(KeyGenerator.getUUIDKey());
			relationship.setParentId(departmentId);
			relationship.setDepartmentId(departmentId);
			sysOrganizationRelationshipMapper.insert(relationship);
			
			String parentId = organization.getParentId();
			if(StringUtils.isNotBlank(parentId)) {
				List<SysOrganizationRelationship> list = sysOrganizationRelationshipMapper.selectByDepartmentId(parentId);
				if(list != null) {
					for(SysOrganizationRelationship departmentRelationship : list) {
						departmentRelationship.setId(KeyGenerator.getUUIDKey());
						departmentRelationship.setDepartmentId(departmentId);
						sysOrganizationRelationshipMapper.insert(departmentRelationship);
					}
				}
			}
		}
	}

	@Override
	public SysOrganization getOrganizationById(String departmentId) {
		if(StringUtils.isNotBlank(departmentId)) {
			return sysOrganizationMapper.selectByPrimaryKey(departmentId);
		}
		return null;
	}

	@Override
	public List<SysOrganization> getOrganizations(OrganizationVo organizationVo) {
		String orderBy = "departmentOrder Asc";
		PageHelper.orderBy(orderBy);
		
		List<SysOrganization> list = sysOrganizationMapper.select(organizationVo);
		return list;
	}
	
	@Override
	public List<SysOrganization> getUserOrganizations(String userId) {
		if(StringUtils.isNotBlank(userId)) {
			return sysOrganizationMapper.selectByUserId(userId);
		}
		return null;
	}
	
	@Override
	public PageInfo<SysOrganization> getOrganizationPage(OrganizationVo organizationVo,
			int currentPage, int pageSize, String sortName, String sortOrder) {
		if(StringUtils.isNotBlank(sortName) && StringUtils.isNotBlank(sortOrder)) {
			String orderBy = sortName +  " " + sortOrder;
			PageHelper.startPage(currentPage, pageSize, orderBy);
		} else {
			String orderBy = "departmentOrder Asc";
			PageHelper.startPage(currentPage, pageSize, orderBy);
		}
		
		List<SysOrganization> list = sysOrganizationMapper.select(organizationVo);
		PageInfo<SysOrganization> page = new PageInfo<SysOrganization>(list);
		
		return page;
	}

	@Transactional
	@Override
	public void deleteOrganizationById(String departmentId) throws OperationException {
		if(StringUtils.isBlank(departmentId)) {
			throw new OperationException("删除组织机构失败,未指定删除的组织机构!");
		}
		
		Integer c = sysOrganizationMapper.countByParent(departmentId);
		if(c > 0) {
			throw new OperationException("删除组织机构失败,删除的组织机构还有下级机构!");
		}
		
		sysOrganizationMapper.deleteByPrimaryKey(departmentId);
	}

	private String getDepartmentCode() {
		return sysSnUtilMapper.getSerialKey("ZZJG");
	}
}
