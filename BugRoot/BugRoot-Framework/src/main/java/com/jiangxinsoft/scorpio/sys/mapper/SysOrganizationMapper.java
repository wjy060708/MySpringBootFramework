package com.jiangxinsoft.scorpio.sys.mapper;

import java.util.List;

import com.jiangxinsoft.scorpio.mapper.IMapper;
import com.jiangxinsoft.scorpio.sys.model.SysOrganization;

public interface SysOrganizationMapper extends IMapper<SysOrganization> {
	
	/**
	 * 根据机构编码查找机构
	 * @param code
	 * @return
	 */
	public SysOrganization selectByCode(String departmentCode);
	
	/**
	 * 查询用户主管部门
	 * @param userId
	 * @return
	 */
	public List<SysOrganization> selectByUserId(String userId);
	
	/**
	 * 查询所有子节点ID集合
	 * @param parentId
	 * @return
	 */
	public List<String> selectByParentId(String parentId);
	
	/**
	 * 查询子节点数量
	 * @param parentId
	 * @return
	 */
	public Integer countByParent(String parentId);

}