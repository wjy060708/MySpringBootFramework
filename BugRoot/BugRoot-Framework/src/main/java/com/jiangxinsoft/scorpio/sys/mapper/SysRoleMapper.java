package com.jiangxinsoft.scorpio.sys.mapper;

import java.util.List;

import com.jiangxinsoft.scorpio.mapper.IMapper;
import com.jiangxinsoft.scorpio.sys.model.SysRole;

public interface SysRoleMapper extends IMapper<SysRole> {
	
	/**
	 * 查询系统角色列表
	 * @param roleVo
	 * @return
	 */
	public List<SysRole> selectByUserId(String userId);
	
	/**
	 * 查询系统角色列表
	 * @param userId
	 * @return
	 */
	public List<SysRole> selectGrantedByUserId(String userId);

}