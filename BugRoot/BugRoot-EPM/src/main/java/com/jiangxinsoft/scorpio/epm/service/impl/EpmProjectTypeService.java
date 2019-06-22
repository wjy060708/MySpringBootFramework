package com.jiangxinsoft.scorpio.epm.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

import com.jiangxinsoft.scorpio.epm.mapper.EpmProjectTypeMapper;
import com.jiangxinsoft.scorpio.epm.model.EpmProjectType;
import com.jiangxinsoft.scorpio.epm.service.IEpmProjectTypeService;
import com.jiangxinsoft.scorpio.exception.OperationException;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.util.KeyGenerator;

@Service
public class EpmProjectTypeService implements IEpmProjectTypeService {
	
	@Autowired
	private EpmProjectTypeMapper epmProjectTypeMapper;

	@Override
	public void save(EpmProjectType pojo) throws RuntimeException {
		pojo.setTypeId(KeyGenerator.getUUIDKey());
		
		pojo.setCreateTime(new Date());
		pojo.setUpdateTime(new Date());
		
		epmProjectTypeMapper.insert(pojo);	
		
	}

	@Override
	public void update(EpmProjectType pojo) throws RuntimeException {	
		pojo.setUpdateTime(new Date());
		
		epmProjectTypeMapper.updateByPrimaryKey(pojo);		
	}

	@Override
	public EpmProjectType findByPrimaryKey(String typeId) {
		if(StringUtils.isNotBlank(typeId)) {
			return epmProjectTypeMapper.selectByPrimaryKey(typeId);
		}
		
		return null;
	}

	@Override
	public List<EpmProjectType> find(EpmProjectType pojo) {
		String orderBy = "TypeOrder Asc";
		PageHelper.orderBy(orderBy);
		
		List<EpmProjectType> list = epmProjectTypeMapper.select(pojo);
		return list;
	}

	@Override
	public PageInfo<EpmProjectType> findByPage(EpmProjectType pojoVo,
			int currentPage, int pageSize, String sortName, String sortOrder) {
		if(StringUtils.isNotBlank(sortName) && StringUtils.isNotBlank(sortOrder)) {
			String orderBy = sortName +  " " + sortOrder;
			PageHelper.startPage(currentPage, pageSize, orderBy);
		} else {
			String orderBy = "TypeOrder Asc";
			PageHelper.startPage(currentPage, pageSize, orderBy);
		}
		
		List<EpmProjectType> list = epmProjectTypeMapper.select(pojoVo);
		PageInfo<EpmProjectType> page = new PageInfo<EpmProjectType>(list);
		
		return page;
	}

	@Override
	public void deleteByPrimaryKey(String id) throws RuntimeException {
		
	}

	@Override
	public void deleteByPrimaryKeys(String[] typeIds) throws RuntimeException {
		if(typeIds != null) {
			epmProjectTypeMapper.deleteByPrimaryKeys(typeIds);
		} else {
			throw new OperationException("删除项目类型失败,未指定删除的项目类型!");
		}
		
	}

}
