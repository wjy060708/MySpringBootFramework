package com.jiangxinsoft.scorpio.sys.service;

import java.util.List;


import com.jiangxinsoft.scorpio.exception.OperationException;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.sys.model.SysRole;
import com.jiangxinsoft.scorpio.sys.model.SysRoleMember;
import com.jiangxinsoft.scorpio.sys.vo.RoleMemberVo;
import com.jiangxinsoft.scorpio.sys.vo.RoleVo;

public interface ISysRoleService {

	/**
	 * 插入系统角色
	 * @param role
	 */
	public void saveRole(SysRole role);
	
	/**
	 * 更新系统角色
	 * @param role
	 */
	public void updateRole(SysRole role);
	
	/**
	 * 根据系统角色ID查找系统角色
	 * @param roleId
	 * @return
	 */
	public SysRole getRoleById(String roleId);
	
	/**
	 * 查询所有系统角色列表
	 * @return
	 */
	public List<SysRole> getAllRoles(RoleVo roleVo);
	
	/**
	 * 查询系统角色列表
	 * @return
	 */
	public PageInfo<SysRole> getRolePage(RoleVo roleVo, int currentPage, int pageSize, String sortName, String sortOrder);
	
	/**
	 * 根据系统角色ID删除系统角色
	 * @param roleId
	 */
	public void deleteRoleById(String roleId) throws OperationException;
	
	/**
	 * 根据系统角色ID批量删除系统角色
	 * @param roleIds
	 */
	public void deleteRoleByIds(String[] roleIds) throws OperationException;
	
	/**
	 * 保存角色人员
	 * @param members
	 */
	public void saveRoleMembers(List<SysRoleMember> members) throws OperationException;
	
	/**
	 * 删除角色人员
	 * @param members
	 */
	public void deleteRoleMembers(List<SysRoleMember> members) throws OperationException;
	
	/**
	 * 人员角色设置
	 * @param userId
	 * @param personMembers
	 */
	public void saveUserRoles(String userId, List<SysRoleMember> userRoles) throws OperationException;
	
	/**
	 * 查询用户系统角色列表
	 * @param userId
	 * @return
	 */
	public List<SysRole> getUserRoles(String userId);
	
	/**
	 * 查询用户系统角色列表
	 * @param userId
	 * @return
	 */
	public List<SysRole> getUserGrantedRoles(String userId);
	
	/**
	 * 查询角色成员
	 * @param roleMemberVo
	 * @param currentPage
	 * @param pageSize
	 * @param sortName
	 * @param sortOrder
	 * @return
	 */
	public PageInfo<SysRoleMember> getRoleMemberPage(RoleMemberVo roleMemberVo, int currentPage, int pageSize, 
			String sortName, String sortOrder);
	
}
