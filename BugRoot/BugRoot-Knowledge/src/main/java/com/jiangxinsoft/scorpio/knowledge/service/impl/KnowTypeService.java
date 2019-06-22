package com.jiangxinsoft.scorpio.knowledge.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

import com.jiangxinsoft.scorpio.exception.OperationException;
import com.jiangxinsoft.scorpio.knowledge.mapper.KnowTypeMapper;
import com.jiangxinsoft.scorpio.knowledge.model.KnowType;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowTypeService;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.util.KeyGenerator;

@Service
public class KnowTypeService implements IKnowTypeService{
	
	@Autowired
	private KnowTypeMapper knowTypeMapper;

	@Override
	public void save(KnowType pojo) throws RuntimeException {
		pojo.setTypeId(KeyGenerator.getUUIDKey());

		pojo.setCreateTime(new Date());
		pojo.setUpdateTime(new Date());
		knowTypeMapper.insert(pojo);
		
	}

	@Override
	public void update(KnowType pojo) throws RuntimeException {
		pojo.setUpdateTime(new Date());
		knowTypeMapper.updateByPrimaryKey(pojo);
	}

	@Override
	public KnowType findByPrimaryKey(String typeId) {
		if(StringUtils.isNotBlank(typeId)) {
			return knowTypeMapper.selectByPrimaryKey(typeId);
		}
		return null;
	}

	@Override
	public List<KnowType> find(KnowType pojo) {
		String orderBy = "CreateTime Asc";
		PageHelper.orderBy(orderBy);
		
		List<KnowType> list = knowTypeMapper.select(pojo);
		return list;
	}

	@Override
	public PageInfo<KnowType> findByPage(KnowType pojoVo, int currentPage,
			int pageSize, String sortName, String sortOrder) {
		if(StringUtils.isNotBlank(sortName) && StringUtils.isNotBlank(sortOrder)) {
			String orderBy = sortName +  " " + sortOrder;
			PageHelper.startPage(currentPage, pageSize, orderBy);
		} else {
			String orderBy = "TypeOrder Asc";
			PageHelper.startPage(currentPage, pageSize, orderBy);
		}
		
		List<KnowType> list = knowTypeMapper.select(pojoVo);
		PageInfo<KnowType> page = new PageInfo<KnowType>(list);
		
		return page;
	}

	@Override
	public void deleteByPrimaryKey(String typeId) throws RuntimeException {
		if(StringUtils.isBlank(typeId)) {
			throw new OperationException("知识分类删除失败,未指定删除的知识分类!");
		}
		
		Integer c = knowTypeMapper.countByParent(typeId);
		if(c > 0) {
			throw new OperationException("知识分类删除失败,知识分类还有下级分类!");
		}
		
		knowTypeMapper.deleteByPrimaryKey(typeId);
		
	}

	@Override
	public void deleteByPrimaryKeys(String[] typeIds) throws RuntimeException {
		
		if(typeIds != null) {
			knowTypeMapper.deleteByPrimaryKeys(typeIds);
		} else {
			throw new OperationException("删除知识类型失败,未指定删除的知识类型!");
		}
	}

	@Override
	public List<KnowType> getType(KnowType pojoVo) {
		String orderBy = "CreateTime Asc";
		PageHelper.orderBy(orderBy);
		
		List<KnowType> list = knowTypeMapper.select(pojoVo);
		return list;
	}

	@Override
	public String getTypeId(String typeName) {
	
		return knowTypeMapper.selectByName(typeName);
	}


	@Override
	public List<KnowType> findByPrarentKey(String parentId) {
		if(StringUtils.isNotBlank(parentId)) {
			return knowTypeMapper.selectByPrarentKey(parentId);
		}
		return null;
	}

	@Override
	public List<KnowType> findFirstType(KnowType knowType) {
		List<KnowType> list = knowTypeMapper.selectFirstType(knowType);
		
		return list;
	}


}
