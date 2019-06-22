package com.jiangxinsoft.scorpio.sys.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jiangxinsoft.scorpio.sys.model.SysRoleMember;
import com.jiangxinsoft.scorpio.sys.vo.RoleMemberVo;

public interface SysRoleMemberMapper {
	
	/**
	 * 插入角色成员
	 * @param roleMember
	 */
	public void insert(SysRoleMember roleMember);
	
	/**
	 * 删除角色成员
	 * @param userId
	 */
	public void deleteByUserId(String userId);
	
	/**
	 * 删除角色成员
	 * @param positionId
	 * @param userId
	 */
	public void deleteByRoleAndUserId(@Param("roleId") String roleId, @Param("userId") String userId);
	
	/**
	 * 查询角色成员列表
	 * @param roleMemberVo
	 * @return
	 */
	public List<SysRoleMember> select(RoleMemberVo roleMemberVo);

}