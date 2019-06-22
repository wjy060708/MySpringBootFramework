package com.jiangxinsoft.scorpio.sys.mapper;

import java.util.List;

import com.jiangxinsoft.scorpio.sys.model.SysRolePage;
import com.jiangxinsoft.scorpio.sys.vo.RolePageVo;

public interface SysRolePageMapper {
	
	/**
	 * 角色页面授权
	 */
	public void insert(SysRolePage rolePage);
	
	/**
	 * 撤销角色页面授权
	 */
	public void deleteByRoleKey(String roleId);
	
	/**
	 * 查询特定角色包含的模块页面列表
	 * @return
	 */
	public List<SysRolePage> selectByRoleKey(RolePageVo rolePageVo);
	
	/**
	 * 查询模块页面列表
	 * @return
	 */
	public List<SysRolePage> selectByUserAndModule(RolePageVo rolePageVo);
	
}