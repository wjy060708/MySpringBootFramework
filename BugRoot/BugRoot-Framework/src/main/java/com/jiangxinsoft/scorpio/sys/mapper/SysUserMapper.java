package com.jiangxinsoft.scorpio.sys.mapper;

import java.util.List;

import com.jiangxinsoft.scorpio.mapper.IMapper;
import com.jiangxinsoft.scorpio.sys.model.SysUser;
import com.jiangxinsoft.scorpio.sys.vo.RoleMemberVo;

public interface SysUserMapper extends IMapper<SysUser> {
	
	/**
	 * 更新系统用户状态
	 * @param sysUser
	 * @throws RuntimeException
	 */
	public void updateStateByPrimaryKey(SysUser sysUser);
	
	/**
	 * 修改系统用户密码
	 * @param sysUser
	 */
	public void updatePasswordByPrimaryKey(SysUser sysUser);
	
	/**
	 * 根据用户名查找用户
	 * @param userName
	 * @return
	 */
	public SysUser selectByUserName(String userName);
	
	/**
	 * 根据用户编码查找用户
	 * @param userCard
	 * @return
	 */
	public SysUser selectByUserCard(String userCard);
	
	/**
	 * 查询角色用户
	 * @param roleMemberVo
	 * @return
	 */
	public List<SysUser> selectByRole(RoleMemberVo roleMemberVo);
	
	/**
	 * 获取用户资源权限
	 * @param userId
	 * @return
	 */
	public List<String> selectPermissionByUserId(String userId);

}