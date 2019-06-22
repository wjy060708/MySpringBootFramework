package com.jiangxinsoft.scorpio.sys.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;

import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.sys.constants.SysConstants;
import com.jiangxinsoft.scorpio.sys.mapper.SysOrganizationMapper;
import com.jiangxinsoft.scorpio.sys.mapper.SysRoleMapper;
import com.jiangxinsoft.scorpio.sys.mapper.SysUserMapper;
import com.jiangxinsoft.scorpio.sys.model.SysOrganization;
import com.jiangxinsoft.scorpio.sys.model.SysRole;
import com.jiangxinsoft.scorpio.sys.model.SysUser;
import com.jiangxinsoft.scorpio.sys.service.ISysUserService;
import com.jiangxinsoft.scorpio.sys.vo.RoleMemberVo;
import com.jiangxinsoft.scorpio.sys.vo.UserVo;
import com.jiangxinsoft.scorpio.util.KeyGenerator;
import com.jiangxinsoft.scorpio.util.PasswordHelper;
import com.jiangxinsoft.scorpio.exception.OperationException;

@Service
public class SysUserService implements ISysUserService {

	@Autowired
    private SysOrganizationMapper sysOrganizationMapper;
	
	@Autowired
    private SysUserMapper sysUserMapper;
	
	@Autowired
    private SysRoleMapper sysRoleMapper;
	
	@Transactional
	@Override
	public void saveUser(SysUser user) throws OperationException {
		String userName = user.getUserName();
		if(StringUtils.isBlank(userName)) {
			throw new OperationException("保存用户失败,用户名不能为空!");
		}
		
		String userCard = user.getUserCard();
		if(StringUtils.isBlank(userCard)) {
			throw new OperationException("保存用户失败,用户编码不能为空!");
		}
		
		SysUser euser1 = sysUserMapper.selectByUserName(userName);
		if(euser1 != null) {
			throw new OperationException("保存用户失败,用户名冲突!");
		}
		
		user.setUserId(KeyGenerator.getUUIDKey());
		
		// 设置默认密码"123456"
		String password = PasswordHelper.encryptPassword(SysConstants.DEFAULT_LOGIN_PASSWORD);
		user.setPassword(password);
		
		user.setUserKind(SysConstants.USER_KIND_COMMON);	// 普通用户
		user.setUserState(SysConstants.USER_STATE_DEFAULT);	// 未激活
		
		user.setCreateTime(new Date());
		user.setUpdateTime(new Date());
		
		sysUserMapper.insert(user);
	}
	
	@Transactional
	@Override
	public void saveUsers(List<SysUser> users) throws OperationException {
		if(users == null) {
			throw new OperationException("保存用户失败未指定保存的用户!");
		}
		
		for(SysUser user : users) {
			String userName = user.getUserName();
			if(StringUtils.isBlank(userName)) {
				throw new OperationException("保存用户失败,用户名不能为空!");
			}
			
			String userCard = user.getUserCard();
			if(StringUtils.isBlank(userCard)) {
				throw new OperationException("保存用户失败,用户编码不能为空!");
			}
			
			SysUser euser = sysUserMapper.selectByUserName(userName);
			if(euser != null) {
				throw new OperationException("保存用户失败,用户名冲突!");
			}
			
			// 设置用户部门
			String departmentCode = user.getDepartmentCode();
			if(StringUtils.isBlank(departmentCode)) {
				throw new OperationException("保存用户失败,未设置用户部门!");
			}
			
			SysOrganization organization = sysOrganizationMapper.selectByCode(departmentCode);
			if(organization == null) {
				throw new OperationException("保存用户失败,用户部门设置不正确!");
			}
			
			user.setUserId(KeyGenerator.getUUIDKey());
			
			user.setDepartmentId(organization.getDepartmentId());
			
			user.setUserKind(SysConstants.USER_KIND_COMMON);	// 普通用户
			user.setUserState(SysConstants.USER_STATE_DEFAULT);	// 未激活
			
			String password = PasswordHelper.encryptPassword(SysConstants.DEFAULT_LOGIN_PASSWORD);	// 采用默认密码
			user.setPassword(password);
			
			user.setCreateTime(new Date());
			user.setUpdateTime(new Date());
			sysUserMapper.insert(user);
		}
	}
	
	@Transactional
	@Override
	public void updateUser(SysUser user) throws OperationException {	// 不得修改密码
		if(StringUtils.isBlank(user.getUserId())) {
			throw new OperationException("修改用户资料失败,未指定用户ID!");
		}
		
		user.setUpdateTime(new Date());
		
		sysUserMapper.updateByPrimaryKey(user);
	}
	
	@Transactional
	@Override
	public void enableUser(String userId) throws OperationException {
		if(StringUtils.isBlank(userId)) {
			throw new OperationException("激活用户失败,未指定激活的用户!");
		}
		
		SysUser user = sysUserMapper.selectByPrimaryKey(userId);
		if(user == null) {
			throw new OperationException("激活用户失败,激活的用户已不存在!");
		}
		
		if(user.getUserState().equals(SysConstants.USER_STATE_ENABLED)) {
			throw new OperationException("激活用户失败,用户已激活!");
		}
		
		user.setUserState(SysConstants.USER_STATE_ENABLED);	// 启用
		user.setUpdateTime(new Date());
		sysUserMapper.updateStateByPrimaryKey(user);
	}
	
	@Transactional
	@Override
	public void enableUser(String[] userIds) throws OperationException {
		if(userIds == null) {
			throw new OperationException("激活用户失败,未指定激活的用户!");
		}
		for(String userId : userIds) {
			this.enableUser(userId);
		}
	}
	
	@Transactional
	@Override
	public void disableUser(String userId) throws OperationException {
		if(StringUtils.isBlank(userId)) {
			throw new OperationException("冻结用户失败,未指定冻结的用户!");
		}
		
		SysUser user = sysUserMapper.selectByPrimaryKey(userId);
		if(user == null) {
			throw new OperationException("冻结用户失败,冻结的用户已不存在!");
		}
		
		if(user.getUserState().equals(SysConstants.USER_STATE_DEFAULT)) {
			throw new OperationException("冻结用户失败,用户还未激活!");
		} else if(user.getUserState().equals(SysConstants.USER_STATE_DISABLED)) {
			throw new OperationException("冻结用户失败,用户已冻结!");
		}
		
		user.setUserState(SysConstants.USER_STATE_DISABLED);	// 禁用
		user.setUpdateTime(new Date());
		sysUserMapper.updateStateByPrimaryKey(user);
	}
	
	@Transactional
	@Override
	public void disableUser(String[] userIds) throws OperationException {
		if(userIds == null) {
			throw new OperationException("冻结用户失败,未指定冻结的用户!");
		}
		
		for(String userId : userIds) {
			this.disableUser(userId);
		}
	}
	
	@Transactional
	@Override
	public void updateUserPassword(String userId, String oldPassword, String newPassword) throws OperationException {
		if(StringUtils.isBlank(newPassword)) {
			throw new OperationException("修改密码失败,新密码不能为空!");
		}
		if(StringUtils.isBlank(oldPassword)) {
			throw new OperationException("修改密码失败,原密码不能为空!");
		}
		
		SysUser user = sysUserMapper.selectByPrimaryKey(userId);
		if(user == null) {
			throw new OperationException("修改密码失败,原用户已不存在!");
		}
		
		// 计算旧密码
		oldPassword = PasswordHelper.encryptPassword(oldPassword);
		
		if(! oldPassword.equals(user.getPassword())) {
			throw new OperationException("修改密码失败,原密码不正确!");
		}
		
		newPassword = PasswordHelper.encryptPassword(newPassword);
		user.setPassword(newPassword);
		user.setUpdateTime(new Date());
		
		sysUserMapper.updatePasswordByPrimaryKey(user);
	}
	
	@Transactional
	@Override
	public void resetUserPassword(String userId) throws OperationException {
		if(StringUtils.isBlank(userId)) {
			throw new OperationException("重置用户密码失败,未指定重置密码用户!");
		}
		
		SysUser user = sysUserMapper.selectByPrimaryKey(userId);
		if(user == null) {
			throw new OperationException("重置用户密码失败,用户已不存在!");
		}
		
		// 默认密码
		String password = PasswordHelper.encryptPassword(SysConstants.DEFAULT_LOGIN_PASSWORD);
		user.setPassword(password);
		user.setUpdateTime(new Date());
		
		sysUserMapper.updatePasswordByPrimaryKey(user);
	}
	
	@Transactional
	@Override
	public void resetUserPassword(String[] userIds) throws OperationException {
		if(userIds == null) {
			throw new OperationException("重置用户密码失败,未指定重置密码用户!");
		}
		
		for(String userId : userIds) {
			this.resetUserPassword(userId);
		}
	}

	@Override
	public SysUser getUserById(String userId) {
		if(StringUtils.isNotBlank(userId)) {
			return sysUserMapper.selectByPrimaryKey(userId);
		}
		return null;
	}
	
	@Override
	public SysUser getUserByUsername(String userName) {
		if(StringUtils.isNotBlank(userName)) {
			return sysUserMapper.selectByUserName(userName);
		}
		return null;
	}
	
	@Override
	public List<SysUser> getUserList(UserVo userVo) {
		List<SysUser> list = sysUserMapper.select(userVo);
		return list;
	}
	
	@Override
	public PageInfo<SysUser> getUserPage(UserVo userVo, int currentPage, int pageSize,
			String sortName, String sortOrder) {
		if(StringUtils.isNotBlank(sortName) && StringUtils.isNotBlank(sortOrder)) {
			String orderBy = sortName +  " " + sortOrder;
			PageHelper.startPage(currentPage, pageSize, orderBy);
		} else {
			PageHelper.startPage(currentPage, pageSize);
		}
		
		List<SysUser> list = sysUserMapper.select(userVo);
		PageInfo<SysUser> page = new PageInfo<SysUser>(list);
		
		return page;
	}
	
	@Override
	public List<String> getUserStringPermissions(String userId) {
		if(StringUtils.isNotBlank(userId)) {
			return sysUserMapper.selectPermissionByUserId(userId);
		}
		return null;
	}
	
	@Transactional
	@Override
	public void deleteUserById(String userId) throws OperationException {
		if(StringUtils.isBlank(userId)) {
			throw new OperationException("删除用户失败,未指定删除的用户!");
		}
		
		SysUser user = sysUserMapper.selectByPrimaryKey(userId);
		if(user == null) {
			throw new OperationException("删除用户失败,用户已不存在!");
		}
		
		if(user.getUserState().equals(SysConstants.USER_STATE_ENABLED)) {
			throw new OperationException("删除用户失败,用户已激活!");
		}
		
		sysUserMapper.deleteByPrimaryKey(userId);
	}

	@Transactional
	@Override
	public void deleteUserByIds(String[] userIds) throws OperationException {
		if(userIds == null) {
			throw new OperationException("删除用户失败,未指定删除的用户!");
		}
		
		for(String userId : userIds) {
			this.deleteUserById(userId);
		}
	}

	@Override
	public List<SysRole> getUserRoles(String userId) {
		if(StringUtils.isNotBlank(userId)) {
			return sysRoleMapper.selectGrantedByUserId(userId);
		}
		return null;
	}
	
	@Override
	public PageInfo<SysUser> getMemberPage(RoleMemberVo roleMemberVo, int currentPage, int pageSize, 
			String sortName, String sortOrder) {
		
		if(StringUtils.isNotBlank(sortName) && StringUtils.isNotBlank(sortOrder)) {
			String orderBy = sortName +  " " + sortOrder;
			PageHelper.startPage(currentPage, pageSize, orderBy);
		} else {
			PageHelper.startPage(currentPage, pageSize);
		}
		
		List<SysUser> list = sysUserMapper.selectByRole(roleMemberVo);
		PageInfo<SysUser> page = new PageInfo<SysUser>(list);
		
		return page;
	}
}
