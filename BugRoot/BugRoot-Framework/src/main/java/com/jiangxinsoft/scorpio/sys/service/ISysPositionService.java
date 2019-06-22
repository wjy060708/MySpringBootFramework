package com.jiangxinsoft.scorpio.sys.service;

import java.util.List;


import com.jiangxinsoft.scorpio.exception.OperationException;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.sys.model.SysPosition;
import com.jiangxinsoft.scorpio.sys.model.SysPositionMember;
import com.jiangxinsoft.scorpio.sys.model.SysPositionScope;
import com.jiangxinsoft.scorpio.sys.vo.PositionMemberVo;
import com.jiangxinsoft.scorpio.sys.vo.PositionScopeVo;
import com.jiangxinsoft.scorpio.sys.vo.PositionVo;

public interface ISysPositionService {

	/**
	 * 插入系统岗位
	 * @param position
	 */
	public void savePosition(SysPosition position);
	
	/**
	 * 更新系统岗位
	 * @param position
	 */
	public void updatePosition(SysPosition position);
	
	/**
	 * 根据系统岗位ID查找系统岗位
	 * @param positionId
	 * @return
	 */
	public SysPosition getPositionById(String positionId);
	
	/**
	 * 查询所有系统岗位列表
	 * @param positionVo
	 * @return
	 */
	public List<SysPosition> getPositions(PositionVo positionVo);
	
	/**
	 * 查询系统岗位列表
	 * @param positionVo
	 * @param currentPage
	 * @param pageSize
	 * @param sortName
	 * @param sortOrder
	 * @return
	 */
	public PageInfo<SysPosition> getPositionPage(PositionVo positionVo, int currentPage, 
			int pageSize, String sortName, String sortOrder);
	
	/**
	 * 根据系统岗位ID删除系统岗位
	 * @param positionId
	 */
	public void deletePositionById(String positionId) throws OperationException;
	
	/**
	 * 根据系统岗位ID批量删除系统岗位
	 * @param positionIds
	 */
	public void deletePositionByIds(String[] positionIds) throws OperationException;
	
	/**
	 * 保存岗位责任部门
	 * @param positionScopes
	 */
	public void savePositionScopes(List<SysPositionScope> positionScopes) throws OperationException;
	
	/**
	 * 删除岗位责任部门
	 * @param positionScopes
	 */
	public void deletePositionScopes(List<SysPositionScope> positionScopes) throws OperationException;
	
	/**
	 * 查询系统岗位责任单位列表
	 * @param positionScopeVo
	 * @param currentPage
	 * @param pageSize
	 * @param sortName
	 * @param sortOrder
	 * @return
	 */
	public PageInfo<SysPositionScope> getPositionScopePage(PositionScopeVo positionScopeVo, 
			int currentPage, int pageSize, String sortName, String sortOrder);
	
	/**
	 * 保存岗位成员
	 * @param positionMembers
	 */
	public void savePositionMembers(List<SysPositionMember> positionMembers) throws OperationException;
	
	/**
	 * 删除岗位成员
	 * @param positionMembers
	 */
	public void deletePositionMembers(List<SysPositionMember> positionMembers) throws OperationException;
	
	/**
	 * 查询用户岗位
	 * @param userId
	 * @return
	 */
	public List<SysPosition> getUserPositions(String userId);
	
	/**
	 * 查询岗位成员列表
	 * @param positionMemberVo
	 * @param currentPage
	 * @param pageSize
	 * @param sortName
	 * @param sortOrder
	 * @return
	 */
	public PageInfo<SysPositionMember> getPositionMemberPage(PositionMemberVo positionMemberVo, int currentPage, 
			int pageSize, String sortName, String sortOrder);
	
	
}
