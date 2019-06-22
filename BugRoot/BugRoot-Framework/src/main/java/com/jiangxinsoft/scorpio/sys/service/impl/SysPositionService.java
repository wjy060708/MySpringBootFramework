package com.jiangxinsoft.scorpio.sys.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;

import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.sys.mapper.SysPositionMapper;
import com.jiangxinsoft.scorpio.sys.mapper.SysPositionMemberMapper;
import com.jiangxinsoft.scorpio.sys.mapper.SysPositionScopeMapper;
import com.jiangxinsoft.scorpio.sys.model.SysPosition;
import com.jiangxinsoft.scorpio.sys.model.SysPositionMember;
import com.jiangxinsoft.scorpio.sys.model.SysPositionScope;
import com.jiangxinsoft.scorpio.sys.service.ISysPositionService;
import com.jiangxinsoft.scorpio.sys.vo.PositionMemberVo;
import com.jiangxinsoft.scorpio.sys.vo.PositionScopeVo;
import com.jiangxinsoft.scorpio.sys.vo.PositionVo;
import com.jiangxinsoft.scorpio.util.KeyGenerator;
import com.jiangxinsoft.scorpio.exception.OperationException;

@Service
public class SysPositionService implements ISysPositionService {
	
	@Autowired
	private SysPositionMapper sysPositionMapper;
	
	@Autowired
	private SysPositionScopeMapper sysPositionScopeMapper;
	
	@Autowired
	private SysPositionMemberMapper sysPositionMemberMapper;
	
	public SysPositionService() {
	}
	
	@Transactional
	@Override
	public void savePosition(SysPosition position) {
		position.setPositionId(KeyGenerator.getUUIDKey());
		position.setCreateTime(new Date());
		position.setUpdateTime(new Date());
		
		sysPositionMapper.insert(position);
	}

	@Transactional
	@Override
	public void updatePosition(SysPosition position) {
		position.setUpdateTime(new Date());
		sysPositionMapper.updateByPrimaryKey(position);
	}

	@Override
	public SysPosition getPositionById(String positionId) {
		if(StringUtils.isNotBlank(positionId)) {
			return sysPositionMapper.selectByPrimaryKey(positionId);
		}
		return null;
	}
	
	@Override
	public List<SysPosition> getPositions(PositionVo positionVo) {
		List<SysPosition> list = sysPositionMapper.select(positionVo);
		return list;
	}
	
	@Override
	public PageInfo<SysPosition> getPositionPage(PositionVo positionVo, int currentPage, int pageSize,
			String sortName, String sortOrder) {
		
		if(StringUtils.isNotBlank(sortName) && StringUtils.isNotBlank(sortOrder)) {
			String orderBy = sortName +  " " + sortOrder;
			PageHelper.startPage(currentPage, pageSize, orderBy);
		} else {
			PageHelper.startPage(currentPage, pageSize);
		}
		
		List<SysPosition> list = sysPositionMapper.select(positionVo);
		PageInfo<SysPosition> page = new PageInfo<SysPosition>(list);
		
		return page;
	}
	
	@Transactional
	@Override
	public void deletePositionById(String positionId) throws OperationException {
		if(StringUtils.isBlank(positionId)) {
			throw new OperationException("删除岗位失败,未设置删除的岗位");
		}
		
		sysPositionMapper.deleteByPrimaryKey(positionId);
	}
	
	@Transactional
	@Override
	public void deletePositionByIds(String[] positionIds) {
		if(positionIds == null) {
			throw new OperationException("删除岗位失败,未设置删除的岗位");
		}
		
		sysPositionMapper.deleteByPrimaryKeys(positionIds);
	}
	
	@Transactional
	@Override
	public void savePositionScopes(List<SysPositionScope> positionScopes) throws OperationException {
		if(positionScopes == null) {
			throw new OperationException("保存岗位责任部门失败,未设置岗位责任部门");
		}
		
		if(positionScopes.size() < 1) {
			throw new OperationException("保存岗位责任部门失败,未设置岗位责任部门");
		}
		
		for(SysPositionScope positionScope: positionScopes) {
			String positionId = positionScope.getPositionId();
			String departmentId = positionScope.getDepartmentId();
			
			if(StringUtils.isBlank(positionId)) {
				throw new OperationException("保存岗位责任部门失败,未设置岗位责任部门");
			}
			if(StringUtils.isBlank(departmentId)) {
				throw new OperationException("保存岗位责任部门失败,未设置岗位责任部门");
			}
			
			//1.  删除之前创建
			sysPositionScopeMapper.deleteByPositionAndDepartmentId(positionId, departmentId);
			
			//2.  重新保存
			positionScope.setId(KeyGenerator.getUUIDKey());
			positionScope.setCreateTime(new Date());
			
			sysPositionScopeMapper.insert(positionScope);
		}
	}
	
	@Transactional
	@Override
	public void deletePositionScopes(List<SysPositionScope> positionScopes) throws OperationException {
		if(positionScopes == null) {
			throw new OperationException("删除岗位责任部门失败,未指定删除的岗位责任部门");
		}
		
		if(positionScopes.size() < 1) {
			throw new OperationException("删除岗位责任部门失败,未指定删除的岗位责任部门");
		}
		
		for(SysPositionScope positionScope : positionScopes) {
			String positionId = positionScope.getPositionId();
			String departmentId = positionScope.getDepartmentId();
			
			if(StringUtils.isBlank(positionId)) {
				throw new OperationException("删除岗位责任部门失败,未指定岗位责任部门");
			}
			if(StringUtils.isBlank(departmentId)) {
				throw new OperationException("删除岗位责任部门失败,未指定岗位责任部门");
			}
			
			sysPositionScopeMapper.deleteByPositionAndDepartmentId(positionId, departmentId);
		}
	}
	
	@Override
	public PageInfo<SysPositionScope> getPositionScopePage(PositionScopeVo positionScopeVo, int currentPage, int pageSize,
			String sortName, String sortOrder) {
		
		if(StringUtils.isNotBlank(sortName) && StringUtils.isNotBlank(sortOrder)) {
			String orderBy = sortName +  " " + sortOrder;
			PageHelper.startPage(currentPage, pageSize, orderBy);
		} else {
			PageHelper.startPage(currentPage, pageSize);
		}
		
		List<SysPositionScope> list = sysPositionScopeMapper.select(positionScopeVo);
		PageInfo<SysPositionScope> page = new PageInfo<SysPositionScope>(list);
		
		return page;
	}
	
	@Transactional
	@Override
	public void savePositionMembers(List<SysPositionMember> positionMembers) throws OperationException {
		if(positionMembers == null) {
			throw new OperationException("保存岗位成员失败,未设置岗位成员");
		}
		
		if(positionMembers.size() < 1) {
			throw new OperationException("保存岗位成员失败,未设置岗位成员");
		}
		
		for(SysPositionMember positionMember: positionMembers) {
			String positionId = positionMember.getPositionId();
			String userId = positionMember.getUserId();
			if(StringUtils.isBlank(positionId)) {
				throw new OperationException("保存岗位成员失败,未设置岗位成员所属岗位");
			}
			if(StringUtils.isBlank(userId)) {
				throw new OperationException("保存岗位成员失败,未设置岗位成员");
			}
			
			//1.  删除之前创建
			sysPositionMemberMapper.deleteByPositionAndUserId(positionId, userId);
			
			//2.  重新保存
			positionMember.setId(KeyGenerator.getUUIDKey());
			positionMember.setCreateTime(new Date());
			
			sysPositionMemberMapper.insert(positionMember);
		}
	}
	
	@Transactional
	@Override
	public void deletePositionMembers(List<SysPositionMember> positionMembers) throws OperationException {
		if(positionMembers == null) {
			throw new OperationException("删除岗位成员失败,未指定删除的岗位成员");
		}
		
		if(positionMembers.size() < 1) {
			throw new OperationException("删除岗位成员失败,未指定删除的岗位成员");
		}
		
		for(SysPositionMember positionMember : positionMembers) {
			String positionId = positionMember.getPositionId();
			String userId = positionMember.getUserId();
			
			if(StringUtils.isBlank(positionId)) {
				throw new OperationException("删除岗位成员失败,未指定删除的岗位成员");
			}
			if(StringUtils.isBlank(userId)) {
				throw new OperationException("删除岗位成员失败,未指定删除的岗位成员");
			}
			
			sysPositionMemberMapper.deleteByPositionAndUserId(positionId, userId);
		}
	}
	
	@Override
	public List<SysPosition> getUserPositions(String userId) {
		if(StringUtils.isNotBlank(userId)) {
			return sysPositionMapper.selectByUserId(userId);
		}
		return null;
	}
	
	@Override
	public PageInfo<SysPositionMember> getPositionMemberPage(PositionMemberVo positionMemberVo, int currentPage, int pageSize,
			String sortName, String sortOrder) {
		
		if(StringUtils.isNotBlank(sortName) && StringUtils.isNotBlank(sortOrder)) {
			String orderBy = sortName +  " " + sortOrder;
			PageHelper.startPage(currentPage, pageSize, orderBy);
		} else {
			PageHelper.startPage(currentPage, pageSize);
		}
		
		List<SysPositionMember> list = sysPositionMemberMapper.select(positionMemberVo);
		PageInfo<SysPositionMember> page = new PageInfo<SysPositionMember>(list);
		
		return page;
	}
}
