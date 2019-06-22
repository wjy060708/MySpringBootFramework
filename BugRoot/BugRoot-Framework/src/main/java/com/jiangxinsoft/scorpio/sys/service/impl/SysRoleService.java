package com.jiangxinsoft.scorpio.sys.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;

import org.apache.commons.lang3.StringUtils;

import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.sys.mapper.SysRoleMapper;
import com.jiangxinsoft.scorpio.sys.mapper.SysRoleMemberMapper;
import com.jiangxinsoft.scorpio.sys.model.SysRole;
import com.jiangxinsoft.scorpio.sys.model.SysRoleMember;
import com.jiangxinsoft.scorpio.sys.service.ISysRoleService;
import com.jiangxinsoft.scorpio.sys.vo.RoleMemberVo;
import com.jiangxinsoft.scorpio.sys.vo.RoleVo;
import com.jiangxinsoft.scorpio.util.KeyGenerator;
import com.jiangxinsoft.scorpio.exception.OperationException;

@Service
public class SysRoleService implements ISysRoleService {
	
	@Autowired
	private SysRoleMapper sysRoleMapper;
	
	@Autowired
	private SysRoleMemberMapper sysRoleMemberMapper;
	
	public SysRoleService() {
	}
	
	@Transactional
	@Override
	public void saveRole(SysRole role) {
		role.setRoleId(KeyGenerator.getUUIDKey());
		role.setCreateTime(new Date());
		role.setUpdateTime(new Date());
		
		sysRoleMapper.insert(role);
	}

	@Transactional
	@Override
	public void updateRole(SysRole role) {
		role.setUpdateTime(new Date());
		sysRoleMapper.updateByPrimaryKey(role);
	}

	@Override
	public SysRole getRoleById(String roleId) {
		if(StringUtils.isNotBlank(roleId)) {
			return sysRoleMapper.selectByPrimaryKey(roleId);
		}
		return null;
	}

	@Override
	public List<SysRole> getAllRoles(RoleVo roleVo) {
		List<SysRole> list = sysRoleMapper.select(roleVo);
		return list;
	}
	
	@Override
	public PageInfo<SysRole> getRolePage(RoleVo roleVo, int currentPage, int pageSize,
			String sortName, String sortOrder) {
		
		if(StringUtils.isNotBlank(sortName) && StringUtils.isNotBlank(sortOrder)) {
			String orderBy = sortName +  " " + sortOrder;
			PageHelper.startPage(currentPage, pageSize, orderBy);
		} else {
			PageHelper.startPage(currentPage, pageSize);
		}
		
		List<SysRole> list = sysRoleMapper.select(roleVo);
		PageInfo<SysRole> page = new PageInfo<SysRole>(list);
		
		return page;
	}
	
	@Transactional
	@Override
	public void deleteRoleById(String roleId) throws OperationException {
		if(StringUtils.isBlank(roleId)) {
			throw new OperationException("删除角色失败,未指定删除的角色");
		}
		
		sysRoleMapper.deleteByPrimaryKey(roleId);
	}

	@Transactional
	@Override
	public void deleteRoleByIds(String[] roleIds) throws OperationException {
		if(roleIds == null) {
			throw new OperationException("删除角色失败,未指定删除的角色");
		}
		
		sysRoleMapper.deleteByPrimaryKeys(roleIds);
	}
	
	@Transactional
	@Override
	public void saveRoleMembers(List<SysRoleMember> members) throws OperationException {
		if(members == null) {
			throw new OperationException("保存角色成员失败,未设置角色成员");
		}
		
		if(members.size() < 1) {
			throw new OperationException("保存角色成员失败,未设置角色成员");
		}
		
		for(SysRoleMember roleMember : members) {
			String roleId = roleMember.getRoleId();
			String userId = roleMember.getUserId();
			
			if(StringUtils.isBlank(roleId)) {
				throw new OperationException("保存角色成员失败,未设置角色成员");
			}
			
			if(StringUtils.isBlank(userId)) {
				throw new OperationException("保存角色成员失败,未设置角色成员");
			}
			
			// 1.先删除用户之前的角色设置
			sysRoleMemberMapper.deleteByRoleAndUserId(roleId, userId);
			
			// 2.保存用户新的角色设置
			roleMember.setId(KeyGenerator.getUUIDKey());
			roleMember.setCreateTime(new Date());	// 记录创建时间
			
			sysRoleMemberMapper.insert(roleMember);
		}
	}
	
	@Transactional
	@Override
	public void deleteRoleMembers(List<SysRoleMember> members) {
		if(members == null) {
			throw new OperationException("删除角色成员失败,未指定删除的角色成员");
		}
		
		if(members.size() < 1) {
			throw new OperationException("删除角色成员失败,未指定删除的角色成员");
		}
		
		for(SysRoleMember roleMember : members) {
			String roleId = roleMember.getRoleId();
			String userId = roleMember.getUserId();
			
			if(StringUtils.isBlank(roleId)) {
				throw new OperationException("删除角色成员失败,未指定删除的角色成员");
			}
			
			if(StringUtils.isBlank(userId)) {
				throw new OperationException("删除角色成员失败,未指定删除的角色成员");
			}
			
			sysRoleMemberMapper.deleteByRoleAndUserId(roleId, userId);
		}
	}
	
	@Transactional
	@Override
	public void saveUserRoles(String userId, List<SysRoleMember> userRoles) throws OperationException {
		if(StringUtils.isBlank(userId)) {
			throw new OperationException("没有指定需要设置角色的人员!");
		}
		
		// 1.清除之前人员设置
		sysRoleMemberMapper.deleteByUserId(userId);
		
		// 2.重新进行人员设置
		for(SysRoleMember roleMember: userRoles) {
			String roleId2 = roleMember.getRoleId();
			String userId2 = roleMember.getUserId();
			
			if(StringUtils.isBlank(roleId2)) {
				throw new OperationException("保存角色成员失败,未设置角色成员");
			}
			
			if(StringUtils.isBlank(userId2)) {
				throw new OperationException("保存角色成员失败,未设置角色成员");
			}
			
			// 2.保存用户新的角色设置
			roleMember.setId(KeyGenerator.getUUIDKey());
			roleMember.setCreateTime(new Date());	// 记录创建时间
			
			sysRoleMemberMapper.insert(roleMember);
		}
	}
	
	@Override
	public List<SysRole> getUserRoles(String userId) {
		List<SysRole> list = null;
		if(StringUtils.isNotBlank(userId)) {
			list = sysRoleMapper.selectByUserId(userId);
		}
		
		return list;
	}
	
	@Override
	public List<SysRole> getUserGrantedRoles(String userId) {
		List<SysRole> list = null;
		if(StringUtils.isNotBlank(userId)) {
			list = sysRoleMapper.selectGrantedByUserId(userId);
		}
		
		return list;
	}
	
	@Override
	public PageInfo<SysRoleMember> getRoleMemberPage(RoleMemberVo roleMemberVo, int currentPage, int pageSize, 
			String sortName, String sortOrder) {
		if(StringUtils.isNotBlank(sortName) && StringUtils.isNotBlank(sortOrder)) {
			String orderBy = sortName +  " " + sortOrder;
			PageHelper.startPage(currentPage, pageSize, orderBy);
		} else {
			PageHelper.startPage(currentPage, pageSize);
		}
		
		List<SysRoleMember> list = sysRoleMemberMapper.select(roleMemberVo);
		PageInfo<SysRoleMember> page = new PageInfo<SysRoleMember>(list);
		return page;
	}
}
