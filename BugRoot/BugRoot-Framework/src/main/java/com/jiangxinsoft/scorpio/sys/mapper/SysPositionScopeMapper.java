package com.jiangxinsoft.scorpio.sys.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jiangxinsoft.scorpio.sys.model.SysPositionScope;
import com.jiangxinsoft.scorpio.sys.vo.PositionScopeVo;

public interface SysPositionScopeMapper {
	
	/**
	 * 插入岗位责任部门
	 * @param positionScope
	 */
	public void insert(SysPositionScope positionScope);
	
	/**
	 * 删除岗位责任部门
	 * @param departmentId
	 */
	public void deleteByDepartmentId(String departmentId);
	
	/**
	 * 删除岗位责任部门
	 * @param positionId
	 * @param departmentId
	 */
	public void deleteByPositionAndDepartmentId(@Param("positionId") String positionId, @Param("departmentId") 
	String departmentId);
	
	/**
	 * 查询岗位责任部门列表
	 * @param positionScopeVo
	 * @return
	 */
	public List<SysPositionScope> select(PositionScopeVo positionScopeVo);

}