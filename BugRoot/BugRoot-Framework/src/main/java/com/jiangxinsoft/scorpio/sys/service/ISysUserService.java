package com.jiangxinsoft.scorpio.sys.service;

import java.util.List;

import com.jiangxinsoft.scorpio.exception.OperationException;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.sys.model.SysRole;
import com.jiangxinsoft.scorpio.sys.model.SysUser;
import com.jiangxinsoft.scorpio.sys.vo.RoleMemberVo;
import com.jiangxinsoft.scorpio.sys.vo.UserVo;


public interface ISysUserService {

	/**
	 * 插入用户
	 * @param user
	 */
	public void saveUser(SysUser user) throws OperationException;
	
	/**
	 * 批量插入用户
	 * @param users
	 * @throws OperationException
	 */
	public void saveUsers(List<SysUser> users) throws OperationException;
	
	/**
	 * 更新用户
	 * @param user
	 */
	public void updateUser(SysUser user) throws OperationException;
	
	/**
	 * 激活用户
	 * @param userId
	 */
	public void enableUser(String userId) throws OperationException;
	
	/**
	 * 批量激活用户
	 * @param userIds
	 * @throws OperationException
	 */
	public void enableUser(String[] userIds) throws OperationException;
	
	/**
	 * 冻结用户
	 * @param userId
	 */
	public void disableUser(String userId) throws OperationException;
	
	/**
	 * 批量冻结用户
	 * @param userIds
	 * @throws OperationException
	 */
	public void disableUser(String[] userIds) throws OperationException;
	
	/**
	 * 修改用户密码
	 * @param systemUser
	 */
	public void updateUserPassword(String userId, String oldPassword, String newPassword) throws OperationException;
	
	/**
	 * 重置用户密码
	 * @param userId
	 */
	public void resetUserPassword(String userId) throws OperationException;
	
	/**
	 * 批量重置用户密码
	 * @param userIds
	 * @throws OperationException
	 */
	public void resetUserPassword(String[] userIds) throws OperationException;
	
	/**
	 * 根据用户ID查找用户
	 * @param userId
	 * @return
	 */
	public SysUser getUserById(String userId);
	
	/**
	 * 根据用户名查找用户
	 * @param userName
	 * @return
	 */
	public SysUser getUserByUsername(String userName);
	
	/**
	 * 查询用户列表
	 * @return
	 */
	public List<SysUser> getUserList(UserVo userVo);
	
	/**
	 * 查询用户列表
	 * @param positionMemberVo
	 * @param currentPage
	 * @param pageSize
	 * @param sortName
	 * @param sortOrder
	 * @return
	 */
	public PageInfo<SysUser> getUserPage(UserVo userVo, int currentPage, int pageSize, String sortName, String sortOrder);
	
	/**
	 * 查询用户权限列表
	 * @param userId
	 * @return
	 */
	public List<String> getUserStringPermissions(String userId);
	
	/**
	 * 根据用户ID删除用户
	 * @param userId
	 * @throws OperationException
	 */
	public void deleteUserById(String userId) throws OperationException;
	
	/**
	 * 根据用户ID批量删除用户
	 * @param userIds
	 * @throws OperationException
	 */
	public void deleteUserByIds(String[] userIds) throws OperationException;
	
	/**
	 * 查询用户角色列表
	 * @param userId
	 * @return
	 */
	public List<SysRole> getUserRoles(String userId);
	
	/**
	 * 查询用户列表
	 * @param roleMemberVo
	 * @param currentPage
	 * @param pageSize
	 * @param sortName
	 * @param sortOrder
	 * @return
	 */
	public PageInfo<SysUser> getMemberPage(RoleMemberVo roleMemberVo, int currentPage, int pageSize, 
			String sortName, String sortOrder);
	
}
