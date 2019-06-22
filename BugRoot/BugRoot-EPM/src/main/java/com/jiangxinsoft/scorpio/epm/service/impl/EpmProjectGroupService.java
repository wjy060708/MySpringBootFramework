package com.jiangxinsoft.scorpio.epm.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

import com.jiangxinsoft.scorpio.epm.mapper.EpmProjectGroupMapper;
import com.jiangxinsoft.scorpio.epm.model.EpmProjectGroup;
import com.jiangxinsoft.scorpio.epm.service.IEpmProjectGroupService;
import com.jiangxinsoft.scorpio.exception.OperationException;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.util.KeyGenerator;

@Service
public class EpmProjectGroupService implements IEpmProjectGroupService {
	
	@Autowired
	private EpmProjectGroupMapper epmProjectGroupMapper;
	
	@Override
	public void save(EpmProjectGroup pojo) throws RuntimeException {
		pojo.setGroupId(KeyGenerator.getUUIDKey());
		
		pojo.setCreateTime(new Date());
		pojo.setUpdateTime(new Date());
		
		epmProjectGroupMapper.insert(pojo);		
	}

	@Override
	public void update(EpmProjectGroup pojo) throws RuntimeException {	
		pojo.setUpdateTime(new Date());
		
		epmProjectGroupMapper.updateByPrimaryKey(pojo);		
	}

	@Override
	public EpmProjectGroup findByPrimaryKey(String groupId) {
		if(StringUtils.isNotBlank(groupId)) {
			return epmProjectGroupMapper.selectByPrimaryKey(groupId);
		}
		return null;
	}

	@Override
	public List<EpmProjectGroup> find(EpmProjectGroup pojo) {
		String orderBy = "GroupOrder Asc";
		PageHelper.orderBy(orderBy);
		
		List<EpmProjectGroup> list = epmProjectGroupMapper.select(pojo);
		return list;
	}

	@Override
	public PageInfo<EpmProjectGroup> findByPage(EpmProjectGroup pojoVo,
			int currentPage, int pageSize, String sortName, String sortOrder) {
		if(StringUtils.isNotBlank(sortName) && StringUtils.isNotBlank(sortOrder)) {
			String orderBy = sortName +  " " + sortOrder;
			PageHelper.startPage(currentPage, pageSize, orderBy);
		} else {
			String orderBy = "GroupOrder Asc";
			PageHelper.startPage(currentPage, pageSize, orderBy);
		}
		
		List<EpmProjectGroup> list = epmProjectGroupMapper.select(pojoVo);
		PageInfo<EpmProjectGroup> page = new PageInfo<EpmProjectGroup>(list);
		
		return page;
	}

	@Override
	public void deleteByPrimaryKey(String id) throws RuntimeException {
		
	}

	@Override
	public void deleteByPrimaryKeys(String[] groupIds) throws RuntimeException {
		if(groupIds != null) {
			epmProjectGroupMapper.deleteByPrimaryKeys(groupIds);
		} else {
			throw new OperationException("删除项目群失败,未指定删除的项目群!");
		}
		
	}

}
